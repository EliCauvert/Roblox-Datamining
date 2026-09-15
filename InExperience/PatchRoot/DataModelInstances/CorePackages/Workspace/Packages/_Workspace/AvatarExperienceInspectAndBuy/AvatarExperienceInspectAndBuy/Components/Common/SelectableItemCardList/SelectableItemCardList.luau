local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(avatarExperienceInspectAndBuy.Types)
local _ = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local _ = require(avatarExperienceInspectAndBuy.Utils.selectItemDataForTryOnItems)
local _ = require(avatarExperienceInspectAndBuy.Utils.getPriceLineContent)
local selectableCardRowContainerModule = require(avatarExperienceInspectAndBuy.Components.Common.SelectableItemCardRow.SelectableCardRowContainer)
local t = { isShopContext = true }

return function(p1)
	-- upvalues: t (ref), reactModule (ref), selectableCardRowContainerModule (ref), foundationModule (ref)
	local rows = p1.rows
	local priceStatusLabels = p1.priceStatusLabels
	local itemCardWidth = p1.itemCardWidth
	local onSelectionChanged = p1.onSelectionChanged
	local priceOptions = p1.priceOptions or t
	
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = "SelectableItemCardList",
		LayoutOrder = p1.LayoutOrder
	}, reactModule.useMemo(function()
		-- upvalues: rows (ref), priceStatusLabels (ref), itemCardWidth (ref), onSelectionChanged (ref), priceOptions (ref), reactModule (copy), selectableCardRowContainerModule (copy)
		local t = {}
		
		for i, v in rows do
			local isEquipped = v.isEquipped
			t[if v.itemData and v.itemData.id ~= nil and v.itemData.itemType ~= nil then "Row_" .. tostring(v.itemData.id) .. "-" .. tostring(v.itemData.itemType) else "Row_" .. tostring(i)] = reactModule.createElement(selectableCardRowContainerModule, {
				isSelectionEnabled = true,
				itemData = v.itemData,
				priceStatusLabels = priceStatusLabels,
				LayoutOrder = i,
				itemCardWidth = itemCardWidth,
				isSelected = isEquipped,
				onSelectionChanged = onSelectionChanged,
				onItemCardActivated = function(p2)
					-- upvalues: onSelectionChanged (copy), isEquipped (ref)
					onSelectionChanged(p2, not isEquipped)
				end,
				priceOptions = priceOptions
			})
		end
		return t
	end, {
		rows,
		priceStatusLabels,
		itemCardWidth,
		onSelectionChanged,
		priceOptions
	}))
end