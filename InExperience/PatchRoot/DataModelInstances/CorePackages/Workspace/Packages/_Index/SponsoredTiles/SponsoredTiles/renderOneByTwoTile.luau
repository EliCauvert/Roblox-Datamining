local sponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local parent = sponsoredTiles.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local reactModule = require(parent.React)
local oneByTwoTileModule = require(sponsoredTiles.OneByTwoTile)
local getTileBadgeByPositionConfigFromEntry = require(parent.GameTile).getTileBadgeByPositionConfigFromEntry
local _ = require(parent.VideoUtils)
local var1 = reactModule.memo(function(p1)
	-- upvalues: getTileBadgeByPositionConfigFromEntry (ref), reactModule (ref), oneByTwoTileModule (ref)
	local var2 = -((p1.maxItemIndex or 0) + 1)
	
	return reactModule.createElement(oneByTwoTileModule, {
		size = p1.item.sizeOverride,
		zIndex = if p1.zIndex then p1.zIndex + var2 else var2,
		hoverKey = `OneByTwoTile_{p1.impressionsTag or ""}_{p1.index or "0"}_{p1.item.universeId or p1.item.clickoutUrl}`,
		contentType = p1.item.contentType,
		universeId = p1.item.universeId,
		placeId = p1.item.placeId,
		placeIdOverride = p1.item.placeIdOverride,
		launchDataOverride = p1.item.launchDataOverride,
		referralSource = p1.appPage,
		reportGameDetailOpened = p1.reportGameDetailOpened,
		reportExperienceLaunched = p1.reportExperienceLaunched,
		launchExperienceEventContext = p1.launchExperienceEventContext,
		topicId = p1.topicId,
		badgeOverride = getTileBadgeByPositionConfigFromEntry(p1.item),
		primaryImageAssetId = p1.item.primaryImageAssetId,
		primaryVideoAssetId = p1.item.primaryVideoAssetId,
		attributionThumbnailAssetId = p1.item.attributionThumbnailAssetId,
		logoImageAssetId = p1.item.logoAssetId,
		logoAspectRatio = p1.item.logoAspectRatio,
		headline = p1.item.headline,
		subtitle = p1.item.subtitle,
		ctaText = p1.item.ctaText or "",
		adId = p1.item.adId,
		impressionsTag = p1.impressionsTag,
		index = p1.index,
		clickoutUrl = p1.item.clickoutUrl,
		videoPlaybackContext = p1.videoPlaybackContext,
		videoAnalytics = p1.videoAnalytics,
		pageContext = p1.appPage,
		payerName = p1.item.payerName,
		appPage = p1.appPage,
		sponsoredUserCohort = p1.sponsoredUserCohort,
		setGameHidden = p1.setGameHidden,
		enableSponsoredFeedback = p1.enableSponsoredFeedback,
		enableReportAd = p1.enableReportAd,
		enableExplicitFeedback = p1.enableExplicitFeedback,
		onSelectionGained = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			if p1.onSelectionGained then
				p1.onSelectionGained(p1.item, p1.index, p1.item.universeId)
			end
		end, { p1.onSelectionGained, p1.item, p1.index }),
		onSelectionLost = p1.onSelectionLost,
		SelectionOrder = p1.SelectionOrder
	})
end)

return function(p1)
	-- upvalues: reactModule (ref), var1 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var1, p1), gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile
end