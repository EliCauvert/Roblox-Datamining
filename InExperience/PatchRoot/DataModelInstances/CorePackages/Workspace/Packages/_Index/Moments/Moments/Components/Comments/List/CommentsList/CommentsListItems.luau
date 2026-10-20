local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local CommentsListFooterViewModule = require(script.Parent.Parent.CommentsListFooterView)
local CommentRowContainerModule = require(script.Parent.Parent.Rows.CommentRow.CommentRowContainer)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)
local CommentsReadOnlyNoticeViewModule = require(Moments.Components.Comments.Panel.CommentsReadOnlyNoticeView)
local PendingCommentRowViewModule = require(script.Parent.Parent.Rows.PendingCommentRowView)
local _ = require(Moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes)
local UseCommentsListRowFunction = require(script.Parent.CommentsListRowContext).useCommentsListRow
local config = {
	readiness = ViewRecyclerModule.RecyclableViewReadiness.ReadyOnCommit
}
local Frozen = table.freeze({
	comment = ViewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), UseCommentsListRowFunction (copy), ReactModule (copy), FoundationModule (copy), CommentRowContainerModule (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
		local UseCommentsListRowResult = UseCommentsListRowFunction()
		
		return if UseSignalStateResult.type == "comment" then ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y padding-x-small" }, {
			Row = ReactModule.createElement(CommentRowContainerModule, {
				feedItemId = UseCommentsListRowResult.feedItemId,
				commentId = UseSignalStateResult.commentId,
				text = UseSignalStateResult.text,
				createdAt = UseSignalStateResult.createdAt,
				viewerUsername = UseCommentsListRowResult.viewerUsername,
				thumbsUpEmoteId = UseCommentsListRowResult.thumbsUpEmoteId,
				creatorEnabled = UseCommentsListRowResult.creatorEnabled,
				viewerCanWrite = UseCommentsListRowResult.viewerCanWrite,
				scrollingFrameRef = UseCommentsListRowResult.scrollingFrameRef,
				avatarBackgroundStyle = UseCommentsListRowResult.avatarBackgroundStyle,
				onToggleReaction = UseCommentsListRowResult.onToggleReaction,
				onAddReaction = UseCommentsListRowResult.onAddReaction,
				onReportComment = UseCommentsListRowResult.onReportComment,
				onBlockCommentAuthor = UseCommentsListRowResult.onBlockCommentAuthor,
				onDeleteComment = UseCommentsListRowResult.onDeleteComment,
				isExpanded = UseSignalStateResult.isExpanded,
				onToggleExpanded = UseCommentsListRowResult.onToggleCommentExpanded
			})
		}) else nil
	end, config),
	pending = ViewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), UseCommentsListRowFunction (copy), ReactModule (copy), FoundationModule (copy), PendingCommentRowViewModule (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
		local UseCommentsListRowResult = UseCommentsListRowFunction()
		
		if UseSignalStateResult.type == "pending" then
			local IsOutcomeUnknown = UseSignalStateResult.status == "OutcomeUnknown"
			
			return ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y padding-x-small" }, {
				Row = ReactModule.createElement(PendingCommentRowViewModule, {
					rowKey = UseSignalStateResult.key,
					text = UseSignalStateResult.text,
					viewerUsername = UseCommentsListRowResult.viewerUsername,
					avatarBackgroundStyle = UseCommentsListRowResult.avatarBackgroundStyle,
					status = UseSignalStateResult.status,
					onRetry = if IsOutcomeUnknown then UseCommentsListRowResult.onRetryPendingSubmission else nil,
					onEdit = if IsOutcomeUnknown then UseCommentsListRowResult.onEditPendingSubmission else nil
				})
			})
		else
			return nil
		end
	end, config),
	loadMore = ViewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), UseCommentsListRowFunction (copy), ReactModule (copy), FoundationModule (copy), CommentsListFooterViewModule (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
		local UseCommentsListRowResult = UseCommentsListRowFunction()
		
		return if UseSignalStateResult.type == "loadMore" then ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y padding-x-large" }, {
			Footer = ReactModule.createElement(CommentsListFooterViewModule, {
				status = UseSignalStateResult.status,
				onRetry = UseCommentsListRowResult.onRetryLoadMore
			})
		}) else nil
	end),
	readOnlyNotice = ViewRecyclerModule.createRecyclableView(function(_)
		-- upvalues: ReactModule (copy), FoundationModule (copy), CommentsReadOnlyNoticeViewModule (copy)
		return ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y padding-x-large" }, {
			Notice = ReactModule.createElement(CommentsReadOnlyNoticeViewModule)
		})
	end)
})

local function getItemType(p1, _)
	-- upvalues: Frozen (copy)
	local FrozenEntry = Frozen[p1.type]
	assert(FrozenEntry ~= nil, `CommentsListItems: unknown item type "{tostring(p4.type)}"`)
	
	return FrozenEntry
end

local function getItemKey(p1, _)
	return p1.key
end

local t = {}
local config1 = { type = "readOnlyNotice", key = "footer:read-only-notice" }
table.freeze(config1)

return table.freeze({
	getItemType = getItemType,
	getItemKey = getItemKey,
	loadMore = function(Status)
		-- upvalues: t (copy)
		local Entry = t[Status]
		
		if Entry == nil then
			local config = {
				type = "loadMore",
				key = "footer:load-more",
				status = Status
			}
			table.freeze(config)
			t[Status] = config
			
			return config
		else
			return Entry
		end
	end,
	readOnlyNotice = function()
		-- upvalues: config1 (copy)
		return config1
	end
})