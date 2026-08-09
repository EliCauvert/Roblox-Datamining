local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local constantsModule = require(foundation.Constants)
local wrappersModule = require(foundation.Utility.Wrappers)
local coreGui = wrappersModule.Services.CoreGui
local runService = wrappersModule.Services.RunService
local players = wrappersModule.Services.Players
local flagsModule = require(foundation.Utility.Flags)
local var4 = nil

if not flagsModule.FoundationUseMainGuiUtility then
	var4 = if players.LocalPlayer and runService:IsRunning() then players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
end
local getMainGuiModule = require(foundation.Utility.getMainGui)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useStyleSheet = require(foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(foundation.Components.Types)
local overlayContextModule = require(script.Parent.OverlayContext)
local useKeyboardAwareSizeModule = require(script.Parent.useKeyboardAwareSize)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local t = { DisplayOrder = constantsModule.MAX_LAYOUT_ORDER - 1 }
local var13 = if flagsModule.FoundationUseMainGuiUtility then getMainGuiModule() elseif isPluginSecurityModule() then coreGui else var4

return function(p0) --[[ line: 45 | named "OverlayProvider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), flagsModule (ref), useKeyboardAwareSizeModule (ref), useStyleSheet (ref), var13 (ref), overlayContextModule (ref), reactRobloxModule (ref)
	local var14 = withDefaultsModule(p0, t)
	local var15, var16 = reactModule.useState(var14.gui)
	local var17, var18 = reactModule.useState(false)
	local var19 = if flagsModule.FoundationOverlayKeyboardAwarenessHardened and not var14.gui then var15 and var15.Parent else nil
	
	return reactModule.createElement(overlayContextModule.Provider, {
		value = {
			requestOverlay = reactModule.useCallback(function() --[[ line: 57 ]]
				-- upvalues: var14 (ref), var18 (ref)
				if var14.gui == nil then
					var18(true)
				end
			end, { var14.gui }),
			instance = if var14.gui ~= nil then var15 else var14.gui,
			screen = if flagsModule.FoundationOverlayKeyboardAwarenessHardened then if var14.gui ~= nil then var19 else var14.gui else nil
		}
	}, {
		FoundationOverlay = if var14.gui == nil and (var13 ~= nil and var17) then reactRobloxModule.createPortal(reactModule.createElement("ScreenGui", {
			Enabled = true,
			ClipToDeviceSafeArea = false,
			DisplayOrder = var14.DisplayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
			SafeAreaCompatibility = Enum.SafeAreaCompatibility.None,
			ref = if not flagsModule.FoundationOverlayKeyboardAwareness then var16 else nil
		}, {
			SafeAreaFrame = if flagsModule.FoundationOverlayKeyboardAwareness then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if flagsModule.FoundationOverlayKeyboardAwareness then useKeyboardAwareSizeModule(if flagsModule.FoundationOverlayKeyboardAwarenessHardened then var19 else var15) else nil,
				ref = var16
			}) else nil,
			FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() })
		}), var13) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, var14.children)
	})
end