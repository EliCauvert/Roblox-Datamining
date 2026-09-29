local topicContentsRodux = script:FindFirstAncestor("TopicContentsRodux")
local topicContentsEntryModelModule = require(topicContentsRodux.TopicContentsEntryModel)
local parent = topicContentsRodux.Parent
local discoveryTypesModule = require(parent.DiscoveryTypes)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local omniRecommendationsContentType = discoveryTypesModule.OmniRecommendationsContentType
local gameCollectionItemType = discoveryTypesModule.GameCollectionItemTypes.GameCollectionItemType
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppEnableOneByTwoTileFunnelTelemetry = require(parent.SharedFlags).FFlagLuaAppEnableOneByTwoTileFunnelTelemetry
local t = {
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

function t.mock()
	-- upvalues: t (ref), topicContentsEntryModelModule (ref)
	local var1 = t.new()
	var1.entries = { topicContentsEntryModelModule.mock() }
	var1.rowsRequested = 1
	var1.hasMoreRows = false
	var1.nextPageExclusiveStartId = 0
	var1.updatedTimestamp = nil
	var1.nextPageToken = ""
	
	return var1
end

function t.fromData(p1)
	return {
		entries = p1.entries,
		rowsRequested = p1.rowsRequested,
		hasMoreRows = p1.hasMoreRows,
		nextPageExclusiveStartId = p1.nextPageExclusiveStartId,
		updatedTimestamp = p1.updatedTimestamp,
		nextPageToken = if p1.nextPageToken then p1.nextPageToken else ""
	}
end

function t.fromContentList(p1, p2, p3, p4, p5)
	-- upvalues: t (ref), topicContentsEntryModelModule (ref), fFlagLuaAppEnableOneByTwoTileFunnelTelemetry (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), gameCollectionItemType (ref), discoveryEventErrorLogger (ref), omniRecommendationsContentType (ref)
	local var1 = t.new()
	var1.updatedTimestamp = p4
	var1.entries = {}
	var1.hasMoreRows = false
	
	if p1 then
		for i, v in ipairs(p1) do
			if not var1.hasMoreRows then
				topicContentsEntryModelModule.fromOmniRecommendations(v, if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then p5 else nil):match(function(p6)
					-- upvalues: fFlagLuaAppEnableHomepageOneByTwoTile (copy), gameCollectionItemType (copy), discoveryEventErrorLogger (copy), omniRecommendationsContentType (copy), var1 (ref), v (ref), p2 (ref), p3 (ref)
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
						table.insert(var1.entries, p6)
						
						return
					else
						local var2 = p2(v.contentType)
						
						if var2 ~= nil then
							local var3 = p3(p6, var2)
							
							if var3 ~= nil then
								table.insert(var1.entries, var3)
								
								return
							end
							var1.hasMoreRows = true
						end
					end
				end):matchError(function(p6)
					warn(p6)
				end)
				continue
			end
			return var1
		end
	end
	return var1
end

return t