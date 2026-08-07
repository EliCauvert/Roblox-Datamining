local parent = script:FindFirstAncestor("AuthCommon").Parent
local roactModule = require(parent.Roact)
local argCheckModule = require(parent.ArgCheck)
local graphite = require(parent.Style).Colors.Graphite
local windowedListFrame = roactModule.PureComponent:extend("WindowedListFrame")

function windowedListFrame.init(p0) --[[ line: 17 ]]
	p0.state = { windowStart = 1, windowSize = 5, topPadding = 0 }
	
	function p0.updateWindow(p1) --[[ line: 24 ]]
		-- upvalues: p0 (ref)
		local var3 = p0.props.ButtonSizeY + 1
		local y = p1.AbsoluteSize.Y
		local y_1 = p1.CanvasPosition.Y
		
		if y > 0 then
			local maxValue = math.max(1, math.floor(y_1 / var3) + 1)
			local var5 = math.floor(y / var3) + 2
			
			if maxValue ~= p0.state.windowStart or var5 ~= p0.state.windowSize then
				p0:setState({
					windowStart = maxValue,
					windowSize = var5,
					topPadding = var3 * (maxValue - 1)
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

function windowedListFrame.render(p2) --[[ line: 52 ]]
	-- upvalues: roactModule (ref), argCheckModule (ref), graphite (ref)
	local listButton = p2.props.ListButton
	local listButtonProps = p2.props.ListButtonProps
	local list = p2.props.List
	local listCount = #list
	local list_1 = {
		roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	argCheckModule.isInTypes(listButton, { "function", "table" }, "ListButton prop in WindowedListFrame")
	
	if listButton then
		local windowStart = p2.state.windowStart
		
		for i = windowStart, math.min(#list, windowStart + p2.state.windowSize) do
			local var8 = i + i
			list_1[var8] = roactModule.createElement(listButton, {
				Size = UDim2.new(1, 0, 0, p2.props.ButtonSizeY),
				LayoutOrder = var8,
				Data = list[i],
				ListButtonProps = listButtonProps
			})
			var8 += 1
			list_1[var8] = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = graphite,
				LayoutOrder = var8
			})
		end
	end
	return roactModule.createElement("ScrollingFrame", {
		Position = UDim2.new(0, 0, 0, p2.props.ScrollingFrameOffset),
		Size = UDim2.new(1, 8, 1, -p2.props.ScrollingFrameOffset),
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = graphite,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, listCount * (p2.props.ButtonSizeY + 1)),
		[roactModule.Change.CanvasPosition] = p2.updateWindow,
		[roactModule.Change.AbsoluteSize] = p2.updateWindow
	}, {
		ListHolder = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -8, 0, 1),
			Position = UDim2.new(0, 0, 0, p2.state.topPadding)
		}, list_1)
	})
end

return windowedListFrame