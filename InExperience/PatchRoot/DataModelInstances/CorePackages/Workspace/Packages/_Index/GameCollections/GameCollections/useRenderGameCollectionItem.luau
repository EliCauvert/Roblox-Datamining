local gameCollections = script:FindFirstAncestor("GameCollections")
local parent = gameCollections.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local gameTileModule = require(parent.GameTile)
local gameTileConstants = gameTileModule.GameTileConstants
local gameTileLayoutType = gameTileModule.GameTileTypes.GameTileLayoutType
local appGameTile = gameTileModule.AppGameTile
local getTileBadgeByPositionConfigFromEntry = gameTileModule.getTileBadgeByPositionConfigFromEntry
local useTriggerGameTileFeedbackCallbacksModule = require(gameCollections.useTriggerGameTileFeedbackCallbacks)
local seeAllTileModule = require(gameCollections.SeeAllTile)
local useNavigateToGameDetails = require(parent.GameTile).useNavigateToGameDetails
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local _ = require(parent.HoldToPlay)
local _ = require(parent.VideoUtils)
local fFlagLuaAppContinueSortInstantPlay = require(parent.SharedFlags).FFlagLuaAppContinueSortInstantPlay
local fFlagLuaAppEnableSponsoredReportAd = require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local fFlagLuaAppEmphasisGameTileVideo = require(parent.SharedFlags).FFlagLuaAppEmphasisGameTileVideo
local gameCollectionItemType = gameCollectionItemTypes.GameCollectionItemType

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, _, _, _, p40, p41, p42, p43, p44, p45, p46)
	-- upvalues: usePreferredInput (ref), useNavigateToGameDetails (ref), useTriggerGameTileFeedbackCallbacksModule (ref), responsiveModule (ref), useBreakpointXOrSmaller (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), gameTileConstants (ref), gameTileLayoutType (ref), reactModule (ref), seeAllTileModule (ref), gameCollectionItemType (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), fFlagLuaAppEmphasisGameTileVideo (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), getTileBadgeByPositionConfigFromEntry (ref), appGameTile (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref), fFlagLuaAppContinueSortInstantPlay (ref)
	local var1 = usePreferredInput()
	local var2 = useNavigateToGameDetails()
	local _ = nil
	local _ = nil
	local var3, var4 = useTriggerGameTileFeedbackCallbacksModule()
	local var5 = var3
	local var6 = var4
	local var7 = p7 and var1 == responsiveModule.Input.Pointer
	local var8 = if p3 ~= "Wide" then p3 == "Event" else true
	local _ = nil
	local _ = nil
	local _ = nil
	local var9 = useBreakpointXOrSmaller(responsiveModule.Keys.XSmall)
	local var10 = if useBreakpointXOrSmaller(responsiveModule.Keys.Small) and (p24 > 0 and not (if fFlagLuaAppNarrowTileHideRating then p42 else fFlagLuaAppNarrowTileHidePlayerCount and p43)) then gameTileConstants.TileTextLines[p3 or gameTileLayoutType.Narrow].largeMetadataTextLines else gameTileConstants.TileTextLines[p3 or gameTileLayoutType.Narrow].metadataTextLines
	
	return reactModule.useCallback(function(p47, p48, p49, p50)
		-- upvalues: p15 (ref), p13 (ref), reactModule (copy), seeAllTileModule (copy), gameCollectionItemType (copy), p23 (ref), p32 (ref), p30 (ref), p38 (ref), p21 (ref), p22 (ref), p14 (ref), p12 (ref), p11 (ref), p1 (ref), p16 (ref), p3 (ref), var7 (ref), p18 (ref), p8 (ref), p9 (ref), p10 (ref), p29 (ref), var2 (ref), p6 (ref), p24 (ref), p34 (ref), p33 (ref), p35 (ref), p36 (ref), p37 (ref), p31 (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), p40 (ref), p44 (ref), fFlagLuaAppEmphasisGameTileVideo (copy), fFlagLuaAppEnableHomepageOneByTwoTile (copy), p28 (ref), getTileBadgeByPositionConfigFromEntry (copy), appGameTile (copy), p4 (ref), p5 (ref), var8 (ref), p2 (ref), p17 (ref), p19 (ref), p20 (ref), var5 (write), var6 (write), p25 (ref), var10 (write), p26 (ref), p27 (ref), var9 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), p39 (ref), fFlagLuaAppNarrowTileSmallerFooterFont (copy), p41 (ref), fFlagLuaAppNarrowTileHideRating (copy), p42 (ref), fFlagLuaAppNarrowTileHidePlayerCount (copy), p43 (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), p45 (ref), fFlagLuaAppContinueSortInstantPlay (copy), p46 (ref)
		if p15 and p48 == p15 and p13 then
			return reactModule.createElement(seeAllTileModule, { onActivated = p13, size = p49, layoutOrder = p48 }), gameCollectionItemType.SeeAllTile
		end
		local var11 = if p23 then p23(p48) else nil
		local universeId = p32 and p32[p47.universeId]
		local var12 = if p30 then p30 + p48 else nil
		
		if p47.customRenderFunction then
			return p47.customRenderFunction({
				item = p47,
				index = p48,
				itemSize = p49,
				rowNum = p50,
				zIndex = -p48,
				maxItemIndex = p38,
				SelectionOrder = var12,
				isDisabled = var11,
				onSelectionGained = p21,
				onSelectionLost = p22,
				topicId = p14,
				source = p12,
				referralSource = p11,
				playerCountStyle = p1,
				hideGameStats = p16,
				gameTileLayoutType = p3,
				hoverTileEnabled = var7,
				isContained = p18,
				reportGameDetailOpened = p8,
				reportExperienceLaunched = p9,
				launchExperienceEventContext = p10,
				onPeekViewClosed = p29,
				navigateToGameDetails = var2,
				impressionsTag = p6,
				textSizeOffset = p24,
				appPage = p34,
				setGameHidden = p33,
				isHidden = universeId,
				sponsoredUserCohort = p35,
				enableSponsoredFeedback = p36,
				enableReportAd = p37,
				enableExplicitFeedback = p31,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone and p40 and not universeId then p40 else nil,
				videoPlaybackContext = p44,
				videoAnalytics = if fFlagLuaAppEmphasisGameTileVideo or fFlagLuaAppEnableHomepageOneByTwoTile then p28 else nil
			})
		end
		return reactModule.createElement(appGameTile, {
			Size = p49,
			entry = p47,
			layoutOrder = p48,
			ZIndex = -p48,
			reportGameDetailOpened = p8,
			reportExperienceLaunched = p9,
			index = p48,
			friendFooterEnabled = p4,
			showFriendActivity = p5,
			impressionsTag = p6,
			useGridTile = var8,
			playerCountStyle = p1,
			isSponsoredFooterAllowed = p2,
			gameTileLayoutType = p3,
			useHoverTile = var7,
			topicId = p14,
			launchExperienceEventContext = p10,
			referralSource = p11,
			source = p12,
			rowNum = p50,
			navigateToGameDetails = var2,
			hideGameStats = p16,
			playButtonStyle = p17,
			isContained = p18,
			hideTitle = p19,
			hideMetadata = p20,
			onGuiStateChanged = var5,
			onActivated = var6,
			isDisabled = var11,
			onSelectionGained = p21,
			onSelectionLost = p22,
			textSizeOffset = p24,
			contentTextLineCount = p25,
			metadataTextLineCount = var10,
			useExperienceTileMetadata = p26,
			forceHideAgeRatings = p27,
			videoAnalytics = p28,
			onPeekViewClosed = p29,
			SelectionOrder = var12,
			enableExplicitFeedback = p31,
			setGameHidden = p33,
			appPage = p34,
			isHidden = universeId,
			isNarrowScreenXSmall = var9,
			sponsoredUserCohort = p35,
			enableSponsoredFeedback = p36,
			enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then p37 else nil,
			isSponsoredRatingFooterAllowed = p39,
			badgeOverride = getTileBadgeByPositionConfigFromEntry(p47),
			onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone and p40 and not universeId then p40 else nil,
			compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then p41 else nil,
			hideRating = if fFlagLuaAppNarrowTileHideRating then p42 else nil,
			hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p43 else nil,
			hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p45 else nil,
			videoPlaybackContext = p44,
			enableInstantPlay = if fFlagLuaAppContinueSortInstantPlay then p46 else nil
		}), gameCollectionItemType.GameTile
	end, {
		var8, p4, p16, p5, p6, p1, p2, p3, p14, p8, p9, p13, p10, p12, p11, p15, var7,
		p17, p18, p19, p20, p24, var5, var6, p21, p22, p23, p25, p26, p27, p28, p29,
		p30, var10, p31, p32, p33, p34, var9, p35, p36,
		if fFlagLuaAppEnableSponsoredReportAd then p37 else nil, var2, p39,
		if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p40 else nil,
		if fFlagLuaAppNarrowTileSmallerFooterFont then p41 else nil,
		if fFlagLuaAppNarrowTileHideRating then p42 else nil,
		if fFlagLuaAppNarrowTileHidePlayerCount then p43 else nil,
		if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p45 else nil, p44,
		if fFlagLuaAppContinueSortInstantPlay then p46 else nil
	})
end