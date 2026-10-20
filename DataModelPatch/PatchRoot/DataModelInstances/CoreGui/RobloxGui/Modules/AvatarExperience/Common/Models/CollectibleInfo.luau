local CorePackages = game:GetService("CorePackages")
local GenerateStringIdFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GenerateStringId
local CatalogConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.CatalogConstants)
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping

return {
	mock = function()
		-- upvalues: GenerateStringIdFunction (copy), CatalogConstantsModule (copy)
		return {
			collectibleItemId = GenerateStringIdFunction(),
			collectibleProductId = GenerateStringIdFunction(),
			name = "",
			description = "",
			creator = {
				name = "",
				type = "",
				targetId = "",
				hasVerifiedBadge = false,
				id = GenerateStringIdFunction()
			},
			price = 1,
			lowestPrice = 0,
			unitsAvailableForConsumption = 0,
			offsaleDeadline = "",
			assetStock = 0,
			recentAveragePrice = 0,
			saleLocationType = "ShopAndAllExperiences",
			quantityLimitPerUser = 0,
			resaleRestriction = CatalogConstantsModule.ResaleRestriction.None
		}
	end,
	fromGetCollectibleItemData = function(p1)
		-- upvalues: FFlagAXMISEnableMultiShopping (copy)
		local config = {
			collectibleItemId = p1.collectibleItemId,
			collectibleProductId = p1.collectibleProductId,
			name = p1.name,
			description = p1.description,
			creator = {
				id = p1.creatorId,
				name = p1.creatorName,
				type = p1.creatorType,
				targetId = p1.creatorTargetId,
				hasVerifiedBadge = p1.creatorHasVerifiedBadge
			},
			price = p1.price,
			lowestPrice = p1.lowestPrice,
			unitsAvailableForConsumption = p1.unitsAvailableForConsumption,
			offsaleDeadline = p1.offsaleDeadline,
			assetStock = p1.assetStock,
			saleLocationType = p1.saleLocationType,
			quantityLimitPerUser = p1.quantityLimitPerUser,
			experiences = p1.experiences,
			resaleRestriction = p1.resaleRestriction
		}
		
		if FFlagAXMISEnableMultiShopping then
			config.lowestAvailableResaleProductId = p1.lowestAvailableResaleProductId
			config.lowestAvailableResaleItemInstanceId = p1.lowestAvailableResaleItemInstanceId
		end
		return config
	end,
	fromGetResellers = function(p1)
		return { hasResellers = #p1 > 0 }
	end,
	fromGetResaleData = function(p1)
		return { recentAveragePrice = p1.recentAveragePrice }
	end
}