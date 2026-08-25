local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local eventIngestService = game:GetService("EventIngestService")
local reactModule = require(corePackagesService.Packages.React)
local inputUiModule = require(corePackagesService.Workspace.Packages.InputUi)
local gamepadDisconnectedModal = inputUiModule.Gamepad.GamepadDisconnectedModal
local useGamepadDisconnectOverlayEffect = inputUiModule.Gamepad.useGamepadDisconnectOverlayEffect
local inGameMenuConstantsModule = require(coreGuiService.RobloxGui.Modules.InGameMenuConstants)
local var6 = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(eventIngestService)

return function()
	-- upvalues: reactModule (ref), useGamepadDisconnectOverlayEffect (ref), var6 (ref), inGameMenuConstantsModule (ref), gamepadDisconnectedModal (ref)
	local var7, var8 = reactModule.useState(false)
	useGamepadDisconnectOverlayEffect(reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		var8(true)
	end, { var8 }), reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		var8(false)
	end, { var8 }), var6, "InExperience")
	
	return if var7 then reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		DisplayOrder = inGameMenuConstantsModule.DisplayOrder.HeadsetDisconnectedDialog,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		GamepadDisconnectedModal = reactModule.createElement(gamepadDisconnectedModal)
	}) else nil
end