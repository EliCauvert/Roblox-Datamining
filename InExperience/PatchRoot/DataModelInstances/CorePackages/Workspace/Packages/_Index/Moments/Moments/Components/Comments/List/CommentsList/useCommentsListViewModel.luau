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

local _ = function(p1)
	-- upvalues: ViewRecyclerModule (copy)
	local Current = p1.current
	
	return function(p2, p3)
		-- upvalues: Current (ref), p1 (copy), ViewRecyclerModule (upval)
		local Current = Current
		Current = p1.current
		
		if p3.scrollOffset > 33 then
			return false
		end
		for _, change in p2.changes do
			if change.type == ViewRecyclerModule.DataSourceChangeType.Insert and change.index == 1 then
				return ViewRecyclerModule.AutoScrollTarget.Start
			elseif change.type == ViewRecyclerModule.DataSourceChangeType.Reset and Current ~= Current then
				return ViewRecyclerModule.AutoScrollTarget.Start
			end
		end
		return false
	end
end

return function(p2)
	-- upvalues: UseLocalizationFunction (copy), config (copy), Players (copy), GetCommentCollectionStoreModule (copy), ReactModule (copy), SignalsReactModule (copy), CreateExpandedCommentsStoreModule (copy), SignalsModule (copy), BuildCommentRowsModule (copy), MomentsGetMomentsCommentsStoreModule (copy), MomentsGetMomentsReactionsStoreModule (copy), MomentsResolveEmoteIdModule (copy), ReactionTypeModule (copy), UseCommentCapabilitiesModule (copy), FoundationModule (copy), ViewRecyclerModule (copy), LoadStatus (copy), CommentsListItemsModule (copy), FFlagMomentsCommentsRevealAfterMeasureModule (copy), UseCommentsListRevealModule (copy), GetCommentsListCoordinatorModule (copy), FFlagMomentsComments (copy), GetCommentsSheetStoreModule (copy), EventNames (copy), UseMomentsHostFunction (copy), FFlagMomentsCommentActionsRealtimeModule (copy), GetToastStoreModule (copy)
	local DeleteFailed = UseLocalizationFunction(config).deleteFailed
	local LocalPlayer = Players.LocalPlayer
	local Name = if LocalPlayer == nil then "" else LocalPlayer.Name
	local CommentCollectionStoreModule = GetCommentCollectionStoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CommentCollectionStoreModule (copy), p2 (copy)
		return CommentCollectionStoreModule.getState(p2.feedItemId)
	end, { CommentCollectionStoreModule, p2.feedItemId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult)
	local UseStateResult = ReactModule.useState(CreateExpandedCommentsStoreModule)
	local GetExpandedCommentIdsFunction = UseStateResult.getExpandedCommentIds
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), BuildCommentRowsModule (upval), MomentsGetMomentsCommentsStoreModule (upval), GetExpandedCommentIdsFunction (copy)
		local v1 = nil
		
		return SignalsModule.createComputed(function(p3)
			-- upvalues: UseMemoResult (upval), BuildCommentRowsModule (upval), MomentsGetMomentsCommentsStoreModule (upval), v1 (ref), GetExpandedCommentIdsFunction (upval)
			local CommentRowsModule = BuildCommentRowsModule(UseMemoResult(p3), function(p4)
				-- upvalues: MomentsGetMomentsCommentsStoreModule (upval), p3 (copy)
				return MomentsGetMomentsCommentsStoreModule(false).getCachedComment(p4).data(p3)
			end, v1, GetExpandedCommentIdsFunction(p3))
			v1 = CommentRowsModule
			
			return CommentRowsModule
		end)
	end, { UseMemoResult, GetExpandedCommentIdsFunction })))
	local MomentsGetMomentsCommentsStoreModuleResult = MomentsGetMomentsCommentsStoreModule(false)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: MomentsGetMomentsCommentsStoreModuleResult (copy), p2 (copy)
		return MomentsGetMomentsCommentsStoreModuleResult.getCachedMomentComments(p2.feedItemId)
	end, {
		MomentsGetMomentsCommentsStoreModuleResult,
		p2.feedItemId
	}).data)
	local MomentsGetMomentsReactionsStoreModuleResult = MomentsGetMomentsReactionsStoreModule(false)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), MomentsGetMomentsReactionsStoreModuleResult (copy), MomentsResolveEmoteIdModule (upval), ReactionTypeModule (upval)
		return SignalsModule.createComputed(function(p3)
			-- upvalues: MomentsGetMomentsReactionsStoreModuleResult (upval), MomentsResolveEmoteIdModule (upval), ReactionTypeModule (upval)
			local GetCachedEmojiCatalogFunction = MomentsGetMomentsReactionsStoreModuleResult.getCachedEmojiCatalog
			
			if GetCachedEmojiCatalogFunction == nil then
				return nil
			else
				local CachedEmojiCatalog = GetCachedEmojiCatalogFunction(p3)
				
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
	local IsReadOnly = p2.isReadOnly
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
	local UseCommentsListRevealModuleResult = if FFlagMomentsCommentsRevealAfterMeasureModule then UseCommentsListRevealModule(UseStateResult1, UseMemoResult1, p2.onRevealed) else nil
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult.current = if UseMemoResult1[1] == nil then nil else UseMemoResult1[1].key
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), ViewRecyclerModule (upval)
		local Current = UseRefResult.current
		
		return function(p3, p4)
			-- upvalues: Current (ref), UseRefResult (copy), ViewRecyclerModule (upval)
			local Current = Current
			Current = UseRefResult.current
			
			if p4.scrollOffset > 33 then
				return false
			end
			for _, change in p3.changes do
				if change.type == ViewRecyclerModule.DataSourceChangeType.Insert and change.index == 1 then
					return ViewRecyclerModule.AutoScrollTarget.Start
				elseif change.type == ViewRecyclerModule.DataSourceChangeType.Reset and Current ~= Current then
					return ViewRecyclerModule.AutoScrollTarget.Start
				end
			end
			return false
		end
	end, {})
	local CommentsListCoordinatorModule = GetCommentsListCoordinatorModule(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CommentsListCoordinatorModule (copy), p2 (copy)
		return CommentsListCoordinatorModule.loadMore(p2.feedItemId, p2.sessionId)
	end, {
		CommentsListCoordinatorModule,
		p2.feedItemId,
		p2.sessionId
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseResult (copy)
		if UseRefResult1.current > 0 and UseRefResult2.current > 0 and UseRefResult2.current <= UseRefResult1.current then
			UseResult()
		end
	end, { UseResult })
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult1 (copy), UseResult2 (copy)
		UseRefResult1.current = p3.Y
		UseResult2()
	end, { UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult2 (copy), UseResult2 (copy)
		UseRefResult2.current = Current
		UseResult2()
	end, { UseResult2 })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: CommentsListCoordinatorModule (copy), p2 (copy)
		CommentsListCoordinatorModule.retryLoadMore(p2.feedItemId, p2.sessionId)
	end, {
		CommentsListCoordinatorModule,
		p2.feedItemId,
		p2.sessionId
	})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: CommentsListCoordinatorModule (copy), p2 (copy)
		CommentsListCoordinatorModule.retryPendingSubmission(p2.feedItemId, p2.sessionId)
	end, {
		CommentsListCoordinatorModule,
		p2.feedItemId,
		p2.sessionId
	})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: CommentsListCoordinatorModule (copy), p2 (copy)
		CommentsListCoordinatorModule.editPendingSubmission(p2.feedItemId, p2.sessionId)
	end, {
		CommentsListCoordinatorModule,
		p2.feedItemId,
		p2.sessionId
	})
	local AnalyticsSession = if FFlagMomentsComments then GetCommentsSheetStoreModule(false).getAnalyticsSession(p2.feedItemId, p2.sessionId) else nil
	local UseResult8 = ReactModule.useCallback(function(CommentId, p3, p4, p5)
		-- upvalues: FFlagMomentsComments (upval), AnalyticsSession (copy), EventNames (upval), CommentsListCoordinatorModule (copy), p2 (copy)
		if FFlagMomentsComments and AnalyticsSession ~= nil then
			AnalyticsSession.logEvent(EventNames.MomentCommentReactButtonClicked, {
				commentId = CommentId,
				reactionSelected = tostring(not p5)
			})
		end
		return if p5 then CommentsListCoordinatorModule.ensureReactionAbsent(p2.feedItemId, CommentId, p3, p4) else CommentsListCoordinatorModule.ensureReactionPresent(p2.feedItemId, CommentId, p3, p4)
	end, {
		CommentsListCoordinatorModule,
		p2.feedItemId,
		AnalyticsSession
	})
	local UseResult9 = ReactModule.useCallback(function(p3, p4, p5)
		-- upvalues: CommentsListCoordinatorModule (copy), p2 (copy)
		return CommentsListCoordinatorModule.ensureReactionPresent(p2.feedItemId, p3, p4, p5)
	end, { CommentsListCoordinatorModule, p2.feedItemId })
	local UseMomentsHostResult = UseMomentsHostFunction()
	local OpenMomentCommentReportFunction = UseMomentsHostResult.openMomentCommentReport
	local ChannelId = UseSignalStateResult.channelId
	local UseMemoResult4 = ReactModule.useMemo(function()
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
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: OpenBlockUserFunction (copy), FFlagMomentsCommentActionsRealtimeModule (upval), AnalyticsSession (copy), CommentsListCoordinatorModule (copy), p2 (copy), UseMemoResult4 (copy)
		return if OpenBlockUserFunction == nil then nil else function(p3, UserId)
			-- upvalues: OpenBlockUserFunction (upval), FFlagMomentsCommentActionsRealtimeModule (upval), AnalyticsSession (upval), CommentsListCoordinatorModule (upval), p2 (upval), UseMemoResult4 (upval)
			OpenBlockUserFunction({
				userId = UserId,
				onBlockConfirmed = function()
					-- upvalues: FFlagMomentsCommentActionsRealtimeModule (upval), AnalyticsSession (upval), CommentsListCoordinatorModule (upval), p2 (upval), UserId (copy)
					if FFlagMomentsCommentActionsRealtimeModule and AnalyticsSession ~= nil then
						AnalyticsSession.logRealtimeEvent("MomentsCommentAuthorBlock", { status = "attempted" })
					end
					CommentsListCoordinatorModule.hideCommentsByAuthor(p2.feedItemId, UserId)
				end,
				onBlockFailed = function()
					-- upvalues: FFlagMomentsCommentActionsRealtimeModule (upval), AnalyticsSession (upval), CommentsListCoordinatorModule (upval), p2 (upval), UserId (copy)
					if FFlagMomentsCommentActionsRealtimeModule and AnalyticsSession ~= nil then
						AnalyticsSession.logRealtimeEvent("MomentsCommentAuthorBlock", { status = "failed" })
					end
					CommentsListCoordinatorModule.restoreCommentsByAuthor(p2.feedItemId, UserId)
				end,
				onBlockSucceeded = if FFlagMomentsCommentActionsRealtimeModule and AnalyticsSession ~= nil then function()
					-- upvalues: AnalyticsSession (upval)
					AnalyticsSession.logRealtimeEvent("MomentsCommentAuthorBlock", { status = "succeeded" })
				end else nil,
				openReportUser = if UseMemoResult4 == nil then nil else function()
					-- upvalues: UseMemoResult4 (upval), p3 (copy), UserId (copy)
					UseMemoResult4(p3, UserId)
				end
			})
		end
	end, {
		OpenBlockUserFunction,
		UseMemoResult4,
		CommentsListCoordinatorModule,
		p2.feedItemId,
		AnalyticsSession
	})
	local UseResult10 = ReactModule.useCallback(function(CommentId)
		-- upvalues: FFlagMomentsComments (upval), AnalyticsSession (copy), EventNames (upval), DeleteFailed (copy), GetToastStoreModule (upval), CommentsListCoordinatorModule (copy), p2 (copy)
		return CommentsListCoordinatorModule.deleteComment(p2.feedItemId, CommentId, function()
			-- upvalues: DeleteFailed (upval), GetToastStoreModule (upval)
			GetToastStoreModule(false).triggerToast({ text = "", title = DeleteFailed })
		end, if FFlagMomentsComments and AnalyticsSession ~= nil then function()
			-- upvalues: AnalyticsSession (upval), EventNames (upval), CommentId (copy)
			AnalyticsSession.logEvent(EventNames.MomentCommentDeleted, { commentId = CommentId })
		end else nil)
	end, {
		CommentsListCoordinatorModule,
		p2.feedItemId,
		AnalyticsSession,
		DeleteFailed
	})
	local UseRefResult3 = ReactModule.useRef(nil)
	local Shift300 = UseTokensResult.Color.Shift.Shift_300
	local CreatorEnabled = UseSignalStateResult2 ~= nil and UseSignalStateResult2.creatorEnabled
	local ViewerCanWrite = UseSignalStateResult2 ~= nil and UseSignalStateResult2.viewerCanWrite
	
	return {
		data = UseMemoResult2,
		layout = UseStateResult1,
		rowBleed = Small,
		row = ReactModule.useMemo(function()
			-- upvalues: Name (copy), p2 (copy), UseSignalStateResult4 (copy), CreatorEnabled (copy), ViewerCanWrite (copy), Shift300 (copy), UseRefResult3 (copy), UseResult8 (copy), UseResult9 (copy), UseMemoResult4 (copy), UseMemoResult5 (copy), UseResult10 (copy), UseStateResult (copy), UseResult6 (copy), UseResult7 (copy), UseResult5 (copy)
			return {
				viewerUsername = Name,
				feedItemId = p2.feedItemId,
				thumbsUpEmoteId = UseSignalStateResult4,
				creatorEnabled = CreatorEnabled,
				viewerCanWrite = ViewerCanWrite,
				avatarBackgroundStyle = Shift300,
				scrollingFrameRef = UseRefResult3,
				onToggleReaction = UseResult8,
				onAddReaction = UseResult9,
				onReportComment = UseMemoResult4,
				onBlockCommentAuthor = UseMemoResult5,
				onDeleteComment = UseResult10,
				onToggleCommentExpanded = UseStateResult.toggle,
				onRetryPendingSubmission = UseResult6,
				onEditPendingSubmission = UseResult7,
				onRetryLoadMore = UseResult5
			}
		end, {
			Name, p2.feedItemId, UseSignalStateResult4, CreatorEnabled, ViewerCanWrite,
			Shift300, UseResult8, UseResult9, UseMemoResult4, UseMemoResult5, UseResult10,
			UseStateResult, UseResult6, UseResult7, UseResult5
		}),
		listScrollingFrameRef = UseRefResult3,
		isScrollingEnabled = SignalsReactModule.useSignalBinding(GetCommentsSheetStoreModule(false).getIsListScrollingEnabled),
		onEndReached = if UseSignalStateResult.hasMore then UseResult1 else nil,
		onViewportChanged = UseResult3,
		onContentLengthChanged = UseResult4,
		onVisibleRangeChanged = if UseCommentsListRevealModuleResult == nil then nil else UseCommentsListRevealModuleResult.onVisibleRangeChanged,
		autoScrollOnChange = UseMemoResult3
	}
end