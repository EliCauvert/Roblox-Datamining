local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local MockProvidersModule = require(AppChat.Components.MockProviders)

return function(p1, p2)
	-- upvalues: ReactModule (copy), MockProvidersModule (copy)
	local P1 = p2 or {}
	
	return ReactModule.createElement(MockProvidersModule, {
		withLayerCollector = P1.withLayerCollector == nil or P1.withLayerCollector,
		withUiModeSupport = P1.withUiModeSupport,
		themeName = P1.themeName,
		rodux = P1.rodux
	}, p1)
end