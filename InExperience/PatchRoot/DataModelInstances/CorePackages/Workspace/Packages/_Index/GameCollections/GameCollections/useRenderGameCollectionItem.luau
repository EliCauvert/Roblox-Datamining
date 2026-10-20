local GameCollections = script:FindFirstAncestor("GameCollections")
local Parent = GameCollections.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local GameTileModule = require(Parent.GameTile)
local GameTileConstants = GameTileModule.GameTileConstants
local GameTileLayoutType = GameTileModule.GameTileTypes.GameTileLayoutType
local AppGameTile = GameTileModule.AppGameTile
local GetTileBadgeByPositionConfigFromEntryFunction = GameTileModule.getTileBadgeByPositionConfigFromEntry
local UseTriggerGameTileFeedbackCallbacksModule = require(GameCollections.useTriggerGameTileFeedbackCallbacks)
local SeeAllTileModule = require(GameCollections.SeeAllTile)
local UseNavigateToGameDetailsFunction = require(Parent.GameTile).useNavigateToGameDetails
local _ = require(Parent.HoldToPlay)
local _ = require(Parent.VideoUtils)
local FFlagLuaAppContinueSortInstantPlay = require(Parent.SharedFlags).FFlagLuaAppContinueSortInstantPlay
local FFlagLuaAppEnableReportExperience = require(Parent.SharedFlags).FFlagLuaAppEnableReportExperience
local FFlagLuaAppNarrowTileHideRating = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local FFlagLuaAppEmphasisGameTileVideo = require(Parent.SharedFlags).FFlagLuaAppEmphasisGameTileVideo
local GameCollectionItemType = require(Parent.DiscoveryTypes).GameCollectionItemTypes.GameCollectionItemType

