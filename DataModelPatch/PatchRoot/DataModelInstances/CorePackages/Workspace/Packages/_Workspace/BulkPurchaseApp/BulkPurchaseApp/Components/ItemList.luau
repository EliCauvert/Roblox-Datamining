local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local CatalogRowItemCard = require(Parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogRowItemCard

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CatalogRowItemCard (copy)
	local UseTokensResult = UseTokensFunction()
	local config = {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, UseTokensResult.Gap.Medium)
		})
	}
	local Size1200 = UseTokensResult.Size.Size_1200
	
	for LayoutOrder, item in Frame.items do
		config[item.id] = ReactModule.createElement(CatalogRowItemCard, {
			LayoutOrder = LayoutOrder,
			title = item.title,
			presentationSlot = item.presentationSlot,
			priceLineContent = item.priceLineContent,
			headerSize = UDim2.fromOffset(Size1200, Size1200),
			footerSize = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, config)
end