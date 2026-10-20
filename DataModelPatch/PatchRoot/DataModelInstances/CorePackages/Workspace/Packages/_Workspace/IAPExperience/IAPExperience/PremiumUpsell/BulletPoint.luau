local TextService = game:GetService("TextService")
local Parent = script.Parent.Parent.Parent
local UIBloxModule = require(Parent.UIBlox)
local RoactModule = require(Parent.Roact)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local IconSize = UIBloxModule.App.Constant.IconSize
local NewSmall = IconSize.Small + 16

return function(p1)
	-- upvalues: WithStyleFunction (copy), TextService (copy), NewSmall (copy), RoactModule (copy), ImageSetLabel (copy), IconSize (copy), Images (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), TextService (upval), NewSmall (upval), RoactModule (upval), ImageSetLabel (upval), IconSize (upval), Images (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Text = p1.text
		local ScaledRelativeSize = _Font.Body.RelativeSize * _Font.BaseSize
		local BodyFont = _Font.Body.Font
		local _Vector2 = if Text == nil then Vector2.new(0, 0) else TextService:GetTextSize(Text, ScaledRelativeSize, BodyFont, Vector2.new(p1.width - NewSmall, 10000))
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, _Vector2.Y),
			LayoutOrder = p1.layoutOrder
		}, {
			Bullet = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 2, 0, 2),
				Size = UDim2.new(0, IconSize.Small, 0, IconSize.Small),
				ScaleType = Enum.ScaleType.Stretch,
				Image = Images["icons/status/success_small"],
				ImageColor3 = Theme.IconDefault.Color,
				ImageTransparency = Theme.IconDefault.Transparency
			}),
			Text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Position = UDim2.new(0, NewSmall, 0, 0),
				Size = UDim2.new(1, -NewSmall, 0, _Vector2.Y),
				Text = Text,
				TextSize = ScaledRelativeSize,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency,
				Font = BodyFont,
				TextXAlignment = Enum.TextXAlignment.Left,
				LayoutOrder = p1.layoutOrder
			})
		})
	end)
end