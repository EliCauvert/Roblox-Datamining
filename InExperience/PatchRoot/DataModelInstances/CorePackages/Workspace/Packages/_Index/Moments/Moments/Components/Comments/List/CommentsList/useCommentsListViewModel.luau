local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local viewRecyclerModule = require(parent.ViewRecycler)
local momentsCommonModule = require(parent.MomentsCommon)
local fFlagMomentsComments = require(parent.SharedFlags).FFlagMomentsComments
local fFlagMomentsCommentActionsRealtimeModule = require(moments.Flags.FFlagMomentsCommentActionsRealtime)
local fFlagMomentsCommentsRevealAfterMeasureModule = require(moments.Flags.FFlagMomentsCommentsRevealAfterMeasure)
local eventNames = momentsCommonModule.Analytics.EventNames
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local momentsGetMomentsReactionsStoreModule = require(parent.DataHydration.MomentsGetMomentsReactionsStore)
local momentsResolveEmoteIdModule = require(parent.DataHydration.MomentsResolveEmoteId)
local _ = require(parent.MomentsTypes)
local getCommentCollectionStoreModule = require(moments.Components.Comments.GetCommentCollectionStore)
local commentCollectionTypesModule = require(moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes)
local getCommentsListCoordinatorModule = require(script.Parent.Parent.getCommentsListCoordinator)
local getCommentsSheetStoreModule = require(moments.Components.Comments.Sheet.getCommentsSheetStore)
local useCommentCapabilitiesModule = require(moments.Components.Comments.useCommentCapabilities)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local reactionTypeModule = require(moments.Enums.ReactionType)
local buildCommentRowsModule = require(script.Parent.Parent.Rows.buildCommentRows)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)
local commentsListItemsModule = require(script.Parent.CommentsListItems)
local _ = require(script.Parent.CommentsListRowContext)
local _ = require(script.Parent.CommentsListView)
local createExpandedCommentsStoreModule = require(script.Parent.createExpandedCommentsStore)
local useCommentsListRevealModule = require(script.Parent.useCommentsListReveal)
local playersService = game:GetService("Players")
local loadStatus = commentCollectionTypesModule.LoadStatus
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	deleteFailed = "Feature.Moments.Label.CommentDeleteFailed"
}

local function _(p1)
	-- upvalues: getToastStoreModule (ref)
	getToastStoreModule(false).triggerToast({ text = "", title = p1 })
end

local _ = function(p1)
	-- upvalues: viewRecyclerModule (ref)
	local current = p1.current
	
	return function(p2, p3)
		-- upvalues: current (write), p1 (ref), viewRecyclerModule (copy)
		current = p1.current
		
		if p3.scrollOffset > 33 then
			return false
		end
		for i, v in p2.changes do
			if v.type ~= viewRecyclerModule.DataSourceChangeType.Insert or v.index ~= 1 then
				if v.type == viewRecyclerModule.DataSourceChangeType.Reset and current ~= current then
					return viewRecyclerModule.AutoScrollTarget.Start
				end
			end
			return viewRecyclerModule.AutoScrollTarget.Start
		end
		return false
	end
end

