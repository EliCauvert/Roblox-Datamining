local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetTopics).name] = function(p1, p2)
		-- upvalues: CatalogUtilsModule (copy), CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[CatalogUtilsModule.getTopicRequestKey(p2.selectedTopics, p2.initialItems, p2.searchKeyword)] = p2.newTopics
		})
	end
})