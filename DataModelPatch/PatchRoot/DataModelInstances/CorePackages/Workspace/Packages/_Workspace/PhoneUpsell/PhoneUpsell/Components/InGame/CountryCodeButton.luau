local Parent = script:FindFirstAncestor("PhoneUpsell").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local RoactModule = require(Parent.Roact)

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), RoactModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Tokens = UseStyleResult.Tokens
	local TextField = Tokens.Component.TextField
	
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
			Font = p1.font or TextField.Base.Field.Typography.Font,
			TextSize = p1.textSize or TextField.Base.Field.Typography.FontSize,
			TextColor3 = TextField.Base.FieldValue.ContentColor.Color3,
			TextTransparency = TextField.Base.FieldValue.ContentColor.Transparency,
			[RoactModule.Event.Activated] = p1.onButtonClick,
			[RoactModule.Ref] = p1.forwardRef
		})
	})
end