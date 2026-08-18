local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local httpService = game:GetService("HttpService")
local dataHydrationModule = require(parent.DataHydration)
local logging = require(parent.AppCommonLib).Logging
local fFlagSduiMarketplaceCatalogSortSupport = require(parent.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)

local function mapCardFootersToItemFooters(p0) --[[ line: 44 ]]
	if not p0 then
		return nil
	end
	local t = {}
	
	for i, v in p0 do
		table.insert(t, { contentType = v.contentType })
	end
	return t
end

local function _(p1) --[[ line: 57 | named "mapCardStyle" ]]
	return if p1 then { thumbnailAspectRatio = p1.thumbnailAspectRatio } else nil
end

local function buildTemplate(p2, p3) --[[ line: 69 ]]
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

return function(p4, p5, p6) --[[ line: 91 | named "buildFocusedSortWidgetInfo" ]]
	-- upvalues: logging (ref), dataHydrationModule (ref), fFlagSduiMarketplaceCatalogSortSupport (ref), buildTemplate (ref), httpService (ref)
	if p4 == nil or p4 == "" then
		logging.warn("buildFocusedSortWidgetInfo: missing sortId; bailing")
		
		return nil
	elseif p5 == nil or p5 == "" then
		logging.warn("buildFocusedSortWidgetInfo: missing context for sortId=" .. p4 .. "; bailing")
		
		return nil
	end
	local marketplaceCatalogSortStore = dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false)
	local var8 = if fFlagSduiMarketplaceCatalogSortSupport then marketplaceCatalogSortStore.getNormalizedMarketplaceCatalogSort(p4) else marketplaceCatalogSortStore.getMarketplaceCatalogSort(p4)
	local var9 = if var8 and var8.data then var8.data(false) else nil
	
	if var9 then
		return {
			widgetInfo = {
				[p5] = {
					id = p4,
					type = var9.type,
					content = var9.content,
					template = buildTemplate(var9, p6),
					tagId = var9.tagId
				}
			},
			requestId = httpService:GenerateGUID(true)
		}
	end
	logging.warn("buildFocusedSortWidgetInfo: sort not in cache for sortId=" .. p4 .. " context=" .. p5)
	
	return nil
end