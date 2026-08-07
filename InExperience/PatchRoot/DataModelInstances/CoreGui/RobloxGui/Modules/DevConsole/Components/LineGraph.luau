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

function lineGraph.init(p0) --[[ line: 24 ]]
	-- upvalues: roactModule (ref)
	function p0.onGraphInputChanged(_, p1) --[[ line: 25 ]]
		-- upvalues: p0 (ref)
		if p1.UserInputType == Enum.UserInputType.MouseMovement and not p0.state.holdPos then
			p0:setState({ inputPosition = p1.Position })
		end
	end
	
	function p0.onGraphInputEnded(_, p2) --[[ line: 35 ]]
		-- upvalues: p0 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			if p0.state.holdPos then
				return
			else
				p0:setState({ inputPosition = false })
				
				return
			end
		elseif p2.UserInputType == Enum.UserInputType.MouseButton1 then
			p0:setState({ holdPos = not p0.state.holdPos })
		end
	end
	
	p0.graphRef = roactModule.createRef()
	p0.state = { selectedTimeStamps = {} }
end

function lineGraph.didUpdate(p3) --[[ line: 55 ]]
	if p3.state.absGraphSize ~= p3.graphRef.current.AbsoluteSize then
		p3:setState({
			absGraphSize = p3.graphRef.current.AbsoluteSize,
			absGraphPos = p3.graphRef.current.AbsolutePosition
		})
	end
end

function lineGraph.didMount(p4) --[[ line: 67 ]]
	p4:setState({
		absGraphSize = p4.graphRef.current.AbsoluteSize,
		absGraphPos = p4.graphRef.current.AbsolutePosition
	})
end

function lineGraph.render(p5) --[[ line: 77 ]]
	-- upvalues: innerScaleY (ref), roactModule (ref), lineWidth (ref), innerPaddingY (ref), highlightBlue (ref), pointWidth (ref), pointOffset (ref), lineGraphHoverDisplayModule (ref), textPadding (ref), lineColor (ref), text (ref), padding (ref), scale (ref)
	local size = p5.props.size
	local pos = p5.props.pos
	local graphData = p5.props.graphData
	local getX = p5.props.getX
	local getY = p5.props.getY
	local stringFormatX = p5.props.stringFormatX
	local stringFormatY = p5.props.stringFormatY
	local axisLabelX = p5.props.axisLabelX
	local axisLabelY = p5.props.axisLabelY
	local layoutOrder = p5.props.layoutOrder
	local inputPosition = p5.state.inputPosition
	local absGraphSize = p5.state.absGraphSize
	local absGraphPos = p5.state.absGraphPos
	local var4 = getX(graphData:back())
	local var5 = getX(graphData:front())
	local maxY = p5.props.maxY
	local minY = p5.props.minY
	local var6 = nil
	local t = {}
	
	if absGraphSize then
		local t_1 = {}
		local var9 = graphData:iterator()
		local var10 = var9:next()
		while var10 do
			local var11 = getY(var10)
			local var12 = var4 - var5
			local var13 = maxY - minY
			table.insert(t_1, {
				X = if var12 > 0 then (getX(var10) - var5) / var12 else 0,
				Y = if var13 > 0 then (var11 - minY) / var13 else 1,
				data = var10
			})
			var10 = var9:next()
		end
		for i = 2, #t_1 do
			local var14 = t_1[i].X * absGraphSize.X
			local var15 = t_1[i].Y * absGraphSize.Y * innerScaleY
			local var16 = t_1[i - 1].X * absGraphSize.X
			local var17 = t_1[i - 1].Y * absGraphSize.Y * innerScaleY
			
			if var14 ~= var16 then
				local var18 = (var14 + var16) / 2
				local var19 = (var15 + var17) / 2
				local var20 = var14 - var16
				local var21 = var15 - var17
				local squareRoot = math.sqrt(var20 * var20 + var21 * var21)
				table.insert(t, roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, squareRoot, 0, lineWidth),
					Position = UDim2.new(0, var18 - squareRoot / 2, 1 - innerPaddingY, -var19),
					BackgroundColor3 = highlightBlue,
					Rotation = -math.deg(math.atan2(var21, var20))
				}))
				table.insert(t, roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, pointWidth, 0, pointWidth),
					Position = UDim2.new(0, var14, 1 - innerPaddingY, (-var15) - pointOffset),
					BackgroundColor3 = highlightBlue
				}))
				
				if inputPosition then
					local var23 = inputPosition.X - absGraphPos.X
					
					if var23 < var14 and var16 < var23 then
						local var24 = getX(t_1[i].data)
						local var25 = getX(t_1[i - 1].data)
						local var26 = getY(t_1[i].data)
						local var27 = getY(t_1[i - 1].data)
						local var28 = (var23 - var16) / var20
						var6 = var17 + var21 * var28
						t.HoverDetails = roactModule.createElement(lineGraphHoverDisplayModule, {
							hoverLineX = var23,
							hoverLineY = var6,
							hoverValX = (var24 - var25) * var28 + var25,
							hoverValY = (var26 - var27) * var28 + var27,
							stringFormatX = stringFormatX,
							stringFormatY = stringFormatY
						})
					end
				end
			end
		end
		if #t_1 > 0 then
			local var29 = t_1[#t_1].Y * absGraphSize.Y * innerScaleY
			local var30 = getY(t_1[#t_1].data)
			local var31 = not (var6 and math.abs(var6) < 10 or math.abs(var29) < 10)
			
			if var6 and math.abs(var29 - var6) < 10 then
				t.LatestEntryLine = roactModule.createElement("Frame", {
					BackgroundTransparency = 0.5,
					BorderSizePixel = 0,
					Size = UDim2.new(1, textPadding, 0, lineWidth),
					Position = UDim2.new(0, -textPadding, 1 - innerPaddingY, -var29),
					BackgroundColor3 = lineColor
				})
				t.LatestEntryText = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = stringFormatY and stringFormatY(var30) or var30,
					TextColor3 = text,
					TextXAlignment = Enum.TextXAlignment.Right,
					Position = UDim2.new(0, (-textPadding) - 2, 1 - innerPaddingY, -var29)
				})
			end
			if var31 then
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
	local var32 = 2 * textPadding + 2
	
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
			Text = stringFormatX and stringFormatX(var5) or var5,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(padding, 0, padding + scale, var32)
		}),
		maxX = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = stringFormatX and stringFormatX(var4) or var4,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(padding + scale, 0, padding + scale, var32)
		}),
		axisLabelX = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = axisLabelX,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(0.5, 0, padding + scale, var32)
		}),
		graph = roactModule.createElement("Frame", {
			Position = UDim2.new(padding, 0, padding, 0),
			Size = UDim2.new(scale, 0, scale, 0),
			BackgroundTransparency = 1,
			[roactModule.Ref] = p5.graphRef,
			[roactModule.Event.InputChanged] = p5.onGraphInputChanged,
			[roactModule.Event.InputEnded] = p5.onGraphInputEnded
		}, t)
	})
end

return lineGraph