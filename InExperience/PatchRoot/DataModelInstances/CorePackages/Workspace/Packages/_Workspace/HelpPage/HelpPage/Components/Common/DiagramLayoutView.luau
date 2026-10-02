local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref)
	local layout = p1.layout
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		padding = { top = layout.topPadding },
		onAbsoluteSizeChanged = p1.onSizeChanged,
		testId = p1.testId
	}, {
		LeftColContainer = reactModule.createElement(view, {
			tag = {
				["auto-y"] = layout.columnWidth ~= nil,
				["auto-xy"] = layout.columnWidth == nil
			},
			Size = if layout.columnWidth then UDim2.fromScale(layout.columnWidth, 0) else nil,
			padding = { top = layout.columnTopPadding },
			AnchorPoint = layout.leftAnchor,
			Position = layout.leftPosition,
			scale = layout.columnScale,
			testId = if p1.testId then p1.testId .. "LeftColumn" else nil,
			onAbsoluteSizeChanged = p1.onLeftSizeChanged
		}, { LeftCol = p1.left }),
		ImageComponentContainer = reactModule.createElement(view, {
			tag = "position-top-center anchor-top-center",
			Size = UDim2.fromOffset(layout.diagramSize.X, layout.diagramSize.Y),
			testId = p1.diagramTestId
		}, { ImageComponent = p1.diagram }),
		RightColContainer = reactModule.createElement(view, {
			tag = {
				["auto-y"] = layout.columnWidth ~= nil,
				["auto-xy"] = layout.columnWidth == nil
			},
			Size = if layout.columnWidth then UDim2.fromScale(layout.columnWidth, 0) else nil,
			padding = { top = layout.columnTopPadding },
			AnchorPoint = layout.rightAnchor,
			Position = layout.rightPosition,
			scale = layout.columnScale,
			testId = if p1.testId then p1.testId .. "RightColumn" else nil,
			onAbsoluteSizeChanged = p1.onRightSizeChanged
		}, { RightCol = p1.right })
	})
end)