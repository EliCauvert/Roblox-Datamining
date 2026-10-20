local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Style)
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local _ = require(Parent.AvatarExperienceCommon)
local ItemStatusToItemStatusKeyModule = require(BulkPurchaseApp.Enums.ItemStatusToItemStatusKey)
local FFlagBulkPurchaseEnablePurchaseOptionsModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local _ = require(script.Parent.BulkPurchaseRequestItem)
local _ = require(script.Parent.BulkPurchaseRequestOwnedItem)
local _ = require(script.Parent.BulkPurchaseRequestUnpurchasableItem)

local function _(Tbl, Id)
	local Copy = table.clone(Tbl)
	Copy.id = Id
	
	return Copy
end

return {
	mapItemsToRowPresentation = function(List, p1)
		-- upvalues: FFlagBulkPurchaseEnablePurchaseOptionsModule (copy), ReactModule (copy), ItemCardThumbnail (copy)
		local List1 = {}
		
		for _, value in List do
			local List2 = { { type = "price", price = value.cost } }
			
			if value.originalPrice then
				table.insert(List2, {
					type = "price",
					strikethrough = true,
					price = value.originalPrice
				})
			end
			if FFlagBulkPurchaseEnablePurchaseOptionsModule and p1 and value.timedOptionDays and value.timedOptionDays > 0 then
				local TimedOptionDays = value.timedOptionDays
				table.insert(List2, {
					type = "badge",
					text = p1:Format(if TimedOptionDays == 1 then "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay" else "Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays", { num = tostring(TimedOptionDays) })
				})
			end
			local Copy = table.clone({
				presentationSlot = ReactModule.createElement(ItemCardThumbnail, { url = value.image }),
				title = value.name,
				priceLineContent = List2
			})
			Copy.id = value.id
			table.insert(List1, Copy)
		end
		return List1
	end,
	mapOwnedItemsToRowPresentation = function(List, ColorStyle, p2)
		-- upvalues: ReactModule (copy), ItemCardThumbnail (copy)
		local List1 = {}
		
		for _, value in List do
			local Copy = table.clone({
				presentationSlot = ReactModule.createElement(ItemCardThumbnail, { url = value.image }),
				title = value.name,
				priceLineContent = {
					{
						type = "text",
						text = p2.itemOwned:gsub("{.*}", (tostring(value.ownedCount))),
						colorStyle = ColorStyle
					}
				}
			})
			Copy.id = value.id
			table.insert(List1, Copy)
		end
		return List1
	end,
	mapUnpurchasableItemsToRowPresentation = function(List, p3, p4, p5)
		-- upvalues: ItemStatusToItemStatusKeyModule (copy), ReactModule (copy), ItemCardThumbnail (copy)
		local List1 = {}
		
		for _, value in List do
			local Copy = table.clone({
				presentationSlot = ReactModule.createElement(ItemCardThumbnail, { url = value.image }),
				title = value.name,
				priceLineContent = {
					{
						type = "text",
						text = p3[ItemStatusToItemStatusKeyModule[value.status]],
						colorStyle = if value.status == Enum.MarketplaceItemPurchaseStatus.Success then p4 else p5
					}
				}
			})
			Copy.id = value.id
			table.insert(List1, Copy)
		end
		return List1
	end
}