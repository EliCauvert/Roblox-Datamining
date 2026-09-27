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
local fFlagLuaAppEnableReportExperience = require(parent.SharedFlags).FFlagLuaAppEnableReportExperience
local fFlagLuaAppNarrowTileHideRating = require(parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local fFlagLuaAppNarrowTileHidePlayerCount = require(parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppUsePrevalidatedVideoGamePlayability = require(parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local fFlagLuaAppEmphasisGameTileVideo = require(parent.SharedFlags).FFlagLuaAppEmphasisGameTileVideo
local gameCollectionItemType = gameCollectionItemTypes.GameCollectionItemType

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40, _, _, _, p41, p42, p43, p44, p45, p46, p47)
	-- upvalues: usePreferredInput (ref), useNavigateToGameDetails (ref), useTriggerGameTileFeedbackCallbacksModule (ref), responsiveModule (ref), fFlagLuaAppContinueSortInstantPlay (ref), useBreakpointXOrSmaller (ref), fFlagLuaAppNarrowTileHideRating (ref), fFlagLuaAppNarrowTileHidePlayerCount (ref), gameTileConstants (ref), gameTileLayoutType (ref), reactModule (ref), seeAllTileModule (ref), gameCollectionItemType (ref), fFlagLuaAppEnableReportExperience (ref), fFlagLuaAppEmphasisGameTileVideo (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), getTileBadgeByPositionConfigFromEntry (ref), appGameTile (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (ref)
	local var1
	local var2 = usePreferredInput()
	local var3 = useNavigateToGameDetails()
	local _ = nil
	local _ = nil
	local var4, var5 = useTriggerGameTileFeedbackCallbacksModule()
	local var6 = var4
	local var7 = var5
	local var8 = p7 and var2 == responsiveModule.Input.Pointer
	
	if fFlagLuaAppContinueSortInstantPlay then
		var1 = var2 == responsiveModule.Input.Touch
		var1 = nil
	else
		var1 = nil
	end
	local var9 = if p3 ~= "Wide" then p3 == "Event" else true
	local _ = nil
	local _ = nil
	local _ = nil
	local var10 = useBreakpointXOrSmaller(responsiveModule.Keys.XSmall)
	local var11 = if useBreakpointXOrSmaller(responsiveModule.Keys.Small) and (p24 > 0 and not (if fFlagLuaAppNarrowTileHideRating then p42 else fFlagLuaAppNarrowTileHidePlayerCount and p43)) then gameTileConstants.TileTextLines[p3 or gameTileLayoutType.Narrow].largeMetadataTextLines else gameTileConstants.TileTextLines[p3 or gameTileLayoutType.Narrow].metadataTextLines
	
	return reactModule.useCallback(function(p48, p49, p50, p51)
		-- upvalues: p15 (ref), p13 (ref), reactModule (copy), seeAllTileModule (copy), gameCollectionItemType (copy), p23 (ref), p32 (ref), p30 (ref), p39 (ref), p21 (ref), p22 (ref), p14 (ref), p12 (ref), p11 (ref), p1 (ref), p16 (ref), p3 (ref), var8 (ref), p18 (ref), p8 (ref), p9 (ref), p10 (ref), p29 (ref), var3 (ref), p6 (ref), p24 (ref), p34 (ref), p33 (ref), p35 (ref), p36 (ref), p37 (ref), fFlagLuaAppEnableReportExperience (copy), p38 (ref), p31 (ref), p44 (ref), fFlagLuaAppEmphasisGameTileVideo (copy), fFlagLuaAppEnableHomepageOneByTwoTile (copy), p28 (ref), getTileBadgeByPositionConfigFromEntry (copy), appGameTile (copy), p4 (ref), p5 (ref), var9 (ref), p2 (ref), p17 (ref), p19 (ref), p20 (ref), var6 (write), var7 (write), p25 (ref), var11 (write), p26 (ref), p27 (ref), var10 (ref), p40 (ref), p41 (ref), fFlagLuaAppNarrowTileHideRating (copy), p42 (ref), fFlagLuaAppNarrowTileHidePlayerCount (copy), p43 (ref), fFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), p45 (ref), fFlagLuaAppContinueSortInstantPlay (copy), p46 (ref), p47 (ref), var1 (ref)
		if p15 and p49 == p15 and p13 then
			return reactModule.createElement(seeAllTileModule, { onActivated = p13, size = p50, layoutOrder = p49 }), gameCollectionItemType.SeeAllTile
		end
		local var12 = if p23 then p23(p49) else nil
		local universeId = p32 and p32[p48.universeId]
		local var13 = if p30 then p30 + p49 else nil
		
		if not p48.customRenderFunction then
			return reactModule.createElement(appGameTile, {
				Size = p50,
				entry = p48,
				layoutOrder = p49,
				ZIndex = -p49,
				reportGameDetailOpened = p8,
				reportExperienceLaunched = p9,
				index = p49,
				friendFooterEnabled = p4,
				showFriendActivity = p5,
				impressionsTag = p6,
				useGridTile = var9,
				playerCountStyle = p1,
				isSponsoredFooterAllowed = p2,
				gameTileLayoutType = p3,
				useHoverTile = var8,
				topicId = p14,
				launchExperienceEventContext = p10,
				referralSource = p11,
				source = p12,
				rowNum = p51,
				navigateToGameDetails = var3,
				hideGameStats = p16,
				playButtonStyle = p17,
				isContained = p18,
				hideTitle = p19,
				hideMetadata = p20,
				onGuiStateChanged = var6,
				onActivated = var7,
				isDisabled = var12,
				onSelectionGained = p21,
				onSelectionLost = p22,
				textSizeOffset = p24,
				contentTextLineCount = p25,
				metadataTextLineCount = var11,
				useExperienceTileMetadata = p26,
				forceHideAgeRatings = p27,
				videoAnalytics = p28,
				onPeekViewClosed = p29,
				SelectionOrder = var13,
				enableExplicitFeedback = p31,
				setGameHidden = p33,
				appPage = p34,
				isHidden = universeId,
				isNarrowScreenXSmall = var10,
				sponsoredUserCohort = p35,
				enableSponsoredFeedback = p36,
				enableReportAd = p37,
				enableReportExperience = if fFlagLuaAppEnableReportExperience then p38 else nil,
				isSponsoredRatingFooterAllowed = p40,
				badgeOverride = getTileBadgeByPositionConfigFromEntry(p48),
				compactMetadataFormat = p41,
				hideRating = if fFlagLuaAppNarrowTileHideRating then p42 else nil,
				hidePlayerCount = if fFlagLuaAppNarrowTileHidePlayerCount then p43 else nil,
				hasPrevalidatedVideoGamePlayability = if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p45 else nil,
				videoPlaybackContext = p44,
				enableInstantPlay = if fFlagLuaAppContinueSortInstantPlay then p46 else nil,
				instantPlayTreatment = if fFlagLuaAppContinueSortInstantPlay then p47 else nil,
				isTouchPreferredInput = if fFlagLuaAppContinueSortInstantPlay then var1 else nil
			}), gameCollectionItemType.GameTile
		end
		return p48.customRenderFunction({
			item = p48,
			index = p49,
			itemSize = p50,
			rowNum = p51,
			zIndex = -p49,
			maxItemIndex = p39,
			SelectionOrder = var13,
			isDisabled = var12,
			onSelectionGained = p21,
			onSelectionLost = p22,
			topicId = p14,
			source = p12,
			referralSource = p11,
			playerCountStyle = p1,
			hideGameStats = p16,
			gameTileLayoutType = p3,
			hoverTileEnabled = var8,
			isContained = p18,
			reportGameDetailOpened = p8,
			reportExperienceLaunched = p9,
			launchExperienceEventContext = p10,
			onPeekViewClosed = p29,
			navigateToGameDetails = var3,
			impressionsTag = p6,
			textSizeOffset = p24,
			appPage = p34,
			setGameHidden = p33,
			isHidden = universeId,
			sponsoredUserCohort = p35,
			enableSponsoredFeedback = p36,
			enableReportAd = p37,
			enableReportExperience = if fFlagLuaAppEnableReportExperience then p38 else nil,
			enableExplicitFeedback = p31,
			videoPlaybackContext = p44,
			videoAnalytics = if fFlagLuaAppEmphasisGameTileVideo or fFlagLuaAppEnableHomepageOneByTwoTile then p28 else nil
		})
	end, {
		var9, p4, p16, p5, p6, p1, p2, p3, p14, p8, p9, p13, p10, p12, p11, p15, var8,
		p17, p18, p19, p20, p24, var6, var7, p21, p22, p23, p25, p26, p27, p28, p29,
		p30, var11, p31, p32, p33, p34, var10, p35, p36, p37,
		if fFlagLuaAppEnableReportExperience then p38 else nil, var3, p40, p41,
		if fFlagLuaAppNarrowTileHideRating then p42 else nil,
		if fFlagLuaAppNarrowTileHidePlayerCount then p43 else nil,
		if fFlagLuaAppUsePrevalidatedVideoGamePlayability then p45 else nil, p44,
		if fFlagLuaAppContinueSortInstantPlay then p46 else nil,
		if fFlagLuaAppContinueSortInstantPlay then p47 else nil,
		if fFlagLuaAppContinueSortInstantPlay then var1 else nil
	})
end