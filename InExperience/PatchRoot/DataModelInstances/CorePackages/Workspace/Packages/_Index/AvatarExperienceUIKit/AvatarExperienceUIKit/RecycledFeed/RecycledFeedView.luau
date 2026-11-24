local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local RecycledFeedRowContextModule = require(script.Parent.RecycledFeedRowContext)
local _ = require(script.Parent.useRecycledFeedViewModel)

return function(Frame)
	-- upvalues: ReactModule (copy), RecycledFeedRowContextModule (copy), ViewRecyclerModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = Frame.Size or UDim2.fromScale(1, 1),
		LayoutOrder = Frame.LayoutOrder,
		ClipsDescendants = Frame.clipsDescendants
	}, {
		UIPadding = if Frame.horizontalPadding > 0 then ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Frame.horizontalPadding),
			PaddingRight = UDim.new(0, Frame.horizontalPadding)
		}) else nil,
		RowContext = ReactModule.createElement(RecycledFeedRowContextModule.Provider, { value = Frame.rowContext }, {
			List = if Frame.layout then ReactModule.createElement(ViewRecyclerModule.VirtualList, {
				data = Frame.data,
				layout = Frame.layout,
				axis = ViewRecyclerModule.Axis.Y,
				itemType = Frame.itemType,
				overscan = Frame.overscan,
				listRef = Frame.listRef,
				scrollingFrameRef = Frame.scrollingFrameRef,
				scrollingFrameProps = Frame.scrollingFrameProps,
				onScrollOffsetChanged = Frame.onScrollOffsetChanged,
				onVisibleRangeChanged = Frame.onVisibleRangeChanged,
				onEndReached = Frame.onEndReached,
				endReachedThreshold = Frame.endReachedThreshold,
				tag = Frame.tag
			}) else nil
		})
	})
end