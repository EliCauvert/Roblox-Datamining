local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local constantsModule = require(script.Parent.Parent.Constants)
local impressionEnumsModule = require(script.Parent.Parent.Enums.ImpressionEnums)
local fFlagAXFixUnifiedPurchaseFieldLanding = require(parent.AvatarExperienceFlags).FFlagAXFixUnifiedPurchaseFieldLanding
local t = {
	defaultItem = require(script.Parent.ImpressionsUtil).buildSchema(constantsModule.IMPRESSIONS_EVENTS.AvatarItems, {
		enumMap = {
			contentType = {
				Asset = impressionEnumsModule.MarketplaceItemType.ASSET,
				Bundle = impressionEnumsModule.MarketplaceItemType.BUNDLE,
				Look = impressionEnumsModule.MarketplaceItemType.LOOK
			}
		},
		surfaceSpecificAnalyticsMetadata = {
			[impressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE] = {
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
			[impressionEnumsModule.MarketplaceSurfaceType.SEARCH] = {},
			[impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY] = {}
		},
		mapping = {
			{ prop = "index", out = "absPositions" }, { prop = "itemId", out = "itemId" },
			{ prop = "itemType", out = "contentType" },
			{ prop = "impressionsGroup", out = "group" },
			{ prop = "impressionsSearch", out = "keyword" },
			{ prop = "impressionsCategory", out = "category" },
			{ prop = "impressionsSubcategory", out = "subcategory" },
			{ prop = "surface", out = "surface" }, { prop = "sort", out = "sort" }
		},
		groupBy = { "itemId" }
	})
}
local t_1 = {
	__newindex = function(_, p1)
		error("Attempt to insert into impressions schemas: " .. p0)
	end,
	__index = function(p1, p2)
		if not p2 then
			warn("Nil ImpressionsSchema lookup")
			
			return
		end
		local var1 = rawget(p1, p2)
		
		if not var1 then
			warn("No such impressions schema: " .. p2)
		end
		return var1
	end
}

if fFlagAXFixUnifiedPurchaseFieldLanding then
	local surfaceSpecificAnalyticsMetadata = t.defaultItem.surfaceSpecificAnalyticsMetadata
	
	if surfaceSpecificAnalyticsMetadata then
		surfaceSpecificAnalyticsMetadata[impressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE] = {
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
setmetatable(t, t_1)

return t