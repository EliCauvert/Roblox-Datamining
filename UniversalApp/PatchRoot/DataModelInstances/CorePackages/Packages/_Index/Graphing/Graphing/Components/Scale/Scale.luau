local graphing = script:FindFirstAncestor("Graphing")
local parent = graphing.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local canvasContextModule = require(graphing.CanvasContext)
local typesModule = require(graphing.Types)
local scaleTickModule = require(graphing.Components.ScaleTick)
local gridUtilModule = require(graphing.Util.GridUtil)
local styleUtilModule = require(graphing.Util.StyleUtil)

local function _(p1)
	-- upvalues: typesModule (ref)
	return if p1 ~= typesModule.SIDE_TOP then p1 == typesModule.SIDE_BOTTOM else true
end

function Scale(p1)
	-- upvalues: styleUtilModule (ref), reactModule (ref), canvasContextModule (ref), signalsReactModule (ref), typesModule (ref), gridUtilModule (ref), scaleTickModule (ref)
	local size = p1.Size or styleUtilModule.SCALE_SIZE
	local var1 = reactModule.useContext(canvasContextModule)
	signalsReactModule.useSignalState(var1.viewportRectGetter)
	local side = p1.Side
	local var2 = if if side ~= typesModule.SIDE_TOP then side == typesModule.SIDE_BOTTOM else true then typesModule.AXIS_X else typesModule.AXIS_Y
	local uDim2 = UDim2.fromScale(0, 0)
	
	if p1.Side == typesModule.SIDE_LEFT then
		uDim2 = UDim2.new(-size, UDim.new(0, 0))
	elseif p1.Side == typesModule.SIDE_RIGHT then
		uDim2 = UDim2.fromScale(1, 0)
	elseif p1.Side == typesModule.SIDE_TOP then
		uDim2 = UDim2.new(UDim.new(0, 0), -size)
	elseif p1.Side == typesModule.SIDE_BOTTOM then
		uDim2 = UDim2.fromScale(0, 1)
	else
		assert(false, `Invalid side {p1.Side}`)
	end
	local side_1 = p1.Side
	local var3 = if if side_1 ~= typesModule.SIDE_TOP then side_1 == typesModule.SIDE_BOTTOM else true then UDim2.new(UDim.new(1, 0), size) else UDim2.new(size, UDim.new(1, 0))
	local values = gridUtilModule.getValues(var2, p1.Schema, var1)
	local var4 = if p1.SchemaMinor then gridUtilModule.getValues(var2, p1.SchemaMinor, var1, values) else {}
	local formatter = p1.Formatter or gridUtilModule.trimRoundingError
	local tickLength = p1.TickLength or styleUtilModule.SCALE_TICK_LENGTH
	local tickLengthMinor = p1.TickLengthMinor or styleUtilModule.SCALE_TICK_LENGTH_MINOR
	local t = {}
	
	for i, v in values do
		t[`Tick{v}`] = reactModule.createElement(scaleTickModule, {
			Side = p1.Side,
			Position = v,
			Length = tickLength,
			Thickness = p1.TickThickness,
			TextPadding = p1.TickTextPadding,
			TextSize = p1.TickTextSize,
			Color3 = p1.TickColor,
			Formatter = formatter
		})
	end
	for i, v_1 in var4 do
		t[`TickM{v_1}`] = reactModule.createElement(scaleTickModule, {
			HasLabel = false,
			Side = p1.Side,
			Position = v_1,
			Length = tickLengthMinor,
			Thickness = p1.TickThickness,
			TextPadding = p1.TickTextPadding,
			Color3 = p1.TickColor
		})
	end
	t.Body = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = -1,
		Position = uDim2,
		Size = var3,
		BackgroundColor3 = p1.BackgroundColor3 or styleUtilModule.SCALE_BACKGROUND_COLOR3,
		BackgroundTransparency = p1.BackgroundTransparency or styleUtilModule.SCALE_BACKGROUND_TRANSPARENCY
	}, p1.children)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.ZIndex
	}, t)
end

return Scale