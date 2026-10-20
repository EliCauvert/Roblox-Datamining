local CorePackages = game:GetService("CorePackages")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.SearchTypes)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

return function()
	-- upvalues: UseNavigationFunction (copy), AvatarScreen (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy)
	local UseNavigationResult = UseNavigationFunction()
	local IsRouteNameMatch = UseNavigationResult.state.routeName == AvatarScreen.CatalogSearch
	local DetailParam = if IsRouteNameMatch then UseNavigationResult.getParam("detail") else nil
	
	return (UseSelectorFunction(function(p1)
		-- upvalues: DetailParam (copy)
		return if DetailParam then p1.SearchesParameters[DetailParam] else nil
	end, GetUseSelectorDeepEqualsFunction()))
end