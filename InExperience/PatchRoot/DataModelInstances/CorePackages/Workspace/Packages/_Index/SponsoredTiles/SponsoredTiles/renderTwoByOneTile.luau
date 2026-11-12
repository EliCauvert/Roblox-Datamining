local SponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local Parent = SponsoredTiles.Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local ReactModule = require(Parent.React)
local GameTileModule = require(Parent.GameTile)
local TwoByOneGameTileModule = require(SponsoredTiles.TwoByOneGameTile)
local GetTileBadgeByPositionConfigFromEntryFunction = GameTileModule.getTileBadgeByPositionConfigFromEntry
local ResolveWideAssetIdFunction = GameTileModule.resolveWideAssetId
local _ = require(Parent.VideoUtils)
local FFlagMigrateGameInfoToStore = require(Parent.SharedFlags).FFlagMigrateGameInfoToStore
local FFlagLuaAppEnableReportExperience = require(Parent.SharedFlags).FFlagLuaAppEnableReportExperience
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), GetTileBadgeByPositionConfigFromEntryFunction (copy), TwoByOneGameTileModule (copy), FFlagLuaAppEnableReportExperience (copy), FFlagMigrateGameInfoToStore (copy), ResolveWideAssetIdFunction (copy)
	local Negated = -((p1.maxItemIndex or 0) + 1)
	
	return ReactModule.createElement(TwoByOneGameTileModule, {
		size = p1.item.sizeOverride,
		layoutOrder = p1.index,
		zIndex = if p1.zIndex then p1.zIndex + Negated else Negated,
		universeId = p1.item.universeId,
		placeId = p1.item.placeId,
		topicId = p1.topicId,
		logoImageAssetId = p1.item.logoAssetId,
		logoAspectRatio = p1.item.logoAspectRatio,
		headline = p1.item.headline,
		subtitle = p1.item.subtitle,
		ctaText = p1.item.ctaText,
		tileVariant = p1.item.tileVariant,
		badgeOverride = GetTileBadgeByPositionConfigFromEntryFunction(p1.item),
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
		enableReportExperience = if FFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil,
		enableExplicitFeedback = p1.enableExplicitFeedback,
		placeIdOverride = p1.item.placeIdOverride,
		launchDataOverride = p1.item.launchDataOverride,
		onSelectionGained = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			if p1.onSelectionGained then
				p1.onSelectionGained(p1.item, p1.index, p1.item.universeId)
			end
		end, { p1.onSelectionGained, p1.item, p1.index }),
		onSelectionLost = p1.onSelectionLost,
		primaryWideImageAssetId = if FFlagMigrateGameInfoToStore then nil else p1.item.primaryWideImageAssetId,
		wideAssetId = if FFlagMigrateGameInfoToStore then ResolveWideAssetIdFunction(p1.item.primaryWideImageAssetId, p1.item, p1.topicId) else nil,
		ageRatingLabel = if FFlagMigrateGameInfoToStore then p1.item.ageRecommendationDisplayName else nil,
		videoPlaybackContext = p1.videoPlaybackContext,
		SelectionOrder = p1.SelectionOrder
	})
end)

return function(p1)
	-- upvalues: ReactModule (copy), MemoResult (copy), GameCollectionItemTypes (copy)
	return ReactModule.createElement(MemoResult, p1), GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
end