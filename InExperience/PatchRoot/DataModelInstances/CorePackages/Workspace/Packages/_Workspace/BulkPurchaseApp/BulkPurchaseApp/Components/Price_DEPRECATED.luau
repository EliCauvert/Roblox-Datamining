local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local numberLocalization = require(parent.Localization).NumberLocalization
local UIBloxModule = require(parent.UIBlox)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images

local function PriceIcon(p1)
	-- upvalues: reactModule (ref), imageSetLabel (ref), images (ref)
	return reactModule.createElement(imageSetLabel, {
		ImageTransparency = 0,
		BackgroundTransparency = 1,
		Size = p1.Size,
		Image = images["icons/common/robux_small"],
		ImageColor3 = p1.color,
		LayoutOrder = p1.LayoutOrder
	})
end

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), PriceIcon (ref), styledTextLabel (ref), numberLocalization (ref), localizationService (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, useDesignTokens().Size.Size_100)
	}), reactModule.createElement(PriceIcon, {
		LayoutOrder = 1,
		Size = UDim2.fromOffset(p1.fontStyle.FontSize, p1.fontStyle.FontSize),
		color = p1.colorStyle.Color3
	}), reactModule.createElement(styledTextLabel, {
		layoutOrder = 2,
		fontStyle = p1.fontStyle,
		colorStyle = p1.colorStyle,
		text = numberLocalization.localize(p1.amount, localizationService.RobloxLocaleId),
		textXAlignment = Enum.TextXAlignment.Right
	}))
end