local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local highlightBlue = constantsModule.Color.HighlightBlue
local uDim2 = UDim2.fromOffset(52, 13)
local sparkline = roactModule.Component:extend("Sparkline")

function sparkline.init(p1)
	-- upvalues: roactModule (ref)
	p1.graphRef = roactModule.createRef()
	p1.state = { absSize = nil }
end

function sparkline.didMount(p1)
	p1:setState({ absSize = p1.graphRef.current.AbsoluteSize })
end

function sparkline.didUpdate(p1)
	local absoluteSize = p1.graphRef.current.AbsoluteSize
	
	if p1.state.absSize ~= absoluteSize then
		p1:setState({ absSize = absoluteSize })
	end
end

function sparkline.render(p1)
	-- upvalues: highlightBlue (ref), roactModule (ref), lineWidth (ref), uDim2 (ref)
	local dataSet = p1.props.dataSet
	local getY = p1.props.getY
	local minY = p1.props.minY
	local maxY = p1.props.maxY
	local color = p1.props.color or highlightBlue
	local absSize = p1.state.absSize
	local t = {}
	
	if absSize and dataSet then
		local t_1 = {}
		local var1 = dataSet:iterator()
		local var2 = var1:next()
		while var2 do
			table.insert(t_1, getY(var2))
			var2 = var1:next()
		end
		local var3 = maxY - minY
		local t_1Count = #t_1
		
		for i = 2, t_1Count do
			local var4 = if var3 > 0 then (t_1[i] - minY) / var3 else 0.5
			local var5 = if var3 > 0 then (t_1[i - 1] - minY) / var3 else 0.5
			local var6 = (i - 1) / (t_1Count - 1) * absSize.X
			local var7 = (i - 2) / (t_1Count - 1) * absSize.X
			var4 *= absSize.Y
			var5 *= absSize.Y
			local var8 = (var6 + var7) / 2
			local var9 = (var4 + var5) / 2
			local var10 = var6 - var7
			local var11 = var4 - var5
			local squareRoot = math.sqrt(var10 * var10 + var11 * var11)
			t["seg" .. i] = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, squareRoot, 0, lineWidth),
				Position = UDim2.new(0, var8 - squareRoot / 2, 1, -var9),
				BackgroundColor3 = color,
				Rotation = -math.deg(math.atan2(var11, var10))
			})
		end
	end
	return roactModule.createElement("Frame", {
		Size = p1.props.size or uDim2,
		Position = p1.props.pos,
		LayoutOrder = p1.props.layoutOrder,
		BackgroundTransparency = 1,
		[roactModule.Ref] = p1.graphRef
	}, t)
end

return sparkline