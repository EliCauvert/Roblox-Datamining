local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local priceDEPRECATEDModule = require(bulkPurchaseApp.Components.Price_DEPRECATED)
local itemStatusModule = require(bulkPurchaseApp.Components.ItemStatus)

return {
	mapItemsToPresentation_DEPRECATED = function(p1, p2, p3)
		-- upvalues: reactModule (ref), priceDEPRECATEDModule (ref)
		local t = {}
		
		for i, v in p1 do
			table.insert(t, {
				id = v.id,
				name = v.name,
				image = v.image,
				endSlot = reactModule.createElement(priceDEPRECATEDModule, { amount = v.cost, fontStyle = p2, colorStyle = p3 })
			})
		end
		return t
	end,
	mapOwnedItemsToPresentation_DEPRECATED = function(p4, p5, p6, p7)
		-- upvalues: reactModule (ref), styledTextLabel (ref)
		local t = {}
		
		for i, v in p4 do
			table.insert(t, {
				id = v.id,
				name = v.name,
				image = v.image,
				endSlot = reactModule.createElement(styledTextLabel, {
					fontStyle = p5,
					colorStyle = p6,
					textXAlignment = Enum.TextXAlignment.Right,
					textYAlignment = Enum.TextYAlignment.Top,
					lineHeight = p5.LineHeight,
					size = UDim2.fromScale(1, 1),
					text = p7.itemOwned:gsub("{.*}", tostring(v.ownedCount))
				})
			})
		end
		return t
	end,
	mapUnpurchasableItemsToPresentation_DEPRECATED = function(p8)
		-- upvalues: reactModule (ref), itemStatusModule (ref)
		local t = {}
		
		for i, v in p8 do
			table.insert(t, {
				id = v.id,
				name = v.name,
				image = v.image,
				endSlot = reactModule.createElement(itemStatusModule, { status = v.status })
			})
		end
		return t
	end
}