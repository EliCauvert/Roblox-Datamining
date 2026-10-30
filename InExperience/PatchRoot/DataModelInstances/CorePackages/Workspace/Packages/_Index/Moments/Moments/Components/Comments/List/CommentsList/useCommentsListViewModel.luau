local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local FFlagMomentsComments = require(Parent.SharedFlags).FFlagMomentsComments
local FFlagMomentsCommentActionsRealtimeModule = require(Moments.Flags.FFlagMomentsCommentActionsRealtime)
local FFlagMomentsCommentsRevealAfterMeasureModule = require(Moments.Flags.FFlagMomentsCommentsRevealAfterMeasure)
local FFlagMomentsCommentsScrollToPostedCommentModule = require(Moments.Flags.FFlagMomentsCommentsScrollToPostedComment)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames
local MomentsGetMomentsCommentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsCommentsStore)
local MomentsGetMomentsReactionsStoreModule = require(Parent.DataHydration.MomentsGetMomentsReactionsStore)
local MomentsResolveEmoteIdModule = require(Parent.DataHydration.MomentsResolveEmoteId)
local _ = require(Parent.MomentsTypes)
local GetCommentCollectionStoreModule = require(Moments.Components.Comments.GetCommentCollectionStore)
local GetCommentsListCoordinatorModule = require(script.Parent.Parent.getCommentsListCoordinator)
local GetCommentsSheetStoreModule = require(Moments.Components.Comments.Sheet.getCommentsSheetStore)
local UseCommentCapabilitiesModule = require(Moments.Components.Comments.useCommentCapabilities)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local UseMomentsHostFunction = require(Moments.MomentsHostContext).useMomentsHost
local ReactionTypeModule = require(Moments.Enums.ReactionType)
local BuildCommentRowsModule = require(script.Parent.Parent.Rows.buildCommentRows)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)
local CommentsListItemsModule = require(script.Parent.CommentsListItems)
local _ = require(script.Parent.CommentsListRowContext)
local _ = require(script.Parent.CommentsListView)
local CreateExpandedCommentsStoreModule = require(script.Parent.createExpandedCommentsStore)
local UseCommentsListRevealModule = require(script.Parent.useCommentsListReveal)
local Players = game:GetService("Players")
local LoadStatus = require(Moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes).LoadStatus
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	deleteFailed = "Feature.Moments.Label.CommentDeleteFailed"
}

