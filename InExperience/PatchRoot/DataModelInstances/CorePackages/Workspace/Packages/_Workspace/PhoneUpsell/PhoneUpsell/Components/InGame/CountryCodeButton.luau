local Parent = script:FindFirstAncestor("PhoneUpsell").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local RoactModule = require(Parent.Roact)
local NormalizeFontFaceFunction = require(Parent.Foundation).Utility.normalizeFontFace

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), NormalizeFontFaceFunction (copy), RoactModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Tokens = UseStyleResult.Tokens
	local config = {
		Base = {
			Field = { Typography = Tokens.Typography.BodyLarge },
			FieldValue = { ContentColor = Tokens.Color.Content.Emphasis }
		}
	}
	
	return ReactModule.createElement(ImageSetLabel, {
		ZIndex = 2,
		BackgroundTransparency = 1,
		Size = p1.size,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(9, 9, 9, 9),
		Image = GetImageDataFunction("LuaApp/buttons/buttonStroke"),
		ImageColor3 = if p1.error then Tokens.Color.System.Alert.Color3 else UseStyleResult.Theme.UIDefault.Color,
		ImageTransparency = UseStyleResult.Theme.UIDefault.Transparency,
		LayoutOrder = p1.layoutOrder
	}, {
		Button = ReactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = p1.countryPrefix,
			FontFace = NormalizeFontFaceFunction(p1.font or config.Base.Field.Typography.Font),
			TextSize = p1.textSize or config.Base.Field.Typography.FontSize,
			TextColor3 = config.Base.FieldValue.ContentColor.Color3,
			TextTransparency = config.Base.FieldValue.ContentColor.Transparency,
			[RoactModule.Event.Activated] = p1.onButtonClick,
			[RoactModule.Ref] = p1.forwardRef
		})
	})
end