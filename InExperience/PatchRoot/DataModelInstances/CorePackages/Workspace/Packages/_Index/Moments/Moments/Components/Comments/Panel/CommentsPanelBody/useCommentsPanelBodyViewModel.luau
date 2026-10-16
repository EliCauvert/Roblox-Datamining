local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagMomentsCommentsRevealAfterMeasureModule = require(Moments.Flags.FFlagMomentsCommentsRevealAfterMeasure)
local GetCommentCollectionStoreModule = require(Moments.Components.Comments.GetCommentCollectionStore)
local GetCommentsListCoordinatorModule = require(Moments.Components.Comments.List.getCommentsListCoordinator)
local _ = require(script.Parent.Parent.getCommentsPanelState)
local _ = require(script.Parent.CommentsPanelBodyView)
local UseVisibleContentHeightModule = require(script.Parent.useVisibleContentHeight)

return function(p1) --[[ Line: 35 | Named "useCommentsPanelBodyViewModel" ]]
	-- upvalues: ReactModule (copy), GetCommentCollectionStoreModule (copy), SignalsReactModule (copy), GetCommentsListCoordinatorModule (copy), UseVisibleContentHeightModule (copy), FFlagMomentsCommentsRevealAfterMeasureModule (copy)
	local FeedItemId = p1.feedItemId
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 37 ]]
		-- upvalues: p1 (copy), FeedItemId (copy)
		return if p1.isOpen and FeedItemId ~= nil and FeedItemId ~= "" then { feedItemId = FeedItemId, sessionId = p1.sessionId } else nil
	end, { p1.isOpen, p1.sessionId, FeedItemId })
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local CommentCollectionStoreModule = GetCommentCollectionStoreModule(false)
	local FeedItemId1 = FeedItemId or ""
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 49 ]]
		-- upvalues: CommentCollectionStoreModule (copy), FeedItemId1 (copy)
		return CommentCollectionStoreModule.getState(FeedItemId1)
	end, { CommentCollectionStoreModule, FeedItemId1 })))
	local CommentsListCoordinatorModule = GetCommentsListCoordinatorModule(false)
	ReactModule.useEffect(function() --[[ Line: 56 ]]
		-- upvalues: UseMemoResult (copy), CommentsListCoordinatorModule (copy), UseStateResult2 (copy)
		if UseMemoResult == nil then return end
		local AcquireSessionResult = CommentsListCoordinatorModule.acquireSession(UseMemoResult.feedItemId, UseMemoResult.sessionId)
		UseStateResult2(UseMemoResult)
		
		return AcquireSessionResult
	end, { CommentsListCoordinatorModule, UseMemoResult })
	local Comments = p1.comments
	local NoComments = Comments == nil or Comments.viewerCanRead
	local PendingSubmission = UseSignalStateResult.pendingSubmission
	ReactModule.useEffect(function() --[[ Line: 77 ]]
		-- upvalues: UseMemoResult (copy), UseStateResult (copy), NoComments (copy), CommentsListCoordinatorModule (copy)
		if UseMemoResult ~= nil and UseStateResult == UseMemoResult and NoComments then
			CommentsListCoordinatorModule.ensureInitialLoad(UseMemoResult.feedItemId, UseMemoResult.sessionId)
		end
	end, {
		UseStateResult, CommentsListCoordinatorModule, UseMemoResult, NoComments,
		UseSignalStateResult.initialLoadStatus, UseSignalStateResult.loadMoreStatus,
		if PendingSubmission == nil then "" else PendingSubmission.clientRequestId,
		if PendingSubmission == nil then "" else PendingSubmission.status
	})
	local PanelState = p1.panelState
	ReactModule.useEffect(function() --[[ Line: 96 ]]
		-- upvalues: UseMemoResult (copy), UseStateResult (copy), PanelState (copy), p1 (copy)
		if UseMemoResult ~= nil and UseStateResult == UseMemoResult and PanelState.shouldClose then
			p1.onClose()
		end
	end, {
		UseStateResult,
		p1.onClose,
		PanelState.shouldClose,
		UseMemoResult
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 109 ]]
		-- upvalues: FeedItemId (copy), CommentsListCoordinatorModule (copy), p1 (copy)
		if FeedItemId ~= nil and FeedItemId ~= "" then
			CommentsListCoordinatorModule.retryInitial(FeedItemId, p1.sessionId)
		end
	end, { CommentsListCoordinatorModule, p1.sessionId, FeedItemId })
	local UseVisibleContentHeightModuleResult = UseVisibleContentHeightModule(p1.scrollingFrameRef, p1.actionsFrame)
	local IsListRevealed = true
	local UseResult1 = nil
	
	if FFlagMomentsCommentsRevealAfterMeasureModule then
		local Text: string = `{FeedItemId or ""}:{p1.sessionId}`
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
		IsListRevealed = UseStateResult1 == Text
		UseResult1 = ReactModule.useCallback(function() --[[ Line: 124 ]]
			-- upvalues: UseStateResult2_1 (copy), Text (copy)
			UseStateResult2_1(Text)
		end, { Text })
		local HasFeedItemId: boolean = PanelState.contentState == "list" and FeedItemId ~= nil
		ReactModule.useEffect(function() --[[ Line: 130 ]]
			-- upvalues: HasFeedItemId (copy), UseStateResult2_1 (copy)
			if not HasFeedItemId then
				UseStateResult2_1(nil)
			end
		end, { HasFeedItemId })
	end
	return {
		contentState = PanelState.contentState,
		isReadOnly = PanelState.isReadOnly,
		canRetryInitial = PanelState.canRetryInitial,
		feedItemId = FeedItemId,
		sessionId = p1.sessionId,
		stateMinHeight = UseVisibleContentHeightModuleResult,
		onRetryInitial = UseResult,
		isListRevealed = IsListRevealed,
		onListRevealed = UseResult1
	}
end