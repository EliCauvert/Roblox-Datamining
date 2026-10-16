local LocalizationService = game:GetService("LocalizationService")
local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UserProfileModule = require(Parent.DataHydration.UserProfile)
local MomentsGetMomentsCommentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsCommentsStore)
local GetCommentReactionsStoreModule = require(Moments.Stores.GetCommentReactionsStore)
local UseMomentGesturesModule = require(Moments.Components.Feed.Items.Moment.Reactions.useMomentGestures)
local UsePreferredInputModule = require(Moments.Hooks.usePreferredInput)
local CommentLongPressTimingModule = require(script.Parent.CommentLongPressTiming)
local _ = require(script.Parent.CommentRowView)
local UseCommentActionsMenuModule = require(script.Parent.useCommentActionsMenu)
local UseCommentBodyClampModule = require(script.Parent.useCommentBodyClamp)
local UseCommentBodyPressFeedbackModule = require(script.Parent.useCommentBodyPressFeedback)
local UseCommentBodyToggleModule = require(script.Parent.useCommentBodyToggle)
local UseCommentTimestampModule = require(script.Parent.useCommentTimestamp)
local FFlagMomentsEngagementMetricsFeature = MomentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local GetMomentsCapabilitiesFunction = MomentsCommonModule.Stores.GetMomentsCapabilities
local FeedbackManagerInjectionContext = require(Parent.UIBlox).Core.Control.FeedbackManagerInjectionContext
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local config = {
	info = SignalsModule.createComputed(function(_) --[[ Line: 67 ]]
		return nil
	end),
	status = SignalsModule.createComputed(function(_): string --[[ Line: 70 ]]
		return "Ready"
	end)
}

local function _(p1) --[[ Line: 78 | Named "nonEmpty" ]]
	return if p1 == nil or p1 == "" then nil else p1
end

local _ = function(p1, EmoteId) --[[ Line: 82 | Named "countForEmote" ]]
	if p1 == nil or EmoteId == nil then
		return 0
	end
	for _, count in p1.counts do
		if count.emoteId == EmoteId then
			return count.count
		end
	end
	return 0
end

