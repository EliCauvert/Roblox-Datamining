local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local TypesModule = require(Graphing.Types)
local SidePositionerModule = require(Graphing.Components.SidePositioner)
local GridUtilModule = require(Graphing.Util.GridUtil)
local StyleUtilModule = require(Graphing.Util.StyleUtil)

local function _(SIDEBOTTOM): boolean --[[ Line: 39 | Named "isX" ]]
	-- upvalues: TypesModule (copy)
	return SIDEBOTTOM == TypesModule.SIDE_TOP or SIDEBOTTOM == TypesModule.SIDE_BOTTOM
end

function ScaleTick(Label) --[[ Line: 43 ]]
	-- upvalues: StyleUtilModule (copy), GridUtilModule (copy), TypesModule (copy), ReactModule (copy), SidePositionerModule (copy)
	local Length = Label.Length
	local Thickness = Label.Thickness or StyleUtilModule.SCALE_TICK_THICKNESS
	local TextPadding = Label.TextPadding or StyleUtilModule.SCALE_TICK_LABEL_PADDING
	local NoHasLabel = Label.HasLabel == nil or Label.HasLabel
	local AnchorPointForSide = GridUtilModule.getAnchorPointForSide(Label.Side)
	local TextAlignmentsFromAnchorPoint, TextAlignmentsFromAnchorPoint2 = GridUtilModule.getTextAlignmentsFromAnchorPoint(AnchorPointForSide)
	local Side = Label.Side
	local IsSideMatch: boolean = Side == TypesModule.SIDE_TOP or Side == TypesModule.SIDE_BOTTOM
	local _UDim2: UDim2 = if IsSideMatch then UDim2.fromOffset(Thickness, Length) else UDim2.fromOffset(Length, Thickness)
	local NewLength = Length + TextPadding
	local _UDim2_1 = UDim2.fromOffset(-2 * NewLength * AnchorPointForSide.X + NewLength, -2 * NewLength * AnchorPointForSide.Y + NewLength)
	
	return ReactModule.createElement(SidePositionerModule, {
		Side = Label.Side,
		Position = Label.Position,
		ZIndex = Label.ZIndex
	}, {
		Tick = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = AnchorPointForSide,
			Size = _UDim2,
			BackgroundColor3 = Label.Color3 or StyleUtilModule.SCALE_TICK_COLOR3
		}, Label.children),
		Label = NoHasLabel and ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = AnchorPointForSide,
			Position = _UDim2_1,
			Text = if Label.Formatter then Label.Formatter(Label.Position) else tostring(Label.Position),
			TextXAlignment = TextAlignmentsFromAnchorPoint,
			TextYAlignment = TextAlignmentsFromAnchorPoint2,
			TextColor3 = Label.Color3 or StyleUtilModule.SCALE_TICK_LABEL_COLOR3,
			TextSize = Label.TextSize or StyleUtilModule.SCALE_TICK_LABEL_SIZE
		})
	})
end

return ScaleTick