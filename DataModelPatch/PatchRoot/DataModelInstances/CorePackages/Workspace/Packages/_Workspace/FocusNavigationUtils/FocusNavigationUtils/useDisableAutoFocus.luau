local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local Parent = FocusNavigationUtils.Parent
local UseLastInputMethodModule = require(FocusNavigationUtils.useLastInputMethod)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local NavigationModule = require(Parent.Navigation)
local UseNavigationFunction = NavigationModule.useNavigation
local GetRouteIsFocusedFunction = NavigationModule.getRouteIsFocused
local GetCurrentNavigationStateFunction = NavigationModule.getCurrentNavigationState
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local AppPage = require(Parent.RobloxAppEnums).AppPage
local config = {
	[AvatarScreen.CatalogContextMenu] = true,
	[AvatarScreen.SaveOutfitPrompt] = if require(Parent.SharedFlags).FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then true else nil,
	[AvatarScreen.ColorAdjustment] = true
}

local function _(p1)
	-- upvalues: GetRouteIsFocusedFunction (copy), AppPage (copy)
	return GetRouteIsFocusedFunction(p1, AppPage.AvatarExperienceRoot)
end

local _ = function(p1)
	-- upvalues: GetCurrentNavigationStateFunction (copy), config (copy)
	local CurrentNavigationState = GetCurrentNavigationStateFunction(p1.state)
	local RouteName = if CurrentNavigationState then CurrentNavigationState.routeName else nil
	
	return if RouteName then config[RouteName] else false
end

return function(): boolean
	-- upvalues: UseLastInputMethodModule (copy), UseNavigationFunction (copy), GetRouteIsFocusedFunction (copy), AppPage (copy), GetCurrentNavigationStateFunction (copy), config (copy), UseSelectorFunction (copy)
	local UseLastInputMethodModuleResult = UseLastInputMethodModule()
	local UseNavigationResult = UseNavigationFunction()
	local RouteIsFocused = GetRouteIsFocusedFunction(UseNavigationResult.state, AppPage.AvatarExperienceRoot)
	
	if RouteIsFocused then
		local CurrentNavigationState = GetCurrentNavigationStateFunction(UseNavigationResult.state)
		local RouteName = if CurrentNavigationState then CurrentNavigationState.routeName else nil
		RouteIsFocused = not (if RouteName then config[RouteName] else false)
	end
	local UseSelectorResult = UseSelectorFunction(function(p1): boolean
		return p1.CentralOverlay.OverlayType ~= nil
	end)
	
	return RouteIsFocused and (not UseSelectorResult and UseLastInputMethodModuleResult == "Gamepad")
end