return function(p2)
	-- upvalues: useLocalization (ref), t (ref), playersService (ref), getCommentCollectionStoreModule (ref), reactModule (ref), signalsReactModule (ref), createExpandedCommentsStoreModule (ref), signalsModule (ref), buildCommentRowsModule (ref), momentsGetMomentsCommentsStoreModule (ref), momentsGetMomentsReactionsStoreModule (ref), momentsResolveEmoteIdModule (ref), reactionTypeModule (ref), useCommentCapabilitiesModule (ref), foundationModule (ref), viewRecyclerModule (ref), loadStatus (ref), commentsListItemsModule (ref), fFlagMomentsCommentsRevealAfterMeasureModule (ref), useCommentsListRevealModule (ref), getCommentsListCoordinatorModule (ref), fFlagMomentsComments (ref), getCommentsSheetStoreModule (ref), eventNames (ref), useMomentsHost (ref), fFlagMomentsCommentActionsRealtimeModule (ref), getToastStoreModule (ref)
	local deleteFailed = useLocalization(t).deleteFailed
	local localPlayer = playersService.LocalPlayer
	local var1 = if localPlayer ~= nil then "" else localPlayer.Name
	local var2 = getCommentCollectionStoreModule(false)
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), p2 (ref)
		return var2.getState(p2.feedItemId)
	end, { var2, p2.feedItemId })
	local var4 = signalsReactModule.useSignalState(var3)
	local var5 = reactModule.useState(createExpandedCommentsStoreModule)
	local getExpandedCommentIds = var5.getExpandedCommentIds
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var3 (ref), buildCommentRowsModule (copy), momentsGetMomentsCommentsStoreModule (copy), getExpandedCommentIds (ref)
		local var7 = nil
		
		return signalsModule.createComputed(function(p3)
			-- upvalues: var3 (copy), buildCommentRowsModule (copy), momentsGetMomentsCommentsStoreModule (copy), var7 (write), getExpandedCommentIds (copy)
			local var8 = buildCommentRowsModule(var3(p3), function(p4)
				-- upvalues: momentsGetMomentsCommentsStoreModule (copy), p3 (ref)
				return momentsGetMomentsCommentsStoreModule(false).getCachedComment(p4).data(p3)
			end, var7, getExpandedCommentIds(p3))
			var7 = var8
			
			return var8
		end)
	end, { var3, getExpandedCommentIds }))
	local var7 = momentsGetMomentsCommentsStoreModule(false)
	local var8 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var7 (ref), p2 (ref)
		return var7.getCachedMomentComments(p2.feedItemId)
	end, { var7, p2.feedItemId }).data)
	local var9 = momentsGetMomentsReactionsStoreModule(false)
	local var10 = if useCommentCapabilitiesModule().canReact then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var9 (ref), momentsResolveEmoteIdModule (copy), reactionTypeModule (copy)
		return signalsModule.createComputed(function(p3)
			-- upvalues: var9 (copy), momentsResolveEmoteIdModule (copy), reactionTypeModule (copy)
			local getCachedEmojiCatalog = var9.getCachedEmojiCatalog
			
			if getCachedEmojiCatalog == nil then
				return nil
			end
			local var11 = getCachedEmojiCatalog(p3)
			
			return if var11.source == "cache" and var11.status == "Ready" then momentsResolveEmoteIdModule.resolveOptionalEmoteIdForReaction(var11.emojis, reactionTypeModule.ThumbsUp) else nil
		end)
	end, { var9 })) else nil
	local var11 = foundationModule.Hooks.useTokens()
	local small = var11.Padding.Small
	local size2000 = var11.Size.Size_2000
	local var12 = reactModule.useState(function()
		-- upvalues: viewRecyclerModule (copy), size2000 (ref)
		return viewRecyclerModule.Layout.measured({ estimatedItemLength = size2000 })
	end)
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		return function()
			-- upvalues: var12 (copy)
			var12.destroy()
		end
	end, { var12 })
	local loadMoreStatus = var4.loadMoreStatus
	local isReadOnly = p2.isReadOnly
	local var13 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), loadMoreStatus (ref), loadStatus (copy), commentsListItemsModule (copy), isReadOnly (ref)
		local list = table.create(#var6 + 2)
		
		for i, v in var6 do
			list[i] = v
		end
		if loadMoreStatus == loadStatus.Loading or loadMoreStatus == loadStatus.Failed then
			table.insert(list, commentsListItemsModule.loadMore(loadMoreStatus))
		end
		if isReadOnly then
			table.insert(list, commentsListItemsModule.readOnlyNotice())
		end
		return list
	end, { var6, loadMoreStatus, isReadOnly })
	local var14 = reactModule.useMemo(function()
		-- upvalues: var13 (ref), commentsListItemsModule (copy)
		return {
			items = var13,
			getItemKey = commentsListItemsModule.getItemKey
		}
	end, { var13 })
	local var15 = if fFlagMomentsCommentsRevealAfterMeasureModule then useCommentsListRevealModule(var12, var13, p2.onRevealed) else nil
	local var16 = reactModule.useRef(nil)
	var16.current = if var13[1] ~= nil then nil else var13[1].key
	local var17 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), viewRecyclerModule (copy)
		local current = var16.current
		
		return function(p3, p4)
			-- upvalues: current (write), var16 (ref), viewRecyclerModule (copy)
			current = var16.current
			
			if p4.scrollOffset > 33 then
				return false
			end
			for i, v in p3.changes do
				if v.type ~= viewRecyclerModule.DataSourceChangeType.Insert or v.index ~= 1 then
					if v.type == viewRecyclerModule.DataSourceChangeType.Reset and current ~= current then
						return viewRecyclerModule.AutoScrollTarget.Start
					end
				end
				return viewRecyclerModule.AutoScrollTarget.Start
			end
			return false
		end
	end, {})
	local var18 = getCommentsListCoordinatorModule(false)
	local var19 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), p2 (ref)
		return var18.loadMore(p2.feedItemId, p2.sessionId)
	end, { var18, p2.feedItemId, p2.sessionId })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var19 (ref)
		var19()
	end, { var19 })
	local var21 = reactModule.useRef(0)
	local var22 = reactModule.useRef(0)
	local var23 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), var22 (ref), var19 (ref)
		if var21.current > 0 and var22.current > 0 and var22.current <= var21.current then
			var19()
		end
	end, { var19 })
	local var24 = reactModule.useCallback(function(p3)
		-- upvalues: var21 (ref), var23 (ref)
		var21.current = p3.Y
		var23()
	end, { var23 })
	local var25 = reactModule.useCallback(function(p3)
		-- upvalues: var22 (ref), var23 (ref)
		var22.current = p3
		var23()
	end, { var23 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), p2 (ref)
		var18.retryLoadMore(p2.feedItemId, p2.sessionId)
	end, { var18, p2.feedItemId, p2.sessionId })
	local var27 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), p2 (ref)
		var18.retryPendingSubmission(p2.feedItemId, p2.sessionId)
	end, { var18, p2.feedItemId, p2.sessionId })
	local var28 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), p2 (ref)
		var18.editPendingSubmission(p2.feedItemId, p2.sessionId)
	end, { var18, p2.feedItemId, p2.sessionId })
	local var29 = if fFlagMomentsComments then getCommentsSheetStoreModule(false).getAnalyticsSession(p2.feedItemId, p2.sessionId) else nil
	local var30 = reactModule.useCallback(function(p3, p4, p5, p6)
		-- upvalues: fFlagMomentsComments (copy), var29 (ref), eventNames (copy), var18 (ref), p2 (ref)
		if fFlagMomentsComments and var29 ~= nil then
			var29.logEvent(eventNames.MomentCommentReactButtonClicked, { commentId = p3, reactionSelected = tostring(not p6) })
		end
		return if p6 then var18.ensureReactionAbsent(p2.feedItemId, p3, p4, p5) else var18.ensureReactionPresent(p2.feedItemId, p3, p4, p5)
	end, { var18, p2.feedItemId, var29 })
	local var31 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: var18 (ref), p2 (ref)
		return var18.ensureReactionPresent(p2.feedItemId, p3, p4, p5)
	end, { var18, p2.feedItemId })
	local var32 = useMomentsHost()
	local openMomentCommentReport = var32.openMomentCommentReport
	local channelId = var4.channelId
	local var33 = reactModule.useMemo(function()
		-- upvalues: openMomentCommentReport (ref), channelId (ref), fFlagMomentsComments (copy), var29 (ref), eventNames (copy), fFlagMomentsCommentActionsRealtimeModule (copy)
		return if openMomentCommentReport == nil or channelId == nil then nil else function(p3, p4)
			-- upvalues: fFlagMomentsComments (copy), var29 (copy), eventNames (copy), fFlagMomentsCommentActionsRealtimeModule (copy), openMomentCommentReport (copy), channelId (copy)
			if fFlagMomentsComments and var29 ~= nil then
				var29.logEvent(eventNames.MomentCommentReportClicked, { commentId = p3 })
			end
			if fFlagMomentsCommentActionsRealtimeModule and var29 ~= nil then
				var29.logRealtimeEvent("MomentsCommentReport", { status = "clicked" })
			end
			openMomentCommentReport({
				commentId = p3,
				channelId = channelId,
				reportedUserId = p4
			})
		end
	end, { openMomentCommentReport, channelId, var29 })
	local openBlockUser = var32.openBlockUser
	local var34 = reactModule.useMemo(function()
		-- upvalues: openBlockUser (ref), fFlagMomentsCommentActionsRealtimeModule (copy), var29 (ref), var18 (ref), p2 (ref), var33 (ref)
		return if openBlockUser == nil then nil else function(p3, p4)
			-- upvalues: openBlockUser (copy), fFlagMomentsCommentActionsRealtimeModule (copy), var29 (copy), var18 (copy), p2 (copy), var33 (copy)
			openBlockUser({
				userId = p4,
				onBlockConfirmed = function()
					-- upvalues: fFlagMomentsCommentActionsRealtimeModule (copy), var29 (copy), var18 (copy), p2 (copy), p4 (ref)
					if fFlagMomentsCommentActionsRealtimeModule and var29 ~= nil then
						var29.logRealtimeEvent("MomentsCommentAuthorBlock", { status = "attempted" })
					end
					var18.hideCommentsByAuthor(p2.feedItemId, p4)
				end,
				onBlockFailed = function()
					-- upvalues: fFlagMomentsCommentActionsRealtimeModule (copy), var29 (copy), var18 (copy), p2 (copy), p4 (ref)
					if fFlagMomentsCommentActionsRealtimeModule and var29 ~= nil then
						var29.logRealtimeEvent("MomentsCommentAuthorBlock", { status = "failed" })
					end
					var18.restoreCommentsByAuthor(p2.feedItemId, p4)
				end,
				onBlockSucceeded = if fFlagMomentsCommentActionsRealtimeModule and var29 ~= nil then function()
					-- upvalues: var29 (copy)
					var29.logRealtimeEvent("MomentsCommentAuthorBlock", { status = "succeeded" })
				end else nil,
				openReportUser = if var33 ~= nil then nil else function()
					-- upvalues: var33 (copy), p3 (ref), p4 (ref)
					var33(p3, p4)
				end
			})
		end
	end, {
		openBlockUser,
		var33,
		var18,
		p2.feedItemId,
		var29
	})
	local var35 = reactModule.useCallback(function(p3)
		-- upvalues: fFlagMomentsComments (copy), var29 (ref), eventNames (copy), deleteFailed (ref), getToastStoreModule (copy), var18 (ref), p2 (ref)
		return var18.deleteComment(p2.feedItemId, p3, function()
			-- upvalues: deleteFailed (copy), getToastStoreModule (copy)
			getToastStoreModule(false).triggerToast({ text = "", title = deleteFailed })
		end, if fFlagMomentsComments and var29 ~= nil then function()
			-- upvalues: var29 (copy), eventNames (copy), p3 (ref)
			var29.logEvent(eventNames.MomentCommentDeleted, { commentId = p3 })
		end else nil)
	end, { var18, p2.feedItemId, var29, deleteFailed })
	local var36 = reactModule.useRef(nil)
	local shift300 = var11.Color.Shift.Shift_300
	local var37 = var8 ~= nil and var8.creatorEnabled
	local var38 = var8 ~= nil and var8.viewerCanWrite
	
	return {
		data = var14,
		layout = var12,
		rowBleed = small,
		row = reactModule.useMemo(function()
			-- upvalues: var1 (ref), p2 (ref), var10 (ref), var37 (ref), var38 (ref), shift300 (ref), var36 (ref), var30 (ref), var31 (ref), var33 (ref), var34 (ref), var35 (ref), var5 (ref), var27 (ref), var28 (ref), var26 (ref)
			return {
				viewerUsername = var1,
				feedItemId = p2.feedItemId,
				thumbsUpEmoteId = var10,
				creatorEnabled = var37,
				viewerCanWrite = var38,
				avatarBackgroundStyle = shift300,
				scrollingFrameRef = var36,
				onToggleReaction = var30,
				onAddReaction = var31,
				onReportComment = var33,
				onBlockCommentAuthor = var34,
				onDeleteComment = var35,
				onToggleCommentExpanded = var5.toggle,
				onRetryPendingSubmission = var27,
				onEditPendingSubmission = var28,
				onRetryLoadMore = var26
			}
		end, {
			var1, p2.feedItemId, var10, var37, var38, shift300, var30, var31, var33,
			var34, var35, var5, var27, var28, var26
		}),
		listScrollingFrameRef = var36,
		isScrollingEnabled = signalsReactModule.useSignalBinding(getCommentsSheetStoreModule(false).getIsListScrollingEnabled),
		onEndReached = if var4.hasMore then var20 else nil,
		onViewportChanged = var24,
		onContentLengthChanged = var25,
		onVisibleRangeChanged = if var15 ~= nil then nil else var15.onVisibleRangeChanged,
		autoScrollOnChange = var17
	}
end