local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local priceDEPRECATEDModule = require(bulkPurchaseApp.Components.Price_DEPRECATED)
local itemStatusModule = require(bulkPurchaseApp.Components.ItemStatus)

return {
	mapItemsToPresentation_DEPRECATED = function(p0, p1, p2)
		-- upvalues: reactModule (ref), priceDEPRECATEDModule (ref)
		local t = {}
		
		for i, v in p0 do
			table.insert(t, {
				id = v.id,
				name = v.name,
				image = v.image,
				endSlot = reactModule.createElement(priceDEPRECATEDModule, { amount = v.cost, fontStyle = p1, colorStyle = p2 })
			})
		end
		return t
	end,
	mapOwnedItemsToPresentation_DEPRECATED = function(p3, p4, p5, p6)
		-- upvalues: reactModule (ref), styledTextLabel (ref)
		local t = {}
		
		for i, v in p3 do
			table.insert(t, {
				id = v.id,
				name = v.name,
				image = v.image,
				endSlot = reactModule.createElement(styledTextLabel, {
					fontStyle = p4,
					colorStyle = p5,
					textXAlignment = Enum.TextXAlignment.Right,
					textYAlignment = Enum.TextYAlignment.Top,
					lineHeight = p4.LineHeight,
					size = UDim2.fromScale(1, 1),
					text = p6.itemOwned:gsub("{.*}", tostring(v.ownedCount))
				})
			})
		end
		return t
	end,
	mapUnpurchasableItemsToPresentation_DEPRECATED = function(p7)
		-- upvalues: reactModule (ref), itemStatusModule (ref)
		local t = {}
		
		for i, v in p7 do
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