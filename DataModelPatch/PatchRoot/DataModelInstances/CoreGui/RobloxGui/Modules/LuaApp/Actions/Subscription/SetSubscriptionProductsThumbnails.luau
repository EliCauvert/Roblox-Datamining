return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SubscriptionProductsThumbnails)
	return {
		subscriptionProductsThumbnails = SubscriptionProductsThumbnails
	}
end)