local function _(Title)
	-- upvalues: GetToastStoreModule (copy)
	GetToastStoreModule(false).triggerToast({ text = "", title = Title })
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), Players (copy), GetCommentCollectionStoreModule (copy), ReactModule (copy), SignalsReactModule (copy), CreateExpandedCommentsStoreModule (copy), SignalsModule (copy), BuildCommentRowsModule (copy), MomentsGetMomentsCommentsStoreModule (copy), MomentsGetMomentsReactionsStoreModule (copy), MomentsResolveEmoteIdModule (copy), ReactionTypeModule (copy), UseCommentCapabilitiesModule (copy), FoundationModule (copy), ViewRecyclerModule (copy), LoadStatus (copy), CommentsListItemsModule (copy), FFlagMomentsCommentsRevealAfterMeasureModule (copy), UseCommentsListRevealModule (copy), GetCommentsListCoordinatorModule (copy), FFlagMomentsComments (copy), GetCommentsSheetStoreModule (copy), EventNames (copy), UseMomentsHostFunction (copy), FFlagMomentsCommentActionsRealtimeModule (copy), GetToastStoreModule (copy), FFlagMomentsCommentsScrollToPostedCommentModule (copy)
	local DeleteFailed = UseLocalizationFunction(config).deleteFailed
	local LocalPlayer = Players.LocalPlayer
	local Name = if LocalPlayer == nil then "" else LocalPlayer.Name
	local CommentCollectionStoreModule = GetCommentCollectionStoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CommentCollectionStoreModule (copy), p1 (copy)
		return CommentCollectionStoreModule.getState(p1.feedItemId)
	end, { CommentCollectionStoreModule, p1.feedItemId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult)
	local UseStateResult = ReactModule.useState(CreateExpandedCommentsStoreModule)
	local GetExpandedCommentIdsFunction = UseStateResult.getExpandedCommentIds
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), BuildCommentRowsModule (upval), MomentsGetMomentsCommentsStoreModule (upval), GetExpandedCommentIdsFunction (copy)
		local v1 = nil
		
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult (upval), BuildCommentRowsModule (upval), MomentsGetMomentsCommentsStoreModule (upval), v1 (ref), GetExpandedCommentIdsFunction (upval)
			local CommentRowsModule = BuildCommentRowsModule(UseMemoResult(p2), function(p3)
				-- upvalues: MomentsGetMomentsCommentsStoreModule (upval), p2 (copy)
				return MomentsGetMomentsCommentsStoreModule(false).getCachedComment(p3).data(p2)
			end, v1, GetExpandedCommentIdsFunction(p2))
			v1 = CommentRowsModule
			
			return CommentRowsModule
		end)
	end, { UseMemoResult, GetExpandedCommentIdsFunction })))
	local MomentsGetMomentsCommentsStoreModuleResult = MomentsGetMomentsCommentsStoreModule(false)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: MomentsGetMomentsCommentsStoreModuleResult (copy), p1 (copy)
		return MomentsGetMomentsCommentsStoreModuleResult.getCachedMomentComments(p1.feedItemId)
	end, {
		MomentsGetMomentsCommentsStoreModuleResult,
		p1.feedItemId
	}).data)
	local MomentsGetMomentsReactionsStoreModuleResult = MomentsGetMomentsReactionsStoreModule(false)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), MomentsGetMomentsReactionsStoreModuleResult (copy), MomentsResolveEmoteIdModule (upval), ReactionTypeModule (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: MomentsGetMomentsReactionsStoreModuleResult (upval), MomentsResolveEmoteIdModule (upval), ReactionTypeModule (upval)
			local GetCachedEmojiCatalogFunction = MomentsGetMomentsReactionsStoreModuleResult.getCachedEmojiCatalog
			
			if GetCachedEmojiCatalogFunction == nil then
				return nil
			else
				local CachedEmojiCatalog = GetCachedEmojiCatalogFunction(p2)
				
				return if CachedEmojiCatalog.source == "cache" and CachedEmojiCatalog.status == "Ready" then MomentsResolveEmoteIdModule.resolveOptionalEmoteIdForReaction(CachedEmojiCatalog.emojis, ReactionTypeModule.ThumbsUp) else nil
			end
		end)
	end, { MomentsGetMomentsReactionsStoreModuleResult })))
	local UseSignalStateResult4 = if UseCommentCapabilitiesModule().canReact then UseSignalStateResult3 else nil
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Small = UseTokensResult.Padding.Small
	local Size2000 = UseTokensResult.Size.Size_2000
	local UseStateResult1 = ReactModule.useState(function()
		-- upvalues: ViewRecyclerModule (upval), Size2000 (copy)
		return ViewRecyclerModule.Layout.measured({ estimatedItemLength = Size2000 })
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy)
		return function()
			-- upvalues: UseStateResult1 (upval)
			UseStateResult1.destroy()
		end
	end, { UseStateResult1 })
	local LoadMoreStatus = UseSignalStateResult.loadMoreStatus
	local IsReadOnly = p1.isReadOnly
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), LoadMoreStatus (copy), LoadStatus (upval), CommentsListItemsModule (upval), IsReadOnly (copy)
		local Buffer = table.create(#UseSignalStateResult1 + 2)
		
		for i, value in UseSignalStateResult1 do
			Buffer[i] = value
		end
		if LoadMoreStatus == LoadStatus.Loading or LoadMoreStatus == LoadStatus.Failed then
			table.insert(Buffer, CommentsListItemsModule.loadMore(LoadMoreStatus))
		end
		if IsReadOnly then
			table.insert(Buffer, CommentsListItemsModule.readOnlyNotice())
		end
		return Buffer
	end, { UseSignalStateResult1, LoadMoreStatus, IsReadOnly })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult1 (copy), CommentsListItemsModule (upval)
		return {
			items = UseMemoResult1,
			getItemKey = CommentsListItemsModule.getItemKey
		}
	end, { UseMemoResult1 })
	local UseCommentsListRevealModuleResult = if FFlagMomentsCommentsRevealAfterMeasureModule then UseCommentsListRevealModule(UseStateResult1, UseMemoResult1, p1.onRevealed) else nil
	local CommentsListCoordinatorModule = GetCommentsListCoordinatorModule(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CommentsListCoordinatorModule (copy), p1 (copy)
		return CommentsListCoordinatorModule.loadMore(p1.feedItemId, p1.sessionId)
	end, {
		CommentsListCoordinatorModule,
		p1.feedItemId,
		p1.sessionId
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseResult (copy)
		if UseRefResult.current > 0 and UseRefResult1.current > 0 and UseRefResult1.current <= UseRefResult.current then
			UseResult()
		end
	end, { UseResult })
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseResult2 (copy)
		UseRefResult.current = p2.Y
		UseResult2()
	end, { UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), UseResult2 (copy)
		UseRefResult1.current = Current
		UseResult2()
	end, { UseResult2 })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: CommentsListCoordinatorModule (copy), p1 (copy)
		CommentsListCoordinatorModule.retryLoadMore(p1.feedItemId, p1.sessionId)
	end, {
		CommentsListCoordinatorModule,
		p1.feedItemId,
		p1.sessionId
	})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: CommentsListCoordinatorModule (copy), p1 (copy)
		CommentsListCoordinatorModule.retryPendingSubmission(p1.feedItemId, p1.sessionId)
	end, {
		CommentsListCoordinatorModule,
		p1.feedItemId,
		p1.sessionId
	})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: CommentsListCoordinatorModule (copy), p1 (copy)
		CommentsListCoordinatorModule.editPendingSubmission(p1.feedItemId, p1.sessionId)
	end, {
		CommentsListCoordinatorModule,
		p1.feedItemId,
		p1.sessionId
	})
	local AnalyticsSession = if FFlagMomentsComments then GetCommentsSheetStoreModule(false).getAnalyticsSession(p1.feedItemId, p1.sessionId) else nil
	local UseResult8 = ReactModule.useCallback(function(CommentId, p2, p3, p4)
		-- upvalues: FFlagMomentsComments (upval), AnalyticsSession (copy), EventNames (upval), CommentsListCoordinatorModule (copy), p1 (copy)
		if FFlagMomentsComments and AnalyticsSession ~= nil then
			AnalyticsSession.logEvent(EventNames.MomentCommentReactButtonClicked, {
				commentId = CommentId,
				reactionSelected = tostring(not p4)
			})
		end
		return if p4 then CommentsListCoordinatorModule.ensureReactionAbsent(p1.feedItemId, CommentId, p2, p3) else CommentsListCoordinatorModule.ensureReactionPresent(p1.feedItemId, CommentId, p2, p3)
	end, {
		CommentsListCoordinatorModule,
		p1.feedItemId,
		AnalyticsSession
	})
	local UseResult9 = ReactModule.useCallback(function(p2, p3, p4)
		-- upvalues: CommentsListCoordinatorModule (copy), p1 (copy)
		return CommentsListCoordinatorModule.ensureReactionPresent(p1.feedItemId, p2, p3, p4)
	end, { CommentsListCoordinatorModule, p1.feedItemId })
	local UseMomentsHostResult = UseMomentsHostFunction()
	local OpenMomentCommentReportFunction = UseMomentsHostResult.openMomentCommentReport
	local ChannelId = UseSignalStateResult.channelId
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: OpenMomentCommentReportFunction (copy), ChannelId (copy), FFlagMomentsComments (upval), AnalyticsSession (copy), EventNames (upval), FFlagMomentsCommentActionsRealtimeModule (upval)
		return if OpenMomentCommentReportFunction == nil or ChannelId == nil then nil else function(CommentId, ReportedUserId)
			-- upvalues: FFlagMomentsComments (upval), AnalyticsSession (upval), EventNames (upval), FFlagMomentsCommentActionsRealtimeModule (upval), OpenMomentCommentReportFunction (upval), ChannelId (upval)
			if FFlagMomentsComments and AnalyticsSession ~= nil then
				AnalyticsSession.logEvent(EventNames.MomentCommentReportClicked, { commentId = CommentId })
			end
			if FFlagMomentsCommentActionsRealtimeModule and AnalyticsSession ~= nil then
				AnalyticsSession.logRealtimeEvent("MomentsCommentReport", { status = "clicked" })
			end
			OpenMomentCommentReportFunction({
				commentId = CommentId,
				channelId = ChannelId,
				reportedUserId = ReportedUserId
			})
		end
	end, {
		OpenMomentCommentReportFunction,
		ChannelId,
		AnalyticsSession
	})
	local OpenBlockUserFunction = UseMomentsHostResult.openBlockUser
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: OpenBlockUserFunction (copy), FFlagMomentsCommentActionsRealtimeModule (upval), AnalyticsSession (copy), CommentsListCoordinatorModule (copy), p1 (copy), UseMemoResult3 (copy)
		return if OpenBlockUserFunction == nil then nil else function(p2, UserId)
			-- upvalues: OpenBlockUserFunction (upval), FFlagMomentsCommentActionsRealtimeModule (upval), AnalyticsSession (upval), CommentsListCoordinatorModule (upval), p1 (upval), UseMemoResult3 (upval)
			OpenBlockUserFunction({
				userId = UserId,
				onBlockConfirmed = function()
					-- upvalues: FFlagMomentsCommentActionsRealtimeModule (upval), AnalyticsSession (upval), CommentsListCoordinatorModule (upval), p1 (upval), UserId (copy)
					if FFlagMomentsCommentActionsRealtimeModule and AnalyticsSession ~= nil then
						AnalyticsSession.logRealtimeEvent("MomentsCommentAuthorBlock", { status = "attempted" })
					end
					CommentsListCoordinatorModule.hideCommentsByAuthor(p1.feedItemId, UserId)
				end,
				onBlockFailed = function()
					-- upvalues: FFlagMomentsCommentActionsRealtimeModule (upval), AnalyticsSession (upval), CommentsListCoordinatorModule (upval), p1 (upval), UserId (copy)
					if FFlagMomentsCommentActionsRealtimeModule and AnalyticsSession ~= nil then
						AnalyticsSession.logRealtimeEvent("MomentsCommentAuthorBlock", { status = "failed" })
					end
					CommentsListCoordinatorModule.restoreCommentsByAuthor(p1.feedItemId, UserId)
				end,
				onBlockSucceeded = if FFlagMomentsCommentActionsRealtimeModule and AnalyticsSession ~= nil then function()
					-- upvalues: AnalyticsSession (upval)
					AnalyticsSession.logRealtimeEvent("MomentsCommentAuthorBlock", { status = "succeeded" })
				end else nil,
				openReportUser = if UseMemoResult3 == nil then nil else function()
					-- upvalues: UseMemoResult3 (upval), p2 (copy), UserId (copy)
					UseMemoResult3(p2, UserId)
				end
			})
		end
	end, {
		OpenBlockUserFunction,
		UseMemoResult3,
		CommentsListCoordinatorModule,
		p1.feedItemId,
		AnalyticsSession
	})
	local UseResult10 = ReactModule.useCallback(function(CommentId)
		-- upvalues: FFlagMomentsComments (upval), AnalyticsSession (copy), EventNames (upval), DeleteFailed (copy), GetToastStoreModule (upval), CommentsListCoordinatorModule (copy), p1 (copy)
		return CommentsListCoordinatorModule.deleteComment(p1.feedItemId, CommentId, function()
			-- upvalues: DeleteFailed (upval), GetToastStoreModule (upval)
			GetToastStoreModule(false).triggerToast({ text = "", title = DeleteFailed })
		end, if FFlagMomentsComments and AnalyticsSession ~= nil then function()
			-- upvalues: AnalyticsSession (upval), EventNames (upval), CommentId (copy)
			AnalyticsSession.logEvent(EventNames.MomentCommentDeleted, { commentId = CommentId })
		end else nil)
	end, {
		CommentsListCoordinatorModule,
		p1.feedItemId,
		AnalyticsSession,
		DeleteFailed
	})
	local UseRefResult2 = ReactModule.useRef(nil)
	local ListRef = nil
	
	if FFlagMomentsCommentsScrollToPostedCommentModule then
		local UseRefResult3 = ReactModule.useRef(nil)
		ListRef = UseRefResult3
		local PendingSubmission = UseSignalStateResult.pendingSubmission
		local ClientRequestId = if PendingSubmission == nil then nil else PendingSubmission.clientRequestId
		local UseRefResult4 = ReactModule.useRef(ClientRequestId)
		ReactModule.useEffect(function()
			-- upvalues: ClientRequestId (copy), UseRefResult4 (copy), UseRefResult3 (copy)
			if ClientRequestId == nil or ClientRequestId == UseRefResult4.current then return end
			UseRefResult4.current = ClientRequestId
			local Current = UseRefResult3.current
			
			if Current ~= nil then
				Current.scrollToOffset(0)
			end
		end, { ClientRequestId })
	end
	local Shift300 = UseTokensResult.Color.Shift.Shift_300
	local CreatorEnabled = UseSignalStateResult2 ~= nil and UseSignalStateResult2.creatorEnabled
	local ViewerCanWrite = UseSignalStateResult2 ~= nil and UseSignalStateResult2.viewerCanWrite
	
	return {
		data = UseMemoResult2,
		layout = UseStateResult1,
		rowBleed = Small,
		row = ReactModule.useMemo(function()
			-- upvalues: Name (copy), p1 (copy), UseSignalStateResult4 (copy), CreatorEnabled (copy), ViewerCanWrite (copy), Shift300 (copy), UseRefResult2 (copy), UseResult8 (copy), UseResult9 (copy), UseMemoResult3 (copy), UseMemoResult4 (copy), UseResult10 (copy), UseStateResult (copy), UseResult6 (copy), UseResult7 (copy), UseResult5 (copy)
			return {
				viewerUsername = Name,
				feedItemId = p1.feedItemId,
				thumbsUpEmoteId = UseSignalStateResult4,
				creatorEnabled = CreatorEnabled,
				viewerCanWrite = ViewerCanWrite,
				avatarBackgroundStyle = Shift300,
				scrollingFrameRef = UseRefResult2,
				onToggleReaction = UseResult8,
				onAddReaction = UseResult9,
				onReportComment = UseMemoResult3,
				onBlockCommentAuthor = UseMemoResult4,
				onDeleteComment = UseResult10,
				onToggleCommentExpanded = UseStateResult.toggle,
				onRetryPendingSubmission = UseResult6,
				onEditPendingSubmission = UseResult7,
				onRetryLoadMore = UseResult5
			}
		end, {
			Name, p1.feedItemId, UseSignalStateResult4, CreatorEnabled, ViewerCanWrite,
			Shift300, UseResult8, UseResult9, UseMemoResult3, UseMemoResult4, UseResult10,
			UseStateResult, UseResult6, UseResult7, UseResult5
		}),
		listScrollingFrameRef = UseRefResult2,
		listRef = ListRef,
		isScrollingEnabled = SignalsReactModule.useSignalBinding(GetCommentsSheetStoreModule(false).getIsListScrollingEnabled),
		onEndReached = if UseSignalStateResult.hasMore then UseResult1 else nil,
		onViewportChanged = UseResult3,
		onContentLengthChanged = UseResult4,
		onVisibleRangeChanged = if UseCommentsListRevealModuleResult == nil then nil else UseCommentsListRevealModuleResult.onVisibleRangeChanged
	}
end