local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UIBloxModule = require(game:GetService("CorePackages").Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local RoactModule = require(Modules.Common.Roact)
local TextModule = require(Modules.Common.Text)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local ColorSystem = UIBloxModule.Common.Style.ColorSystem
local _Rect = Rect.new(12, 12, 13, 13)
local NumericalBadge = RoactModule.PureComponent:extend("NumericalBadge")
NumericalBadge.defaultProps = {
	badgeCount = 0,
	inAppChrome = false,
	redBadgeVariant = false,
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(1, 0, 0, 0)
}

function NumericalBadge.render(p1)
	-- upvalues: TextModule (copy), ColorSystem (copy), RoactModule (copy), DEPRECATEDImageSetLabelModule (copy), _Rect (copy), WithStyleFunction (copy)
	local AnchorPoint = p1.props.AnchorPoint
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	local BadgeCount: number = p1.props.badgeCount
	
	if type(BadgeCount) == "number" and BadgeCount > 0 then
		local function renderBadge(BackgroundDefault, Badge, Label)
			-- upvalues: BadgeCount (copy), TextModule (upval), p1 (copy), ColorSystem (upval), RoactModule (upval), DEPRECATEDImageSetLabelModule (upval), AnchorPoint (copy), Position (copy), _Rect (upval), LayoutOrder (copy)
			local Text: string = if BadgeCount > 99 then "99+" else tostring(BadgeCount)
			local TextWidth: number = TextModule.GetTextWidth(Text, Label.Font, Label.TextSize)
			local Largest = math.max(24, TextWidth + 6 + 4)
			local Color = Badge.Color
			local TextColor3 = Label.TextColor3
			
			if p1.props.redBadgeVariant then
				Color = ColorSystem.Red[60]
				TextColor3 = ColorSystem.White
			end
			return RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Image = "LuaApp/9-slice/notification_badge",
				AnchorPoint = AnchorPoint,
				Position = Position,
				Size = UDim2.new(0, Largest, 0, 24),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = _Rect,
				ImageColor3 = BackgroundDefault.Color,
				ImageTransparency = BackgroundDefault.Transparency,
				LayoutOrder = LayoutOrder
			}, {
				InnerBadge = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Image = "LuaApp/9-slice/notification_badge",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(1, -4, 1, -4),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = _Rect,
					ImageColor3 = Color,
					ImageTransparency = Badge.Transparency
				}, {
					Count = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, TextWidth, 1, 0),
						Font = Label.Font,
						Text = Text,
						TextSize = Label.TextSize,
						TextColor3 = TextColor3,
						TextTransparency = Label.TextTransparency
					})
				})
			})
		end
		
		return WithStyleFunction(function(p2)
			-- upvalues: renderBadge (copy)
			return renderBadge(p2.Theme.BackgroundDefault, p2.Theme.Badge, {
				Font = p2.Font.CaptionHeader.Font,
				TextSize = p2.Font.CaptionHeader.RelativeSize * p2.Font.BaseSize,
				TextColor3 = p2.Theme.BadgeContent.Color,
				TextTransparency = p2.Theme.BadgeContent.Transparency
			})
		end)
	else
		return nil
	end
end

return NumericalBadge