local SponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local Parent = SponsoredTiles.Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local ReactModule = require(Parent.React)
local OneByTwoTileModule = require(SponsoredTiles.OneByTwoTile)
local GetTileBadgeByPositionConfigFromEntryFunction = require(Parent.GameTile).getTileBadgeByPositionConfigFromEntry
local _ = require(Parent.VideoUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppEnableReportExperience = SharedFlagsModule.FFlagLuaAppEnableReportExperience
local FFlagLuaAppEnableOneByTwoTileFunnelTelemetry = SharedFlagsModule.FFlagLuaAppEnableOneByTwoTileFunnelTelemetry
local MemoResult = ReactModule.memo(function(p1) --[[ Line: 51 ]]
	-- upvalues: GetTileBadgeByPositionConfigFromEntryFunction (copy), ReactModule (copy), OneByTwoTileModule (copy), FFlagLuaAppEnableReportExperience (copy), FFlagLuaAppEnableOneByTwoTileFunnelTelemetry (copy)
	local Negated = -((p1.maxItemIndex or 0) + 1)
	
	return ReactModule.createElement(OneByTwoTileModule, {
		size = p1.item.sizeOverride,
		alignmentType = if p1.item.spanOverride == nil then nil else p1.item.spanOverride.alignmentType,
		zIndex = if p1.zIndex then p1.zIndex + Negated else Negated,
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
		badgeOverride = GetTileBadgeByPositionConfigFromEntryFunction(p1.item),
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
		enableReportExperience = if FFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil,
		enableExplicitFeedback = p1.enableExplicitFeedback,
		onSelectionGained = ReactModule.useCallback(function() --[[ Line: 59 ]]
			-- upvalues: p1 (copy)
			if p1.onSelectionGained then
				p1.onSelectionGained(p1.item, p1.index, p1.item.universeId)
			end
		end, { p1.onSelectionGained, p1.item, p1.index }),
		onSelectionLost = p1.onSelectionLost,
		SelectionOrder = p1.SelectionOrder,
		oneByTwoTileFlowId = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetry then p1.item.oneByTwoTileFlowId else nil,
		recommendationsRequestId = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetry then p1.item.recommendationsRequestId else nil,
		isSdui = not FFlagLuaAppEnableOneByTwoTileFunnelTelemetry and nil
	})
end)

return function(p1) --[[ Line: 119 ]]
	-- upvalues: ReactModule (copy), MemoResult (copy), GameCollectionItemTypes (copy)
	return ReactModule.createElement(MemoResult, p1), GameCollectionItemTypes.GameCollectionItemType.OneByTwoTile
end