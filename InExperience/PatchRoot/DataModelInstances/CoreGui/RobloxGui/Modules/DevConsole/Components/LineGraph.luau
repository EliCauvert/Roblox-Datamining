local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local LineGraphHoverDisplayModule = require(script.Parent.LineGraphHoverDisplay)
local ConstantsModule = require(script.Parent.Parent.Constants)
local Text = ConstantsModule.Color.Text
local HighlightBlue = ConstantsModule.Color.HighlightBlue
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local PointWidth = ConstantsModule.Graph.PointWidth
local PointOffset = ConstantsModule.Graph.PointOffset
local Padding = ConstantsModule.Graph.Padding
local Scale = ConstantsModule.Graph.Scale
local InnerPaddingY = ConstantsModule.Graph.InnerPaddingY
local InnerScaleY = ConstantsModule.Graph.InnerScaleY
local TextPadding = ConstantsModule.Graph.TextPadding
local LineGraph = RoactModule.Component:extend("LineGraph")

function LineGraph.init(p1) --[[ Line: 24 ]]
	-- upvalues: RoactModule (copy)
	function p1:onGraphInputChanged(Input) --[[ Line: 25 ]]
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseMovement and not p1.state.holdPos then
			p1:setState({ inputPosition = Input.Position })
		end
	end
	
	function p1:onGraphInputEnded(Input) --[[ Line: 35 ]]
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			if not p1.state.holdPos then
				p1:setState({ inputPosition = false })
				
				return
			end
		elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
			p1:setState({ holdPos = not p1.state.holdPos })
		end
	end
	
	p1.graphRef = RoactModule.createRef()
	p1.state = { selectedTimeStamps = {} }
end

function LineGraph.didUpdate(p1) --[[ Line: 55 ]]
	if p1.state.absGraphSize ~= p1.graphRef.current.AbsoluteSize then
		p1:setState({
			absGraphSize = p1.graphRef.current.AbsoluteSize,
			absGraphPos = p1.graphRef.current.AbsolutePosition
		})
	end
end

function LineGraph.didMount(p1) --[[ Line: 67 ]]
	p1:setState({
		absGraphSize = p1.graphRef.current.AbsoluteSize,
		absGraphPos = p1.graphRef.current.AbsolutePosition
	})
end

