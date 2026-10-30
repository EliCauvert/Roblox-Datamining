local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local CommentsListItemsModule = require(script.Parent.CommentsListItems)
local CommentsListRowContextModule = require(script.Parent.CommentsListRowContext)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), CommentsListRowContextModule (copy), ViewRecyclerModule (copy), CommentsListItemsModule (copy)
	local _UDim = UDim.new(0, p1.rowBleed * -2)
	
	return ReactModule.createElement(FoundationModule.View, {
		testId = "moments-comments-list",
		Size = UDim2.fromScale(1, 1),
		padding = { left = _UDim, right = _UDim }
	}, {
		Rows = ReactModule.createElement(CommentsListRowContextModule.CommentsListRowContext.Provider, { value = p1.row }, {
			List = ReactModule.createElement(ViewRecyclerModule.VirtualList, {
				overscan = 2,
				endReachedThreshold = 240,
				autoScrollThreshold = 33,
				data = p1.data,
				layout = p1.layout,
				axis = ViewRecyclerModule.Axis.Y,
				itemType = CommentsListItemsModule.getItemType,
				onEndReached = p1.onEndReached,
				onViewportChanged = p1.onViewportChanged,
				onContentLengthChanged = p1.onContentLengthChanged,
				onVisibleRangeChanged = p1.onVisibleRangeChanged,
				autoScrollOnChange = ViewRecyclerModule.AutoScrollPolicy.WhenAtStart,
				scrollingFrameRef = p1.listScrollingFrameRef,
				listRef = p1.listRef,
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