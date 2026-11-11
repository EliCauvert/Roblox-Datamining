game:DefineFastFlag("WebViewServiceHasBackButtonVisibility", false)

return function()
	return game:GetFastFlag("WebViewServiceHasBackButtonVisibility") and game:GetEngineFeature("WebViewHasBackButtonVisible")
end