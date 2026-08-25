local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local itemCardPriceLineModule = require(script.Parent.ItemCardPriceLine)
local itemCardCreatorNameModule = require(script.Parent.ItemCardCreatorName)
local itemCardTitleModule = require(script.Parent.ItemCardTitle)
local fFlagAXAddTextXAlignmentProp = require(parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp

local function ItemCardFooter(p0)
	-- upvalues: useTokens (ref), reactModule (ref), itemCardTitleModule (ref), fFlagAXAddTextXAlignmentProp (ref), itemCardCreatorNameModule (ref), itemCardPriceLineModule (ref)
	local var5 = useTokens()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	}, {
		ItemCardFooterLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, var5.Gap.XSmall)
		}),
		ItemCardFooterInfo = if p0.title or p0.creatorName then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ItemCardFooterInfoLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, var5.Gap.XXSmall)
			}),
			ItemCardFooterInfoTitle = if p0.title then reactModule.createElement(itemCardTitleModule, {
				LayoutOrder = 1,
				title = p0.title,
				titleTextSize = p0.titleTextSize,
				TextXAlignment = if fFlagAXAddTextXAlignmentProp then p0.TextXAlignment else nil
			}) else nil,
			ItemCardFooterInfoCreatorName = if p0.creatorName then reactModule.createElement(itemCardCreatorNameModule, {
				LayoutOrder = 2,
				name = p0.creatorName,
				hasVerifiedBadge = p0.creatorHasVerifiedBadge,
				TextXAlignment = if fFlagAXAddTextXAlignmentProp then p0.TextXAlignment else nil
			}) else nil
		}) else nil,
		ItemCardFooterPrice = if p0.priceLineContent then reactModule.createElement(itemCardPriceLineModule, { LayoutOrder = 2, content = p0.priceLineContent }) else nil
	})
end

return if require(parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardFooter) else ItemCardFooter