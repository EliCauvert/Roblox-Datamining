local parent = script:FindFirstAncestor("PhoneUpsell").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local roactModule = require(parent.Roact)

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), imageSetLabel (ref), getImageData (ref), roactModule (ref)
	local var1 = useStyle()
	local tokens = var1.Tokens
	local t = {
		Base = {
			Field = { Typography = tokens.Typography.BodyLarge },
			FieldValue = { ContentColor = tokens.Color.Content.Emphasis }
		}
	}
	
	return reactModule.createElement(imageSetLabel, {
		ZIndex = 2,
		BackgroundTransparency = 1,
		Size = p1.size,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(9, 9, 9, 9),
		Image = getImageData("LuaApp/buttons/buttonStroke"),
		ImageColor3 = if p1.error then tokens.Color.System.Alert.Color3 else var1.Theme.UIDefault.Color,
		ImageTransparency = var1.Theme.UIDefault.Transparency,
		LayoutOrder = p1.layoutOrder
	}, {
		Button = reactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = p1.countryPrefix,
			Font = p1.font or t.Base.Field.Typography.Font,
			TextSize = p1.textSize or t.Base.Field.Typography.FontSize,
			TextColor3 = t.Base.FieldValue.ContentColor.Color3,
			TextTransparency = t.Base.FieldValue.ContentColor.Transparency,
			[roactModule.Event.Activated] = p1.onButtonClick,
			[roactModule.Ref] = p1.forwardRef
		})
	})
end