local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.AvatarExperienceModel)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local _ = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local _ = require(AvatarExperienceInspectAndBuy.Utils.getPriceLineContent)
local SelectableCardRowContainerModule = require(AvatarExperienceInspectAndBuy.Components.Common.SelectableItemCardRow.SelectableCardRowContainer)
local config = { isShopContext = true }

return function(Frame) --[[ Line: 59 | Named "SelectableItemCardList" ]]
	-- upvalues: config (copy), ReactModule (copy), SelectableCardRowContainerModule (copy), FoundationModule (copy)
	local Rows = Frame.rows
	local PriceStatusLabels = Frame.priceStatusLabels
	local ItemSubTypeLabels = Frame.itemSubTypeLabels
	local ItemCardWidth = Frame.itemCardWidth
	local OnSelectionChangedFunction = Frame.onSelectionChanged
	local PriceOptions = Frame.priceOptions or config
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = "SelectableItemCardList",
		LayoutOrder = Frame.LayoutOrder
	}, (ReactModule.useMemo(function() --[[ Line: 68 ]]
		-- upvalues: Rows (copy), ItemSubTypeLabels (copy), PriceStatusLabels (copy), ItemCardWidth (copy), OnSelectionChangedFunction (copy), PriceOptions (copy), ReactModule (upval), SelectableCardRowContainerModule (upval)
		local Elements = {}
		
		for LayoutOrder, row in Rows do
			local IsEquipped = row.isEquipped
			local ItemSubTypeLabel = if ItemSubTypeLabels == nil or row.itemData.itemType == nil then nil else ItemSubTypeLabels[row.itemData.itemType]
			Elements[if row.itemData and row.itemData.id ~= nil and row.itemData.itemType ~= nil then "Row_" .. tostring(row.itemData.id) .. "-" .. tostring(row.itemData.itemType) else "Row_" .. tostring(LayoutOrder)] = ReactModule.createElement(SelectableCardRowContainerModule, {
				isSelectionEnabled = true,
				itemData = row.itemData,
				priceStatusLabels = PriceStatusLabels,
				itemSubTypeLabel = if ItemSubTypeLabel == nil or row.itemData.itemSubType == nil then nil else ItemSubTypeLabel[tostring(row.itemData.itemSubType)],
				LayoutOrder = LayoutOrder,
				itemCardWidth = ItemCardWidth,
				isSelected = IsEquipped,
				onSelectionChanged = OnSelectionChangedFunction,
				onItemCardActivated = function(p1) --[[ Line: 86 ]]
					-- upvalues: OnSelectionChangedFunction (upval), IsEquipped (copy)
					OnSelectionChangedFunction(p1, not IsEquipped)
				end,
				priceOptions = PriceOptions
			})
		end
		return Elements
	end, {
		Rows, PriceStatusLabels, ItemSubTypeLabels, ItemCardWidth,
		OnSelectionChangedFunction, PriceOptions
	})))
end