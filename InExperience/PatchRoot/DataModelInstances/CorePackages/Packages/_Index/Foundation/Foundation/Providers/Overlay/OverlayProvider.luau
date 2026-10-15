local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local constantsModule = require(foundation.Constants)
local getMainGuiModule = require(foundation.Utility.getMainGui)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useStyleSheet = require(foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(foundation.Components.Types)
local overlayContextModule = require(script.Parent.OverlayContext)
local useKeyboardAwareSizeModule = require(script.Parent.useKeyboardAwareSize)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local t = { DisplayOrder = constantsModule.MAX_LAYOUT_ORDER - 1 }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useKeyboardAwareSizeModule (ref), useStyleSheet (ref), getMainGuiModule (ref), overlayContextModule (ref), reactRobloxModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2, var3 = reactModule.useState(var1.gui)
	local var4, var5 = reactModule.useState(false)
	local var6 = if not var1.gui then var2 and var2.Parent else nil
	local var7 = useKeyboardAwareSizeModule(var6)
	local var8 = useStyleSheet()
	local var9 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var5 (ref)
		if var1.gui == nil then
			var5(true)
		end
	end, { var1.gui })
	local var10 = if var1.gui == nil and var4 then getMainGuiModule() else nil
	local var11 = var1.gui == nil and (var10 ~= nil and var4)
	local var12 = if var1.gui ~= nil then var2 else var1.gui
	local var13 = if var1.gui ~= nil then var6 else var1.gui
	
	return reactModule.createElement(overlayContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var9 (ref), var12 (ref), var13 (ref)
			return { requestOverlay = var9, instance = var12, screen = var13 }
		end, { var9, var12, var13 })
	}, {
		FoundationOverlay = if var11 then reactRobloxModule.createPortal(reactModule.createElement("ScreenGui", {
			Enabled = true,
			ClipToDeviceSafeArea = false,
			DisplayOrder = var1.DisplayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
			SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
		}, {
			SafeAreaFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = var7,
				ref = var3
			}),
			FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var8 })
		}), var10) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var1.children)
	})
end