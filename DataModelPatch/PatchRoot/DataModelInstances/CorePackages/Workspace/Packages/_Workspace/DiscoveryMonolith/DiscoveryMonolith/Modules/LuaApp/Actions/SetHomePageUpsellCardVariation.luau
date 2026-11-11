return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(UpsellCardType, TitleTextOverride, BodyTextOverride, UpsellCardV2Config)
	return {
		upsellCardType = UpsellCardType,
		titleTextOverride = TitleTextOverride,
		bodyTextOverride = BodyTextOverride,
		upsellCardV2Config = UpsellCardV2Config
	}
end)