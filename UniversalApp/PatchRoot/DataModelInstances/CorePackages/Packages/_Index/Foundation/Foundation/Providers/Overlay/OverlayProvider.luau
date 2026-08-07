local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local getMainGuiModule = require(foundation.Utility.getMainGui)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useStyleSheet = require(foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(foundation.Components.Types)
local overlayContextModule = require(script.Parent.OverlayContext)
local useKeyboardAwareSizeModule = require(script.Parent.useKeyboardAwareSize)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local t = { DisplayOrder = constantsModule.MAX_LAYOUT_ORDER - 1 }
local var10 = if flagsModule.FoundationOverlayResilientMainGui then nil else getMainGuiModule()

return function(p0) --[[ line: 30 | named "OverlayProvider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), flagsModule (ref), useKeyboardAwareSizeModule (ref), useStyleSheet (ref), getMainGuiModule (ref), var10 (ref), overlayContextModule (ref), reactRobloxModule (ref)
	local var11 = withDefaultsModule(p0, t)
	local var12, var13 = reactModule.useState(var11.gui)
	local var14, var15 = reactModule.useState(false)
	local var16 = if flagsModule.FoundationOverlayKeyboardAwarenessHardened and not var11.gui then var12 and var12.Parent else nil
	local var17 = if not flagsModule.FoundationOverlayResilientMainGui then if var11.gui == nil and var14 then getMainGuiModule() else nil else var10
	
	return reactModule.createElement(overlayContextModule.Provider, {
		value = {
			requestOverlay = reactModule.useCallback(function() --[[ line: 42 ]]
				-- upvalues: var11 (ref), var15 (ref)
				if var11.gui == nil then
					var15(true)
				end
			end, { var11.gui }),
			instance = if var11.gui ~= nil then var12 else var11.gui,
			screen = if flagsModule.FoundationOverlayKeyboardAwarenessHardened then if var11.gui ~= nil then var16 else var11.gui else nil
		}
	}, {
		FoundationOverlay = if var11.gui == nil and (var17 ~= nil and var14) then reactRobloxModule.createPortal(reactModule.createElement("ScreenGui", {
			Enabled = true,
			ClipToDeviceSafeArea = false,
			DisplayOrder = var11.DisplayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
			SafeAreaCompatibility = Enum.SafeAreaCompatibility.None,
			ref = if not flagsModule.FoundationOverlayKeyboardAwareness then var13 else nil
		}, {
			SafeAreaFrame = if flagsModule.FoundationOverlayKeyboardAwareness then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if flagsModule.FoundationOverlayKeyboardAwareness then useKeyboardAwareSizeModule(if flagsModule.FoundationOverlayKeyboardAwarenessHardened then var16 else var12) else nil,
				ref = var13
			}) else nil,
			FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() })
		}), var17) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var11.children)
	})
end