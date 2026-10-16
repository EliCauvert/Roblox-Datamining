local Graphing = script:FindFirstAncestor("Graphing")
local Parent = Graphing.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local CanvasContextModule = require(Graphing.CanvasContext)
local TypesModule = require(Graphing.Types)
local ScaleTickModule = require(Graphing.Components.ScaleTick)
local GridUtilModule = require(Graphing.Util.GridUtil)
local StyleUtilModule = require(Graphing.Util.StyleUtil)

local function _(SIDEBOTTOM): boolean --[[ Line: 44 | Named "isX" ]]
	-- upvalues: TypesModule (copy)
	return SIDEBOTTOM == TypesModule.SIDE_TOP or SIDEBOTTOM == TypesModule.SIDE_BOTTOM
end

function Scale(Frame: Frame) --[[ Line: 48 ]]
	-- upvalues: StyleUtilModule (copy), ReactModule (copy), CanvasContextModule (copy), SignalsReactModule (copy), TypesModule (copy), GridUtilModule (copy), ScaleTickModule (copy)
	local Size = Frame.Size or StyleUtilModule.SCALE_SIZE
	local UseContextResult = ReactModule.useContext(CanvasContextModule)
	SignalsReactModule.useSignalState(UseContextResult.viewportRectGetter)
	local Side = Frame.Side
	local IsSideMatch: boolean = Side == TypesModule.SIDE_TOP or Side == TypesModule.SIDE_BOTTOM
	local AXISX = if IsSideMatch then TypesModule.AXIS_X else TypesModule.AXIS_Y
	local _UDim2 = UDim2.fromScale(0, 0)
	
	if Frame.Side == TypesModule.SIDE_LEFT then
		_UDim2 = UDim2.new(-Size, UDim.new(0, 0))
	elseif Frame.Side == TypesModule.SIDE_RIGHT then
		_UDim2 = UDim2.fromScale(1, 0)
	elseif Frame.Side == TypesModule.SIDE_TOP then
		_UDim2 = UDim2.new(UDim.new(0, 0), -Size)
	elseif Frame.Side == TypesModule.SIDE_BOTTOM then
		_UDim2 = UDim2.fromScale(0, 1)
	else
		assert(false, `Invalid side {Frame.Side}`)
	end
	local Side1 = Frame.Side
	local IsSideMatch1: boolean = Side1 == TypesModule.SIDE_TOP or Side1 == TypesModule.SIDE_BOTTOM
	local _UDim2_1: UDim2 = if IsSideMatch1 then UDim2.new(UDim.new(1, 0), Size) else UDim2.new(Size, UDim.new(1, 0))
	local Values = GridUtilModule.getValues(AXISX, Frame.Schema, UseContextResult)
	local Values1 = if Frame.SchemaMinor then GridUtilModule.getValues(AXISX, Frame.SchemaMinor, UseContextResult, Values) else {}
	local Formatter = Frame.Formatter or GridUtilModule.trimRoundingError
	local TickLength = Frame.TickLength or StyleUtilModule.SCALE_TICK_LENGTH
	local TickLengthMinor = Frame.TickLengthMinor or StyleUtilModule.SCALE_TICK_LENGTH_MINOR
	local Elements = {}
	
	for _, value in Values do
		Elements[`Tick{value}`] = ReactModule.createElement(ScaleTickModule, {
			Side = Frame.Side,
			Position = value,
			Length = TickLength,
			Thickness = Frame.TickThickness,
			TextPadding = Frame.TickTextPadding,
			TextSize = Frame.TickTextSize,
			Color3 = Frame.TickColor,
			Formatter = Formatter
		})
	end
	for _, Position in Values1 do
		Elements[`TickM{Position}`] = ReactModule.createElement(ScaleTickModule, {
			HasLabel = false,
			Side = Frame.Side,
			Position = Position,
			Length = TickLengthMinor,
			Thickness = Frame.TickThickness,
			TextPadding = Frame.TickTextPadding,
			Color3 = Frame.TickColor
		})
	end
	Elements.Body = ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = -1,
		Position = _UDim2,
		Size = _UDim2_1,
		BackgroundColor3 = Frame.BackgroundColor3 or StyleUtilModule.SCALE_BACKGROUND_COLOR3,
		BackgroundTransparency = Frame.BackgroundTransparency or StyleUtilModule.SCALE_BACKGROUND_TRANSPARENCY
	}, Frame.children)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ZIndex = Frame.ZIndex
	}, Elements)
end

return Scale