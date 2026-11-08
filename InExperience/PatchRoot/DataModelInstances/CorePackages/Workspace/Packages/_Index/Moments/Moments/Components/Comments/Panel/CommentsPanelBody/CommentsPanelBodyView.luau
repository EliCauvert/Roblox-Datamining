local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagMomentsCommentsRevealAfterMeasureModule = require(Moments.Flags.FFlagMomentsCommentsRevealAfterMeasure)
local FFlagMomentsCommentsAttachSheetScrollerModule = require(Moments.Flags.FFlagMomentsCommentsAttachSheetScroller)
local CommentsListContainerModule = require(Moments.Components.Comments.List.CommentsList.CommentsListContainer)
local CommentsPanelStateViewModule = require(script.Parent.Parent.CommentsPanelStateView)
local CommentsReadOnlyNoticeViewModule = require(script.Parent.Parent.CommentsReadOnlyNoticeView)
local _ = require(script.Parent.Parent.getCommentsPanelState)
local ScrollingFrameCoverModule = require(script.Parent.ScrollingFrameCover)

return function(p1)
	-- upvalues: FFlagMomentsCommentsAttachSheetScrollerModule (copy), ReactModule (copy), CommentsListContainerModule (copy), FFlagMomentsCommentsRevealAfterMeasureModule (copy), CommentsPanelStateViewModule (copy), ScrollingFrameCoverModule (copy), FoundationModule (copy), CommentsReadOnlyNoticeViewModule (copy)
	local FeedItemId = p1.feedItemId
	local HasFeedItemId: boolean = p1.contentState == "list" and FeedItemId ~= nil
	local IsLoading = p1.contentState == "loading"
	local HasFeedItemId1: boolean = FFlagMomentsCommentsAttachSheetScrollerModule and HasFeedItemId
	local NoHasFeedItemId1: boolean = HasFeedItemId and not HasFeedItemId1
	local ListName = "Content"
	local Element = nil
	
	if HasFeedItemId then
		ListName = `List:{FeedItemId}:{p1.sessionId}`
		Element = if HasFeedItemId1 and p1.scrollingFrame == nil then nil else ReactModule.createElement(CommentsListContainerModule, {
			feedItemId = FeedItemId,
			sessionId = p1.sessionId,
			isReadOnly = p1.isReadOnly,
			scrollingFrame = if FFlagMomentsCommentsAttachSheetScrollerModule then p1.scrollingFrame else nil,
			onRevealed = if FFlagMomentsCommentsRevealAfterMeasureModule then p1.onListRevealed else nil
		})
	else
		Element = ReactModule.createElement(CommentsPanelStateViewModule, {
			state = if p1.contentState == "list" then "unavailable" else p1.contentState,
			isReadOnly = p1.isReadOnly,
			onRetry = if p1.canRetryInitial then p1.onRetryInitial else nil
		})
	end
	local Element1 = nil
	
	if FFlagMomentsCommentsRevealAfterMeasureModule and HasFeedItemId1 and not p1.isListRevealed then
		if p1.scrollingFrame ~= nil then
			Element1 = ReactModule.createElement(ScrollingFrameCoverModule, {
				testId = "moments-comments-panel-reveal-placeholders",
				scrollingFrame = p1.scrollingFrame,
				Visible = p1.revealPlaceholdersVisible
			}, {
				Inset = ReactModule.createElement(FoundationModule.View, { tag = "size-full padding-x-xlarge" }, {
					Placeholders = ReactModule.createElement(CommentsPanelStateViewModule, { state = "loading" })
				})
			})
		end
	elseif FFlagMomentsCommentsRevealAfterMeasureModule and HasFeedItemId and not p1.isListRevealed then
		Element1 = ReactModule.createElement(FoundationModule.View, {
			ZIndex = 2,
			tag = "size-full bg-surface-100",
			testId = "moments-comments-panel-reveal-placeholders"
		}, {
			Placeholders = ReactModule.createElement(CommentsPanelStateViewModule, { state = "loading" })
		})
	end
	return ReactModule.createElement(FoundationModule.View, {
		testId = "moments-comments-panel-body",
		tag = {
			["col size-full"] = NoHasFeedItemId1,
			["col size-full-0 auto-y"] = not NoHasFeedItemId1
		},
		sizeConstraint = if HasFeedItemId then nil else {
			MaxSize = nil,
			MinSize = p1.stateMinHeight:map(function(Y): Vector2
				return Vector2.new(0, Y)
			end)
		}
	}, {
		Content = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 1,
			testId = "moments-comments-panel-content",
			tag = {
				["size-full"] = NoHasFeedItemId1,
				["size-full-0"] = not NoHasFeedItemId1,
				["auto-y"] = not NoHasFeedItemId1 and not IsLoading,
				fill = not HasFeedItemId
			}
		}, { [ListName] = Element, RevealPlaceholders = Element1 }),
		ReadOnly = if p1.isReadOnly and not HasFeedItemId then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y",
			testId = "moments-comments-panel-read-only"
		}, {
			Notice = ReactModule.createElement(CommentsReadOnlyNoticeViewModule)
		}) else nil
	})
end