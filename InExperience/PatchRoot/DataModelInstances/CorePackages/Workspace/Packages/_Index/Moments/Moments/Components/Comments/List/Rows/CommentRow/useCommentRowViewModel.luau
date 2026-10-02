local localizationService = game:GetService("LocalizationService")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local UIBloxModule = require(parent.UIBlox)
local userProfileModule = require(parent.DataHydration.UserProfile)
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local getCommentReactionsStoreModule = require(moments.Stores.GetCommentReactionsStore)
local useMomentGesturesModule = require(moments.Components.Feed.Items.Moment.Reactions.useMomentGestures)
local usePreferredInputModule = require(moments.Hooks.usePreferredInput)
local commentLongPressTimingModule = require(script.Parent.CommentLongPressTiming)
local _ = require(script.Parent.CommentRowView)
local useCommentActionsMenuModule = require(script.Parent.useCommentActionsMenu)
local useCommentBodyClampModule = require(script.Parent.useCommentBodyClamp)
local useCommentBodyPressFeedbackModule = require(script.Parent.useCommentBodyPressFeedback)
local useCommentBodyToggleModule = require(script.Parent.useCommentBodyToggle)
local useCommentTimestampModule = require(script.Parent.useCommentTimestamp)
local fFlagMomentsEngagementMetricsFeature = momentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local fFlagGuacMomentsFeatureList = sharedFlagsModule.FFlagGuacMomentsFeatureList
local getMomentsCapabilities = momentsCommonModule.Stores.GetMomentsCapabilities
local feedbackManagerInjectionContext = UIBloxModule.Core.Control.FeedbackManagerInjectionContext
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	info = signalsModule.createComputed(function(_)
		return nil
	end),
	status = signalsModule.createComputed(function(_)
		return "Ready"
	end)
}

local function _(p1)
	return if p1 == nil or p1 == "" then nil else p1
end

local _ = function(p1, p2)
	if p1 == nil or p2 == nil then
		return 0
	end
	for i, v in p1.counts do
		if v.emoteId == p2 then
			return v.count
		end
	end
	return 0
end

