return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ScreenName, ScreenHeightPix, TopYPix, ViewportSizePix)
	return {
		screenName = ScreenName,
		screenHeightPix = ScreenHeightPix,
		topYPix = TopYPix,
		viewportSizePix = ViewportSizePix
	}
end)