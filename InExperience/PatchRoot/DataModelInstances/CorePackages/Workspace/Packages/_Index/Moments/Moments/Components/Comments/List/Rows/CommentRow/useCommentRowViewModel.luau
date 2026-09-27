local localizationService = game:GetService("LocalizationService")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local userProfileModule = require(parent.DataHydration.UserProfile)
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local momentsResolveEmoteIdModule = require(parent.DataHydration.MomentsResolveEmoteId)
local _ = require(script.Parent.Parent.CommentRowTypes)
local getCommentReactionsStoreModule = require(moments.Stores.GetCommentReactionsStore)
local useMomentGesturesModule = require(moments.Components.Feed.Items.Moment.Reactions.useMomentGestures)
local usePreferredInputModule = require(moments.Hooks.usePreferredInput)
local _ = require(script.Parent.CommentRowView)
local useCommentActionsMenuModule = require(script.Parent.useCommentActionsMenu)
local useCommentRowHeightReporterModule = require(script.Parent.useCommentRowHeightReporter)
local useCommentTimestampModule = require(script.Parent.useCommentTimestamp)
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

local t_1 = {}
local t_2 = {}

for i, v in momentsCommonModule.Enums.ReactionType do
	t_2[tostring(v)] = true
end
local function buildReactionSummary(p1, p2)
	-- upvalues: momentsResolveEmoteIdModule (ref), t_2 (ref), localizationModule (ref), localizationService (ref)
	if p1 == nil then
		return nil
	end
	local var1 = 0
	local t = {}
	
	for i, v in p1.counts do
		if v.count > 0 then
			var1 += v.count
			table.insert(t, v)
		end
	end
	if var1 == 0 then
		return nil
	end
	local t_1 = {}
	
	for i_1, v_1 in t do
		t_1[v_1] = i_1
	end
	table.sort(t, function(p3, p4)
		-- upvalues: t_1 (ref)
		return if p3.count == p4.count then t_1[p3] < t_1[p4] else p4.count < p3.count
	end)
	local t_3 = {}
	local t_4 = {}
	
	for i_2, v_2 in t do
		local var2 = momentsResolveEmoteIdModule.reactionTypeForEmoteId(p2, v_2.emoteId)
		
		if var2 ~= nil and t_2[var2] and not t_4[var2] then
			t_4[var2] = true
			table.insert(t_3, var2)
			
			if #t_3 == 3 then break end
		end
	end
	local var3 = localizationModule.abbreviateCount(var1, localizationService.RobloxLocaleId) or tostring(var1)
	
	return {
		reactionTypes = t_3,
		label = if var1 == 1 then `{var3} reaction` else `{var3} reactions`
	}
end

