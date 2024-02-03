package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/resources/armresources"
	"k8s.io/klog"
)

var (
	subscriptionID    string
	resourceGroupName string
)

func main() {
	subscriptionID = os.Getenv("AZURE_SUBSCRIPTION_ID")
	resourceGroupName = os.Getenv("AZURE_RESOURCE_GROUP")
	if len(subscriptionID) == 0 {
		log.Fatal("AZURE_SUBSCRIPTION_ID is not set.")
	}
	if len(resourceGroupName) == 0 {
		log.Fatal("AZURE_RESOURCE_GROUP is not set.")
	}

	cred, err := azidentity.NewDefaultAzureCredential(nil)
	if err != nil {
		klog.Fatal(err)
	}
	ctx := context.Background()

	resourcesClient, err := armresources.NewClient(subscriptionID, cred, nil)
	if err != nil {
		log.Fatalf("Failed to create resources client: %v", err)
	}

	seenResources := make(map[string]bool) // Map to track seen resource names

	for {
		pager := resourcesClient.NewListByResourceGroupPager(resourceGroupName, nil)
		for pager.More() {
			resp, err := pager.NextPage(ctx)
			if err != nil {
				log.Fatalf("Failed to list resources: %v", err)
			}
			for _, resource := range resp.ResourceListResult.Value {
				// Check if the resource has already been printed
				if _, seen := seenResources[*resource.Name]; !seen {
					fmt.Printf("Resource Name: %s, Type: %s\n", *resource.Name, *resource.Type)
					seenResources[*resource.Name] = true // Mark this resource as seen
				}
			}
		}
		time.Sleep(10 * time.Second) // Sleep for 10 seconds before checking for new resources
	}
}
