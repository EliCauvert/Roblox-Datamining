local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local viewRecyclerModule = require(parent.ViewRecycler)
local commentsListFooterViewModule = require(script.Parent.Parent.CommentsListFooterView)
local commentsListRowContextModule = require(script.Parent.CommentsListRowContext)
local commentRowContainerModule = require(script.Parent.Parent.Rows.CommentRow.CommentRowContainer)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)
local commentsReadOnlyNoticeViewModule = require(moments.Components.Comments.Panel.CommentsReadOnlyNoticeView)
local pendingCommentRowViewModule = require(script.Parent.Parent.Rows.PendingCommentRowView)
local _ = require(moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes)
local useCommentsListRow = commentsListRowContextModule.useCommentsListRow
local t = {
	readiness = viewRecyclerModule.RecyclableViewReadiness.ReadyOnCommit
}
local frozen = table.freeze({
	comment = viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: signalsReactModule (ref), useCommentsListRow (ref), reactModule (ref), foundationModule (ref), commentRowContainerModule (ref)
		local var1 = signalsReactModule.useSignalState(p1.itemSignal)
		local var2 = useCommentsListRow()
		
		return if var1.type == "comment" then reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y padding-x-small" }, {
			Row = reactModule.createElement(commentRowContainerModule, {
				feedItemId = var2.feedItemId,
				commentId = var1.commentId,
				text = var1.text,
				createdAt = var1.createdAt,
				viewerUsername = var2.viewerUsername,
				thumbsUpEmoteId = var2.thumbsUpEmoteId,
				creatorEnabled = var2.creatorEnabled,
				viewerCanWrite = var2.viewerCanWrite,
				scrollingFrameRef = var2.scrollingFrameRef,
				avatarBackgroundStyle = var2.avatarBackgroundStyle,
				onToggleReaction = var2.onToggleReaction,
				onAddReaction = var2.onAddReaction,
				onReportComment = var2.onReportComment,
				onDeleteComment = var2.onDeleteComment,
				isExpanded = var1.isExpanded,
				onToggleExpanded = var2.onToggleCommentExpanded
			})
		}) else nil
	end, t),
	pending = viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: signalsReactModule (ref), useCommentsListRow (ref), reactModule (ref), foundationModule (ref), pendingCommentRowViewModule (ref)
		local var1 = signalsReactModule.useSignalState(p1.itemSignal)
		local var2 = useCommentsListRow()
		
		if var1.type == "pending" then
			local isOutcomeUnknown = var1.status == "OutcomeUnknown"
			
			return reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y padding-x-small" }, {
				Row = reactModule.createElement(pendingCommentRowViewModule, {
					rowKey = var1.key,
					text = var1.text,
					viewerUsername = var2.viewerUsername,
					avatarBackgroundStyle = var2.avatarBackgroundStyle,
					status = var1.status,
					onRetry = if isOutcomeUnknown then var2.onRetryPendingSubmission else nil,
					onEdit = if isOutcomeUnknown then var2.onEditPendingSubmission else nil
				})
			})
		end
		return nil
	end, t),
	loadMore = viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: signalsReactModule (ref), useCommentsListRow (ref), reactModule (ref), foundationModule (ref), commentsListFooterViewModule (ref)
		local var1 = signalsReactModule.useSignalState(p1.itemSignal)
		
		return if var1.type == "loadMore" then reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y padding-x-large" }, {
			Footer = reactModule.createElement(commentsListFooterViewModule, {
				status = var1.status,
				onRetry = useCommentsListRow().onRetryLoadMore
			})
		}) else nil
	end),
	readOnlyNotice = viewRecyclerModule.createRecyclableView(function(_)
		-- upvalues: reactModule (ref), foundationModule (ref), commentsReadOnlyNoticeViewModule (ref)
		return reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y padding-x-large" }, {
			Notice = reactModule.createElement(commentsReadOnlyNoticeViewModule)
		})
	end)
})

local function getItemType(p1, _)
	-- upvalues: frozen (ref)
	local type = frozen[p1.type]
	assert(type ~= nil, `CommentsListItems: unknown item type "{tostring(p3.type)}"`)
	
	return type
end

local function getItemKey(p1, _)
	return p1.key
end

local t_1 = {}
local t_2 = { type = "readOnlyNotice", key = "footer:read-only-notice" }
table.freeze(t_2)

return table.freeze({
	getItemType = getItemType,
	getItemKey = getItemKey,
	loadMore = function(p1)
		-- upvalues: t_1 (ref)
		local var1 = t_1[p1]
		
		if var1 == nil then
			local t = { type = "loadMore", key = "footer:load-more", status = p1 }
			table.freeze(t)
			t_1[p1] = t
			
			return t
		end
		return var1
	end,
	readOnlyNotice = function()
		-- upvalues: t_2 (ref)
		return t_2
	end
})