return function(p3)
	-- upvalues: useCommentRowHeightReporterModule (ref), reactModule (ref), momentsGetMomentsCommentsStoreModule (ref), signalsReactModule (ref), userProfileModule (ref), t (ref), useCommentTimestampModule (ref), getCommentReactionsStoreModule (ref), signalsModule (ref), t_1 (ref), buildReactionSummary (ref), usePreferredInputModule (ref), useCommentActionsMenuModule (ref), useMomentGesturesModule (ref)
	local var4 = useCommentRowHeightReporterModule(p3.onHeightChanged)
	local var5 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: momentsGetMomentsCommentsStoreModule (copy), p3 (ref)
		return momentsGetMomentsCommentsStoreModule(false).getCachedComment(p3.commentId)
	end, { p3.commentId }).data)
	local var6 = if var5 == nil or var5.author == nil then nil else var5.author.userId
	local var7 = if var6 ~= nil then nil else tonumber(var6)
	
	if var7 ~= nil and var7 <= 0 then
		var7 = nil
	end
	local var8, username
	local var9 = reactModule.useMemo(function()
		-- upvalues: var7 (write), userProfileModule (copy), t (copy)
		return if var7 == nil then t else userProfileModule.getAndFetchUserInfo(var7)
	end, { var7 })
	local var10 = signalsReactModule.useSignalState(var9.info)
	local var11 = signalsReactModule.useSignalState(var9.status)
	
	if var5 == nil or var5.author == nil then
		var8 = nil
	else
		username = var5.author.username
		var8 = if username == nil or username == "" then nil else username
	end
	local displayName
	if var5 == nil or var5.author == nil then
		username = nil
	else
		displayName = var5.author.displayName
		username = if displayName == nil or displayName == "" then nil else displayName
	end
	local username_1
	if var10 == nil then
		displayName = nil
	else
		username_1 = var10.username
		displayName = if username_1 == nil or username_1 == "" then nil else username_1
	end
	local displayName_1
	if var10 == nil then
		username_1 = nil
	else
		displayName_1 = var10.displayName
		username_1 = if displayName_1 == nil or displayName_1 == "" then nil else displayName_1
	end
	displayName_1 = if var6 ~= nil then "Unknown user" else `User {var6}`
	local viewerUsername = p3.viewerUsername
	viewerUsername = if var5 == nil or not var5.isAuthoredByViewer then nil elseif viewerUsername == nil or viewerUsername == "" then nil else viewerUsername
	local var12 = var8 or (viewerUsername or username)
	local var13 = useCommentTimestampModule(if p3.createdAt ~= "" then if var5 ~= nil then "" else var5.createdAt else p3.createdAt)
	local var14 = if var5 ~= nil then nil else var5.reactions
	local var15 = getCommentReactionsStoreModule(false)
	local var16 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var15 (ref), p3 (ref), var14 (ref)
		return signalsModule.createComputed(function(p4)
			-- upvalues: var15 (copy), p3 (copy), var14 (copy)
			return var15.getProjection(p3.feedItemId, p3.commentId, var14, p4)
		end)
	end, { var15, p3.feedItemId, p3.commentId, var14 or false }))
	local var17 = signalsReactModule.useSignalState(var15.getCooldownUntilMs)
	local reactions = var16.reactions
	local thumbsUpEmoteId = p3.thumbsUpEmoteId
	local var18 = var14 ~= nil and (reactions ~= nil and thumbsUpEmoteId ~= nil)
	local var19 = if reactions == nil or reactions.userReaction == nil then nil else reactions.userReaction.emoteId
	local var20 = thumbsUpEmoteId ~= nil and var19 == thumbsUpEmoteId
	local var21 = if p3.creatorEnabled then if p3.viewerCanWrite then if var16.restriction == nil then if DateTime.now().UnixTimestampMillis >= var17 then var19 ~= nil and not var20 else true else true else not p3.viewerCanWrite else not p3.creatorEnabled
	local emojis = p3.emojis or t_1
	local reactions_1 = reactions or var14
	local var22 = reactModule.useMemo(function()
		-- upvalues: buildReactionSummary (copy), reactions_1 (ref), emojis (ref)
		return buildReactionSummary(reactions_1, emojis)
	end, { reactions_1 or false, emojis })
	local var23 = var18 and (not var21 and not var20)
	local var24 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var21 (ref), var14 (ref), thumbsUpEmoteId (ref), p3 (ref), var20 (ref)
		if var18 and not var21 and (var14 ~= nil and thumbsUpEmoteId ~= nil) then
			p3.onToggleReaction(p3.commentId, thumbsUpEmoteId, var14, var20)
			
			return
		end
	end, {
		var18, var21, var14, thumbsUpEmoteId, p3.onToggleReaction, p3.commentId, var20
	})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var21 (ref), var20 (ref), var14 (ref), thumbsUpEmoteId (ref), p3 (ref)
		if var18 and not var21 and (not var20 and var14 ~= nil) and thumbsUpEmoteId ~= nil then
			p3.onAddReaction(p3.commentId, thumbsUpEmoteId, var14)
			
			return
		end
	end, {
		var18, var21, var20, var14, thumbsUpEmoteId, p3.onAddReaction, p3.commentId
	})
	local var26 = usePreferredInputModule() == Enum.PreferredInput.Touch
	local var27 = useCommentActionsMenuModule({
		commentId = p3.commentId,
		isAuthoredByViewer = var5 ~= nil and var5.isAuthoredByViewer,
		reportedUserId = if var5 == nil or var7 == nil then nil else tostring(var7),
		onReportComment = p3.onReportComment,
		onDeleteComment = p3.onDeleteComment
	})
	local var28 = #var27.items > 0
	local var29 = var28 and var26
	local var30 = var23 or var29
	local var31 = useMomentGesturesModule(var30, {
		onDoubleTap = var25,
		onLongPress = if var29 then var27.openMenu else nil
	}, nil, {
		cancelWhenInactive = true,
		cancelOnUserScroll = true,
		scrollingFrameRef = p3.scrollingFrameRef
	})
	
	return {
		commentId = p3.commentId,
		avatarUserId = var7,
		authorLabel = var8 or (viewerUsername or (displayName or (username or (username_1 or displayName_1)))),
		isAuthorLoading = var12 == nil and (var10 == nil and var11 == "NotReady"),
		text = p3.text,
		metadataLabel = var13,
		rowLayout = p3.rowLayout,
		avatarBackgroundStyle = p3.avatarBackgroundStyle,
		rowRef = var4.rowRef,
		contentRef = var31.ref,
		onAbsoluteSizeChanged = var4.onAbsoluteSizeChanged,
		showReactionControl = var18,
		isReactionSelected = var20,
		isReactionDisabled = var21,
		reactionSummary = var22,
		onReactionActivated = var24,
		isGestureSurfaceActive = var30,
		actionsMenu = if var28 then {
			items = var27.items,
			isOpen = var27.isOpen,
			anchorRef = if var26 then var31.ref else nil,
			onButtonActivated = var27.toggleMenu,
			onClose = var27.closeMenu
		} else nil,
		deleteConfirmation = var27.deleteConfirmation
	}
end