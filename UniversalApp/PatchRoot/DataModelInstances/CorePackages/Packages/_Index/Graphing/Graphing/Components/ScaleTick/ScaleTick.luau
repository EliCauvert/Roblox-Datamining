local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local typesModule = require(graphing.Types)
local sidePositionerModule = require(graphing.Components.SidePositioner)
local gridUtilModule = require(graphing.Util.GridUtil)
local styleUtilModule = require(graphing.Util.StyleUtil)

local function _(p1)
	-- upvalues: typesModule (ref)
	return if p1 ~= typesModule.SIDE_TOP then p1 == typesModule.SIDE_BOTTOM else true
end

function ScaleTick(p1)
	-- upvalues: styleUtilModule (ref), gridUtilModule (ref), typesModule (ref), reactModule (ref), sidePositionerModule (ref)
	local length = p1.Length
	local thickness = p1.Thickness or styleUtilModule.SCALE_TICK_THICKNESS
	local textPadding = p1.TextPadding or styleUtilModule.SCALE_TICK_LABEL_PADDING
	local var1 = if p1.HasLabel ~= nil then p1.HasLabel else true
	local anchorPointForSide = gridUtilModule.getAnchorPointForSide(p1.Side)
	local textAlignmentsFromAnchorPoint, textAlignmentsFromAnchorPoint_1 = gridUtilModule.getTextAlignmentsFromAnchorPoint(anchorPointForSide)
	local side = p1.Side
	local var2 = length + textPadding
	
	return reactModule.createElement(sidePositionerModule, {
		Side = p1.Side,
		Position = p1.Position,
		ZIndex = p1.ZIndex
	}, {
		Tick = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = anchorPointForSide,
			Size = if if side ~= typesModule.SIDE_TOP then side == typesModule.SIDE_BOTTOM else true then UDim2.fromOffset(thickness, length) else UDim2.fromOffset(length, thickness),
			BackgroundColor3 = p1.Color3 or styleUtilModule.SCALE_TICK_COLOR3
		}, p1.children),
		Label = var1 and reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = anchorPointForSide,
			Position = UDim2.fromOffset(-2 * var2 * anchorPointForSide.X + var2, -2 * var2 * anchorPointForSide.Y + var2),
			Text = if p1.Formatter then p1.Formatter(p1.Position) else tostring(p1.Position),
			TextXAlignment = textAlignmentsFromAnchorPoint,
			TextYAlignment = textAlignmentsFromAnchorPoint_1,
			TextColor3 = p1.Color3 or styleUtilModule.SCALE_TICK_LABEL_COLOR3,
			TextSize = p1.TextSize or styleUtilModule.SCALE_TICK_LABEL_SIZE
		})
	})
end

return ScaleTick