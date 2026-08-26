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
local var1 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), getTileBadgeByPositionConfigFromEntry (ref), twoByOneGameTileModule (ref), fFlagMigrateGameInfoToStore (ref), resolveWideAssetId (ref)
	local var2 = -((p1.maxItemIndex or 0) + 1)
	
	return reactModule.createElement(twoByOneGameTileModule, {
		size = p1.item.sizeOverride,
		layoutOrder = p1.index,
		zIndex = if p1.zIndex then p1.zIndex + var2 else var2,
		universeId = p1.item.universeId,
		placeId = p1.item.placeId,
		topicId = p1.topicId,
		logoImageAssetId = p1.item.logoAssetId,
		logoAspectRatio = p1.item.logoAspectRatio,
		headline = p1.item.headline,
		subtitle = p1.item.subtitle,
		ctaText = p1.item.ctaText,
		tileVariant = p1.item.tileVariant,
		badgeOverride = getTileBadgeByPositionConfigFromEntry(p1.item),
		payerName = p1.item.payerName,
		adId = p1.item.adId,
		isSponsored = p1.item.isSponsored,
		sponsoredUserCohort = p1.sponsoredUserCohort,
		appPage = p1.appPage,
		setGameHidden = p1.setGameHidden,
		isHidden = p1.isHidden,
		hoverKey = `TwoByOneTile_{p1.impressionsTag or ""}_{p1.index or "0"}_{p1.item.universeId}`,
		impressionsTag = p1.impressionsTag,
		index = p1.index,
		reportGameDetailOpened = p1.reportGameDetailOpened,
		reportExperienceLaunched = p1.reportExperienceLaunched,
		enableSponsoredFeedback = p1.enableSponsoredFeedback,
		enableReportAd = p1.enableReportAd,
		enableExplicitFeedback = p1.enableExplicitFeedback,
		placeIdOverride = p1.item.placeIdOverride,
		launchDataOverride = p1.item.launchDataOverride,
		onSelectionGained = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			if p1.onSelectionGained then
				p1.onSelectionGained(p1.item, p1.index, p1.item.universeId)
			end
		end, { p1.onSelectionGained, p1.item, p1.index }),
		onSelectionLost = p1.onSelectionLost,
		primaryWideImageAssetId = if fFlagMigrateGameInfoToStore then nil else p1.item.primaryWideImageAssetId,
		wideAssetId = if fFlagMigrateGameInfoToStore then resolveWideAssetId(p1.item.primaryWideImageAssetId, p1.item, p1.topicId) else nil,
		ageRatingLabel = if fFlagMigrateGameInfoToStore then p1.item.ageRecommendationDisplayName else nil,
		videoPlaybackContext = p1.videoPlaybackContext,
		SelectionOrder = p1.SelectionOrder
	})
end)

return function(p1)
	-- upvalues: reactModule (ref), var1 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var1, p1), gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
end