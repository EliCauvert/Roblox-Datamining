local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local WrappersModule = require(Foundation.Utility.Wrappers)
local CoreGui = WrappersModule.Services.CoreGui
local RunService = WrappersModule.Services.RunService
local Players = WrappersModule.Services.Players
local FlagsModule = require(Foundation.Utility.Flags)
local PlayerGui = if FlagsModule.FoundationUseMainGuiUtility then nil elseif Players.LocalPlayer and RunService:IsRunning() then Players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
local GetMainGuiModule = require(Foundation.Utility.getMainGui)
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseStyleSheetFunction = require(Foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(Foundation.Components.Types)
local OverlayContextModule = require(script.Parent.OverlayContext)
local UseKeyboardAwareSizeModule = require(script.Parent.useKeyboardAwareSize)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local config = {
	DisplayOrder = require(Foundation.Constants).MAX_LAYOUT_ORDER - 1
}
local MainGuiModule = if FlagsModule.FoundationUseMainGuiUtility then GetMainGuiModule() elseif IsPluginSecurityModule() then CoreGui else PlayerGui

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), FlagsModule (copy), UseKeyboardAwareSizeModule (copy), UseStyleSheetFunction (copy), MainGuiModule (copy), OverlayContextModule (copy), ReactRobloxModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.gui)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local Parent = if FlagsModule.FoundationOverlayKeyboardAwarenessHardened and not WithDefaultsModuleResult.gui then UseStateResult and UseStateResult.Parent else nil
	local UseKeyboardAwareSizeModuleResult = if FlagsModule.FoundationOverlayKeyboardAwareness then UseKeyboardAwareSizeModule(if FlagsModule.FoundationOverlayKeyboardAwarenessHardened then Parent else UseStateResult) else nil
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseStateResult1_1 = WithDefaultsModuleResult.gui == nil and (MainGuiModule ~= nil and UseStateResult1)
	
	return ReactModule.createElement(OverlayContextModule.Provider, {
		value = {
			requestOverlay = ReactModule.useCallback(function()
				-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2_1 (copy)
				if WithDefaultsModuleResult.gui == nil then
					UseStateResult2_1(true)
				end
			end, { WithDefaultsModuleResult.gui }),
			instance = if WithDefaultsModuleResult.gui == nil then UseStateResult else WithDefaultsModuleResult.gui,
			screen = if FlagsModule.FoundationOverlayKeyboardAwarenessHardened then if WithDefaultsModuleResult.gui == nil then Parent else WithDefaultsModuleResult.gui else nil
		}
	}, {
		FoundationOverlay = if UseStateResult1_1 then ReactRobloxModule.createPortal(ReactModule.createElement("ScreenGui", {
			Enabled = true,
			ClipToDeviceSafeArea = false,
			DisplayOrder = WithDefaultsModuleResult.DisplayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
			SafeAreaCompatibility = Enum.SafeAreaCompatibility.None,
			ref = if FlagsModule.FoundationOverlayKeyboardAwareness then nil else UseStateResult2
		}, {
			SafeAreaFrame = if FlagsModule.FoundationOverlayKeyboardAwareness then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UseKeyboardAwareSizeModuleResult,
				ref = UseStateResult2
			}) else nil,
			FoundationStyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult })
		}), MainGuiModule) else nil,
		Children = ReactModule.createElement(ReactModule.Fragment, nil, WithDefaultsModuleResult.children)
	})
end