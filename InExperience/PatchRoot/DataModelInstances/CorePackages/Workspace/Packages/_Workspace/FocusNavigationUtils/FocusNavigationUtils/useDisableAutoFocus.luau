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

local function _(p1)
	-- upvalues: getRouteIsFocused (ref), appPage (ref)
	return getRouteIsFocused(p1, appPage.AvatarExperienceRoot)
end

local _ = function(p1)
	-- upvalues: getCurrentNavigationState (ref), t (ref)
	local var1 = getCurrentNavigationState(p1.state)
	local var2 = if var1 then var1.routeName else nil
	
	return if var2 then t[var2] else false
end

return function()
	-- upvalues: useLastInputMethodModule (ref), useNavigation (ref), getRouteIsFocused (ref), appPage (ref), getCurrentNavigationState (ref), t (ref), useSelector (ref)
	local var1 = useLastInputMethodModule()
	local var2 = useNavigation()
	local var3 = getRouteIsFocused(var2.state, appPage.AvatarExperienceRoot)
	
	if var3 then
		local var4 = getCurrentNavigationState(var2.state)
		local var5 = if var4 then var4.routeName else nil
		var3 = not (if var5 then t[var5] else false)
	end
	return var3 and (not useSelector(function(p1)
		return p1.CentralOverlay.OverlayType ~= nil
	end) and var1 == "Gamepad")
end