return function(PlayerCountStyle, IsSponsoredFooterAllowed, GameTileLayoutType1, FriendFooterEnabled, ShowFriendActivity, ImpressionsTag, p1, ReportGameDetailOpened, ReportExperienceLaunched, LaunchExperienceEventContext, ReferralSource, Source, OnActivated, TopicId, Index, HideGameStats, PlayButtonStyle, IsContained, HideTitle, HideMetadata, OnSelectionGained, OnSelectionLost, Callback, TextSizeOffset: number, ContentTextLineCount, UseExperienceTileMetadata, ForceHideAgeRatings, VideoAnalytics, OnPeekViewClosed, p2, EnableExplicitFeedback, p3, SetGameHidden, AppPage, SponsoredUserCohort, EnableSponsoredFeedback, EnableReportAd, p4, MaxItemIndex, IsSponsoredRatingFooterAllowed, _, _, _, CompactMetadataFormat, p5, p6, VideoPlaybackContext, p7, p8, p9)
	-- upvalues: UsePreferredInputFunction (copy), UseNavigateToGameDetailsFunction (copy), UseTriggerGameTileFeedbackCallbacksModule (copy), ResponsiveModule (copy), FFlagLuaAppContinueSortInstantPlay (copy), UseBreakpointXOrSmallerFunction (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), GameTileConstants (copy), GameTileLayoutType (copy), ReactModule (copy), SeeAllTileModule (copy), GameCollectionItemType (copy), FFlagLuaAppEnableReportExperience (copy), FFlagLuaAppEmphasisGameTileVideo (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), GetTileBadgeByPositionConfigFromEntryFunction (copy), AppGameTile (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy)
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseNavigateToGameDetailsResult = UseNavigateToGameDetailsFunction()
	local UseTriggerGameTileFeedbackCallbacksModuleResult = nil
	local UseTriggerGameTileFeedbackCallbacksModuleResult2 = nil
	UseTriggerGameTileFeedbackCallbacksModuleResult, UseTriggerGameTileFeedbackCallbacksModuleResult2 = UseTriggerGameTileFeedbackCallbacksModule()
	local IsUsePreferredInputResultMatch: boolean = p1 and UsePreferredInputResult == ResponsiveModule.Input.Pointer
	local IsUsePreferredInputResultMatch1 = if FFlagLuaAppContinueSortInstantPlay then UsePreferredInputResult == ResponsiveModule.Input.Touch else nil
	local IsWide: boolean = GameTileLayoutType1 == "Wide" or GameTileLayoutType1 == "Event"
	local LargeMetadataTextLines = nil
	local UseBreakpointXOrSmallerResult = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small)
	local UseBreakpointXOrSmallerResult1 = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.XSmall)
	LargeMetadataTextLines = if UseBreakpointXOrSmallerResult and (TextSizeOffset > 0 and not (FFlagLuaAppNarrowTileHideRating and p5 or FFlagLuaAppNarrowTileHidePlayerCount and p6)) then GameTileConstants.TileTextLines[GameTileLayoutType1 or GameTileLayoutType.Narrow].largeMetadataTextLines else GameTileConstants.TileTextLines[GameTileLayoutType1 or GameTileLayoutType.Narrow].metadataTextLines
	
	return (ReactModule.useCallback(function(Entry, Index1, Size, RowNum)
		-- upvalues: Index (copy), OnActivated (copy), ReactModule (upval), SeeAllTileModule (upval), GameCollectionItemType (upval), Callback (copy), p3 (copy), p2 (copy), MaxItemIndex (copy), OnSelectionGained (copy), OnSelectionLost (copy), TopicId (copy), Source (copy), ReferralSource (copy), PlayerCountStyle (copy), HideGameStats (copy), GameTileLayoutType1 (copy), IsUsePreferredInputResultMatch (copy), IsContained (copy), ReportGameDetailOpened (copy), ReportExperienceLaunched (copy), LaunchExperienceEventContext (copy), OnPeekViewClosed (copy), UseNavigateToGameDetailsResult (copy), ImpressionsTag (copy), TextSizeOffset (copy), AppPage (copy), SetGameHidden (copy), SponsoredUserCohort (copy), EnableSponsoredFeedback (copy), EnableReportAd (copy), FFlagLuaAppEnableReportExperience (upval), p4 (copy), EnableExplicitFeedback (copy), VideoPlaybackContext (copy), FFlagLuaAppEmphasisGameTileVideo (upval), FFlagLuaAppEnableHomepageOneByTwoTile (upval), VideoAnalytics (copy), GetTileBadgeByPositionConfigFromEntryFunction (upval), AppGameTile (upval), FriendFooterEnabled (copy), ShowFriendActivity (copy), IsWide (copy), IsSponsoredFooterAllowed (copy), PlayButtonStyle (copy), HideTitle (copy), HideMetadata (copy), UseTriggerGameTileFeedbackCallbacksModuleResult (ref), UseTriggerGameTileFeedbackCallbacksModuleResult2 (ref), ContentTextLineCount (copy), LargeMetadataTextLines (ref), UseExperienceTileMetadata (copy), ForceHideAgeRatings (copy), UseBreakpointXOrSmallerResult1 (copy), IsSponsoredRatingFooterAllowed (copy), CompactMetadataFormat (copy), FFlagLuaAppNarrowTileHideRating (upval), p5 (copy), FFlagLuaAppNarrowTileHidePlayerCount (upval), p6 (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (upval), p7 (copy), FFlagLuaAppContinueSortInstantPlay (upval), p8 (copy), p9 (copy), IsUsePreferredInputResultMatch1 (copy)
		if Index and Index1 == Index and OnActivated then
			return ReactModule.createElement(SeeAllTileModule, {
				onActivated = OnActivated,
				size = Size,
				layoutOrder = Index1
			}), GameCollectionItemType.SeeAllTile
		end
		local CallbackResult = if Callback then Callback(Index1) else nil
		local IsHidden = p3 and p3[Entry.universeId]
		local NewIndex = if p2 then p2 + Index1 else nil
		
		if Entry.customRenderFunction then
			return Entry.customRenderFunction({
				item = Entry,
				index = Index1,
				itemSize = Size,
				rowNum = RowNum,
				zIndex = -Index1,
				maxItemIndex = MaxItemIndex,
				SelectionOrder = NewIndex,
				isDisabled = CallbackResult,
				onSelectionGained = OnSelectionGained,
				onSelectionLost = OnSelectionLost,
				topicId = TopicId,
				source = Source,
				referralSource = ReferralSource,
				playerCountStyle = PlayerCountStyle,
				hideGameStats = HideGameStats,
				gameTileLayoutType = GameTileLayoutType1,
				hoverTileEnabled = IsUsePreferredInputResultMatch,
				isContained = IsContained,
				reportGameDetailOpened = ReportGameDetailOpened,
				reportExperienceLaunched = ReportExperienceLaunched,
				launchExperienceEventContext = LaunchExperienceEventContext,
				onPeekViewClosed = OnPeekViewClosed,
				navigateToGameDetails = UseNavigateToGameDetailsResult,
				impressionsTag = ImpressionsTag,
				textSizeOffset = TextSizeOffset,
				appPage = AppPage,
				setGameHidden = SetGameHidden,
				isHidden = IsHidden,
				sponsoredUserCohort = SponsoredUserCohort,
				enableSponsoredFeedback = EnableSponsoredFeedback,
				enableReportAd = EnableReportAd,
				enableReportExperience = if FFlagLuaAppEnableReportExperience then p4 else nil,
				enableExplicitFeedback = EnableExplicitFeedback,
				videoPlaybackContext = VideoPlaybackContext,
				videoAnalytics = if FFlagLuaAppEmphasisGameTileVideo or FFlagLuaAppEnableHomepageOneByTwoTile then VideoAnalytics else nil
			})
		else
			return ReactModule.createElement(AppGameTile, {
				Size = Size,
				entry = Entry,
				layoutOrder = Index1,
				ZIndex = -Index1,
				reportGameDetailOpened = ReportGameDetailOpened,
				reportExperienceLaunched = ReportExperienceLaunched,
				index = Index1,
				friendFooterEnabled = FriendFooterEnabled,
				showFriendActivity = ShowFriendActivity,
				impressionsTag = ImpressionsTag,
				useGridTile = IsWide,
				playerCountStyle = PlayerCountStyle,
				isSponsoredFooterAllowed = IsSponsoredFooterAllowed,
				gameTileLayoutType = GameTileLayoutType1,
				useHoverTile = IsUsePreferredInputResultMatch,
				topicId = TopicId,
				launchExperienceEventContext = LaunchExperienceEventContext,
				referralSource = ReferralSource,
				source = Source,
				rowNum = RowNum,
				navigateToGameDetails = UseNavigateToGameDetailsResult,
				hideGameStats = HideGameStats,
				playButtonStyle = PlayButtonStyle,
				isContained = IsContained,
				hideTitle = HideTitle,
				hideMetadata = HideMetadata,
				onGuiStateChanged = UseTriggerGameTileFeedbackCallbacksModuleResult,
				onActivated = UseTriggerGameTileFeedbackCallbacksModuleResult2,
				isDisabled = CallbackResult,
				onSelectionGained = OnSelectionGained,
				onSelectionLost = OnSelectionLost,
				textSizeOffset = TextSizeOffset,
				contentTextLineCount = ContentTextLineCount,
				metadataTextLineCount = LargeMetadataTextLines,
				useExperienceTileMetadata = UseExperienceTileMetadata,
				forceHideAgeRatings = ForceHideAgeRatings,
				videoAnalytics = VideoAnalytics,
				onPeekViewClosed = OnPeekViewClosed,
				SelectionOrder = NewIndex,
				enableExplicitFeedback = EnableExplicitFeedback,
				setGameHidden = SetGameHidden,
				appPage = AppPage,
				isHidden = IsHidden,
				isNarrowScreenXSmall = UseBreakpointXOrSmallerResult1,
				sponsoredUserCohort = SponsoredUserCohort,
				enableSponsoredFeedback = EnableSponsoredFeedback,
				enableReportAd = EnableReportAd,
				enableReportExperience = if FFlagLuaAppEnableReportExperience then p4 else nil,
				isSponsoredRatingFooterAllowed = IsSponsoredRatingFooterAllowed,
				badgeOverride = GetTileBadgeByPositionConfigFromEntryFunction(Entry),
				compactMetadataFormat = CompactMetadataFormat,
				hideRating = if FFlagLuaAppNarrowTileHideRating then p5 else nil,
				hidePlayerCount = if FFlagLuaAppNarrowTileHidePlayerCount then p6 else nil,
				hasPrevalidatedVideoGamePlayability = if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p7 else nil,
				videoPlaybackContext = VideoPlaybackContext,
				enableInstantPlay = if FFlagLuaAppContinueSortInstantPlay then p8 else nil,
				instantPlayTreatment = if FFlagLuaAppContinueSortInstantPlay then p9 else nil,
				isTouchPreferredInput = if FFlagLuaAppContinueSortInstantPlay then IsUsePreferredInputResultMatch1 else nil
			}), GameCollectionItemType.GameTile
		end
	end, {
		IsWide, FriendFooterEnabled, HideGameStats, ShowFriendActivity, ImpressionsTag,
		PlayerCountStyle, IsSponsoredFooterAllowed, GameTileLayoutType1, TopicId,
		ReportGameDetailOpened, ReportExperienceLaunched, OnActivated,
		LaunchExperienceEventContext, Source, ReferralSource, Index,
		IsUsePreferredInputResultMatch, PlayButtonStyle, IsContained, HideTitle,
		HideMetadata, TextSizeOffset, UseTriggerGameTileFeedbackCallbacksModuleResult,
		UseTriggerGameTileFeedbackCallbacksModuleResult2, OnSelectionGained,
		OnSelectionLost, Callback, ContentTextLineCount, UseExperienceTileMetadata,
		ForceHideAgeRatings, VideoAnalytics, OnPeekViewClosed, p2,
		LargeMetadataTextLines, EnableExplicitFeedback, p3, SetGameHidden, AppPage,
		UseBreakpointXOrSmallerResult1, SponsoredUserCohort, EnableSponsoredFeedback,
		EnableReportAd, if FFlagLuaAppEnableReportExperience then p4 else nil,
		UseNavigateToGameDetailsResult, IsSponsoredRatingFooterAllowed,
		CompactMetadataFormat, if FFlagLuaAppNarrowTileHideRating then p5 else nil,
		if FFlagLuaAppNarrowTileHidePlayerCount then p6 else nil,
		if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p7 else nil,
		VideoPlaybackContext, if FFlagLuaAppContinueSortInstantPlay then p8 else nil,
		if FFlagLuaAppContinueSortInstantPlay then p9 else nil,
		if FFlagLuaAppContinueSortInstantPlay then IsUsePreferredInputResultMatch1 else nil
	}))
end