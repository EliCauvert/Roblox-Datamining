return require(script:FindFirstAncestor("AppTopBanner").Parent.Rodux).makeActionCreator(script.Name, function(Expanded, AppTopBannerType, AppTopBannerContentProps, OnAppTopBannerClick, AppTopBannerContentHeight)
	return {
		expanded = Expanded,
		appTopBannerType = AppTopBannerType,
		appTopBannerContentProps = AppTopBannerContentProps,
		onAppTopBannerClick = OnAppTopBannerClick,
		appTopBannerContentHeight = AppTopBannerContentHeight
	}
end)