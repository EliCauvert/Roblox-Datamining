local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local _ = require(parent.Style)
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local _ = require(parent.AvatarExperienceCommon)
local itemStatusToItemStatusKeyModule = require(bulkPurchaseApp.Enums.ItemStatusToItemStatusKey)
local fFlagBulkPurchaseEnablePurchaseOptionsModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local _ = require(script.Parent.BulkPurchaseRequestItem)
local _ = require(script.Parent.BulkPurchaseRequestOwnedItem)
local _ = require(script.Parent.BulkPurchaseRequestUnpurchasableItem)

local function _(p1, p2)
	local cloned = table.clone(p1)
	cloned.id = p2
	
	return cloned
end

return {
	mapItemsToRowPresentation = function(p1, p2)
		-- upvalues: fFlagBulkPurchaseEnablePurchaseOptionsModule (ref), reactModule (ref), itemCardThumbnail (ref)
		local t = {}
		
		for i, v in p1 do
			local list = { { type = "price", price = v.cost } }
			
			if v.originalPrice then
				table.insert(list, {
					type = "price",
					strikethrough = true,
					price = v.originalPrice
				})
			end
			if fFlagBulkPurchaseEnablePurchaseOptionsModule and p2 and (v.timedOptionDays and v.timedOptionDays > 0) then
				local timedOptionDays = v.timedOptionDays
				table.insert(list, {
					type = "badge",
					text = p2:Format(if timedOptionDays == 1 then "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay" else "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays", { num = tostring(timedOptionDays) })
				})
			end
			local cloned = table.clone({
				presentationSlot = reactModule.createElement(itemCardThumbnail, { url = v.image }),
				title = v.name,
				priceLineContent = list
			})
			cloned.id = v.id
			table.insert(t, cloned)
		end
		return t
	end,
	mapOwnedItemsToRowPresentation = function(p3, p4, p5)
		-- upvalues: reactModule (ref), itemCardThumbnail (ref)
		local t = {}
		
		for i, v in p3 do
			local cloned = table.clone({
				presentationSlot = reactModule.createElement(itemCardThumbnail, { url = v.image }),
				title = v.name,
				priceLineContent = {
					{
						type = "text",
						text = p5.itemOwned:gsub("{.*}", tostring(v.ownedCount)),
						colorStyle = p4
					}
				}
			})
			cloned.id = v.id
			table.insert(t, cloned)
		end
		return t
	end,
	mapUnpurchasableItemsToRowPresentation = function(p6, p7, p8, p9)
		-- upvalues: itemStatusToItemStatusKeyModule (ref), reactModule (ref), itemCardThumbnail (ref)
		local t = {}
		
		for i, v in p6 do
			local cloned = table.clone({
				presentationSlot = reactModule.createElement(itemCardThumbnail, { url = v.image }),
				title = v.name,
				priceLineContent = {
					{
						type = "text",
						text = p7[itemStatusToItemStatusKeyModule[v.status]],
						colorStyle = if v.status == Enum.MarketplaceItemPurchaseStatus.Success then p8 else p9
					}
				}
			})
			cloned.id = v.id
			table.insert(t, cloned)
		end
		return t
	end
}