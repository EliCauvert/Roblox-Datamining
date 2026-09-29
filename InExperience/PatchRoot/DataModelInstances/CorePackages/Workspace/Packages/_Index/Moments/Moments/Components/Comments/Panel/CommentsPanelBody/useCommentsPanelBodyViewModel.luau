local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getCommentCollectionStoreModule = require(moments.Components.Comments.GetCommentCollectionStore)
local getCommentsListCoordinatorModule = require(moments.Components.Comments.List.getCommentsListCoordinator)
local _ = require(script.Parent.Parent.getCommentsPanelState)
local _ = require(script.Parent.CommentsPanelBodyView)
local useVisibleContentHeightModule = require(script.Parent.useVisibleContentHeight)

return function(p1)
	-- upvalues: reactModule (ref), getCommentCollectionStoreModule (ref), signalsReactModule (ref), getCommentsListCoordinatorModule (ref), useVisibleContentHeightModule (ref)
	local feedItemId = p1.feedItemId
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), feedItemId (ref)
		return if p1.isOpen and feedItemId ~= nil and feedItemId ~= "" then { feedItemId = feedItemId, sessionId = p1.sessionId } else nil
	end, { p1.isOpen, p1.sessionId, feedItemId })
	local var2, var3 = reactModule.useState(nil)
	local var4 = getCommentCollectionStoreModule(false)
	local feedItemId_1 = feedItemId or ""
	local var5 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var4 (ref), feedItemId_1 (ref)
		return var4.getState(feedItemId_1)
	end, { var4, feedItemId_1 }))
	local var6 = getCommentsListCoordinatorModule(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var6 (ref), var3 (ref)
		if var1 == nil then
			return
		end
		local var7 = var6.acquireSession(var1.feedItemId, var1.sessionId)
		var3(var1)
		
		return var7
	end, { var6, var1 })
	local comments = p1.comments
	local var7 = if comments ~= nil then comments.viewerCanRead else true
	local pendingSubmission = var5.pendingSubmission
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), var7 (ref), var6 (ref)
		if var1 ~= nil and var2 == var1 and var7 then
			var6.ensureInitialLoad(var1.feedItemId, var1.sessionId)
		end
	end, {
		var2, var6, var1, var7, var5.initialLoadStatus, var5.loadMoreStatus,
		if pendingSubmission ~= nil then "" else pendingSubmission.clientRequestId,
		if pendingSubmission ~= nil then "" else pendingSubmission.status
	})
	local panelState = p1.panelState
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), panelState (ref), p1 (ref)
		if var1 ~= nil and var2 == var1 and panelState.shouldClose then
			p1.onClose()
		end
	end, { var2, p1.onClose, panelState.shouldClose, var1 })
	
	return {
		contentState = panelState.contentState,
		isReadOnly = panelState.isReadOnly,
		canRetryInitial = panelState.canRetryInitial,
		feedItemId = feedItemId,
		sessionId = p1.sessionId,
		scrollingFrameRef = p1.scrollingFrameRef,
		stateMinHeight = useVisibleContentHeightModule(p1.scrollingFrameRef, p1.actionsFrame),
		onRetryInitial = reactModule.useCallback(function()
			-- upvalues: feedItemId (ref), var6 (ref), p1 (ref)
			if feedItemId ~= nil and feedItemId ~= "" then
				var6.retryInitial(feedItemId, p1.sessionId)
			end
		end, { var6, p1.sessionId, feedItemId })
	}
end