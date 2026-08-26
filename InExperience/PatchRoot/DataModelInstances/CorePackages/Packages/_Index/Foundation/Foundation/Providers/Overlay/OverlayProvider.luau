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
local var1 = if flagsModule.FoundationOverlayResilientMainGui then nil else getMainGuiModule()

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useKeyboardAwareSizeModule (ref), useStyleSheet (ref), flagsModule (ref), getMainGuiModule (ref), var1 (ref), overlayContextModule (ref), reactRobloxModule (ref)
	local var2 = withDefaultsModule(p1, t)
	local var3, var4 = reactModule.useState(var2.gui)
	local var5, var6 = reactModule.useState(false)
	local var7 = if not var2.gui then var3 and var3.Parent else nil
	local var8 = useKeyboardAwareSizeModule(var7)
	local var9 = useStyleSheet()
	local var10 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var6 (ref)
		if var2.gui == nil then
			var6(true)
		end
	end, { var2.gui })
	local var11 = if not flagsModule.FoundationOverlayResilientMainGui then if var2.gui == nil and var5 then getMainGuiModule() else nil else var1
	local var12 = var2.gui == nil and (var11 ~= nil and var5)
	local var13 = if var2.gui ~= nil then var3 else var2.gui
	local var14 = if var2.gui ~= nil then var7 else var2.gui
	
	return reactModule.createElement(overlayContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var10 (ref), var13 (ref), var14 (ref)
			return { requestOverlay = var10, instance = var13, screen = var14 }
		end, { var10, var13, var14 }) else nil else { requestOverlay = var10, instance = var13, screen = var14 }
	}, {
		FoundationOverlay = if var12 then reactRobloxModule.createPortal(reactModule.createElement("ScreenGui", {
			Enabled = true,
			ClipToDeviceSafeArea = false,
			DisplayOrder = var2.DisplayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
			SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
		}, {
			SafeAreaFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = var8,
				ref = var4
			}),
			FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var9 })
		}), var11) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var2.children)
	})
end