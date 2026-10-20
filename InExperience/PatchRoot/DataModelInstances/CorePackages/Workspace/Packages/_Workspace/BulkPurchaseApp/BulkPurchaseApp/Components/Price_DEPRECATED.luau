local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local NumberLocalization = require(Parent.Localization).NumberLocalization
local UIBloxModule = require(Parent.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images

local function PriceIcon(Frame)
	-- upvalues: ReactModule (copy), ImageSetLabel (copy), Images (copy)
	return ReactModule.createElement(ImageSetLabel, {
		ImageTransparency = 0,
		BackgroundTransparency = 1,
		Size = Frame.Size,
		Image = Images["icons/common/robux_small"],
		ImageColor3 = Frame.color,
		LayoutOrder = Frame.LayoutOrder
	})
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), PriceIcon (copy), StyledTextLabel (copy), NumberLocalization (copy), LocalizationService (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, ReactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, UseDesignTokensFunction().Size.Size_100)
	}), ReactModule.createElement(PriceIcon, {
		LayoutOrder = 1,
		Size = UDim2.fromOffset(p1.fontStyle.FontSize, p1.fontStyle.FontSize),
		color = p1.colorStyle.Color3
	}), ReactModule.createElement(StyledTextLabel, {
		layoutOrder = 2,
		fontStyle = p1.fontStyle,
		colorStyle = p1.colorStyle,
		text = NumberLocalization.localize(p1.amount, LocalizationService.RobloxLocaleId),
		textXAlignment = Enum.TextXAlignment.Right
	}))
end