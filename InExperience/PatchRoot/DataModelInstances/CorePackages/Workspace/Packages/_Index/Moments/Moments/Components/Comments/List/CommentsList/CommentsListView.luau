local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local viewRecyclerModule = require(parent.ViewRecycler)
local commentsListItemsModule = require(script.Parent.CommentsListItems)
local commentsListRowContextModule = require(script.Parent.CommentsListRowContext)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), commentsListRowContextModule (ref), viewRecyclerModule (ref), commentsListItemsModule (ref)
	local uDim = UDim.new(0, p1.rowBleed * -2)
	
	return reactModule.createElement(foundationModule.View, {
		testId = "moments-comments-list",
		Size = UDim2.fromScale(1, 1),
		padding = { left = uDim, right = uDim }
	}, {
		Rows = reactModule.createElement(commentsListRowContextModule.CommentsListRowContext.Provider, { value = p1.row }, {
			List = reactModule.createElement(viewRecyclerModule.VirtualList, {
				overscan = 2,
				endReachedThreshold = 240,
				data = p1.data,
				layout = p1.layout,
				axis = viewRecyclerModule.Axis.Y,
				itemType = commentsListItemsModule.getItemType,
				onEndReached = p1.onEndReached,
				onViewportChanged = p1.onViewportChanged,
				onContentLengthChanged = p1.onContentLengthChanged,
				autoScrollOnChange = p1.autoScrollOnChange,
				scrollingFrameRef = p1.listScrollingFrameRef,
				scrollingFrameProps = {
					Name = "MomentsCommentsListScrollingFrame",
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ScrollBarThickness = 0,
					Selectable = false,
					ScrollingEnabled = p1.isScrollingEnabled
				}
			})
		})
	})
end