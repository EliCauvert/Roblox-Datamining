local parent = script:FindFirstAncestor("GameCollections").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local reactModule = require(parent.React)
local gameTileModule = require(parent.GameTile)
local twoByOneGameTile = gameTileModule.TwoByOneGameTile
local getTileBadgeByPositionConfigFromEntry = gameTileModule.getTileBadgeByPositionConfigFromEntry
local _ = require(parent.VideoUtils)
local fFlagLuaAppGameTileLockedBadge = sharedFlagsModule.FFlagLuaAppGameTileLockedBadge
local fFlagLuaAppSupportSponsoredExplicitFeedback = sharedFlagsModule.FFlagLuaAppSupportSponsoredExplicitFeedback
local fFlagLuaAppHomeTouchAutoplay = sharedFlagsModule.FFlagLuaAppHomeTouchAutoplay
local fFlagLuaAppFixCustomTileBugs = sharedFlagsModule.FFlagLuaAppFixCustomTileBugs
local var3 = reactModule.memo(function(p0) --[[ line: 45 ]]
	-- upvalues: reactModule (ref), fFlagLuaAppGameTileLockedBadge (ref), getTileBadgeByPositionConfigFromEntry (ref), twoByOneGameTile (ref), fFlagLuaAppSupportSponsoredExplicitFeedback (ref), fFlagLuaAppHomeTouchAutoplay (ref), fFlagLuaAppFixCustomTileBugs (ref)
	local var4 = -((p0.maxItemIndex or 0) + 1)
	local var5 = if p0.zIndex then p0.zIndex + var4 else var4
	local var6 = reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: p0 (ref)
		if p0.onSelectionGained then
			p0.onSelectionGained(p0.item, p0.index, p0.item.universeId)
		end
	end, { p0.onSelectionGained, p0.item, p0.index })
	local t = nil
	
	if fFlagLuaAppGameTileLockedBadge then
		t = getTileBadgeByPositionConfigFromEntry(p0.item)
	elseif p0.item.badgePosition and p0.item.badgeAnalyticsId and p0.item.badgeType and (p0.item.badgeText or p0.item.badgeIcon) then
		t = {
			[p0.item.badgePosition] = {
				{
					analyticsId = p0.item.badgeAnalyticsId,
					tileBadgeType = p0.item.badgeType,
					text = p0.item.badgeText,
					icons = if p0.item.badgeIcon then { p0.item.badgeIcon } else nil,
					tileBadgeComponentType = p0.item.badgeComponentType
				}
			}
		}
	end
	return reactModule.createElement(twoByOneGameTile, {
		size = p0.item.sizeOverride,
		layoutOrder = p0.index,
		zIndex = var5,
		universeId = p0.item.universeId,
		placeId = p0.item.placeId,
		topicId = p0.topicId,
		logoImageAssetId = p0.item.logoAssetId,
		logoAspectRatio = p0.item.logoAspectRatio,
		headline = p0.item.headline,
		subtitle = p0.item.subtitle,
		ctaText = p0.item.ctaText,
		tileVariant = p0.item.tileVariant,
		badgeOverride = t,
		payerName = p0.item.payerName,
		adId = p0.item.adId,
		isSponsored = p0.item.isSponsored,
		sponsoredUserCohort = p0.sponsoredUserCohort,
		appPage = p0.appPage,
		setGameHidden = p0.setGameHidden,
		isHidden = if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.isHidden else nil,
		hoverKey = `TwoByOneTile_{p0.impressionsTag or ""}_{p0.index or "0"}_{p0.item.universeId}`,
		impressionsTag = p0.impressionsTag,
		index = p0.index,
		reportGameDetailOpened = p0.reportGameDetailOpened,
		reportExperienceLaunched = p0.reportExperienceLaunched,
		enableSponsoredFeedback = if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.enableSponsoredFeedback else nil,
		enableReportAd = if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.enableReportAd else nil,
		enableExplicitFeedback = if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.enableExplicitFeedback else nil,
		placeIdOverride = p0.item.placeIdOverride,
		launchDataOverride = p0.item.launchDataOverride,
		onSelectionGained = var6,
		onSelectionLost = p0.onSelectionLost,
		primaryWideImageAssetId = p0.item.primaryWideImageAssetId,
		videoPlaybackContext = if fFlagLuaAppHomeTouchAutoplay then p0.videoPlaybackContext else nil,
		SelectionOrder = if fFlagLuaAppFixCustomTileBugs then p0.SelectionOrder else nil
	})
end)

return function(p1) --[[ line: 125 ]]
	-- upvalues: reactModule (ref), var3 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var3, p1), gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
end