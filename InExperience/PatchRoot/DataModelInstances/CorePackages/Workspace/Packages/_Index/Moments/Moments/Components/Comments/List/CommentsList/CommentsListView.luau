local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local ultimateListModule = require(parent.UltimateList)
local commentsListFooterViewModule = require(script.Parent.Parent.CommentsListFooterView)
local virtualizedSheetContentModule = require(script.Parent.Parent.VirtualizedSheetContent)
local commentRowContainerModule = require(script.Parent.Parent.Rows.CommentRow.CommentRowContainer)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)
local pendingCommentRowViewModule = require(script.Parent.Parent.Rows.PendingCommentRowView)
local _ = require(moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes)

local function getKey(p1, _)
	return p1.row.key
end

return function(p1)
	-- upvalues: reactModule (ref), ultimateListModule (ref), commentRowContainerModule (ref), pendingCommentRowViewModule (ref), foundationModule (ref), virtualizedSheetContentModule (ref), getKey (ref), commentsListFooterViewModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "col size-full-0 auto-y",
		testId = "moments-comments-list"
	}, {
		Canvas = reactModule.createElement(virtualizedSheetContentModule, {
			LayoutOrder = 1,
			endReachedThreshold = 240,
			overscan = 240,
			dataSource = reactModule.useMemo(function()
				-- upvalues: ultimateListModule (copy), p1 (ref)
				return ultimateListModule.DataSources.array(p1.geometry)
			end, { p1.geometry }),
			dimensions = reactModule.useMemo(function()
				-- upvalues: ultimateListModule (copy)
				return ultimateListModule.Dimensions.getter(function(p2, _)
					return {
						size = UDim2.new(1, 0, 0, p2.height),
						position = UDim2.fromOffset(0, p2.yOffset)
					}
				end)
			end, {}),
			renderer = reactModule.useMemo(function()
				-- upvalues: ultimateListModule (copy), p1 (ref), reactModule (copy), commentRowContainerModule (copy), pendingCommentRowViewModule (copy)
				return ultimateListModule.Renderers.byState(function(p2)
					-- upvalues: p1 (copy), reactModule (copy), commentRowContainerModule (copy), pendingCommentRowViewModule (copy)
					local row = p2.row
					
					local var1 = function(p3)
						-- upvalues: p1 (copy), row (ref)
						p1.onRowHeightChanged(row.key, p3)
					end
					
					local _ = nil
					
					return if row.type == "comment" then reactModule.createElement(commentRowContainerModule, {
						commentId = row.commentId,
						text = row.text,
						createdAt = row.createdAt,
						viewerUsername = p1.viewerUsername,
						feedItemId = p1.feedItemId,
						thumbsUpEmoteId = p1.thumbsUpEmoteId,
						emojis = p1.emojis,
						creatorEnabled = p1.creatorEnabled,
						viewerCanWrite = p1.viewerCanWrite,
						scrollingFrameRef = p1.scrollingFrameRef,
						avatarBackgroundStyle = p1.avatarBackgroundStyle,
						rowLayout = p1.rowLayout,
						onToggleReaction = p1.onToggleReaction,
						onAddReaction = p1.onAddReaction,
						onReportComment = p1.onReportComment,
						onDeleteComment = p1.onDeleteComment,
						onHeightChanged = var1
					}) else reactModule.createElement(pendingCommentRowViewModule, {
						rowKey = row.key,
						text = row.text,
						viewerUsername = p1.viewerUsername,
						avatarBackgroundStyle = p1.avatarBackgroundStyle,
						status = row.status,
						rowLayout = p1.rowLayout,
						onRetry = if row.status == "OutcomeUnknown" then p1.onRetryPendingSubmission else nil,
						onEdit = if row.status == "OutcomeUnknown" then p1.onEditPendingSubmission else nil,
						onHeightChanged = var1
					})
				end)
			end, {
				p1.avatarBackgroundStyle, p1.creatorEnabled, p1.emojis, p1.feedItemId,
				p1.onAddReaction, p1.onDeleteComment, p1.onEditPendingSubmission,
				p1.onReportComment, p1.onRetryPendingSubmission, p1.onRowHeightChanged,
				p1.onToggleReaction, p1.rowLayout, p1.scrollingFrameRef, p1.thumbsUpEmoteId,
				p1.viewerCanWrite, p1.viewerUsername
			}),
			getKey = getKey,
			scrollingFrameRef = p1.scrollingFrameRef,
			paginationStateKey = p1.paginationStateKey,
			onNearEnd = p1.onNearEnd,
			onUnderfilled = p1.onUnderfilled
		}),
		LoadMoreFooter = reactModule.createElement(commentsListFooterViewModule, {
			LayoutOrder = 3,
			status = p1.loadMoreStatus,
			onRetry = p1.onRetryLoadMore
		})
	})
end