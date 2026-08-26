local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local httpService = game:GetService("HttpService")
local dataHydrationModule = require(parent.DataHydration)
local logging = require(parent.AppCommonLib).Logging
local fFlagSduiMarketplaceCatalogSortSupport = require(parent.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)

local function mapCardFootersToItemFooters(p1)
	if not p1 then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		table.insert(t, { contentType = v.contentType })
	end
	return t
end

local function _(p2)
	return if p2 then { thumbnailAspectRatio = p2.thumbnailAspectRatio } else nil
end

local function buildTemplate(p2, p3)
	-- upvalues: mapCardFootersToItemFooters (ref)
	local t = {
		type = "ItemGroup",
		title = nil,
		description = nil,
		localizedTitle = p3.title or p2.title,
		localizedDescription = p3.description or p2.description,
		itemFooters = mapCardFootersToItemFooters(p2.cardFooters)
	}
	local cardStyle = p2.cardStyle
	t.cardStyle = if not cardStyle then nil else { thumbnailAspectRatio = cardStyle.thumbnailAspectRatio }
	t.previewColumns = if p2.previewColumns then { default = p2.previewColumns } else nil
	t.previewRows = { default = 1 }
	
	return t
end

return function(p2, p3, p4)
	-- upvalues: logging (ref), dataHydrationModule (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), buildTemplate (ref), httpService (ref)
	if p2 == nil or p2 == "" then
		logging.warn("buildFocusedSortWidgetInfo: missing sortId; bailing")
		
		return nil
	elseif p3 == nil or p3 == "" then
		logging.warn("buildFocusedSortWidgetInfo: missing context for sortId=" .. p4 .. "; bailing")
		
		return nil
	end
	local marketplaceCatalogSortStore = dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false)
	local var1 = if fFlagSduiMarketplaceCatalogSortSupport then marketplaceCatalogSortStore.getNormalizedMarketplaceCatalogSort(p2) else marketplaceCatalogSortStore.getMarketplaceCatalogSort(p2)
	local var2 = if var1 and var1.data then var1.data(false) else nil
	
	if var2 then
		return {
			widgetInfo = {
				[p3] = {
					id = p2,
					type = var2.type,
					content = var2.content,
					template = buildTemplate(var2, p4),
					tagId = var2.tagId
				}
			},
			requestId = httpService:GenerateGUID(true)
		}
	end
	logging.warn("buildFocusedSortWidgetInfo: sort not in cache for sortId=" .. p4 .. " context=" .. p5)
	
	return nil
end