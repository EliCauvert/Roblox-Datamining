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

return function(p0)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useKeyboardAwareSizeModule (ref), useStyleSheet (ref), flagsModule (ref), getMainGuiModule (ref), var10 (ref), overlayContextModule (ref), reactRobloxModule (ref)
	local var11 = withDefaultsModule(p0, t)
	local var12, var13 = reactModule.useState(var11.gui)
	local var14, var15 = reactModule.useState(false)
	local var16 = if not var11.gui then var12 and var12.Parent else nil
	local var17 = useKeyboardAwareSizeModule(var16)
	local var18 = useStyleSheet()
	local var19 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var15 (ref)
		if var11.gui == nil then
			var15(true)
		end
	end, { var11.gui })
	local var20 = if not flagsModule.FoundationOverlayResilientMainGui then if var11.gui == nil and var14 then getMainGuiModule() else nil else var10
	local var21 = var11.gui == nil and (var20 ~= nil and var14)
	local var22 = if var11.gui ~= nil then var12 else var11.gui
	local var23 = if var11.gui ~= nil then var16 else var11.gui
	
	return reactModule.createElement(overlayContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var19 (ref), var22 (ref), var23 (ref)
			return { requestOverlay = var19, instance = var22, screen = var23 }
		end, { var19, var22, var23 }) else nil else { requestOverlay = var19, instance = var22, screen = var23 }
	}, {
		FoundationOverlay = if var21 then reactRobloxModule.createPortal(reactModule.createElement("ScreenGui", {
			Enabled = true,
			ClipToDeviceSafeArea = false,
			DisplayOrder = var11.DisplayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
			SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
		}, {
			SafeAreaFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = var17,
				ref = var13
			}),
			FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var18 })
		}), var20) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var11.children)
	})
end