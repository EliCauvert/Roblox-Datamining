local CorePackages = game:GetService("CorePackages")
local CatalogUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.CatalogUtils)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

return function()
	-- upvalues: UseSelectorFunction (copy), CatalogUtilsModule (copy), GetUseSelectorDeepEqualsFunction (copy)
	return UseSelectorFunction(function(p1)
		-- upvalues: CatalogUtilsModule (upval)
		return CatalogUtilsModule.getCurrentCategoryNames(p1)
	end, GetUseSelectorDeepEqualsFunction())
end