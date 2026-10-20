local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), View (copy)
	local Layout = p1.layout
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Negated = if Layout.columnWidth == 0.5 then -UseTokensResult.Gap.XXLarge else 0
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		padding = { top = Layout.topPadding, bottom = Layout.bottomPadding },
		onAbsoluteSizeChanged = p1.onSizeChanged,
		testId = p1.testId
	}, {
		LeftColContainer = ReactModule.createElement(View, {
			tag = {
				["auto-y"] = Layout.columnWidth ~= nil,
				["auto-xy"] = Layout.columnWidth == nil
			},
			Size = if Layout.columnWidth then UDim2.new(Layout.columnWidth, Negated, 0, 0) else nil,
			padding = { top = Layout.columnTopPadding },
			AnchorPoint = Layout.leftAnchor,
			Position = Layout.leftPosition,
			scale = Layout.columnScale,
			testId = if p1.testId then p1.testId .. "LeftColumn" else nil,
			onAbsoluteSizeChanged = p1.onLeftSizeChanged
		}, { LeftCol = p1.left }),
		ImageComponentContainer = ReactModule.createElement(View, {
			tag = "anchor-top-center",
			Position = UDim2.new(0.5, 0, 0, Layout.diagramOffsetY or 0),
			Size = UDim2.fromOffset(Layout.diagramSize.X, Layout.diagramSize.Y),
			testId = p1.diagramTestId
		}, {
			ImageComponent = if p1.renderDiagram then p1.renderDiagram(Layout.diagramSize) else p1.diagram
		}),
		RightColContainer = ReactModule.createElement(View, {
			tag = {
				["auto-y"] = Layout.columnWidth ~= nil,
				["auto-xy"] = Layout.columnWidth == nil
			},
			Size = if Layout.columnWidth then UDim2.new(Layout.columnWidth, Negated, 0, 0) else nil,
			padding = { top = Layout.columnTopPadding },
			AnchorPoint = Layout.rightAnchor,
			Position = Layout.rightPosition,
			scale = Layout.columnScale,
			testId = if p1.testId then p1.testId .. "RightColumn" else nil,
			onAbsoluteSizeChanged = p1.onRightSizeChanged
		}, { RightCol = p1.right })
	})
end)