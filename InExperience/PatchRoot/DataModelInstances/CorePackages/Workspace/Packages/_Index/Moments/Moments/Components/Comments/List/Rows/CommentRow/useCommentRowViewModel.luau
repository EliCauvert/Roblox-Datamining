local localizationService = game:GetService("LocalizationService")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
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
local feedbackManagerInjectionContext = UIBloxModule.Core.Control.FeedbackManagerInjectionContext
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
	for i, v in p1.counts do
		if v.emoteId == p2 then
			return v.count
		end
	end
	return 0
end

return function(p3)
	-- upvalues: reactModule (ref), momentsGetMomentsCommentsStoreModule (ref), signalsReactModule (ref), userProfileModule (ref), t (ref), useCommentTimestampModule (ref), getCommentReactionsStoreModule (ref), signalsModule (ref), localizationModule (ref), localizationService (ref), usePreferredInputModule (ref), feedbackManagerInjectionContext (ref), useCommentActionsMenuModule (ref), useCommentBodyClampModule (ref), useCommentBodyToggleModule (ref), useCommentBodyPressFeedbackModule (ref), useMomentGesturesModule (ref), commentLongPressTimingModule (ref)
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
	displayName_1 = if var2 ~= nil then "Unknown user" else `User {var2}`
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
	local var20 = var15 and (not var18 and not var17)
	local var21 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var18 (ref), var11 (ref), thumbsUpEmoteId (ref), p3 (ref), var17 (ref)
		if var15 and not var18 and (var11 ~= nil and thumbsUpEmoteId ~= nil) then
			p3.onToggleReaction(p3.commentId, thumbsUpEmoteId, var11, var17)
			
			return
		end
	end, {
		var15, var18, var11, thumbsUpEmoteId, p3.onToggleReaction, p3.commentId, var17
	})
	local var22 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var18 (ref), var17 (ref), var11 (ref), thumbsUpEmoteId (ref), p3 (ref)
		if var15 and not var18 and (not var17 and var11 ~= nil) and thumbsUpEmoteId ~= nil then
			p3.onAddReaction(p3.commentId, thumbsUpEmoteId, var11)
			
			return
		end
	end, {
		var15, var18, var17, var11, thumbsUpEmoteId, p3.onAddReaction, p3.commentId
	})
	v = usePreferredInputModule() == Enum.PreferredInput.Touch
	local var23 = reactModule.useContext(feedbackManagerInjectionContext)
	local var24 = useCommentActionsMenuModule({
		commentId = p3.commentId,
		isAuthoredByViewer = var1 ~= nil and var1.isAuthoredByViewer,
		reportedUserId = if var1 == nil or var3 == nil then nil else tostring(var3),
		onReportComment = p3.onReportComment,
		onDeleteComment = p3.onDeleteComment
	})
	local var25 = #var24.items > 0
	local var26 = v and var25
	local var27 = p3.isExpanded == true
	local var28 = useCommentBodyClampModule(p3.text, var27)
	local var29 = useCommentBodyToggleModule(var28, p3.onToggleExpanded, p3.commentId, var27, var20)
	local var30 = useCommentBodyPressFeedbackModule(p3.commentId, var29.canToggle)
	local var31 = var20 or (var26 or var29.isActive)
	local var32, var33 = reactModule.useState(nil)
	reactModule.useLayoutEffect(function()
		-- upvalues: var33 (ref)
		var33(nil)
	end, { p3.commentId })
	local openMenu = var24.openMenu
	local var34 = useMomentGesturesModule(var31, {
		onTap = var29.onTap,
		onSingleTapConfirmed = var29.onSingleTapConfirmed,
		onDoubleTap = var22,
		onLongPress = if var26 then reactModule.useCallback(function()
			-- upvalues: var33 (ref), var23 (ref), openMenu (ref)
			var33(nil)
			var23("TileLongPress", "Press")
			openMenu()
		end, { var23, openMenu }) else nil,
		onLongPressStart = if var26 then reactModule.useCallback(function()
			-- upvalues: var33 (ref), p3 (ref)
			var33(p3.commentId)
		end, { p3.commentId }) else nil,
		onLongPressCancel = if var26 then reactModule.useCallback(function()
			-- upvalues: var33 (ref)
			var33(nil)
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
		bodyText = var28.bodyText,
		bodyRef = var28.bodyRef,
		bodyMeasureRef = var28.measureRef,
		onBodyAbsoluteSizeChanged = var28.onBodyAbsoluteSizeChanged,
		bodyTextStyle = var30.textStyle,
		metadataLabel = var10,
		avatarBackgroundStyle = p3.avatarBackgroundStyle,
		gestureRef = var34.ref,
		showReactionControl = var15,
		isReactionSelected = var17,
		isReactionDisabled = var18,
		reactionCountLabel = var19,
		onReactionActivated = var21,
		actionsMenu = if var25 then {
			items = var24.items,
			isOpen = var24.isOpen,
			anchorRef = if v then var34.ref else nil,
			onButtonActivated = var24.toggleMenu,
			onClose = var24.closeMenu
		} else nil,
		deleteConfirmation = var24.deleteConfirmation,
		isLongPressCharging = var32 == p3.commentId and var26,
		isGestureSurfaceActive = var31,
		onContentStateChanged = var30.onStateChanged
	}
end