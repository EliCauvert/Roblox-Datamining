local sponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local parent = sponsoredTiles.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local reactModule = require(parent.React)
local oneByTwoTileModule = require(sponsoredTiles.OneByTwoTile)
local getTileBadgeByPositionConfigFromEntry = require(parent.GameTile).getTileBadgeByPositionConfigFromEntry
local _ = require(parent.VideoUtils)
local var3 = reactModule.memo(function(p0) --[[ line: 28 ]]
	-- upvalues: getTileBadgeByPositionConfigFromEntry (ref), reactModule (ref), oneByTwoTileModule (ref)
	local var4 = -((p0.maxItemIndex or 0) + 1)
	
	return reactModule.createElement(oneByTwoTileModule, {
		size = p0.item.sizeOverride,
		layoutOrder = p0.index,
		zIndex = if p0.zIndex then p0.zIndex + var4 else var4,
		contentType = p0.item.contentType,
		universeId = p0.item.universeId,
		placeId = p0.item.placeId,
		placeIdOverride = p0.item.placeIdOverride,
		launchDataOverride = p0.item.launchDataOverride,
		referralSource = p0.appPage,
		reportExperienceLaunched = p0.reportExperienceLaunched,
		topicId = p0.topicId,
		badgeOverride = getTileBadgeByPositionConfigFromEntry(p0.item),
		primaryImageAssetId = p0.item.primaryImageAssetId,
		primaryVideoAssetId = p0.item.primaryVideoAssetId,
		logoImageAssetId = p0.item.logoAssetId,
		logoAspectRatio = p0.item.logoAspectRatio,
		headline = p0.item.headline,
		subtitle = p0.item.subtitle,
		videoPlaybackContext = p0.videoPlaybackContext
	})
end)

return function(p1) --[[ line: 58 ]]
	-- upvalues: reactModule (ref), var3 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var3, p1), gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile
end