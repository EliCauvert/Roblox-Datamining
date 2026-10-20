local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local HttpService = game:GetService("HttpService")
local DataHydrationModule = require(Parent.DataHydration)
local Logging = require(Parent.AppCommonLib).Logging
local FFlagSduiMarketplaceCatalogSortSupport = require(Parent.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport
local FFlagAXSduiSeeAllPageRequestId = require(Parent.AvatarExperienceFlags).FFlagAXSduiSeeAllPageRequestId
local _ = require(AvatarExperienceCatalog.Models.WidgetListInfo)

local function mapCardFootersToItemFooters(CardFooters)
	if not CardFooters then
		return nil
	end
	local List = {}
	
	for _, cardFooter in CardFooters do
		table.insert(List, { contentType = cardFooter.contentType })
	end
	return List
end

local function _(p1)
	return if p1 then { thumbnailAspectRatio = p1.thumbnailAspectRatio } else nil
end

local function buildTemplate(Template, Template1)
	-- upvalues: mapCardFootersToItemFooters (copy)
	local CardStyle = Template.cardStyle
	
	return {
		type = "ItemGroup",
		title = nil,
		description = nil,
		localizedTitle = Template1.title or Template.title,
		localizedDescription = Template1.description or Template.description,
		itemFooters = mapCardFootersToItemFooters(Template.cardFooters),
		cardStyle = if CardStyle then { thumbnailAspectRatio = CardStyle.thumbnailAspectRatio } else nil,
		previewColumns = if Template.previewColumns then { default = Template.previewColumns } else nil,
		previewRows = { default = 1 }
	}
end

return function(Id, Text, p1, p2)
	-- upvalues: Logging (copy), DataHydrationModule (copy), FFlagSduiMarketplaceCatalogSortSupport (copy), buildTemplate (copy), FFlagAXSduiSeeAllPageRequestId (copy), HttpService (copy)
	if Id == nil or Id == "" then
		Logging.warn("buildFocusedSortWidgetInfo: missing sortId; bailing")
		
		return nil
	elseif Text == nil or Text == "" then
		Logging.warn("buildFocusedSortWidgetInfo: missing context for sortId=" .. Id .. "; bailing")
		
		return nil
	else
		local MarketplaceCatalogSortStore = DataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false)
		local NormalizedMarketplaceCatalogSort = if FFlagSduiMarketplaceCatalogSortSupport then MarketplaceCatalogSortStore.getNormalizedMarketplaceCatalogSort(Id) else MarketplaceCatalogSortStore.getMarketplaceCatalogSort(Id)
		local DataResult = if NormalizedMarketplaceCatalogSort and NormalizedMarketplaceCatalogSort.data then NormalizedMarketplaceCatalogSort.data(false) else nil
		
		if DataResult then
			return {
				widgetInfo = {
					[Text] = {
						id = Id,
						type = DataResult.type,
						content = DataResult.content,
						template = buildTemplate(DataResult, p1),
						tagId = DataResult.tagId
					}
				},
				requestId = if FFlagAXSduiSeeAllPageRequestId and p2 ~= nil and p2 ~= "" then p2 else HttpService:GenerateGUID(true)
			}
		else
			Logging.warn("buildFocusedSortWidgetInfo: sort not in cache for sortId=" .. Id .. " context=" .. Text)
			
			return nil
		end
	end
end