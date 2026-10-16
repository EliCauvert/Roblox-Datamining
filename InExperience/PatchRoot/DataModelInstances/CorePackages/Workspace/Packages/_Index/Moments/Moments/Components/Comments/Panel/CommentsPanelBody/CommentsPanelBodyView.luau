local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagMomentsCommentsRevealAfterMeasureModule = require(Moments.Flags.FFlagMomentsCommentsRevealAfterMeasure)
local CommentsListContainerModule = require(Moments.Components.Comments.List.CommentsList.CommentsListContainer)
local CommentsPanelStateViewModule = require(script.Parent.Parent.CommentsPanelStateView)
local CommentsReadOnlyNoticeViewModule = require(script.Parent.Parent.CommentsReadOnlyNoticeView)
local _ = require(script.Parent.Parent.getCommentsPanelState)

return function(p1) --[[ Line: 28 | Named "CommentsPanelBodyView" ]]
	-- upvalues: ReactModule (copy), CommentsListContainerModule (copy), FFlagMomentsCommentsRevealAfterMeasureModule (copy), CommentsPanelStateViewModule (copy), FoundationModule (copy), CommentsReadOnlyNoticeViewModule (copy)
	local FeedItemId = p1.feedItemId
	local HasFeedItemId: boolean = p1.contentState == "list" and FeedItemId ~= nil
	local IsLoading = p1.contentState == "loading"
	local ListName = "Content"
	local Element = nil
	
	if HasFeedItemId then
		ListName = `List:{FeedItemId}:{p1.sessionId}`
		Element = ReactModule.createElement(CommentsListContainerModule, {
			feedItemId = FeedItemId,
			sessionId = p1.sessionId,
			isReadOnly = p1.isReadOnly,
			onRevealed = if FFlagMomentsCommentsRevealAfterMeasureModule then p1.onListRevealed else nil
		})
	else
		Element = ReactModule.createElement(CommentsPanelStateViewModule, {
			state = if p1.contentState == "list" then "unavailable" else p1.contentState,
			isReadOnly = p1.isReadOnly,
			onRetry = if p1.canRetryInitial then p1.onRetryInitial else nil
		})
	end
	return ReactModule.createElement(FoundationModule.View, {
		testId = "moments-comments-panel-body",
		tag = {
			["col size-full"] = HasFeedItemId,
			["col size-full-0 auto-y"] = not HasFeedItemId
		},
		sizeConstraint = if HasFeedItemId then nil else {
			MaxSize = nil,
			MinSize = p1.stateMinHeight:map(function(Y): Vector2 --[[ Line: 74 ]]
				return Vector2.new(0, Y)
			end)
		}
	}, {
		Content = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 1,
			testId = "moments-comments-panel-content",
			tag = {
				["size-full"] = HasFeedItemId,
				["size-full-0"] = not HasFeedItemId,
				["auto-y"] = not HasFeedItemId and not IsLoading,
				fill = not HasFeedItemId
			}
		}, {
			[ListName] = Element,
			RevealPlaceholders = if FFlagMomentsCommentsRevealAfterMeasureModule and HasFeedItemId and not p1.isListRevealed then ReactModule.createElement(FoundationModule.View, {
				ZIndex = 2,
				tag = "size-full bg-surface-100",
				testId = "moments-comments-panel-reveal-placeholders"
			}, {
				Placeholders = ReactModule.createElement(CommentsPanelStateViewModule, { state = "loading" })
			}) else nil
		}),
		ReadOnly = if p1.isReadOnly and not HasFeedItemId then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y",
			testId = "moments-comments-panel-read-only"
		}, {
			Notice = ReactModule.createElement(CommentsReadOnlyNoticeViewModule)
		}) else nil
	})
end