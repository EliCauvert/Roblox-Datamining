local parent = script:FindFirstAncestor("AuthCommon").Parent
local roactModule = require(parent.Roact)
local argCheckModule = require(parent.ArgCheck)
local graphite = require(parent.Style).Colors.Graphite
local windowedListFrame = roactModule.PureComponent:extend("WindowedListFrame")

function windowedListFrame.init(p1)
	p1.state = { windowStart = 1, windowSize = 5, topPadding = 0 }
	
	function p0.updateWindow(p2)
		-- upvalues: p1 (ref)
		local var1 = p1.props.ButtonSizeY + 1
		local y = p2.AbsoluteSize.Y
		local y_1 = p2.CanvasPosition.Y
		
		if y > 0 then
			local maxValue = math.max(1, math.floor(y_1 / var1) + 1)
			local var2 = math.floor(y / var1) + 2
			
			if maxValue ~= p1.state.windowStart or var2 ~= p1.state.windowSize then
				p1:setState({
					windowStart = maxValue,
					windowSize = var2,
					topPadding = var1 * (maxValue - 1)
				})
			end
		end
	end
end

windowedListFrame.defaultProps = {
	ButtonSizeY = 20,
	ScrollingFrameOffset = 0,
	List = {},
	ListButtonProps = {}
}

function windowedListFrame.render(p1)
	-- upvalues: roactModule (ref), argCheckModule (ref), graphite (ref)
	local listButton = p1.props.ListButton
	local listButtonProps = p1.props.ListButtonProps
	local list = p1.props.List
	local listCount = #list
	local list_1 = {
		roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	argCheckModule.isInTypes(listButton, { "function", "table" }, "ListButton prop in WindowedListFrame")
	
	if listButton then
		local windowStart = p1.state.windowStart
		
		for i = windowStart, math.min(#list, windowStart + p1.state.windowSize) do
			local var1 = i + i
			list_1[var1] = roactModule.createElement(listButton, {
				Size = UDim2.new(1, 0, 0, p1.props.ButtonSizeY),
				LayoutOrder = var1,
				Data = list[i],
				ListButtonProps = listButtonProps
			})
			var1 += 1
			list_1[var1] = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = graphite,
				LayoutOrder = var1
			})
		end
	end
	return roactModule.createElement("ScrollingFrame", {
		Position = UDim2.new(0, 0, 0, p1.props.ScrollingFrameOffset),
		Size = UDim2.new(1, 8, 1, -p1.props.ScrollingFrameOffset),
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = graphite,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, listCount * (p1.props.ButtonSizeY + 1)),
		[roactModule.Change.CanvasPosition] = p1.updateWindow,
		[roactModule.Change.AbsoluteSize] = p1.updateWindow
	}, {
		ListHolder = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -8, 0, 1),
			Position = UDim2.new(0, 0, 0, p1.state.topPadding)
		}, list_1)
	})
end

return windowedListFrame