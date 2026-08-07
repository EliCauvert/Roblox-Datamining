local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local useLastInputMethodModule = require(focusNavigationUtils.useLastInputMethod)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local navigationModule = require(parent.Navigation)
local useNavigation = navigationModule.useNavigation
local getRouteIsFocused = navigationModule.getRouteIsFocused
local getCurrentNavigationState = navigationModule.getCurrentNavigationState
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local appPage = require(parent.RobloxAppEnums).AppPage
local t = {
	[avatarScreen.CatalogContextMenu] = true,
	[avatarScreen.SaveOutfitPrompt] = if require(parent.SharedFlags).FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then true else nil,
	[avatarScreen.ColorAdjustment] = true
}

local function _(p0) --[[ line: 26 | named "getAvatarRouteIsFocused" ]]
	-- upvalues: getRouteIsFocused (ref), appPage (ref)
	return getRouteIsFocused(p0, appPage.AvatarExperienceRoot)
end

local _ = function(p1) --[[ line: 30 | named "getRouteInGreenList" ]]
	-- upvalues: getCurrentNavigationState (ref), t (ref)
	local var4 = getCurrentNavigationState(p1.state)
	local var5 = if var4 then var4.routeName else nil
	
	return if var5 then t[var5] else false
end

return function() --[[ line: 37 | named "useDisableAutoFocus" ]]
	-- upvalues: useLastInputMethodModule (ref), useNavigation (ref), getRouteIsFocused (ref), appPage (ref), getCurrentNavigationState (ref), t (ref), useSelector (ref)
	local var6 = useLastInputMethodModule()
	local var7 = useNavigation()
	local var8 = getRouteIsFocused(var7.state, appPage.AvatarExperienceRoot)
	
	if var8 then
		local var9 = getCurrentNavigationState(var7.state)
		local var10 = if var9 then var9.routeName else nil
		var8 = not (if var10 then t[var10] else false)
	end
	return var8 and (not useSelector(function(p2) --[[ line: 42 ]]
		return p2.CentralOverlay.OverlayType ~= nil
	end) and var6 == "Gamepad")
end