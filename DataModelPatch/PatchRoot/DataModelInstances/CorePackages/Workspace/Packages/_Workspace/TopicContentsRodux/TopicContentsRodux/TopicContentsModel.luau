local TopicContentsRodux = script:FindFirstAncestor("TopicContentsRodux")
local TopicContentsEntryModelModule = require(TopicContentsRodux.TopicContentsEntryModel)
local Parent = TopicContentsRodux.Parent
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local OmniRecommendationsContentType = DiscoveryTypesModule.OmniRecommendationsContentType
local GameCollectionItemType = DiscoveryTypesModule.GameCollectionItemTypes.GameCollectionItemType
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local TopicContentsModelModule = {
	new = function()
		return {
			entries = {},
			rowsRequested = 0,
			hasMoreRows = false,
			nextPageExclusiveStartId = 0,
			updatedTimestamp = nil,
			nextPageToken = ""
		}
	end
}

function TopicContentsModelModule.mock()
	-- upvalues: TopicContentsModelModule (copy), TopicContentsEntryModelModule (copy)
	local NewTopicContentsModel = TopicContentsModelModule.new()
	NewTopicContentsModel.entries = { TopicContentsEntryModelModule.mock() }
	NewTopicContentsModel.rowsRequested = 1
	NewTopicContentsModel.hasMoreRows = false
	NewTopicContentsModel.nextPageExclusiveStartId = 0
	NewTopicContentsModel.updatedTimestamp = nil
	NewTopicContentsModel.nextPageToken = ""
	
	return NewTopicContentsModel
end

function TopicContentsModelModule.fromData(p1)
	return {
		entries = p1.entries,
		rowsRequested = p1.rowsRequested,
		hasMoreRows = p1.hasMoreRows,
		nextPageExclusiveStartId = p1.nextPageExclusiveStartId,
		updatedTimestamp = p1.updatedTimestamp,
		nextPageToken = if p1.nextPageToken then p1.nextPageToken else ""
	}
end

function TopicContentsModelModule.fromContentList(List, Callback, Callback1, UpdatedTimestamp)
	-- upvalues: TopicContentsModelModule (copy), TopicContentsEntryModelModule (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), GameCollectionItemType (copy), DiscoveryEventErrorLogger (copy), OmniRecommendationsContentType (copy)
	local NewTopicContentsModel = TopicContentsModelModule.new()
	NewTopicContentsModel.updatedTimestamp = UpdatedTimestamp
	NewTopicContentsModel.entries = {}
	NewTopicContentsModel.hasMoreRows = false
	
	if List then
		for _, value in ipairs(List) do
			if NewTopicContentsModel.hasMoreRows then
				return NewTopicContentsModel
			end
			TopicContentsEntryModelModule.fromOmniRecommendations(value):match(function(p1)
				-- upvalues: FFlagLuaAppEnableHomepageOneByTwoTile (upval), GameCollectionItemType (upval), DiscoveryEventErrorLogger (upval), OmniRecommendationsContentType (upval), NewTopicContentsModel (copy), value (copy), Callback (copy), Callback1 (copy)
				if FFlagLuaAppEnableHomepageOneByTwoTile and p1.componentType == GameCollectionItemType.OneByTwoTile and (not p1.primaryVideoAssetId or not p1.primaryImageAssetId) then
					DiscoveryEventErrorLogger.reportError("TopicContentsModel_OneByTwoTileMissingAssets", "OneByTwoTile entry dropped: missing primaryVideoAssetId or primaryImageAssetId", {
						contentType = tostring(p1.contentType),
						hasVideo = p1.primaryVideoAssetId ~= nil,
						hasImage = p1.primaryImageAssetId ~= nil
					})
					
					return
				end
				if FFlagLuaAppEnableHomepageOneByTwoTile and p1.contentType == OmniRecommendationsContentType.AdLink then
					if p1.universeId ~= nil then
						DiscoveryEventErrorLogger.reportError("TopicContentsModel_AdLinkUnexpectedUniverseId", "AdLink entry unexpectedly has universe ID")
					end
					table.insert(NewTopicContentsModel.entries, p1)
					
					return
				else
					local CallbackResult = Callback(value.contentType)
					
					if CallbackResult ~= nil then
						local CallbackResult1 = Callback1(p1, CallbackResult)
						
						if CallbackResult1 ~= nil then
							table.insert(NewTopicContentsModel.entries, CallbackResult1)
							
							return
						end
						NewTopicContentsModel.hasMoreRows = true
					end
				end
			end):matchError(function(p1)
				warn(p1)
			end)
		end
	end
	return NewTopicContentsModel
end

return TopicContentsModelModule