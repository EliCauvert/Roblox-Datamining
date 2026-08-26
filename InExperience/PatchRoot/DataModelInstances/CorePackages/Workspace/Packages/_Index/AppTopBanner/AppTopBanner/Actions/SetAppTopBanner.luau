return require(script:FindFirstAncestor("AppTopBanner").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4, p5)
	return {
		expanded = p1,
		appTopBannerType = p2,
		appTopBannerContentProps = p3,
		onAppTopBannerClick = p4,
		appTopBannerContentHeight = p5
	}
end)