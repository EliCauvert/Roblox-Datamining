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
local FFlagLuaAppGameTileInteractionFeedback = require(Parent.SharedFlags).FFlagLuaAppGameTileInteractionFeedback
local FFlagLuaAppEnableWhyThisAdModal = require(Parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableSponsoredReportAd = require(Parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppSupportSponsoredExplicitFeedback = require(Parent.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppNarrowTileSmallerFooterFont = require(Parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local FFlagLuaAppNarrowTileHideRating = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(Parent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local FFlagLuaAppFixCustomTileBugs = require(Parent.SharedFlags).FFlagLuaAppFixCustomTileBugs
local GameCollectionItemType = require(Parent.DiscoveryTypes).GameCollectionItemTypes.GameCollectionItemType

return function(PlayerCountStyle, IsSponsoredFooterAllowed, GameTileLayoutType1, FriendFooterEnabled, ShowFriendActivity, ImpressionsTag, p1, ReportGameDetailOpened, ReportExperienceLaunched, LaunchExperienceEventContext, ReferralSource, Source, OnActivated, TopicId, Index, HideGameStats, PlayButtonStyle, IsContained, HideTitle, HideMetadata, OnSelectionGained, OnSelectionLost, Callback, TextSizeOffset: number, ContentTextLineCount, UseExperienceTileMetadata, ForceHideAgeRatings, VideoAnalytics, OnPeekViewClosed, p2, EnableExplicitFeedback, p3, SetGameHidden, AppPage, p4, EnableSponsoredFeedback, p5, MaxItemIndex, IsSponsoredRatingFooterAllowed, _, _, _, p6, p7, p8, p9, p10, p11)
	-- upvalues: UsePreferredInputFunction (copy), UseNavigateToGameDetailsFunction (copy), FFlagLuaAppGameTileInteractionFeedback (copy), UseTriggerGameTileFeedbackCallbacksModule (copy), ResponsiveModule (copy), UseBreakpointXOrSmallerFunction (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), GameTileConstants (copy), GameTileLayoutType (copy), ReactModule (copy), SeeAllTileModule (copy), GameCollectionItemType (copy), FFlagLuaAppFixCustomTileBugs (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy), GetTileBadgeByPositionConfigFromEntryFunction (copy), AppGameTile (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), FFlagLuaAppNarrowTileSmallerFooterFont (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy)
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseNavigateToGameDetailsResult = UseNavigateToGameDetailsFunction()
	local v1 = nil
	local v2 = nil
	
	if FFlagLuaAppGameTileInteractionFeedback then
		v1, v27 = UseTriggerGameTileFeedbackCallbacksModule()
	end
	local IsUsePreferredInputResultMatch: boolean = p1 and UsePreferredInputResult == ResponsiveModule.Input.Pointer
	local IsWide: boolean = GameTileLayoutType1 == "Wide" or GameTileLayoutType1 == "Event"
	local LargeMetadataTextLines = nil
	local UseBreakpointXOrSmallerResult = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small)
	local UseBreakpointXOrSmallerResult1 = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.XSmall)
	LargeMetadataTextLines = if UseBreakpointXOrSmallerResult and (TextSizeOffset > 0 and not (FFlagLuaAppNarrowTileHideRating and p8 or FFlagLuaAppNarrowTileHidePlayerCount and p9)) then GameTileConstants.TileTextLines[GameTileLayoutType1 or GameTileLayoutType.Narrow].largeMetadataTextLines else GameTileConstants.TileTextLines[GameTileLayoutType1 or GameTileLayoutType.Narrow].metadataTextLines
	
	return (ReactModule.useCallback(function(Entry, Index1, Size, RowNum)
		-- upvalues: Index (copy), OnActivated (copy), ReactModule (upval), SeeAllTileModule (upval), GameCollectionItemType (upval), Callback (copy), p3 (copy), p2 (copy), MaxItemIndex (copy), FFlagLuaAppFixCustomTileBugs (upval), OnSelectionGained (copy), OnSelectionLost (copy), TopicId (copy), Source (copy), ReferralSource (copy), PlayerCountStyle (copy), HideGameStats (copy), GameTileLayoutType1 (copy), IsUsePreferredInputResultMatch (copy), IsContained (copy), ReportGameDetailOpened (copy), ReportExperienceLaunched (copy), LaunchExperienceEventContext (copy), OnPeekViewClosed (copy), UseNavigateToGameDetailsResult (copy), ImpressionsTag (copy), TextSizeOffset (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (upval), AppPage (copy), SetGameHidden (copy), p4 (copy), EnableSponsoredFeedback (copy), p5 (copy), EnableExplicitFeedback (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (upval), p6 (copy), FFlagLuaAppHomeTouchAutoplay (upval), p10 (copy), GetTileBadgeByPositionConfigFromEntryFunction (upval), AppGameTile (upval), FriendFooterEnabled (copy), ShowFriendActivity (copy), IsWide (copy), IsSponsoredFooterAllowed (copy), PlayButtonStyle (copy), HideTitle (copy), HideMetadata (copy), FFlagLuaAppGameTileInteractionFeedback (upval), v1 (ref), v2 (ref), ContentTextLineCount (copy), LargeMetadataTextLines (ref), UseExperienceTileMetadata (copy), ForceHideAgeRatings (copy), VideoAnalytics (copy), UseBreakpointXOrSmallerResult1 (copy), FFlagLuaAppEnableWhyThisAdModal (upval), FFlagLuaAppEnableSponsoredReportAd (upval), IsSponsoredRatingFooterAllowed (copy), FFlagLuaAppNarrowTileSmallerFooterFont (upval), p7 (copy), FFlagLuaAppNarrowTileHideRating (upval), p8 (copy), FFlagLuaAppNarrowTileHidePlayerCount (upval), p9 (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (upval), p11 (copy)
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
				selectionOrder = if FFlagLuaAppFixCustomTileBugs then nil else NewIndex,
				SelectionOrder = if FFlagLuaAppFixCustomTileBugs then NewIndex else nil,
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
				appPage = if FFlagLuaAppSupportSponsoredExplicitFeedback then AppPage else nil,
				setGameHidden = if FFlagLuaAppSupportSponsoredExplicitFeedback then SetGameHidden else nil,
				isHidden = if FFlagLuaAppSupportSponsoredExplicitFeedback then IsHidden else nil,
				sponsoredUserCohort = if FFlagLuaAppSupportSponsoredExplicitFeedback then p4 else nil,
				enableSponsoredFeedback = if FFlagLuaAppSupportSponsoredExplicitFeedback then EnableSponsoredFeedback else nil,
				enableReportAd = if FFlagLuaAppSupportSponsoredExplicitFeedback then p5 else nil,
				enableExplicitFeedback = if FFlagLuaAppSupportSponsoredExplicitFeedback then EnableExplicitFeedback else nil,
				onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone and p6 and not IsHidden then p6 else nil,
				videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p10 else nil
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
				onGuiStateChanged = if FFlagLuaAppGameTileInteractionFeedback then v1 else nil,
				onActivated = if FFlagLuaAppGameTileInteractionFeedback then v2 else nil,
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
				sponsoredUserCohort = if FFlagLuaAppEnableWhyThisAdModal then p4 else nil,
				enableSponsoredFeedback = EnableSponsoredFeedback,
				enableReportAd = if FFlagLuaAppEnableSponsoredReportAd then p5 else nil,
				isSponsoredRatingFooterAllowed = IsSponsoredRatingFooterAllowed,
				badgeOverride = GetTileBadgeByPositionConfigFromEntryFunction(Entry),
				onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone and p6 and not IsHidden then p6 else nil,
				compactMetadataFormat = if FFlagLuaAppNarrowTileSmallerFooterFont then p7 else nil,
				hideRating = if FFlagLuaAppNarrowTileHideRating then p8 else nil,
				hidePlayerCount = if FFlagLuaAppNarrowTileHidePlayerCount then p9 else nil,
				hasPrevalidatedVideoGamePlayability = if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p11 else nil,
				videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p10 else nil
			}), GameCollectionItemType.GameTile
		end
	end, {
		IsWide, FriendFooterEnabled, HideGameStats, ShowFriendActivity, ImpressionsTag,
		PlayerCountStyle, IsSponsoredFooterAllowed, GameTileLayoutType1, TopicId,
		ReportGameDetailOpened, ReportExperienceLaunched, OnActivated,
		LaunchExperienceEventContext, Source, ReferralSource, Index,
		IsUsePreferredInputResultMatch, PlayButtonStyle, IsContained, HideTitle,
		HideMetadata, TextSizeOffset,
		if FFlagLuaAppGameTileInteractionFeedback then v1 else nil,
		if FFlagLuaAppGameTileInteractionFeedback then v2 else nil, OnSelectionGained,
		OnSelectionLost, Callback, ContentTextLineCount, UseExperienceTileMetadata,
		ForceHideAgeRatings, VideoAnalytics, OnPeekViewClosed, p2,
		LargeMetadataTextLines, EnableExplicitFeedback, p3, SetGameHidden, AppPage,
		UseBreakpointXOrSmallerResult1,
		if FFlagLuaAppEnableWhyThisAdModal then p4 else nil, EnableSponsoredFeedback,
		if FFlagLuaAppEnableSponsoredReportAd then p5 else nil,
		UseNavigateToGameDetailsResult, IsSponsoredRatingFooterAllowed,
		if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p6 else nil,
		if FFlagLuaAppNarrowTileSmallerFooterFont then p7 else nil,
		if FFlagLuaAppNarrowTileHideRating then p8 else nil,
		if FFlagLuaAppNarrowTileHidePlayerCount then p9 else nil,
		if FFlagLuaAppUsePrevalidatedVideoGamePlayability then p11 else nil,
		if FFlagLuaAppHomeTouchAutoplay then p10 else nil
	}))
end