function LineGraph.render(p1) --[[ Line: 77 ]]
	-- upvalues: InnerScaleY (copy), RoactModule (copy), LineWidth (copy), InnerPaddingY (copy), HighlightBlue (copy), PointWidth (copy), PointOffset (copy), LineGraphHoverDisplayModule (copy), TextPadding (copy), LineColor (copy), Text (copy), Padding (copy), Scale (copy)
	local Size = p1.props.size
	local Pos = p1.props.pos
	local GraphData = p1.props.graphData
	local GetXFunction = p1.props.getX
	local GetYFunction = p1.props.getY
	local StringFormatXFunction = p1.props.stringFormatX
	local StringFormatYFunction = p1.props.stringFormatY
	local AxisLabelX = p1.props.axisLabelX
	local AxisLabelY = p1.props.axisLabelY
	local LayoutOrder = p1.props.layoutOrder
	local InputPosition = p1.state.inputPosition
	local AbsGraphSize = p1.state.absGraphSize
	local AbsGraphPos = p1.state.absGraphPos
	local GetXResult = GetXFunction(GraphData:back())
	local GetXResult1 = GetXFunction(GraphData:front())
	local MaxY = p1.props.maxY
	local MinY = p1.props.minY
	local Value: number? = nil
	local Frames = {}
	
	if AbsGraphSize then
		local List = {}
		local IteratorResult = GraphData:iterator()
		local Key = IteratorResult:next()
		while Key do
			local GetYResult = GetYFunction(Key)
			local GetXResult2 = GetXFunction(Key)
			local GetXResultDelta = GetXResult - GetXResult1
			local MaxYDelta = MaxY - MinY
			table.insert(List, {
				X = GetXResultDelta > 0 and (GetXResult2 - GetXResult1) / GetXResultDelta or 0,
				Y = MaxYDelta > 0 and (GetYResult - MinY) / MaxYDelta or 1,
				data = Key
			})
			Key = IteratorResult:next()
		end
		for i = 2, #List do
			local ScaledX = List[i].X * AbsGraphSize.X
			local ScaledY = List[i].Y * AbsGraphSize.Y * InnerScaleY
			local ScaledX1 = List[i - 1].X * AbsGraphSize.X
			local ScaledY1 = List[i - 1].Y * AbsGraphSize.Y * InnerScaleY
			
			if ScaledX ~= ScaledX1 then
				local X = ScaledX - ScaledX1
				local Y = ScaledY - ScaledY1
				local SquareRoot = math.sqrt(X * X + Y * Y)
				table.insert(Frames, RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, SquareRoot, 0, LineWidth),
					Position = UDim2.new(0, (ScaledX + ScaledX1) / 2 - SquareRoot / 2, 1 - InnerPaddingY, -((ScaledY + ScaledY1) / 2)),
					BackgroundColor3 = HighlightBlue,
					Rotation = -math.deg((math.atan2(Y, X)))
				}))
				table.insert(Frames, RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, PointWidth, 0, PointWidth),
					Position = UDim2.new(0, ScaledX, 1 - InnerPaddingY, -ScaledY - PointOffset),
					BackgroundColor3 = HighlightBlue
				}))
				
				if InputPosition then
					local XDelta = InputPosition.X - AbsGraphPos.X
					
					if XDelta < ScaledX and ScaledX1 < XDelta then
						local GetXResult3 = GetXFunction(List[i].data)
						local GetXResult31 = GetXFunction(List[i - 1].data)
						local GetYResult = GetYFunction(List[i].data)
						local GetYResult1 = GetYFunction(List[i - 1].data)
						local XDeltaRatio = (XDelta - ScaledX1) / X
						Value = ScaledY1 + Y * XDeltaRatio
						Frames.HoverDetails = RoactModule.createElement(LineGraphHoverDisplayModule, {
							hoverLineX = XDelta,
							hoverLineY = Value,
							hoverValX = (GetXResult3 - GetXResult31) * XDeltaRatio + GetXResult31,
							hoverValY = (GetYResult - GetYResult1) * XDeltaRatio + GetYResult1,
							stringFormatX = StringFormatXFunction,
							stringFormatY = StringFormatYFunction
						})
					end
				end
			end
		end
		if #List > 0 then
			local ScaledY = List[#List].Y * AbsGraphSize.Y * InnerScaleY
			local GetYResult = GetYFunction(List[#List].data)
			local Inverted = not (Value and math.abs(Value) < 10 or math.abs(ScaledY) < 10)
			
			if not (Value and math.abs(ScaledY - Value) < 10) then
				Frames.LatestEntryLine = RoactModule.createElement("Frame", {
					BackgroundTransparency = 0.5,
					BorderSizePixel = 0,
					Size = UDim2.new(1, TextPadding, 0, LineWidth),
					Position = UDim2.new(0, -TextPadding, 1 - InnerPaddingY, -ScaledY),
					BackgroundColor3 = LineColor
				})
				Frames.LatestEntryText = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = StringFormatYFunction and StringFormatYFunction(GetYResult) or GetYResult,
					TextColor3 = Text,
					TextXAlignment = Enum.TextXAlignment.Right,
					Position = UDim2.new(0, -TextPadding - 2, 1 - InnerPaddingY, -ScaledY)
				})
			end
			if Inverted then
				Frames.AxisTextY0 = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = StringFormatYFunction and StringFormatYFunction(MinY) or MinY,
					TextColor3 = Text,
					TextXAlignment = Enum.TextXAlignment.Right,
					Position = UDim2.new(0, -TextPadding - 2, 1 - InnerPaddingY, 0)
				})
			end
			Frames.AxisX = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = LineColor
			})
			Frames.AxisY = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, LineWidth, 1, 0),
				BackgroundColor3 = LineColor
			})
		end
	end
	local NewTextPadding = 2 * TextPadding + 2
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		Position = Pos,
		LayoutOrder = LayoutOrder
	}, {
		name = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = AxisLabelY,
			TextColor3 = Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Position = UDim2.new(Padding, 0, Padding, -TextPadding)
		}),
		minX = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = StringFormatXFunction and StringFormatXFunction(GetXResult1) or GetXResult1,
			TextColor3 = Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(Padding, 0, Padding + Scale, NewTextPadding)
		}),
		maxX = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = StringFormatXFunction and StringFormatXFunction(GetXResult) or GetXResult,
			TextColor3 = Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(Padding + Scale, 0, Padding + Scale, NewTextPadding)
		}),
		axisLabelX = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = AxisLabelX,
			TextColor3 = Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(0.5, 0, Padding + Scale, NewTextPadding)
		}),
		graph = RoactModule.createElement("Frame", {
			Position = UDim2.new(Padding, 0, Padding, 0),
			Size = UDim2.new(Scale, 0, Scale, 0),
			BackgroundTransparency = 1,
			[RoactModule.Ref] = p1.graphRef,
			[RoactModule.Event.InputChanged] = p1.onGraphInputChanged,
			[RoactModule.Event.InputEnded] = p1.onGraphInputEnded
		}, Frames)
	})
end

return LineGraph