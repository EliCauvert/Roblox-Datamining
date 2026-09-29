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
local useCommentRowHeightReporterModule = require(script.Parent.useCommentRowHeightReporter)
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
	-- upvalues: useCommentRowHeightReporterModule (ref), reactModule (ref), momentsGetMomentsCommentsStoreModule (ref), signalsReactModule (ref), userProfileModule (ref), t (ref), useCommentTimestampModule (ref), getCommentReactionsStoreModule (ref), signalsModule (ref), localizationModule (ref), localizationService (ref), usePreferredInputModule (ref), feedbackManagerInjectionContext (ref), useCommentActionsMenuModule (ref), useMomentGesturesModule (ref), commentLongPressTimingModule (ref)
	local var1 = useCommentRowHeightReporterModule(p3.onHeightChanged)
	local var2 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: momentsGetMomentsCommentsStoreModule (copy), p3 (ref)
		return momentsGetMomentsCommentsStoreModule(false).getCachedComment(p3.commentId)
	end, { p3.commentId }).data)
	local var3 = if var2 == nil or var2.author == nil then nil else var2.author.userId
	local var4 = if var3 ~= nil then nil else tonumber(var3)
	
	if var4 ~= nil and var4 <= 0 then
		var4 = nil
	end
	local var5, username
	local var6 = reactModule.useMemo(function()
		-- upvalues: var4 (write), userProfileModule (copy), t (copy)
		return if var4 == nil then t else userProfileModule.getAndFetchUserInfo(var4)
	end, { var4 })
	local var7 = signalsReactModule.useSignalState(var6.info)
	local var8 = signalsReactModule.useSignalState(var6.status)
	
	if var2 == nil or var2.author == nil then
		var5 = nil
	else
		username = var2.author.username
		var5 = if username == nil or username == "" then nil else username
	end
	local displayName
	if var2 == nil or var2.author == nil then
		username = nil
	else
		displayName = var2.author.displayName
		username = if displayName == nil or displayName == "" then nil else displayName
	end
	local username_1
	if var7 == nil then
		displayName = nil
	else
		username_1 = var7.username
		displayName = if username_1 == nil or username_1 == "" then nil else username_1
	end
	local displayName_1
	if var7 == nil then
		username_1 = nil
	else
		displayName_1 = var7.displayName
		username_1 = if displayName_1 == nil or displayName_1 == "" then nil else displayName_1
	end
	local var9, v
	displayName_1 = if var3 ~= nil then "Unknown user" else `User {var3}`
	local viewerUsername = p3.viewerUsername
	viewerUsername = if var2 == nil or not var2.isAuthoredByViewer then nil elseif viewerUsername == nil or viewerUsername == "" then nil else viewerUsername
	local var10 = var5 or (viewerUsername or username)
	local var11 = useCommentTimestampModule(if p3.createdAt ~= "" then if var2 ~= nil then "" else var2.createdAt else p3.createdAt)
	local var12 = if var2 ~= nil then nil else var2.reactions
	local var13 = getCommentReactionsStoreModule(false)
	local var14 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var13 (ref), p3 (ref), var12 (ref)
		return signalsModule.createComputed(function(p4)
			-- upvalues: var13 (copy), p3 (copy), var12 (copy)
			return var13.getProjection(p3.feedItemId, p3.commentId, var12, p4)
		end)
	end, { var13, p3.feedItemId, p3.commentId, var12 or false }))
	local var15 = signalsReactModule.useSignalState(var13.getCooldownUntilMs)
	local reactions = var14.reactions
	local thumbsUpEmoteId = p3.thumbsUpEmoteId
	local var16 = var12 ~= nil and (reactions ~= nil and thumbsUpEmoteId ~= nil)
	local var17 = if reactions == nil or reactions.userReaction == nil then nil else reactions.userReaction.emoteId
	local var18 = thumbsUpEmoteId ~= nil and var17 == thumbsUpEmoteId
	local var19 = if p3.creatorEnabled then if p3.viewerCanWrite then if var14.restriction == nil then if DateTime.now().UnixTimestampMillis >= var15 then var17 ~= nil and not var18 else true else true else not p3.viewerCanWrite else not p3.creatorEnabled
	
	if reactions == nil or thumbsUpEmoteId == nil then
		var9 = 0
	else
		for i, v in reactions.counts do
			if v.emoteId == thumbsUpEmoteId then
				var9 = v.count
			end
		end
		var9 = 0
	end
	local var20 = localizationModule.abbreviateCount(var9, localizationService.RobloxLocaleId) or tostring(var9)
	local var21 = var16 and (not var19 and not var18)
	local var22 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), var19 (ref), var12 (ref), thumbsUpEmoteId (ref), p3 (ref), var18 (ref)
		if var16 and not var19 and (var12 ~= nil and thumbsUpEmoteId ~= nil) then
			p3.onToggleReaction(p3.commentId, thumbsUpEmoteId, var12, var18)
			
			return
		end
	end, {
		var16, var19, var12, thumbsUpEmoteId, p3.onToggleReaction, p3.commentId, var18
	})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), var19 (ref), var18 (ref), var12 (ref), thumbsUpEmoteId (ref), p3 (ref)
		if var16 and not var19 and (not var18 and var12 ~= nil) and thumbsUpEmoteId ~= nil then
			p3.onAddReaction(p3.commentId, thumbsUpEmoteId, var12)
			
			return
		end
	end, {
		var16, var19, var18, var12, thumbsUpEmoteId, p3.onAddReaction, p3.commentId
	})
	v = usePreferredInputModule() == Enum.PreferredInput.Touch
	local var24 = reactModule.useContext(feedbackManagerInjectionContext)
	local var25 = useCommentActionsMenuModule({
		commentId = p3.commentId,
		isAuthoredByViewer = var2 ~= nil and var2.isAuthoredByViewer,
		reportedUserId = if var2 == nil or var4 == nil then nil else tostring(var4),
		onReportComment = p3.onReportComment,
		onDeleteComment = p3.onDeleteComment
	})
	local var26 = #var25.items > 0
	local var27 = v and var26
	local var28 = var21 or var27
	local var29, var30 = reactModule.useState(false)
	local openMenu = var25.openMenu
	local var31 = useMomentGesturesModule(var28, {
		onDoubleTap = var23,
		onLongPress = if var27 then reactModule.useCallback(function()
			-- upvalues: var30 (ref), var24 (ref), openMenu (ref)
			var30(false)
			var24("TileLongPress", "Press")
			openMenu()
		end, { var24, openMenu }) else nil,
		onLongPressStart = if var27 then reactModule.useCallback(function()
			-- upvalues: var30 (ref)
			var30(true)
		end, {}) else nil,
		onLongPressCancel = if var27 then reactModule.useCallback(function()
			-- upvalues: var30 (ref)
			var30(false)
		end, {}) else nil
	}, nil, {
		cancelWhenInactive = true,
		cancelOnUserScroll = true,
		scrollingFrameRef = p3.scrollingFrameRef,
		longPressThreshold = commentLongPressTimingModule.HOLD_SECONDS
	})
	
	return {
		commentId = p3.commentId,
		avatarUserId = var4,
		authorLabel = var5 or (viewerUsername or (displayName or (username or (username_1 or displayName_1)))),
		isAuthorLoading = var10 == nil and (var7 == nil and var8 == "NotReady"),
		text = p3.text,
		metadataLabel = var11,
		avatarBackgroundStyle = p3.avatarBackgroundStyle,
		rowRef = var1.rowRef,
		gestureRef = var31.ref,
		onAbsoluteSizeChanged = var1.onAbsoluteSizeChanged,
		showReactionControl = var16,
		isReactionSelected = var18,
		isReactionDisabled = var19,
		reactionCountLabel = var20,
		onReactionActivated = var22,
		actionsMenu = if var26 then {
			items = var25.items,
			isOpen = var25.isOpen,
			anchorRef = if v then var31.ref else nil,
			onButtonActivated = var25.toggleMenu,
			onClose = var25.closeMenu
		} else nil,
		deleteConfirmation = var25.deleteConfirmation,
		isLongPressCharging = var29 and var27,
		isGestureSurfaceActive = var28
	}
end