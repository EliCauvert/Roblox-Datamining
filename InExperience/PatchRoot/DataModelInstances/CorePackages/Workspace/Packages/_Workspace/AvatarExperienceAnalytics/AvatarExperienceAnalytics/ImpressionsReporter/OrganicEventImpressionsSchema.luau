local ImpressionEnumsModule = require(script.Parent.Parent.Enums.ImpressionEnums)
local config = {
	__newindex = function(_, Text)
		error("Attempt to insert into impressions schemas: " .. Text)
	end,
	__index = function(p1, Text)
		if not Text then
			warn("Nil ImpressionsSchema lookup")
			
			return
		end
		local RawValue = rawget(p1, Text)
		
		if not RawValue then
			warn("No such impressions schema: " .. Text)
		end
		return RawValue
	end
}
local config1 = {
	defaultItem = require(script.Parent.ImpressionsUtil).buildSchema(require(script.Parent.Parent.Constants).IMPRESSIONS_EVENTS.AvatarItems, {
		enumMap = {
			contentType = {
				Asset = ImpressionEnumsModule.MarketplaceItemType.ASSET,
				Bundle = ImpressionEnumsModule.MarketplaceItemType.BUNDLE,
				Look = ImpressionEnumsModule.MarketplaceItemType.LOOK
			}
		},
		surfaceSpecificAnalyticsMetadata = {
			[ImpressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE] = {
				{ prop = "sortEnumValue", out = "sort" },
				{
					prop = "filterSalesTypeEnumValue",
					out = "filterSalesType"
				},
				{
					prop = "filterCreatorsTypeEnumValue",
					out = "filterCreators"
				},
				{ prop = "filterPriceEnumValue", out = "filterPrice" },
				{
					prop = "filterUnavailableItemsEnumValue",
					out = "filterUnavailableItems"
				},
				{ prop = "filterCreatorsName", out = "filterCreatorsName" },
				{ prop = "filterPriceMin", out = "filterPriceMin" },
				{ prop = "filterPriceMax", out = "filterPriceMax" }
			},
			[ImpressionEnumsModule.MarketplaceSurfaceType.SEARCH] = {},
			[ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY] = {}
		},
		mapping = {
			{ prop = "index", out = "absPositions" },
			{ prop = "itemId", out = "itemId" },
			{ prop = "itemType", out = "contentType" },
			{ prop = "impressionsGroup", out = "group" },
			{ prop = "impressionsSearch", out = "keyword" },
			{ prop = "impressionsCategory", out = "category" },
			{ prop = "impressionsSubcategory", out = "subcategory" },
			{ prop = "surface", out = "surface" },
			{ prop = "sort", out = "sort" }
		},
		groupBy = { "itemId" }
	})
}

if require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceFlags).FFlagAXFixUnifiedPurchaseFieldLanding then
	local SurfaceSpecificAnalyticsMetadata = config1.defaultItem.surfaceSpecificAnalyticsMetadata
	
	if SurfaceSpecificAnalyticsMetadata then
		SurfaceSpecificAnalyticsMetadata[ImpressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE] = {
			{ prop = "sort", out = "sort" },
			{ prop = "filterSalesType", out = "filterSalesType" },
			{ prop = "filterCreators", out = "filterCreators" },
			{ prop = "filterPrice", out = "filterPrice" },
			{
				prop = "filterUnavailableItems",
				out = "filterUnavailableItems"
			},
			{ prop = "filterCreatorsName", out = "filterCreatorsName" },
			{ prop = "filterPriceMin", out = "filterPriceMin" },
			{ prop = "filterPriceMax", out = "filterPriceMax" }
		}
	end
end
setmetatable(config1, config)

return config1