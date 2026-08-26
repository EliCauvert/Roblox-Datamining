local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local catalogRowItemCard = require(parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogRowItemCard

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), catalogRowItemCard (ref)
	local var1 = useTokens()
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, var1.Gap.Medium)
		})
	}
	local size1200 = var1.Size.Size_1200
	
	for i, v in p1.items do
		t[v.id] = reactModule.createElement(catalogRowItemCard, {
			LayoutOrder = i,
			title = v.title,
			presentationSlot = v.presentationSlot,
			priceLineContent = v.priceLineContent,
			headerSize = UDim2.fromOffset(size1200, size1200),
			footerSize = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, t)
end