return function(p2) --[[ Line: 94 | Named "useCommentRowViewModel" ]]
	-- upvalues: ReactModule (copy), MomentsGetMomentsCommentsStoreModule (copy), SignalsReactModule (copy), UserProfileModule (copy), config (copy), UseLocalizationFunction (copy), UseCommentTimestampModule (copy), GetCommentReactionsStoreModule (copy), SignalsModule (copy), LocalizationModule (copy), LocalizationService (copy), FFlagMomentsEngagementMetricsFeature (copy), GetMomentsCapabilitiesFunction (copy), UsePreferredInputModule (copy), FeedbackManagerInjectionContext (copy), UseCommentActionsMenuModule (copy), UseCommentBodyClampModule (copy), UseCommentBodyToggleModule (copy), UseCommentBodyPressFeedbackModule (copy), UseMomentGesturesModule (copy), CommentLongPressTimingModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 95 ]]
		-- upvalues: MomentsGetMomentsCommentsStoreModule (upval), p2 (copy)
		return MomentsGetMomentsCommentsStoreModule(false).getCachedComment(p2.commentId)
	end, { p2.commentId }).data)
	local UserId = if UseSignalStateResult == nil or UseSignalStateResult.author == nil then nil else UseSignalStateResult.author.userId
	local Number = if UserId == nil then nil else tonumber(UserId)
	
	if Number ~= nil and Number <= 0 then
		Number = nil
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 105 ]]
		-- upvalues: Number (ref), UserProfileModule (upval), config (upval)
		return if Number == nil then config else UserProfileModule.getAndFetchUserInfo(Number)
	end, { Number })
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.info)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseMemoResult.status)
	local v1 = nil
	
	if UseSignalStateResult == nil or UseSignalStateResult.author == nil then
		v1 = nil
	else
		local Username = UseSignalStateResult.author.username
		v1 = if Username == nil or Username == "" then nil else Username
	end
	local v2 = nil
	if UseSignalStateResult == nil or UseSignalStateResult.author == nil then
		v2 = nil
	else
		local DisplayName = UseSignalStateResult.author.displayName
		v2 = if DisplayName == nil or DisplayName == "" then nil else DisplayName
	end
	local Username1 = nil
	if UseSignalStateResult1 == nil then
		Username1 = nil
	else
		local Username = UseSignalStateResult1.username
		Username1 = if Username == nil or Username == "" then nil else Username
	end
	local DisplayName1 = nil
	if UseSignalStateResult1 == nil then
		DisplayName1 = nil
	else
		local DisplayName = UseSignalStateResult1.displayName
		DisplayName1 = if DisplayName == nil or DisplayName == "" then nil else DisplayName
	end
	local Label = UseLocalizationFunction({
		label = if UserId == nil then "Feature.Moments.Label.CommentAuthorUnknown" else {
			"Feature.Moments.Label.CommentAuthorFallback",
			userId = UserId
		}
	}).label
	local ViewerUsername = p2.viewerUsername
	local ViewerUsername1 = if ViewerUsername == nil or ViewerUsername == "" then nil else ViewerUsername
	local ViewerUsername2 = if UseSignalStateResult == nil or not UseSignalStateResult.isAuthoredByViewer then nil else ViewerUsername1
	local V33 = v1 or (ViewerUsername2 or v2)
	local UseCommentTimestampModuleResult = UseCommentTimestampModule(if p2.createdAt == "" then if UseSignalStateResult == nil then "" else UseSignalStateResult.createdAt else p2.createdAt)
	local Reactions = if UseSignalStateResult == nil then nil else UseSignalStateResult.reactions
	local CommentReactionsStoreModule = GetCommentReactionsStoreModule(false)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 130 ]]
		-- upvalues: SignalsModule (upval), CommentReactionsStoreModule (copy), p2 (copy), Reactions (copy)
		return SignalsModule.createComputed(function(p3) --[[ Line: 131 ]]
			-- upvalues: CommentReactionsStoreModule (upval), p2 (upval), Reactions (upval)
			return CommentReactionsStoreModule.getProjection(p2.feedItemId, p2.commentId, Reactions, p3)
		end)
	end, {
		CommentReactionsStoreModule,
		p2.feedItemId,
		p2.commentId,
		Reactions or false
	})))
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(CommentReactionsStoreModule.getCooldownUntilMs)
	local Reactions1 = UseSignalStateResult3.reactions
	local ThumbsUpEmoteId = p2.thumbsUpEmoteId
	local HasThumbsUpEmoteId: boolean = Reactions ~= nil and (Reactions1 ~= nil and ThumbsUpEmoteId ~= nil)
	local EmoteId = if Reactions1 == nil or Reactions1.userReaction == nil then nil else Reactions1.userReaction.emoteId
	local IsEmoteIdMatch: boolean = ThumbsUpEmoteId ~= nil and EmoteId == ThumbsUpEmoteId
	local NoCreatorEnabled: boolean = not p2.creatorEnabled or (not p2.viewerCanWrite or (UseSignalStateResult3.restriction ~= nil or (DateTime.now().UnixTimestampMillis < UseSignalStateResult4 or EmoteId ~= nil and not IsEmoteIdMatch)))
	local Count = nil
	
	if Reactions1 == nil or ThumbsUpEmoteId == nil then
		Count = 0
	else
		Count = 0
		
		for _, count in Reactions1.counts do
			if count.emoteId == ThumbsUpEmoteId then
				Count = count.count
				break
			end
		end
	end
	local AbbreviateCountResult = LocalizationModule.abbreviateCount(Count, LocalizationService.RobloxLocaleId) or tostring(Count)
	local Inverted = if FFlagMomentsEngagementMetricsFeature then not SignalsReactModule.useSignalState(GetMomentsCapabilitiesFunction(false).getIsEngagementMetricsEnabled) else nil
	local NoIsEmoteIdMatch: boolean = HasThumbsUpEmoteId and (not NoCreatorEnabled and not IsEmoteIdMatch)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 161 ]]
		-- upvalues: HasThumbsUpEmoteId (copy), NoCreatorEnabled (copy), Reactions (copy), ThumbsUpEmoteId (copy), p2 (copy), IsEmoteIdMatch (copy)
		if HasThumbsUpEmoteId and not NoCreatorEnabled and Reactions ~= nil and ThumbsUpEmoteId ~= nil then
			p2.onToggleReaction(p2.commentId, ThumbsUpEmoteId, Reactions, IsEmoteIdMatch)
			
			return
		end
	end, {
		HasThumbsUpEmoteId, NoCreatorEnabled, Reactions, ThumbsUpEmoteId,
		p2.onToggleReaction, p2.commentId, IsEmoteIdMatch
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 178 ]]
		-- upvalues: HasThumbsUpEmoteId (copy), NoCreatorEnabled (copy), IsEmoteIdMatch (copy), Reactions (copy), ThumbsUpEmoteId (copy), p2 (copy)
		if HasThumbsUpEmoteId and not NoCreatorEnabled and not IsEmoteIdMatch and Reactions ~= nil and ThumbsUpEmoteId ~= nil then
			p2.onAddReaction(p2.commentId, ThumbsUpEmoteId, Reactions)
			
			return
		end
	end, {
		HasThumbsUpEmoteId, NoCreatorEnabled, IsEmoteIdMatch, Reactions,
		ThumbsUpEmoteId, p2.onAddReaction, p2.commentId
	})
	local IsUsePreferredInputModuleResultMatch = UsePreferredInputModule() == Enum.PreferredInput.Touch
	local UseContextResult = ReactModule.useContext(FeedbackManagerInjectionContext)
	local UseCommentActionsMenuModuleResult = UseCommentActionsMenuModule({
		commentId = p2.commentId,
		isAuthoredByViewer = UseSignalStateResult ~= nil and UseSignalStateResult.isAuthoredByViewer,
		authorUserId = if UseSignalStateResult == nil or Number == nil then nil else tostring(Number),
		onReportComment = p2.onReportComment,
		onBlockCommentAuthor = p2.onBlockCommentAuthor,
		onDeleteComment = p2.onDeleteComment
	})
	local v3 = #UseCommentActionsMenuModuleResult.items > 0
	local V66: boolean = IsUsePreferredInputModuleResultMatch and v3
	local IsIsExpanded = p2.isExpanded == true
	local UseCommentBodyClampModuleResult = UseCommentBodyClampModule(p2.text, IsIsExpanded)
	local UseCommentBodyToggleModuleResult = UseCommentBodyToggleModule(UseCommentBodyClampModuleResult, p2.onToggleExpanded, p2.commentId, IsIsExpanded, NoIsEmoteIdMatch)
	local UseCommentBodyPressFeedbackModuleResult = UseCommentBodyPressFeedbackModule(p2.commentId, UseCommentBodyToggleModuleResult.canToggle)
	local NoIsEmoteIdMatch1 = NoIsEmoteIdMatch or (V66 or UseCommentBodyToggleModuleResult.isActive)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useLayoutEffect(function() --[[ Line: 223 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, { p2.commentId })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 226 ]]
		-- upvalues: UseStateResult2 (copy), p2 (copy)
		UseStateResult2(p2.commentId)
	end, { p2.commentId })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 229 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	local OpenMenuFunction = UseCommentActionsMenuModuleResult.openMenu
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 233 ]]
		-- upvalues: UseStateResult2 (copy), UseContextResult (copy), OpenMenuFunction (copy)
		UseStateResult2(nil)
		UseContextResult("TileLongPress", "Press")
		OpenMenuFunction()
	end, { UseContextResult, OpenMenuFunction })
	local UseMomentGesturesModuleResult = UseMomentGesturesModule(NoIsEmoteIdMatch1, {
		onTap = UseCommentBodyToggleModuleResult.onTap,
		onSingleTapConfirmed = UseCommentBodyToggleModuleResult.onSingleTapConfirmed,
		onDoubleTap = UseResult1,
		onLongPress = if V66 then UseResult4 else nil,
		onLongPressStart = if V66 then UseResult2 else nil,
		onLongPressCancel = if V66 then UseResult3 else nil
	}, nil, {
		cancelWhenInactive = true,
		cancelOnUserScroll = true,
		scrollingFrameRef = p2.scrollingFrameRef,
		longPressThreshold = CommentLongPressTimingModule.HOLD_SECONDS
	})
	
	return {
		commentId = p2.commentId,
		avatarUserId = Number,
		authorLabel = v1 or (ViewerUsername2 or (Username1 or (v2 or (DisplayName1 or Label)))),
		isAuthorLoading = V33 == nil and UseSignalStateResult1 == nil and UseSignalStateResult2 == "NotReady",
		text = p2.text,
		bodyText = UseCommentBodyClampModuleResult.bodyText,
		bodyRef = UseCommentBodyClampModuleResult.bodyRef,
		bodyMeasureRef = UseCommentBodyClampModuleResult.measureRef,
		onBodyAbsoluteSizeChanged = UseCommentBodyClampModuleResult.onBodyAbsoluteSizeChanged,
		bodyTextStyle = UseCommentBodyPressFeedbackModuleResult.textStyle,
		metadataLabel = UseCommentTimestampModuleResult,
		avatarBackgroundStyle = p2.avatarBackgroundStyle,
		gestureRef = UseMomentGesturesModuleResult.ref,
		showReactionControl = HasThumbsUpEmoteId,
		isReactionSelected = IsEmoteIdMatch,
		isReactionDisabled = NoCreatorEnabled,
		reactionCountLabel = AbbreviateCountResult,
		isReactionCountHidden = Inverted,
		onReactionActivated = UseResult,
		actionsMenu = if v3 then {
			items = UseCommentActionsMenuModuleResult.items,
			isOpen = UseCommentActionsMenuModuleResult.isOpen,
			anchorRef = if IsUsePreferredInputModuleResultMatch then UseMomentGesturesModuleResult.ref else nil,
			onButtonActivated = UseCommentActionsMenuModuleResult.toggleMenu,
			onClose = UseCommentActionsMenuModuleResult.closeMenu
		} else nil,
		deleteConfirmation = UseCommentActionsMenuModuleResult.deleteConfirmation,
		isLongPressCharging = UseStateResult == p2.commentId and V66,
		isGestureSurfaceActive = NoIsEmoteIdMatch1,
		onContentStateChanged = UseCommentBodyPressFeedbackModuleResult.onStateChanged
	}
end