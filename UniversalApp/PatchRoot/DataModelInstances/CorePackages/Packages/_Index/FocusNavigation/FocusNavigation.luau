local _ = require(script.Parent.EventPropagation)
local focusNavigationServiceModule = require(script.FocusNavigationService)
local isValidFocusTargetModule = require(script.isValidFocusTarget)
local engineInterfaceModule = require(script.EngineInterface)
local _ = require(script.types)

return {
	isValidFocusTarget = isValidFocusTargetModule,
	FocusNavigationService = focusNavigationServiceModule,
	EngineInterface = {
		CoreGui = engineInterfaceModule.CoreGui,
		PlayerGui = engineInterfaceModule.PlayerGui
	}
}