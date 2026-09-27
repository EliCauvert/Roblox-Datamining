local parent = script:FindFirstAncestor("PhoneUpsell").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local colors = UIBloxModule.App.Style.Colors

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), colors (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref)
	local var1 = useStyle()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 0.3,
		BackgroundColor3 = colors.Black,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		MiddleContent = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 24)
			}),
			Image = p1.image,
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var1.Tokens.Size.Size_600),
				PaddingRight = UDim.new(0, var1.Tokens.Size.Size_600)
			}),
			VerifyingText = reactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = var1.Font.BaseSize * var1.Font.Header1.RelativeSize,
				TextColor3 = colors.White,
				Text = p1.text,
				Font = if foundationFontFaceMigration then nil else var1.Font.Header1.Font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(var1.Tokens.Typography.HeadingSmall.Font) else nil
			})
		})
	})
end