local Parent = script:FindFirstAncestor("AuthCommon").Parent
local RoactModule = require(Parent.Roact)
local ArgCheckModule = require(Parent.ArgCheck)
local Graphite = require(Parent.Style).Colors.Graphite
local WindowedListFrame = RoactModule.PureComponent:extend("WindowedListFrame")

function WindowedListFrame.init(p1)
	p1.state = { windowStart = 1, windowSize = 5, topPadding = 0 }
	
	function p1.updateWindow(Frame)
		-- upvalues: p1 (copy)
		local NewButtonSizeY = p1.props.ButtonSizeY + 1
		local Y: number = Frame.AbsoluteSize.Y
		local Y1 = Frame.CanvasPosition.Y
		
		if Y > 0 then
			local Largest = math.max(1, math.floor(Y1 / NewButtonSizeY) + 1)
			local NewFloored = math.floor(Y / NewButtonSizeY) + 2
			
			if Largest ~= p1.state.windowStart or NewFloored ~= p1.state.windowSize then
				p1:setState({
					windowStart = Largest,
					windowSize = NewFloored,
					topPadding = NewButtonSizeY * (Largest - 1)
				})
			end
		end
	end
end

WindowedListFrame.defaultProps = {
	ButtonSizeY = 20,
	ScrollingFrameOffset = 0,
	List = {},
	ListButtonProps = {}
}

function WindowedListFrame.render(p1)
	-- upvalues: RoactModule (copy), ArgCheckModule (copy), Graphite (copy)
	local ListButton = p1.props.ListButton
	local ListButtonProps = p1.props.ListButtonProps
	local List = p1.props.List
	local CountList = #List
	local Elements = {
		RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	ArgCheckModule.isInTypes(ListButton, { "function", "table" }, "ListButton prop in WindowedListFrame")
	
	if ListButton then
		local WindowStart = p1.state.windowStart
		
		for i = WindowStart, math.min(#List, WindowStart + p1.state.windowSize) do
			local NewI = i + i
			Elements[NewI] = RoactModule.createElement(ListButton, {
				Size = UDim2.new(1, 0, 0, p1.props.ButtonSizeY),
				LayoutOrder = NewI,
				Data = List[i],
				ListButtonProps = ListButtonProps
			})
			local NewNewI = NewI + 1
			Elements[NewNewI] = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = Graphite,
				LayoutOrder = NewNewI
			})
		end
	end
	return RoactModule.createElement("ScrollingFrame", {
		Position = UDim2.new(0, 0, 0, p1.props.ScrollingFrameOffset),
		Size = UDim2.new(1, 8, 1, -p1.props.ScrollingFrameOffset),
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = Graphite,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, CountList * (p1.props.ButtonSizeY + 1)),
		[RoactModule.Change.CanvasPosition] = p1.updateWindow,
		[RoactModule.Change.AbsoluteSize] = p1.updateWindow
	}, {
		ListHolder = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -8, 0, 1),
			Position = UDim2.new(0, 0, 0, p1.state.topPadding)
		}, Elements)
	})
end

return WindowedListFrame