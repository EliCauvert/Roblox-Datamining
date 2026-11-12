local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local FlagsModule = require(Foundation.Utility.Flags)
local GetMainGuiModule = require(Foundation.Utility.getMainGui)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseStyleSheetFunction = require(Foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(Foundation.Components.Types)
local OverlayContextModule = require(script.Parent.OverlayContext)
local ViewportBreakpointContextModule = require(script.Parent.ViewportBreakpointContext)
local UseKeyboardAwareSizeModule = require(script.Parent.useKeyboardAwareSize)
local UseSharedViewportBreakpointModule = require(script.Parent.useSharedViewportBreakpoint)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local config = {
	DisplayOrder = require(Foundation.Constants).MAX_LAYOUT_ORDER - 1
}

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), UseKeyboardAwareSizeModule (copy), UseStyleSheetFunction (copy), GetMainGuiModule (copy), FlagsModule (copy), UseSharedViewportBreakpointModule (copy), OverlayContextModule (copy), ReactRobloxModule (copy), ViewportBreakpointContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.gui)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local Parent = if WithDefaultsModuleResult.gui then nil else UseStateResult and UseStateResult.Parent
	local UseKeyboardAwareSizeModuleResult = UseKeyboardAwareSizeModule(Parent)
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2_1 (copy)
		if WithDefaultsModuleResult.gui == nil then
			UseStateResult2_1(true)
		end
	end, { WithDefaultsModuleResult.gui })
	local MainGuiModule = if WithDefaultsModuleResult.gui == nil and UseStateResult1 then GetMainGuiModule() else nil
	local UseStateResult1_1 = WithDefaultsModuleResult.gui == nil and (MainGuiModule ~= nil and UseStateResult1)
	local UseStateResult3 = if WithDefaultsModuleResult.gui == nil then UseStateResult else WithDefaultsModuleResult.gui
	local Parent1 = if WithDefaultsModuleResult.gui == nil then Parent else WithDefaultsModuleResult.gui
	local UseSharedViewportBreakpointModuleResult = if FlagsModule.FoundationSharedViewportBreakpoint then UseSharedViewportBreakpointModule(Parent1) else nil
	
	return ReactModule.createElement(OverlayContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseResult (copy), UseStateResult3 (copy), Parent1 (copy)
			return {
				requestOverlay = UseResult,
				instance = UseStateResult3,
				screen = Parent1
			}
		end, { UseResult, UseStateResult3, Parent1 })
	}, {
		FoundationOverlay = if UseStateResult1_1 then ReactRobloxModule.createPortal(ReactModule.createElement("ScreenGui", {
			Enabled = true,
			ClipToDeviceSafeArea = false,
			DisplayOrder = WithDefaultsModuleResult.DisplayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
			SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
		}, {
			SafeAreaFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UseKeyboardAwareSizeModuleResult,
				ref = UseStateResult2
			}),
			FoundationStyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult })
		}), MainGuiModule) else nil,
		Children = if FlagsModule.FoundationSharedViewportBreakpoint then ReactModule.createElement(ViewportBreakpointContextModule.Provider, { value = UseSharedViewportBreakpointModuleResult }, WithDefaultsModuleResult.children) else ReactModule.createElement(ReactModule.Fragment, nil, WithDefaultsModuleResult.children)
	})
end