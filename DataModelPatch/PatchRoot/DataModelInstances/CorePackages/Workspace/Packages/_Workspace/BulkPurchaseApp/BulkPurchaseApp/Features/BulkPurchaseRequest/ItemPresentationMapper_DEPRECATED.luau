local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local PriceDEPRECATEDModule = require(BulkPurchaseApp.Components.Price_DEPRECATED)
local ItemStatusModule = require(BulkPurchaseApp.Components.ItemStatus)

return {
	mapItemsToPresentation_DEPRECATED = function(List, FontStyle, ColorStyle)
		-- upvalues: ReactModule (copy), PriceDEPRECATEDModule (copy)
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, {
				id = value.id,
				name = value.name,
				image = value.image,
				endSlot = ReactModule.createElement(PriceDEPRECATEDModule, {
					amount = value.cost,
					fontStyle = FontStyle,
					colorStyle = ColorStyle
				})
			})
		end
		return List1
	end,
	mapOwnedItemsToPresentation_DEPRECATED = function(List, FontStyle, ColorStyle, p1)
		-- upvalues: ReactModule (copy), StyledTextLabel (copy)
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, {
				id = value.id,
				name = value.name,
				image = value.image,
				endSlot = ReactModule.createElement(StyledTextLabel, {
					fontStyle = FontStyle,
					colorStyle = ColorStyle,
					textXAlignment = Enum.TextXAlignment.Right,
					textYAlignment = Enum.TextYAlignment.Top,
					lineHeight = FontStyle.LineHeight,
					size = UDim2.fromScale(1, 1),
					text = p1.itemOwned:gsub("{.*}", (tostring(value.ownedCount)))
				})
			})
		end
		return List1
	end,
	mapUnpurchasableItemsToPresentation_DEPRECATED = function(List)
		-- upvalues: ReactModule (copy), ItemStatusModule (copy)
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, {
				id = value.id,
				name = value.name,
				image = value.image,
				endSlot = ReactModule.createElement(ItemStatusModule, { status = value.status })
			})
		end
		return List1
	end
}