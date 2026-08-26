local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local lineGraphHoverDisplayModule = require(script.Parent.LineGraphHoverDisplay)
local constantsModule = require(script.Parent.Parent.Constants)
local text = constantsModule.Color.Text
local highlightBlue = constantsModule.Color.HighlightBlue
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local pointWidth = constantsModule.Graph.PointWidth
local pointOffset = constantsModule.Graph.PointOffset
local padding = constantsModule.Graph.Padding
local scale = constantsModule.Graph.Scale
local innerPaddingY = constantsModule.Graph.InnerPaddingY
local innerScaleY = constantsModule.Graph.InnerScaleY
local textPadding = constantsModule.Graph.TextPadding
local lineGraph = roactModule.Component:extend("LineGraph")

function lineGraph.init(p1)
	-- upvalues: roactModule (ref)
	function p0.onGraphInputChanged(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseMovement and not p1.state.holdPos then
			p1:setState({ inputPosition = p2.Position })
		end
	end
	
	function p0.onGraphInputEnded(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			if p1.state.holdPos then
				return
			else
				p1:setState({ inputPosition = false })
				
				return
			end
		elseif p2.UserInputType == Enum.UserInputType.MouseButton1 then
			p1:setState({ holdPos = not p1.state.holdPos })
		end
	end
	
	p1.graphRef = roactModule.createRef()
	p1.state = { selectedTimeStamps = {} }
end

function lineGraph.didUpdate(p1)
	if p1.state.absGraphSize ~= p1.graphRef.current.AbsoluteSize then
		p1:setState({
			absGraphSize = p1.graphRef.current.AbsoluteSize,
			absGraphPos = p1.graphRef.current.AbsolutePosition
		})
	end
end

function lineGraph.didMount(p1)
	p1:setState({
		absGraphSize = p1.graphRef.current.AbsoluteSize,
		absGraphPos = p1.graphRef.current.AbsolutePosition
	})
end

function lineGraph.render(p1)
	-- upvalues: innerScaleY (ref), roactModule (ref), lineWidth (ref), innerPaddingY (ref), highlightBlue (ref), pointWidth (ref), pointOffset (ref), lineGraphHoverDisplayModule (ref), textPadding (ref), lineColor (ref), text (ref), padding (ref), scale (ref)
	local size = p1.props.size
	local pos = p1.props.pos
	local graphData = p1.props.graphData
	local getX = p1.props.getX
	local getY = p1.props.getY
	local stringFormatX = p1.props.stringFormatX
	local stringFormatY = p1.props.stringFormatY
	local axisLabelX = p1.props.axisLabelX
	local axisLabelY = p1.props.axisLabelY
	local layoutOrder = p1.props.layoutOrder
	local inputPosition = p1.state.inputPosition
	local absGraphSize = p1.state.absGraphSize
	local absGraphPos = p1.state.absGraphPos
	local var1 = getX(graphData:back())
	local var2 = getX(graphData:front())
	local maxY = p1.props.maxY
	local minY = p1.props.minY
	local var3 = nil
	local t = {}
	
	if absGraphSize then
		local t_1 = {}
		local var4 = graphData:iterator()
		local var5 = var4:next()
		while var5 do
			local var6 = getY(var5)
			local var7 = var1 - var2
			local var8 = maxY - minY
			table.insert(t_1, {
				X = if var7 > 0 then (getX(var5) - var2) / var7 else 0,
				Y = if var8 > 0 then (var6 - minY) / var8 else 1,
				data = var5
			})
			var5 = var4:next()
		end
		for i = 2, #t_1 do
			local var9 = t_1[i].X * absGraphSize.X
			local var10 = t_1[i].Y * absGraphSize.Y * innerScaleY
			local var11 = t_1[i - 1].X * absGraphSize.X
			local var12 = t_1[i - 1].Y * absGraphSize.Y * innerScaleY
			
			if var9 ~= var11 then
				local var13 = (var9 + var11) / 2
				local var14 = (var10 + var12) / 2
				local var15 = var9 - var11
				local var16 = var10 - var12
				local squareRoot = math.sqrt(var15 * var15 + var16 * var16)
				table.insert(t, roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, squareRoot, 0, lineWidth),
					Position = UDim2.new(0, var13 - squareRoot / 2, 1 - innerPaddingY, -var14),
					BackgroundColor3 = highlightBlue,
					Rotation = -math.deg(math.atan2(var16, var15))
				}))
				table.insert(t, roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, pointWidth, 0, pointWidth),
					Position = UDim2.new(0, var9, 1 - innerPaddingY, (-var10) - pointOffset),
					BackgroundColor3 = highlightBlue
				}))
				
				if inputPosition then
					local var17 = inputPosition.X - absGraphPos.X
					
					if var17 < var9 and var11 < var17 then
						local var18 = getX(t_1[i].data)
						local var19 = getX(t_1[i - 1].data)
						local var20 = getY(t_1[i].data)
						local var21 = getY(t_1[i - 1].data)
						local var22 = (var17 - var11) / var15
						var3 = var12 + var16 * var22
						t.HoverDetails = roactModule.createElement(lineGraphHoverDisplayModule, {
							hoverLineX = var17,
							hoverLineY = var3,
							hoverValX = (var18 - var19) * var22 + var19,
							hoverValY = (var20 - var21) * var22 + var21,
							stringFormatX = stringFormatX,
							stringFormatY = stringFormatY
						})
					end
				end
			end
		end
		if #t_1 > 0 then
			local var23 = t_1[#t_1].Y * absGraphSize.Y * innerScaleY
			local var24 = getY(t_1[#t_1].data)
			local var25 = not (var3 and math.abs(var3) < 10 or math.abs(var23) < 10)
			
			if var3 and math.abs(var23 - var3) < 10 then
				t.LatestEntryLine = roactModule.createElement("Frame", {
					BackgroundTransparency = 0.5,
					BorderSizePixel = 0,
					Size = UDim2.new(1, textPadding, 0, lineWidth),
					Position = UDim2.new(0, -textPadding, 1 - innerPaddingY, -var23),
					BackgroundColor3 = lineColor
				})
				t.LatestEntryText = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = stringFormatY and stringFormatY(var24) or var24,
					TextColor3 = text,
					TextXAlignment = Enum.TextXAlignment.Right,
					Position = UDim2.new(0, (-textPadding) - 2, 1 - innerPaddingY, -var23)
				})
			end
			if var25 then
				t.AxisTextY0 = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = stringFormatY and stringFormatY(minY) or minY,
					TextColor3 = text,
					TextXAlignment = Enum.TextXAlignment.Right,
					Position = UDim2.new(0, (-textPadding) - 2, 1 - innerPaddingY, 0)
				})
			end
			t.AxisX = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, lineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = lineColor
			})
			t.AxisY = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, lineWidth, 1, 0),
				BackgroundColor3 = lineColor
			})
		end
	end
	local var26 = 2 * textPadding + 2
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		Position = pos,
		LayoutOrder = layoutOrder
	}, {
		name = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = axisLabelY,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Position = UDim2.new(padding, 0, padding, -textPadding)
		}),
		minX = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = stringFormatX and stringFormatX(var2) or var2,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(padding, 0, padding + scale, var26)
		}),
		maxX = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = stringFormatX and stringFormatX(var1) or var1,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(padding + scale, 0, padding + scale, var26)
		}),
		axisLabelX = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = axisLabelX,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(0.5, 0, padding + scale, var26)
		}),
		graph = roactModule.createElement("Frame", {
			Position = UDim2.new(padding, 0, padding, 0),
			Size = UDim2.new(scale, 0, scale, 0),
			BackgroundTransparency = 1,
			[roactModule.Ref] = p1.graphRef,
			[roactModule.Event.InputChanged] = p1.onGraphInputChanged,
			[roactModule.Event.InputEnded] = p1.onGraphInputEnded
		}, t)
	})
end

return lineGraph