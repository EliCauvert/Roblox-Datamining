return require(script.Parent.Parent.Action)(script.Name, function(p0, p1, p2, p3, p4, p5)
	return {
		isClientView = p0,
		usePercentages = p1,
		clientSessionState = p2,
		serverSessionState = p3,
		isExporting = p4,
		isShowingMobileSettings = p5
	}
end)