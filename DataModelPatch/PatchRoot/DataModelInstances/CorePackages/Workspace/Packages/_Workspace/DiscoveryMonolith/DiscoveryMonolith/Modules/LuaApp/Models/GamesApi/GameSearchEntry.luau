local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local ResultModule = require(DiscoveryMonolith.Parent.Result)
local GetFFlagShowCreatorNameOnEmphasisSearchTileIXPModule = require(DiscoveryMonolith.Modules.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP)
local GameSearchEntryModule = {
	new = function()
		return {}
	end
}

function GameSearchEntryModule.mock(p1, p2)
	-- upvalues: GameSearchEntryModule (copy)
	local NewGameSearchEntry = GameSearchEntryModule.new()
	NewGameSearchEntry.name = "test name"
	NewGameSearchEntry.universeId = p1 or "149757"
	NewGameSearchEntry.placeId = p2 or "384314"
	NewGameSearchEntry.isSponsored = false
	NewGameSearchEntry.isShowSponsoredLabel = NewGameSearchEntry.isSponsored
	NewGameSearchEntry.adId = nil
	NewGameSearchEntry.playerCount = 150
	NewGameSearchEntry.creatorName = "test name"
	NewGameSearchEntry.creatorHasVerifiedBadge = false
	NewGameSearchEntry.topicId = "test_topic"
	NewGameSearchEntry.placeIdOverride = "123"
	NewGameSearchEntry.launchDataOverride = "test"
	NewGameSearchEntry.badgePosition = nil
	NewGameSearchEntry.badgeAnalyticsId = nil
	NewGameSearchEntry.badgeType = nil
	NewGameSearchEntry.badgeText = nil
	NewGameSearchEntry.badgeIcon = nil
	NewGameSearchEntry.badgeComponentType = nil
	
	return NewGameSearchEntry
end

function GameSearchEntryModule.fromJsonData(p1, p2)
	-- upvalues: ResultModule (copy), GameSearchEntryModule (copy), GetFFlagShowCreatorNameOnEmphasisSearchTileIXPModule (copy)
	if p2 and type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return ResultModule.error("GameSearchEntry.fromJsonData expects universeId to be a number or a string for game contents")
	end
	if p2 and type(p1.placeId) ~= "number" and type(p1.placeId) ~= "string" then
		return ResultModule.error("GameSearchEntry.fromJsonData expects placeId to be a number or a string for game contents")
	end
	local NewGameSearchEntry = GameSearchEntryModule.new()
	NewGameSearchEntry.name = p1.name
	NewGameSearchEntry.topicId = p1.topicId
	
	if p2 then
		NewGameSearchEntry.universeId = tostring(p1.universeId)
		NewGameSearchEntry.placeId = tostring(p1.placeId)
		NewGameSearchEntry.isSponsored = p1.isSponsored
		NewGameSearchEntry.isShowSponsoredLabel = nil
		
		if p1.isShowSponsoredLabel == nil then
			NewGameSearchEntry.isShowSponsoredLabel = true
		else
			NewGameSearchEntry.isShowSponsoredLabel = p1.isShowSponsoredLabel
		end
		NewGameSearchEntry.adId = p1.nativeAdData
		NewGameSearchEntry.playerCount = p1.playerCount
		
		if GetFFlagShowCreatorNameOnEmphasisSearchTileIXPModule() then
			NewGameSearchEntry.creatorName = p1.creatorName
			NewGameSearchEntry.creatorHasVerifiedBadge = p1.creatorHasVerifiedBadge
		end
		local ContentMetadata = p1.contentMetadata
		
		if ContentMetadata then
			NewGameSearchEntry.placeIdOverride = if ContentMetadata.PlaceIdOverride then tostring(ContentMetadata.PlaceIdOverride) else nil
			NewGameSearchEntry.launchDataOverride = ContentMetadata.LaunchDataOverride
			NewGameSearchEntry.badgePosition = ContentMetadata.badgePosition
			NewGameSearchEntry.badgeAnalyticsId = ContentMetadata.badgeAnalyticsId
			NewGameSearchEntry.badgeType = ContentMetadata.badgeType
			NewGameSearchEntry.badgeText = ContentMetadata.badgeText
			NewGameSearchEntry.badgeIcon = ContentMetadata.badgeIcon
			NewGameSearchEntry.badgeComponentType = ContentMetadata.badgeComponentType
		end
	end
	return ResultModule.success(NewGameSearchEntry)
end

return GameSearchEntryModule