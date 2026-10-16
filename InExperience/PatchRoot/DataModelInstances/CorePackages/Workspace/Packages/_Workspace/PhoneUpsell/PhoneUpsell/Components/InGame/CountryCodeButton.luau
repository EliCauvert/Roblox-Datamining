local Parent = script:FindFirstAncestor("PhoneUpsell").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local RoactModule = require(Parent.Roact)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

return function(p1) --[[ Line: 26 | Named "CountryCodeButton" ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), RoactModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Tokens = UseStyleResult.Tokens
	local config = {
		Base = {
			Field = { Typography = Tokens.Typography.BodyLarge },
			FieldValue = { ContentColor = Tokens.Color.Content.Emphasis }
		}
	}
	local _Font = p1.font or config.Base.Field.Typography.Font
	
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
			Font = if FoundationFontFaceMigration then nil else _Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(_Font) else nil,
			TextSize = p1.textSize or config.Base.Field.Typography.FontSize,
			TextColor3 = config.Base.FieldValue.ContentColor.Color3,
			TextTransparency = config.Base.FieldValue.ContentColor.Transparency,
			[RoactModule.Event.Activated] = p1.onButtonClick,
			[RoactModule.Ref] = p1.forwardRef
		})
	})
end