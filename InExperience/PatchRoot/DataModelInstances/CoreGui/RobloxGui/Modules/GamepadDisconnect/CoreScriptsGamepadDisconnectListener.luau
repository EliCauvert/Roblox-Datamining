local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local eventIngestService = game:GetService("EventIngestService")
local reactModule = require(corePackagesService.Packages.React)
local inputUiModule = require(corePackagesService.Workspace.Packages.InputUi)
local gamepadDisconnectedModal = inputUiModule.Gamepad.GamepadDisconnectedModal
local useGamepadDisconnectOverlayEffect = inputUiModule.Gamepad.useGamepadDisconnectOverlayEffect
local inGameMenuConstantsModule = require(coreGuiService.RobloxGui.Modules.InGameMenuConstants)
local var1 = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(eventIngestService)

return function()
	-- upvalues: reactModule (ref), useGamepadDisconnectOverlayEffect (ref), var1 (ref), inGameMenuConstantsModule (ref), gamepadDisconnectedModal (ref)
	local var2, var3 = reactModule.useState(false)
	useGamepadDisconnectOverlayEffect(reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(true)
	end, { var3 }), reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, { var3 }), var1, "InExperience")
	
	return if var2 then reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		DisplayOrder = inGameMenuConstantsModule.DisplayOrder.HeadsetDisconnectedDialog,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		GamepadDisconnectedModal = reactModule.createElement(gamepadDisconnectedModal)
	}) else nil
end