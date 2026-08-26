return require(script.Parent.Parent.Action)(script.Name, function(p1, p2, p3, p4, p5, p6)
	return {
		isClientView = p1,
		usePercentages = p2,
		clientSessionState = p3,
		serverSessionState = p4,
		isExporting = p5,
		isShowingMobileSettings = p6
	}
end)