local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local commentsListContainerModule = require(moments.Components.Comments.List.CommentsList.CommentsListContainer)
local commentsPanelStateViewModule = require(script.Parent.Parent.CommentsPanelStateView)
local commentsReadOnlyNoticeViewModule = require(script.Parent.Parent.CommentsReadOnlyNoticeView)
local _ = require(script.Parent.Parent.getCommentsPanelState)

return function(p1)
	-- upvalues: reactModule (ref), commentsListContainerModule (ref), commentsPanelStateViewModule (ref), foundationModule (ref), commentsReadOnlyNoticeViewModule (ref)
	local _ = nil
	
	return reactModule.createElement(foundationModule.View, {
		tag = "col size-full-0 auto-y",
		testId = "moments-comments-panel-body"
	}, {
		Content = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y",
			testId = "moments-comments-panel-content"
		}, {
			Content = if p1.contentState == "list" and p1.feedItemId ~= nil then reactModule.createElement(commentsListContainerModule, {
				feedItemId = p1.feedItemId,
				sessionId = p1.sessionId,
				scrollingFrameRef = p1.scrollingFrameRef
			}) else reactModule.createElement(commentsPanelStateViewModule, {
				state = if p1.contentState == "list" then "unavailable" else p1.contentState,
				onRetry = if p1.canRetryInitial then p1.onRetryInitial else nil
			})
		}),
		ReadOnly = if p1.isReadOnly then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y",
			testId = "moments-comments-panel-read-only"
		}, {
			Notice = reactModule.createElement(commentsReadOnlyNoticeViewModule)
		}) else nil
	})
end