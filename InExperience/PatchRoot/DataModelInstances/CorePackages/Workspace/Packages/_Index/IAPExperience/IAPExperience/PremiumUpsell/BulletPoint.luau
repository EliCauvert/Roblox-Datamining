local textService = game:GetService("TextService")
local parent = script.Parent.Parent.Parent
local UIBloxModule = require(parent.UIBlox)
local roactModule = require(parent.Roact)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Style.withStyle
local iconSize = UIBloxModule.App.Constant.IconSize
local var3 = iconSize.Small + 16

return function(p0)
	-- upvalues: withStyle (ref), textService (ref), var3 (ref), roactModule (ref), imageSetLabel (ref), iconSize (ref), images (ref)
	return withStyle(function(p1)
		-- upvalues: p0 (ref), textService (copy), var3 (copy), roactModule (copy), imageSetLabel (copy), iconSize (copy), images (copy)
		local theme = p1.Theme
		local font = p1.Font
		local text = p0.text
		local var4 = font.Body.RelativeSize * font.BaseSize
		local font_1 = font.Body.Font
		local var5 = if text ~= nil then Vector2.new(0, 0) else textService:GetTextSize(text, var4, font_1, Vector2.new(p0.width - var3, 10000))
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var5.Y),
			LayoutOrder = p0.layoutOrder
		}, {
			Bullet = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 2, 0, 2),
				Size = UDim2.new(0, iconSize.Small, 0, iconSize.Small),
				ScaleType = Enum.ScaleType.Stretch,
				Image = images["icons/status/success_small"],
				ImageColor3 = theme.IconDefault.Color,
				ImageTransparency = theme.IconDefault.Transparency
			}),
			Text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Position = UDim2.new(0, var3, 0, 0),
				Size = UDim2.new(1, -var3, 0, var5.Y),
				Text = text,
				TextSize = var4,
				TextColor3 = theme.TextDefault.Color,
				TextTransparency = theme.TextDefault.Transparency,
				Font = font_1,
				TextXAlignment = Enum.TextXAlignment.Left,
				LayoutOrder = p0.layoutOrder
			})
		})
	end)
end