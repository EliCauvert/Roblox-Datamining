local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local InputUiModule = require(CorePackages.Workspace.Packages.InputUi)
local GamepadDisconnectedModal = InputUiModule.Gamepad.GamepadDisconnectedModal
local UseGamepadDisconnectOverlayEffectFunction = InputUiModule.Gamepad.useGamepadDisconnectOverlayEffect
local InGameMenuConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.InGameMenuConstants)
local NewResult = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))

return function()
	-- upvalues: ReactModule (copy), UseGamepadDisconnectOverlayEffectFunction (copy), NewResult (copy), InGameMenuConstantsModule (copy), GamepadDisconnectedModal (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	UseGamepadDisconnectOverlayEffectFunction(ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, { UseStateResult2 }), ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { UseStateResult2 }), NewResult, "InExperience")
	
	return if UseStateResult then ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		DisplayOrder = InGameMenuConstantsModule.DisplayOrder.HeadsetDisconnectedDialog,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		GamepadDisconnectedModal = ReactModule.createElement(GamepadDisconnectedModal)
	}) else nil
end