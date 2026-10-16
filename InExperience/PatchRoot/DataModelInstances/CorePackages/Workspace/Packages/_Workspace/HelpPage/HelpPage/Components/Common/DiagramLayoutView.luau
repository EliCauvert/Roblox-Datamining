local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return ReactModule.memo(function(p1) --[[ Line: 32 | Named "DiagramLayoutView" ]]
	-- upvalues: ReactModule (copy), View (copy)
	local Layout = p1.layout
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		padding = { top = Layout.topPadding },
		onAbsoluteSizeChanged = p1.onSizeChanged,
		testId = p1.testId
	}, {
		LeftColContainer = ReactModule.createElement(View, {
			tag = {
				["auto-y"] = Layout.columnWidth ~= nil,
				["auto-xy"] = Layout.columnWidth == nil
			},
			Size = if Layout.columnWidth then UDim2.fromScale(Layout.columnWidth, 0) else nil,
			padding = { top = Layout.columnTopPadding },
			AnchorPoint = Layout.leftAnchor,
			Position = Layout.leftPosition,
			scale = Layout.columnScale,
			testId = if p1.testId then p1.testId .. "LeftColumn" else nil,
			onAbsoluteSizeChanged = p1.onLeftSizeChanged
		}, { LeftCol = p1.left }),
		ImageComponentContainer = ReactModule.createElement(View, {
			tag = "position-top-center anchor-top-center",
			Size = UDim2.fromOffset(Layout.diagramSize.X, Layout.diagramSize.Y),
			testId = p1.diagramTestId
		}, { ImageComponent = p1.diagram }),
		RightColContainer = ReactModule.createElement(View, {
			tag = {
				["auto-y"] = Layout.columnWidth ~= nil,
				["auto-xy"] = Layout.columnWidth == nil
			},
			Size = if Layout.columnWidth then UDim2.fromScale(Layout.columnWidth, 0) else nil,
			padding = { top = Layout.columnTopPadding },
			AnchorPoint = Layout.rightAnchor,
			Position = Layout.rightPosition,
			scale = Layout.columnScale,
			testId = if p1.testId then p1.testId .. "RightColumn" else nil,
			onAbsoluteSizeChanged = p1.onRightSizeChanged
		}, { RightCol = p1.right })
	})
end)