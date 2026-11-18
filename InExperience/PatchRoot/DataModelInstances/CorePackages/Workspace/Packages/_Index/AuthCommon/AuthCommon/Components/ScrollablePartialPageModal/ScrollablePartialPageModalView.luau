local Parent = script:FindFirstAncestor("AuthCommon").Parent
local ReactModule = require(Parent.React)
local SCROLLGAP = require(script.Parent.getMaxMiddleHeight).SCROLL_GAP
local PartialPageModal = require(Parent.UIBlox).App.Dialog.Modal.PartialPageModal

return function(p1)
	-- upvalues: ReactModule (copy), PartialPageModal (copy), SCROLLGAP (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Tag] = "data-testid=ScrollablePartialPageModalView",
		[ReactModule.Change.AbsoluteSize] = p1.onHostSizeChanged
	}, {
		Modal = ReactModule.createElement(PartialPageModal, p1.modalProps, {
			ScrollingMiddle = ReactModule.createElement("ScrollingFrame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, p1.visibleHeight or 0),
				AutomaticSize = if p1.visibleHeight == nil then Enum.AutomaticSize.Y else Enum.AutomaticSize.None,
				CanvasSize = UDim2.new(0, 0, 0, p1.contentHeight or 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollBarThickness = p1.scrollBarThickness,
				ScrollBarImageColor3 = p1.scrollBarColor,
				ScrollBarImageTransparency = p1.scrollBarTransparency,
				ref = p1.scrollingFrameRef
			}, {
				Content = ReactModule.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ref = p1.contentRef,
					[ReactModule.Change.AbsoluteSize] = p1.onContentSizeChanged
				}, p1.children)
			}),
			ScrollGap = if p1.isCapped then ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, SCROLLGAP)
			}) else nil
		})
	})
end