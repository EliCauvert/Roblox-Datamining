local sponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local parent = sponsoredTiles.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local reactModule = require(parent.React)
local oneByTwoTileModule = require(sponsoredTiles.OneByTwoTile)
local getTileBadgeByPositionConfigFromEntry = require(parent.GameTile).getTileBadgeByPositionConfigFromEntry
local _ = require(parent.VideoUtils)
local var3 = reactModule.memo(function(p0)
	-- upvalues: getTileBadgeByPositionConfigFromEntry (ref), reactModule (ref), oneByTwoTileModule (ref)
	local var4 = -((p0.maxItemIndex or 0) + 1)
	
	return reactModule.createElement(oneByTwoTileModule, {
		size = p0.item.sizeOverride,
		zIndex = if p0.zIndex then p0.zIndex + var4 else var4,
		hoverKey = `OneByTwoTile_{p0.impressionsTag or ""}_{p0.index or "0"}_{p0.item.universeId or p0.item.clickoutUrl}`,
		contentType = p0.item.contentType,
		universeId = p0.item.universeId,
		placeId = p0.item.placeId,
		placeIdOverride = p0.item.placeIdOverride,
		launchDataOverride = p0.item.launchDataOverride,
		referralSource = p0.appPage,
		reportGameDetailOpened = p0.reportGameDetailOpened,
		reportExperienceLaunched = p0.reportExperienceLaunched,
		launchExperienceEventContext = p0.launchExperienceEventContext,
		topicId = p0.topicId,
		badgeOverride = getTileBadgeByPositionConfigFromEntry(p0.item),
		primaryImageAssetId = p0.item.primaryImageAssetId,
		primaryVideoAssetId = p0.item.primaryVideoAssetId,
		attributionThumbnailAssetId = p0.item.attributionThumbnailAssetId,
		logoImageAssetId = p0.item.logoAssetId,
		logoAspectRatio = p0.item.logoAspectRatio,
		headline = p0.item.headline,
		subtitle = p0.item.subtitle,
		ctaText = p0.item.ctaText or "",
		adId = p0.item.adId,
		impressionsTag = p0.impressionsTag,
		index = p0.index,
		clickoutUrl = p0.item.clickoutUrl,
		videoPlaybackContext = p0.videoPlaybackContext,
		videoAnalytics = p0.videoAnalytics,
		pageContext = p0.appPage,
		payerName = p0.item.payerName,
		appPage = p0.appPage,
		sponsoredUserCohort = p0.sponsoredUserCohort,
		setGameHidden = p0.setGameHidden,
		enableSponsoredFeedback = p0.enableSponsoredFeedback,
		enableReportAd = p0.enableReportAd,
		enableExplicitFeedback = p0.enableExplicitFeedback,
		onSelectionGained = reactModule.useCallback(function()
			-- upvalues: p0 (ref)
			if p0.onSelectionGained then
				p0.onSelectionGained(p0.item, p0.index, p0.item.universeId)
			end
		end, { p0.onSelectionGained, p0.item, p0.index }),
		onSelectionLost = p0.onSelectionLost,
		SelectionOrder = p0.SelectionOrder
	})
end)

return function(p1)
	-- upvalues: reactModule (ref), var3 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var3, p1), gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile
end