local topicContentsRodux = script:FindFirstAncestor("TopicContentsRodux")
local topicContentsEntryModelModule = require(topicContentsRodux.TopicContentsEntryModel)
local parent = topicContentsRodux.Parent
local discoveryTypesModule = require(parent.DiscoveryTypes)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local omniRecommendationsContentType = discoveryTypesModule.OmniRecommendationsContentType
local gameCollectionItemType = discoveryTypesModule.GameCollectionItemTypes.GameCollectionItemType
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local t = {
	new = function() --[[ line: 17 ]]
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

function t.mock() --[[ line: 31 ]]
	-- upvalues: t (ref), topicContentsEntryModelModule (ref)
	local var5 = t.new()
	var5.entries = { topicContentsEntryModelModule.mock() }
	var5.rowsRequested = 1
	var5.hasMoreRows = false
	var5.nextPageExclusiveStartId = 0
	var5.updatedTimestamp = nil
	var5.nextPageToken = ""
	
	return var5
end

function t.fromData(p0) --[[ line: 45 ]]
	return {
		entries = p0.entries,
		rowsRequested = p0.rowsRequested,
		hasMoreRows = p0.hasMoreRows,
		nextPageExclusiveStartId = p0.nextPageExclusiveStartId,
		updatedTimestamp = p0.updatedTimestamp,
		nextPageToken = if p0.nextPageToken then p0.nextPageToken else ""
	}
end

function t.fromContentList(p1, p2, p3, p4) --[[ line: 59 ]]
	-- upvalues: t (ref), topicContentsEntryModelModule (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), gameCollectionItemType (ref), discoveryEventErrorLogger (ref), omniRecommendationsContentType (ref)
	local var6 = t.new()
	var6.updatedTimestamp = p4
	var6.entries = {}
	var6.hasMoreRows = false
	
	if p1 then
		for i, v in ipairs(p1) do
			if not var6.hasMoreRows then
				topicContentsEntryModelModule.fromOmniRecommendations(v):match(function(p6) --[[ line: 78 ]]
					-- upvalues: fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameCollectionItemType (copy), discoveryEventErrorLogger (copy), omniRecommendationsContentType (copy), var6 (ref), v (ref), p2 (ref), p3 (ref)
					if fFlagLuaAppEnableHomepageOneByTwoTile and p6.componentType == gameCollectionItemType.OneByTwoTile and (not p6.primaryVideoAssetId or not p6.primaryImageAssetId) then
						discoveryEventErrorLogger.reportError("TopicContentsModel_OneByTwoTileMissingAssets", "OneByTwoTile entry dropped: missing primaryVideoAssetId or primaryImageAssetId", {
							contentType = tostring(p6.contentType),
							hasVideo = p6.primaryVideoAssetId ~= nil,
							hasImage = p6.primaryImageAssetId ~= nil
						})
						
						return
					elseif fFlagLuaAppEnableHomepageOneByTwoTile and p6.contentType == omniRecommendationsContentType.AdLink then
						if not p6.clickoutUrl or p6.clickoutUrl == "" then
							discoveryEventErrorLogger.reportError("TopicContentsModel_AdLinkMissingClickoutUrl", "AdLink entry dropped: missing clickoutUrl")
							
							return
						elseif p6.universeId ~= nil then
							discoveryEventErrorLogger.reportError("TopicContentsModel_AdLinkUnexpectedUniverseId", "AdLink entry unexpectedly has universe ID")
						end
						table.insert(var6.entries, p6)
						
						return
					else
						local var7 = p2(v.contentType)
						
						if var7 ~= nil then
							local var8 = p3(p6, var7)
							
							if var8 ~= nil then
								table.insert(var6.entries, var8)
								
								return
							end
							var6.hasMoreRows = true
						end
					end
				end):matchError(function(p5) --[[ line: 129 ]]
					warn(p5)
				end)
				continue
			end
			return var6
		end
	end
	return var6
end

return t