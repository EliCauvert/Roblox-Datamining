local parent = script:FindFirstAncestor("GameCollections").Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local reactModule = require(parent.React)
local gameTileModule = require(parent.GameTile)
local twoByOneGameTile = gameTileModule.TwoByOneGameTile
local getTileBadgeByPositionConfigFromEntry = gameTileModule.getTileBadgeByPositionConfigFromEntry
local _ = require(parent.VideoUtils)
local var2 = reactModule.memo(function(p0) --[[ line: 39 ]]
	-- upvalues: reactModule (ref), getTileBadgeByPositionConfigFromEntry (ref), twoByOneGameTile (ref)
	local var3 = -((p0.maxItemIndex or 0) + 1)
	
	return reactModule.createElement(twoByOneGameTile, {
		size = p0.item.sizeOverride,
		layoutOrder = p0.index,
		zIndex = if p0.zIndex then p0.zIndex + var3 else var3,
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
		onSelectionGained = reactModule.useCallback(function() --[[ line: 44 ]]
			-- upvalues: p0 (ref)
			if p0.onSelectionGained then
				p0.onSelectionGained(p0.item, p0.index, p0.item.universeId)
			end
		end, { p0.onSelectionGained, p0.item, p0.index }),
		onSelectionLost = p0.onSelectionLost,
		primaryWideImageAssetId = p0.item.primaryWideImageAssetId,
		videoPlaybackContext = p0.videoPlaybackContext,
		SelectionOrder = p0.SelectionOrder
	})
end)

return function(p1) --[[ line: 93 ]]
	-- upvalues: reactModule (ref), var2 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var2, p1), gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
end