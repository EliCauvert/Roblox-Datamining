local sponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local parent = sponsoredTiles.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local reactModule = require(parent.React)
local gameTileModule = require(parent.GameTile)
local twoByOneGameTileModule = require(sponsoredTiles.TwoByOneGameTile)
local getTileBadgeByPositionConfigFromEntry = gameTileModule.getTileBadgeByPositionConfigFromEntry
local resolveWideAssetId = gameTileModule.resolveWideAssetId
local _ = require(parent.VideoUtils)
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local var4 = reactModule.memo(function(p0) --[[ line: 41 ]]
	-- upvalues: reactModule (ref), getTileBadgeByPositionConfigFromEntry (ref), twoByOneGameTileModule (ref), fFlagMigrateGameInfoToStore (ref), resolveWideAssetId (ref)
	local var5 = -((p0.maxItemIndex or 0) + 1)
	
	return reactModule.createElement(twoByOneGameTileModule, {
		size = p0.item.sizeOverride,
		layoutOrder = p0.index,
		zIndex = if p0.zIndex then p0.zIndex + var5 else var5,
		universeId = p0.item.universeId,
		placeId = p0.item.placeId,
		topicId = p0.topicId,
		logoImageAssetId = p0.item.logoAssetId,
		logoAspectRatio = p0.item.logoAspectRatio,
		headline = p0.item.headline,
		subtitle = p0.item.subtitle,
		ctaText = p0.item.ctaText,
		tileVariant = p0.item.tileVariant,
		badgeOverride = getTileBadgeByPositionConfigFromEntry(p0.item),
		payerName = p0.item.payerName,
		adId = p0.item.adId,
		isSponsored = p0.item.isSponsored,
		sponsoredUserCohort = p0.sponsoredUserCohort,
		appPage = p0.appPage,
		setGameHidden = p0.setGameHidden,
		isHidden = p0.isHidden,
		hoverKey = `TwoByOneTile_{p0.impressionsTag or ""}_{p0.index or "0"}_{p0.item.universeId}`,
		impressionsTag = p0.impressionsTag,
		index = p0.index,
		reportGameDetailOpened = p0.reportGameDetailOpened,
		reportExperienceLaunched = p0.reportExperienceLaunched,
		enableSponsoredFeedback = p0.enableSponsoredFeedback,
		enableReportAd = p0.enableReportAd,
		enableExplicitFeedback = p0.enableExplicitFeedback,
		placeIdOverride = p0.item.placeIdOverride,
		launchDataOverride = p0.item.launchDataOverride,
		onSelectionGained = reactModule.useCallback(function() --[[ line: 46 ]]
			-- upvalues: p0 (ref)
			if p0.onSelectionGained then
				p0.onSelectionGained(p0.item, p0.index, p0.item.universeId)
			end
		end, { p0.onSelectionGained, p0.item, p0.index }),
		onSelectionLost = p0.onSelectionLost,
		primaryWideImageAssetId = if fFlagMigrateGameInfoToStore then nil else p0.item.primaryWideImageAssetId,
		wideAssetId = if fFlagMigrateGameInfoToStore then resolveWideAssetId(p0.item.primaryWideImageAssetId, p0.item, p0.topicId) else nil,
		ageRatingLabel = if fFlagMigrateGameInfoToStore then p0.item.ageRecommendationDisplayName else nil,
		videoPlaybackContext = p0.videoPlaybackContext,
		SelectionOrder = p0.SelectionOrder
	})
end)

return function(p1) --[[ line: 102 ]]
	-- upvalues: reactModule (ref), var4 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var4, p1), gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
end