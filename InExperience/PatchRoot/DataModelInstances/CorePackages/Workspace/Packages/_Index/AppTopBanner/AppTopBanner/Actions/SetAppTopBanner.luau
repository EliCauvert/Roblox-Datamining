return require(script:FindFirstAncestor("AppTopBanner").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3, p4) --[[ line: 7 ]]
	return {
		expanded = p0,
		appTopBannerType = p1,
		appTopBannerContentProps = p2,
		onAppTopBannerClick = p3,
		appTopBannerContentHeight = p4
	}
end)