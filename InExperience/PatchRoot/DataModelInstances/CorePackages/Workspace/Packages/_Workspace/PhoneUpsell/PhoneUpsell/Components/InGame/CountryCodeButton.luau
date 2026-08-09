local parent = script:FindFirstAncestor("PhoneUpsell").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local roactModule = require(parent.Roact)

return function(p0) --[[ line: 23 | named "CountryCodeButton" ]]
	-- upvalues: useStyle (ref), reactModule (ref), imageSetLabel (ref), getImageData (ref), roactModule (ref)
	local var3 = useStyle()
	local tokens = var3.Tokens
	local textField = tokens.Component.TextField
	
	return reactModule.createElement(imageSetLabel, {
		ZIndex = 2,
		BackgroundTransparency = 1,
		Size = p0.size,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(9, 9, 9, 9),
		Image = getImageData("LuaApp/buttons/buttonStroke"),
		ImageColor3 = if p0.error then tokens.Color.System.Alert.Color3 else var3.Theme.UIDefault.Color,
		ImageTransparency = var3.Theme.UIDefault.Transparency,
		LayoutOrder = p0.layoutOrder
	}, {
		Button = reactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = p0.countryPrefix,
			Font = p0.font or textField.Base.Field.Typography.Font,
			TextSize = p0.textSize or textField.Base.Field.Typography.FontSize,
			TextColor3 = textField.Base.FieldValue.ContentColor.Color3,
			TextTransparency = textField.Base.FieldValue.ContentColor.Transparency,
			[roactModule.Event.Activated] = p0.onButtonClick,
			[roactModule.Ref] = p0.forwardRef
		})
	})
end