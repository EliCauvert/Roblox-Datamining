local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local HighlightBlue = ConstantsModule.Color.HighlightBlue
local _UDim2 = UDim2.fromOffset(52, 13)
local Sparkline = RoactModule.Component:extend("Sparkline")

function Sparkline.init(p1) --[[ Line: 23 ]]
	-- upvalues: RoactModule (copy)
	p1.graphRef = RoactModule.createRef()
	p1.state = { absSize = nil }
end

function Sparkline.didMount(p1) --[[ Line: 30 ]]
	p1:setState({ absSize = p1.graphRef.current.AbsoluteSize })
end

function Sparkline.didUpdate(p1) --[[ Line: 34 ]]
	local AbsoluteSize = p1.graphRef.current.AbsoluteSize
	
	if p1.state.absSize ~= AbsoluteSize then
		p1:setState({ absSize = AbsoluteSize })
	end
end

function Sparkline.render(p1) --[[ Line: 41 ]]
	-- upvalues: HighlightBlue (copy), RoactModule (copy), LineWidth (copy), _UDim2 (copy)
	local DataSet = p1.props.dataSet
	local GetYFunction = p1.props.getY
	local MinY = p1.props.minY
	local MaxY = p1.props.maxY
	local Color = p1.props.color or HighlightBlue
	local AbsSize = p1.state.absSize
	local Frames = {}
	
	if AbsSize and DataSet then
		local List = {}
		local IteratorResult = DataSet:iterator()
		local Key = IteratorResult:next()
		while Key do
			table.insert(List, GetYFunction(Key))
			Key = IteratorResult:next()
		end
		local MaxYDelta = MaxY - MinY
		local CountList = #List
		
		for i = 2, CountList do
			local ScaledI = (i - 1) / (CountList - 1) * AbsSize.X
			local ScaledI1 = (i - 2) / (CountList - 1) * AbsSize.X
			local ScaledY = (MaxYDelta > 0 and (List[i] - MinY) / MaxYDelta or 0.5) * AbsSize.Y
			local ScaledY1 = (MaxYDelta > 0 and (List[i - 1] - MinY) / MaxYDelta or 0.5) * AbsSize.Y
			local X = ScaledI - ScaledI1
			local Y = ScaledY - ScaledY1
			local SquareRoot = math.sqrt(X * X + Y * Y)
			Frames["seg" .. i] = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, SquareRoot, 0, LineWidth),
				Position = UDim2.new(0, (ScaledI + ScaledI1) / 2 - SquareRoot / 2, 1, -((ScaledY + ScaledY1) / 2)),
				BackgroundColor3 = Color,
				Rotation = -math.deg((math.atan2(Y, X)))
			})
		end
	end
	return RoactModule.createElement("Frame", {
		Size = p1.props.size or _UDim2,
		Position = p1.props.pos,
		LayoutOrder = p1.props.layoutOrder,
		BackgroundTransparency = 1,
		[RoactModule.Ref] = p1.graphRef
	}, Frames)
end

return Sparkline