return require(script.Parent.Parent.Action)(script.Name, function(IsClientView, UsePercentages, ClientSessionState, ServerSessionState, IsExporting, IsShowingMobileSettings)
	return {
		isClientView = IsClientView,
		usePercentages = UsePercentages,
		clientSessionState = ClientSessionState,
		serverSessionState = ServerSessionState,
		isExporting = IsExporting,
		isShowingMobileSettings = IsShowingMobileSettings
	}
end)