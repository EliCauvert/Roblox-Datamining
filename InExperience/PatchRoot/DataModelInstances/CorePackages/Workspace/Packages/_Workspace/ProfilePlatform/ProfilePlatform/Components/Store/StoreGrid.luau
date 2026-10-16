local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local SquareCollectionGridViewModule = require(ProfilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local CatalogItemCard = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local ItemRestrictions = AvatarExperienceCommonModule.Enums.ItemRestrictions
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local _ = require(ProfilePlatform.Common.AssetInfo)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FFlagProfileStoreEnableFreeItemPriceLabelFixModule = require(ProfilePlatform.Flags.FFlagProfileStoreEnableFreeItemPriceLabelFix)
local FFlagProfileStoreShowLimitedResalePriceModule = require(ProfilePlatform.Flags.FFlagProfileStoreShowLimitedResalePrice)
local Asset = Constants.RbxthumbTypes.Asset
local BundleThumbnail = Constants.RbxthumbTypes.BundleThumbnail

local function GetItemHeight(p1: number): number --[[ Line: 39 ]]
	return p1 + 49
end

local function isLimitedItem(p1): boolean --[[ Line: 43 ]]
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	
	if not ItemRestrictions1 then
		return false
	end
	for _, value in ItemRestrictions1 do
		if value == ItemRestrictions.Limited or value == ItemRestrictions.LimitedUnique or value == ItemRestrictions.Collectible then
			return true
		end
	end
	return false
end

local function _(p2): boolean --[[ Line: 60 | Named "isOnlyAvailableFromResale" ]]
	-- upvalues: isLimitedItem (copy)
	if p2.hasResellers and p2.lowestResalePrice and p2.lowestResalePrice > 0 then
		local Inverted: boolean = not isLimitedItem(p2) or p2.unitsAvailableForConsumption ~= nil and p2.unitsAvailableForConsumption > 0
		
		return p2.isOffSale == true or not Inverted
	else
		return false
	end
end

return function(p2) --[[ Line: 69 | Named "StoreGrid" ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), EnumsModule (copy), BundleThumbnail (copy), Asset (copy), FFlagProfileStoreEnableFreeItemPriceLabelFixModule (copy), FFlagProfileStoreShowLimitedResalePriceModule (copy), isLimitedItem (copy), CatalogItemCard (copy), ItemCardThumbnail (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), SquareCollectionGridViewModule (copy), GetItemHeight (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		store = TextKeysModule.Store,
		free = TextKeysModule.CatalogLabelFree
	})
	
	return ReactModule.createElement(SquareCollectionGridViewModule, {
		layoutOrder = p2.layoutOrder,
		items = p2.assets,
		renderItem = ReactModule.useCallback(function(p3, LayoutOrder) --[[ Line: 75 ]]
			-- upvalues: EnumsModule (upval), BundleThumbnail (upval), Asset (upval), FFlagProfileStoreEnableFreeItemPriceLabelFixModule (upval), UseLocalizationResult (copy), FFlagProfileStoreShowLimitedResalePriceModule (upval), isLimitedItem (upval), ReactModule (upval), CatalogItemCard (upval), ItemCardThumbnail (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), p2 (copy)
			local BundleThumbnail1 = if p3.itemType == EnumsModule.ItemTypes.Bundle then BundleThumbnail else Asset
			local Config = if FFlagProfileStoreEnableFreeItemPriceLabelFixModule and p3.price and p3.price == 0 then {
				type = EnumsModule.PriceLineContentType.Text,
				text = UseLocalizationResult.free
			} else p3.price and {
				type = EnumsModule.PriceLineContentType.Price,
				price = p3.price
			}
			
			if FFlagProfileStoreShowLimitedResalePriceModule and p3.lowestResalePrice then
				local IsIsOffSale = nil
				if p3.hasResellers and p3.lowestResalePrice and p3.lowestResalePrice > 0 then
					local Inverted: boolean = not isLimitedItem(p3) or p3.unitsAvailableForConsumption ~= nil and p3.unitsAvailableForConsumption > 0
					IsIsOffSale = p3.isOffSale == true or not Inverted
				else
					IsIsOffSale = false
				end
				if IsIsOffSale then
					Config = {
						type = EnumsModule.PriceLineContentType.Price,
						price = p3.lowestResalePrice
					}
				end
			end
			return ReactModule.createElement(CatalogItemCard, {
				LayoutOrder = LayoutOrder,
				title = p3.name,
				presentationSlot = ReactModule.createElement(ItemCardThumbnail, {
					url = GetRbxthumbWithTypeSizeAndOptionsFunction(p3.id, BundleThumbnail1, 150)
				}),
				onActivated = function() --[[ Line: 101 ]]
					-- upvalues: p2 (upval), p3 (copy), LayoutOrder (copy)
					p2.openItemDetails(p3.id, p3.itemType, LayoutOrder)
				end,
				priceLineContent = if FFlagProfileStoreEnableFreeItemPriceLabelFixModule or FFlagProfileStoreShowLimitedResalePriceModule then Config else p3.price and {
					type = EnumsModule.PriceLineContentType.Price,
					price = p3.price
				},
				AutomaticSize = Enum.AutomaticSize.Y
			}), "ItemCard"
		end, { p2.openItemDetails }),
		getItemHeight = GetItemHeight,
		title = UseLocalizationResult.store,
		onActivateHeader = p2.navigateToCatalogSearch,
		overrides = { numColumns = p2.numColumns or 3 }
	})
end