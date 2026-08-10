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
local fFlagLuaAppGameTileInteractionFeedback = require(parent.SharedFlags).FFlagLuaAppGameTileInteractionFeedback
local fFlagLuaAppEnableSponsoredReportAd = require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local gameCollectionItemType = gameCollectionItemTypes.GameCollectionItemType

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, _, _, _, p39, p40, p41, p42, p43, p44) --[[ line: 37 | named "useRenderGameCollectionItem" ]]
	-- upvalues: usePreferredInput (ref), useNavigateToGameDetails (ref), fFlagLuaAppGameTileInteractionFeedback (ref), useTriggerGameTileFeedbackCallbacksModule (ref), responsiveModule (ref), useBreakpointXOrSmaller (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), gameTileConstants (ref), gameTileLayoutType (ref), reactModule (ref), seeAllTileModule (ref), gameCollectionItemType (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), getTileBadgeByPositionConfigFromEntry (ref), appGameTile (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref)
	local var6 = usePreferredInput()
	local var7 = useNavigateToGameDetails()
	local var8 = nil
	local var9 = nil
	
	if fFlagLuaAppGameTileInteractionFeedback then
		local var10, var11 = useTriggerGameTileFeedbackCallbacksModule()
		var8 = var10
		var9 = var11
	end
	local var12 = p6 and var6 == responsiveModule.Input.Pointer
	local var13 = if p2 ~= "Wide" then p2 == "Event" else true
	local _ = nil
	local _ = nil
	local _ = nil
	local var14 = useBreakpointXOrSmaller(responsiveModule.Keys.XSmall)
	local var15 = if useBreakpointXOrSmaller(responsiveModule.Keys.Small) and (p23 > 0 and not (if fFlagLuaAppNarrowTileHideRating then p41 else fFlagLuaAppNarrowTileHidePlayerCount and p42)) then gameTileConstants.TileTextLines[p2 or gameTileLayoutType.Narrow].largeMetadataTextLines else gameTileConstants.TileTextLines[p2 or gameTileLayoutType.Narrow].metadataTextLines
	
	return reactModule.useCallback(function(p45, p46, p47, p48) --[[ line: 166 ]]
		-- upvalues: p14 (ref), p12 (ref), reactModule (copy), seeAllTileModule (copy), gameCollectionItemType (copy), p22 (ref), p31 (ref), p29 (ref), p37 (ref), p20 (ref), p21 (ref), p13 (ref), p11 (ref), p10 (ref), p0 (ref), p15 (ref), p2 (ref), var12 (ref), p17 (ref), p7 (ref), p8 (ref), p9 (ref), p28 (ref), var7 (ref), p5 (ref), p23 (ref), p33 (ref), p32 (ref), p34 (ref), p35 (ref), p36 (ref), p30 (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), p39 (ref), p43 (ref), getTileBadgeByPositionConfigFromEntry (copy), appGameTile (copy), p3 (ref), p4 (ref), var13 (ref), p1 (ref), p16 (ref), p18 (ref), p19 (ref), fFlagLuaAppGameTileInteractionFeedback (copy), var8 (write), var9 (write), p24 (ref), var15 (write), p25 (ref), p26 (ref), p27 (ref), var14 (ref), fFlagLuaAppEnableSponsoredReportAd (copy), p38 (ref), fFlagLuaAppNarrowTileSmallerFooterFont (copy), p40 (ref), fFlagLuaAppNarrowTileHideRating (copy), p41 (ref), fFlagLuaAppNarrowTileHidePlayerCount (copy), p42 (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), p44 (ref)
		if p14 and p46 == p14 and p12 then
			return reactModule.createElement(seeAllTileModule, { onActivated = p12, size = p47, layoutOrder = p46 }), gameCollectionItemType.SeeAllTile
		end
		local var16 = if p22 then p22(p46) else nil
		local universeId = p31 and p31[p45.universeId]
		local var18 = if p29 then p29 + p46 else nil
		
		if p45.customRenderFunction then
			return p45.customRenderFunction({
				item = p45,
				index = p46,
				itemSize = p47,
				rowNum = p48,
				zIndex = -p46,
				maxItemIndex = p37,
				SelectionOrder = var18,
				isDisabled = var16,
				onSelectionGained = p20,
				onSelectionLost = p21,
				topicId = p13,
				source = p11,
				referralSource = p10,
				playerCountStyle = p0,
				hideGameStats = p15,
				gameTileLayoutType = p2,
				hoverTileEnabled = var12,
				isContained = p17,
				reportGameDetailOpened = p7,
				reportExperienceLaunched = p8,
				launchExperienceEventContext = p9,
				onPeekViewClosed = p28,
				navigateToGameDetails = var7,
				impressionsTag = p5,
				textSizeOffset = p23,
				appPage = p33,
				setGameHidden = p32,
				isHidden = universeId,
				sponsoredUserCohort = p34,
				enableSponsoredFeedback = p35,
				enableReportAd = p36,
				enableExplicitFeedback = p30,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone and p39 and not universeId then p39 else nil,
				videoPlaybackContext = p43
			})
		end
		return reactModule.createElement(appGameTile, {
			Size = p47,
			entry = p45,
			layoutOrder = p46,
			ZIndex = -p46,
			reportGameDetailOpened = p7,
			reportExperienceLaunched = p8,
			index = p46,
			friendFooterEnabled = p3,
			showFriendActivity = p4,
			impressionsTag = p5,
			useGridTile = var13,
			playerCountStyle = p0,
			isSponsoredFooterAllowed = p1,
			gameTileLayoutType = p2,
			useHoverTile = var12,
			topicId = p13,
			launchExperienceEventContext = p9,
			referralSource = p10,
			source = p11,
			rowNum = p48,
			navigateToGameDetails = var7,
			hideGameStats = p15,
			playButtonStyle = p16,
			isContained = p17,
			hideTitle = p18,
			hideMetadata = p19,
			onGuiStateChanged = if fFlagLuaAppGameTileInteractionFeedback then var8 else nil,
			onActivated = if fFlagLuaAppGameTileInteractionFeedback then var9 else nil,
			isDisabled = var16,
			onSelectionGained = p20,
			onSelectionLost = p21,
			textSizeOffset = p23,
			contentTextLineCount = p24,
			metadataTextLineCount = var15,
			useExperienceTileMetadata = p25,
			forceHideAgeRatings = p26,
			videoAnalytics = p27,
			onPeekViewClosed = p28,
			SelectionOrder = var18,
			enableExplicitFeedback = p30,
			setGameHidden = p32,
			appPage = p33,
			isHidden = universeId,
			isNarrowScreenXSmall = var14,
			sponsoredUserCohort = p34,
			enableSponsoredFeedback = p35,
			enableReportAd = if fFlagLuaAppEnableSponsoredReportAd then p36 else nil,
			isSponsoredRatingFooterAllowed = p38,
			badgeOverride = getTileBadgeByPositionConfigFromEntry(p45),
			onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone and p39 and not universeId then p39 else nil,
			compactMetadataFormat = if fFlagLuaAppNarrowTileSmallerFooterFont then p40 else nil,
			hideRating = if fFlagLuaAppNarrowTileHideRating then p41 else nil,
			hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p42 else nil,
			hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p44 else nil,
			videoPlaybackContext = p43
		}), gameCollectionItemType.GameTile
	end, {
		var13, p3, p15, p4, p5, p0, p1, p2, p13, p7, p8, p12, p9, p11, p10, p14, var12,
		p16, p17, p18, p19, p23,
		if fFlagLuaAppGameTileInteractionFeedback then var8 else nil,
		if fFlagLuaAppGameTileInteractionFeedback then var9 else nil, p20, p21, p22,
		p24, p25, p26, p27, p28, p29, var15, p30, p31, p32, p33, var14, p34, p35,
		if fFlagLuaAppEnableSponsoredReportAd then p36 else nil, var7, p38,
		if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p39 else nil,
		if fFlagLuaAppNarrowTileSmallerFooterFont then p40 else nil,
		if fFlagLuaAppNarrowTileHideRating then p41 else nil,
		if fFlagLuaAppNarrowTileHidePlayerCount then p42 else nil,
		if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p44 else nil, p43
	})
end