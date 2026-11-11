local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen

return require(CorePackages.Packages.Rodux).createReducer({
	params = nil,
	requestId = 0,
	completedRequestId = 0,
	screen = AvatarScreen.None
}, {
	[require(Modules.AvatarExperience.Common.Actions.ApplyNavigateIntoAvatarExperience).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			screen = p2.screen,
			params = p2.params,
			requestId = p1.requestId + 1
		})
	end,
	[require(Modules.AvatarExperience.Common.Actions.CompleteExternalNavigation).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { completedRequestId = p2.requestId })
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			params = CryoModule.Dictionary.join(p1.params or {}, {
				creatorName = CryoModule.None,
				minPrice = CryoModule.None,
				maxPrice = CryoModule.None,
				salesTypeFilter = CryoModule.None,
				includeNotForSale = CryoModule.None,
				sortType = CryoModule.None,
				sortAggregation = CryoModule.None,
				category = CryoModule.None,
				subcategory = CryoModule.None,
				taxonomy = CryoModule.None,
				keyword = CryoModule.None,
				topics = CryoModule.None,
				wearTimeFilter = CryoModule.None
			})
		})
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.EquippedDeepLinkCatalogItem).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			params = CryoModule.Dictionary.join(p1.params or {}, {
				itemId = p2.itemId,
				itemType = p2.itemType,
				wasItemEquipped = p2.wasItemEquipped or false,
				fetchItemFailed = p2.fetchItemFailed or false
			})
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.NavigatedToDeepLinkAvatarEditor).name] = function(p1, _)
		-- upvalues: CryoModule (copy), AvatarScreen (copy)
		return CryoModule.Dictionary.join(p1, {
			params = CryoModule.Dictionary.join(p1.params or {}, {
				category = CryoModule.None,
				subcategory = CryoModule.None,
				opaquePage = AvatarScreen.AvatarEditor
			})
		})
	end
})