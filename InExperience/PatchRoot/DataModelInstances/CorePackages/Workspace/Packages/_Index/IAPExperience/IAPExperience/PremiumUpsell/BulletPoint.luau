local textService = game:GetService("TextService")
local parent = script.Parent.Parent.Parent
local UIBloxModule = require(parent.UIBlox)
local roactModule = require(parent.Roact)
local foundationModule = require(parent.Foundation)
local getTextSize = require(parent.Style).GetTextSize
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Style.withStyle
local iconSize = UIBloxModule.App.Constant.IconSize
local var1 = iconSize.Small + 16

return function(p1)
	-- upvalues: withStyle (ref), foundationFontFaceMigration (ref), getTextSize (ref), var1 (ref), textService (ref), roactModule (ref), imageSetLabel (ref), iconSize (ref), images (ref), normalizeFontFace (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), foundationFontFaceMigration (copy), getTextSize (copy), var1 (copy), textService (copy), roactModule (copy), imageSetLabel (copy), iconSize (copy), images (copy), normalizeFontFace (copy)
		local theme = p2.Theme
		local font = p2.Font
		local text = p1.text
		local var2 = font.Body.RelativeSize * font.BaseSize
		local font_1 = font.Body.Font
		local var3 = if text ~= nil then Vector2.new(0, 0) elseif foundationFontFaceMigration then getTextSize(text, var2, p2.Tokens.Typography.BodyLarge.Font, Vector2.new(p1.width - var1, 10000), { addTemporaryPadding = false }) else textService:GetTextSize(text, var2, font_1, Vector2.new(p1.width - var1, 10000))
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var3.Y),
			LayoutOrder = p1.layoutOrder
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
				Position = UDim2.new(0, var1, 0, 0),
				Size = UDim2.new(1, -var1, 0, var3.Y),
				Text = text,
				TextSize = var2,
				TextColor3 = theme.TextDefault.Color,
				TextTransparency = theme.TextDefault.Transparency,
				Font = if foundationFontFaceMigration then nil else font_1,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(p2.Tokens.Typography.BodyLarge.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				LayoutOrder = p1.layoutOrder
			})
		})
	end)
end