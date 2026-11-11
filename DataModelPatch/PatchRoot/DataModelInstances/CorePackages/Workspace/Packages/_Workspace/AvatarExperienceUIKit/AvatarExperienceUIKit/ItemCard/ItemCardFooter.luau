local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ItemCardPriceLineModule = require(script.Parent.ItemCardPriceLine)
local ItemCardCreatorNameModule = require(script.Parent.ItemCardCreatorName)
local ItemCardTitleModule = require(script.Parent.ItemCardTitle)
local FFlagAXAddTextXAlignmentProp = require(Parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp

local function ItemCardFooter(Label)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ItemCardTitleModule (copy), FFlagAXAddTextXAlignmentProp (copy), ItemCardCreatorNameModule (copy), ItemCardPriceLineModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Label.LayoutOrder
	}, {
		ItemCardFooterLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, UseTokensResult.Gap.XSmall)
		}),
		ItemCardFooterInfo = if Label.title or Label.creatorName then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ItemCardFooterInfoLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, UseTokensResult.Gap.XXSmall)
			}),
			ItemCardFooterInfoTitle = if Label.title then ReactModule.createElement(ItemCardTitleModule, {
				LayoutOrder = 1,
				title = Label.title,
				titleTextSize = Label.titleTextSize,
				TextXAlignment = if FFlagAXAddTextXAlignmentProp then Label.TextXAlignment else nil
			}) else nil,
			ItemCardFooterInfoCreatorName = if Label.creatorName then ReactModule.createElement(ItemCardCreatorNameModule, {
				LayoutOrder = 2,
				name = Label.creatorName,
				hasVerifiedBadge = Label.creatorHasVerifiedBadge,
				TextXAlignment = if FFlagAXAddTextXAlignmentProp then Label.TextXAlignment else nil
			}) else nil
		}) else nil,
		ItemCardFooterPrice = if Label.priceLineContent then ReactModule.createElement(ItemCardPriceLineModule, { LayoutOrder = 2, content = Label.priceLineContent }) else nil
	})
end

return if require(Parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then ReactModule.memo(ItemCardFooter) else ItemCardFooter