return function(p3)
	-- upvalues: reactModule (ref), momentsGetMomentsCommentsStoreModule (ref), signalsReactModule (ref), userProfileModule (ref), t (ref), useLocalization (ref), useCommentTimestampModule (ref), getCommentReactionsStoreModule (ref), signalsModule (ref), localizationModule (ref), localizationService (ref), fFlagMomentsEngagementMetricsFeature (ref), fFlagGuacMomentsFeatureList (ref), getMomentsCapabilities (ref), usePreferredInputModule (ref), feedbackManagerInjectionContext (ref), useCommentActionsMenuModule (ref), useCommentBodyClampModule (ref), useCommentBodyToggleModule (ref), useCommentBodyPressFeedbackModule (ref), useMomentGesturesModule (ref), commentLongPressTimingModule (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: momentsGetMomentsCommentsStoreModule (copy), p3 (ref)
		return momentsGetMomentsCommentsStoreModule(false).getCachedComment(p3.commentId)
	end, { p3.commentId }).data)
	local var2 = if var1 == nil or var1.author == nil then nil else var1.author.userId
	local var3 = if var2 ~= nil then nil else tonumber(var2)
	
	if var3 ~= nil and var3 <= 0 then
		var3 = nil
	end
	local var4, username
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (write), userProfileModule (copy), t (copy)
		return if var3 == nil then t else userProfileModule.getAndFetchUserInfo(var3)
	end, { var3 })
	local var6 = signalsReactModule.useSignalState(var5.info)
	local var7 = signalsReactModule.useSignalState(var5.status)
	
	if var1 == nil or var1.author == nil then
		var4 = nil
	else
		username = var1.author.username
		var4 = if username == nil or username == "" then nil else username
	end
	local displayName
	if var1 == nil or var1.author == nil then
		username = nil
	else
		displayName = var1.author.displayName
		username = if displayName == nil or displayName == "" then nil else displayName
	end
	local username_1
	if var6 == nil then
		displayName = nil
	else
		username_1 = var6.username
		displayName = if username_1 == nil or username_1 == "" then nil else username_1
	end
	local displayName_1
	if var6 == nil then
		username_1 = nil
	else
		displayName_1 = var6.displayName
		username_1 = if displayName_1 == nil or displayName_1 == "" then nil else displayName_1
	end
	local var8, v
	displayName_1 = useLocalization({
		label = if var2 ~= nil then "Feature.Moments.Label.CommentAuthorUnknown" else {
			"Feature.Moments.Label.CommentAuthorFallback",
			userId = var2
		}
	}).label
	local viewerUsername = p3.viewerUsername
	viewerUsername = if var1 == nil or not var1.isAuthoredByViewer then nil elseif viewerUsername == nil or viewerUsername == "" then nil else viewerUsername
	local var9 = var4 or (viewerUsername or username)
	local var10 = useCommentTimestampModule(if p3.createdAt ~= "" then if var1 ~= nil then "" else var1.createdAt else p3.createdAt)
	local var11 = if var1 ~= nil then nil else var1.reactions
	local var12 = getCommentReactionsStoreModule(false)
	local var13 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var12 (ref), p3 (ref), var11 (ref)
		return signalsModule.createComputed(function(p4)
			-- upvalues: var12 (copy), p3 (copy), var11 (copy)
			return var12.getProjection(p3.feedItemId, p3.commentId, var11, p4)
		end)
	end, { var12, p3.feedItemId, p3.commentId, var11 or false }))
	local var14 = signalsReactModule.useSignalState(var12.getCooldownUntilMs)
	local reactions = var13.reactions
	local thumbsUpEmoteId = p3.thumbsUpEmoteId
	local var15 = var11 ~= nil and (reactions ~= nil and thumbsUpEmoteId ~= nil)
	local var16 = if reactions == nil or reactions.userReaction == nil then nil else reactions.userReaction.emoteId
	local var17 = thumbsUpEmoteId ~= nil and var16 == thumbsUpEmoteId
	local var18 = if p3.creatorEnabled then if p3.viewerCanWrite then if var13.restriction == nil then if DateTime.now().UnixTimestampMillis >= var14 then var16 ~= nil and not var17 else true else true else not p3.viewerCanWrite else not p3.creatorEnabled
	
	if reactions == nil or thumbsUpEmoteId == nil then
		var8 = 0
	else
		for i, v in reactions.counts do
			if v.emoteId == thumbsUpEmoteId then
				var8 = v.count
			end
		end
		var8 = 0
	end
	local var19 = localizationModule.abbreviateCount(var8, localizationService.RobloxLocaleId) or tostring(var8)
	local var20 = if fFlagMomentsEngagementMetricsFeature and fFlagGuacMomentsFeatureList then not signalsReactModule.useSignalState(getMomentsCapabilities(false).getIsEngagementMetricsEnabled) else nil
	local var21 = var15 and (not var18 and not var17)
	local var22 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var18 (ref), var11 (ref), thumbsUpEmoteId (ref), p3 (ref), var17 (ref)
		if var15 and not var18 and (var11 ~= nil and thumbsUpEmoteId ~= nil) then
			p3.onToggleReaction(p3.commentId, thumbsUpEmoteId, var11, var17)
			
			return
		end
	end, {
		var15, var18, var11, thumbsUpEmoteId, p3.onToggleReaction, p3.commentId, var17
	})
	v = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var18 (ref), var17 (ref), var11 (ref), thumbsUpEmoteId (ref), p3 (ref)
		if var15 and not var18 and (not var17 and var11 ~= nil) and thumbsUpEmoteId ~= nil then
			p3.onAddReaction(p3.commentId, thumbsUpEmoteId, var11)
			
			return
		end
	end, {
		var15, var18, var17, var11, thumbsUpEmoteId, p3.onAddReaction, p3.commentId
	})
	local var23 = usePreferredInputModule() == Enum.PreferredInput.Touch
	local var24 = reactModule.useContext(feedbackManagerInjectionContext)
	local var25 = useCommentActionsMenuModule({
		commentId = p3.commentId,
		isAuthoredByViewer = var1 ~= nil and var1.isAuthoredByViewer,
		authorUserId = if var1 == nil or var3 == nil then nil else tostring(var3),
		onReportComment = p3.onReportComment,
		onBlockCommentAuthor = p3.onBlockCommentAuthor,
		onDeleteComment = p3.onDeleteComment
	})
	local var26 = #var25.items > 0
	local var27 = var23 and var26
	local var28 = p3.isExpanded == true
	local var29 = useCommentBodyClampModule(p3.text, var28)
	local var30 = useCommentBodyToggleModule(var29, p3.onToggleExpanded, p3.commentId, var28, var21)
	local var31 = useCommentBodyPressFeedbackModule(p3.commentId, var30.canToggle)
	local var32 = var21 or (var27 or var30.isActive)
	local var33, var34 = reactModule.useState(nil)
	reactModule.useLayoutEffect(function()
		-- upvalues: var34 (ref)
		var34(nil)
	end, { p3.commentId })
	local openMenu = var25.openMenu
	local var35 = useMomentGesturesModule(var32, {
		onTap = var30.onTap,
		onSingleTapConfirmed = var30.onSingleTapConfirmed,
		onDoubleTap = v,
		onLongPress = if var27 then reactModule.useCallback(function()
			-- upvalues: var34 (ref), var24 (ref), openMenu (ref)
			var34(nil)
			var24("TileLongPress", "Press")
			openMenu()
		end, { var24, openMenu }) else nil,
		onLongPressStart = if var27 then reactModule.useCallback(function()
			-- upvalues: var34 (ref), p3 (ref)
			var34(p3.commentId)
		end, { p3.commentId }) else nil,
		onLongPressCancel = if var27 then reactModule.useCallback(function()
			-- upvalues: var34 (ref)
			var34(nil)
		end, {}) else nil
	}, nil, {
		cancelWhenInactive = true,
		cancelOnUserScroll = true,
		scrollingFrameRef = p3.scrollingFrameRef,
		longPressThreshold = commentLongPressTimingModule.HOLD_SECONDS
	})
	
	return {
		commentId = p3.commentId,
		avatarUserId = var3,
		authorLabel = var4 or (viewerUsername or (displayName or (username or (username_1 or displayName_1)))),
		isAuthorLoading = var9 == nil and (var6 == nil and var7 == "NotReady"),
		text = p3.text,
		bodyText = var29.bodyText,
		bodyRef = var29.bodyRef,
		bodyMeasureRef = var29.measureRef,
		onBodyAbsoluteSizeChanged = var29.onBodyAbsoluteSizeChanged,
		bodyTextStyle = var31.textStyle,
		metadataLabel = var10,
		avatarBackgroundStyle = p3.avatarBackgroundStyle,
		gestureRef = var35.ref,
		showReactionControl = var15,
		isReactionSelected = var17,
		isReactionDisabled = var18,
		reactionCountLabel = var19,
		isReactionCountHidden = var20,
		onReactionActivated = var22,
		actionsMenu = if var26 then {
			items = var25.items,
			isOpen = var25.isOpen,
			anchorRef = if var23 then var35.ref else nil,
			onButtonActivated = var25.toggleMenu,
			onClose = var25.closeMenu
		} else nil,
		deleteConfirmation = var25.deleteConfirmation,
		isLongPressCharging = var33 == p3.commentId and var27,
		isGestureSurfaceActive = var32,
		onContentStateChanged = var31.onStateChanged
	}
end