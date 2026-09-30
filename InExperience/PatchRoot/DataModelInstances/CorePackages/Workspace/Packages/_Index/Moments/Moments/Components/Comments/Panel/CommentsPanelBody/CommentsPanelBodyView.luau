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
	local var1
	local feedItemId = p1.feedItemId
	local var2 = p1.contentState == "list" and feedItemId ~= nil
	local isLoading = p1.contentState == "loading"
	local var3 = "Content"
	local _ = nil
	
	if var2 then
		var3 = `List:{feedItemId}:{p1.sessionId}`
		var1 = reactModule.createElement(commentsListContainerModule, {
			feedItemId = feedItemId,
			sessionId = p1.sessionId,
			isReadOnly = p1.isReadOnly
		})
	else
		var1 = reactModule.createElement(commentsPanelStateViewModule, {
			state = if p1.contentState == "list" then "unavailable" else p1.contentState,
			isReadOnly = p1.isReadOnly,
			onRetry = if p1.canRetryInitial then p1.onRetryInitial else nil
		})
	end
	return reactModule.createElement(foundationModule.View, {
		testId = "moments-comments-panel-body",
		tag = {
			["col size-full"] = var2,
			["col size-full-0 auto-y"] = not var2
		},
		sizeConstraint = if var2 then nil else {
			MaxSize = nil,
			MinSize = p1.stateMinHeight:map(function(p2)
				return Vector2.new(0, p2)
			end)
		}
	}, {
		Content = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			testId = "moments-comments-panel-content",
			tag = {
				["size-full"] = var2,
				["size-full-0"] = not var2,
				["auto-y"] = not var2 and not isLoading,
				fill = not var2
			}
		}, { [var3] = var1 }),
		ReadOnly = if p1.isReadOnly and not var2 then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y",
			testId = "moments-comments-panel-read-only"
		}, {
			Notice = reactModule.createElement(commentsReadOnlyNoticeViewModule)
		}) else nil
	})
end