local _ = require(script.Parent.EventPropagation)
local EngineInterfaceModule = require(script.EngineInterface)
local _ = require(script.types)

return {
	isValidFocusTarget = require(script.isValidFocusTarget),
	FocusNavigationService = require(script.FocusNavigationService),
	EngineInterface = {
		CoreGui = EngineInterfaceModule.CoreGui,
		PlayerGui = EngineInterfaceModule.PlayerGui
	}
}