local Parent = script:FindFirstAncestor("GameCollections").Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local ReactModule = require(Parent.React)
local GameTileModule = require(Parent.GameTile)
local OneByTwoTile = GameTileModule.OneByTwoTile
local GetTileBadgeByPositionConfigFromEntryFunction = GameTileModule.getTileBadgeByPositionConfigFromEntry
local _ = require(Parent.VideoUtils)
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: GetTileBadgeByPositionConfigFromEntryFunction (copy), ReactModule (copy), OneByTwoTile (copy), FFlagLuaAppHomeTouchAutoplay (copy)
	local Negated = -((p1.maxItemIndex or 0) + 1)
	
	return ReactModule.createElement(OneByTwoTile, {
		size = p1.item.sizeOverride,
		layoutOrder = p1.index,
		zIndex = if p1.zIndex then p1.zIndex + Negated else Negated,
		contentType = p1.item.contentType,
		universeId = p1.item.universeId,
		placeId = p1.item.placeId,
		placeIdOverride = p1.item.placeIdOverride,
		launchDataOverride = p1.item.launchDataOverride,
		referralSource = p1.appPage,
		reportExperienceLaunched = p1.reportExperienceLaunched,
		topicId = p1.topicId,
		badgeOverride = GetTileBadgeByPositionConfigFromEntryFunction(p1.item),
		primaryImageAssetId = p1.item.primaryImageAssetId,
		primaryVideoAssetId = p1.item.primaryVideoAssetId,
		logoImageAssetId = p1.item.logoAssetId,
		logoAspectRatio = p1.item.logoAspectRatio,
		headline = p1.item.headline,
		subtitle = p1.item.subtitle,
		videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackContext else nil
	})
end)

return function(p1)
	-- upvalues: ReactModule (copy), MemoResult (copy), GameCollectionItemTypes (copy)
	return ReactModule.createElement(MemoResult, p1), GameCollectionItemTypes.GameCollectionItemType.OneByTwoTile
end