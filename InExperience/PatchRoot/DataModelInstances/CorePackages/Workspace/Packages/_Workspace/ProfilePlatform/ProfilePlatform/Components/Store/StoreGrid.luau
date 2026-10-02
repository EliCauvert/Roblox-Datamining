local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local squareCollectionGridViewModule = require(profilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local catalogItemCard = avatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local itemRestrictions = avatarExperienceCommonModule.Enums.ItemRestrictions
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local enumsModule = require(profilePlatform.Common.Enums)
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local _ = require(profilePlatform.Common.AssetInfo)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local fFlagProfileStoreEnableFreeItemPriceLabelFixModule = require(profilePlatform.Flags.FFlagProfileStoreEnableFreeItemPriceLabelFix)
local fFlagProfileStoreShowLimitedResalePriceModule = require(profilePlatform.Flags.FFlagProfileStoreShowLimitedResalePrice)
local asset = constants.RbxthumbTypes.Asset
local bundleThumbnail = constants.RbxthumbTypes.BundleThumbnail

local var1 = function(p1)
	return p1 + 49
end

local function isLimitedItem(p1)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	
	if not itemRestrictions_1 then
		return false
	end
	for i, v in itemRestrictions_1 do
		if v == itemRestrictions.Limited or v == itemRestrictions.LimitedUnique or v == itemRestrictions.Collectible then
			return true
		end
	end
	return false
end

local function _(p2)
	-- upvalues: isLimitedItem (ref)
	return not (not p2.hasResellers or not p2.lowestResalePrice or p2.lowestResalePrice <= 0) and (if p2.isOffSale ~= true then not (if isLimitedItem(p2) then p2.unitsAvailableForConsumption ~= nil and p2.unitsAvailableForConsumption > 0 else not isLimitedItem(p2)) else true)
end

return function(p2)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), enumsModule (ref), bundleThumbnail (ref), asset (ref), fFlagProfileStoreEnableFreeItemPriceLabelFixModule (ref), fFlagProfileStoreShowLimitedResalePriceModule (ref), isLimitedItem (ref), catalogItemCard (ref), itemCardThumbnail (ref), getRbxthumbWithTypeSizeAndOptions (ref), squareCollectionGridViewModule (ref), var1 (ref)
	local var2 = useLocalization({
		store = textKeysModule.Store,
		free = textKeysModule.CatalogLabelFree
	})
	
	return reactModule.createElement(squareCollectionGridViewModule, {
		layoutOrder = p2.layoutOrder,
		items = p2.assets,
		renderItem = reactModule.useCallback(function(p3, p4)
			-- upvalues: enumsModule (copy), bundleThumbnail (copy), asset (copy), fFlagProfileStoreEnableFreeItemPriceLabelFixModule (copy), var2 (ref), fFlagProfileStoreShowLimitedResalePriceModule (copy), isLimitedItem (copy), reactModule (copy), catalogItemCard (copy), itemCardThumbnail (copy), getRbxthumbWithTypeSizeAndOptions (copy), p2 (ref)
			local var3 = if p3.itemType == enumsModule.ItemTypes.Bundle then bundleThumbnail else asset
			local var4 = if fFlagProfileStoreEnableFreeItemPriceLabelFixModule and p3.price and p3.price == 0 then {
				type = enumsModule.PriceLineContentType.Text,
				text = var2.free
			} else p3.price and {
				type = enumsModule.PriceLineContentType.Price,
				price = p3.price
			}
			
			if fFlagProfileStoreShowLimitedResalePriceModule and p3.lowestResalePrice then
				if if p3.hasResellers and p3.lowestResalePrice and p3.lowestResalePrice > 0 then if p3.isOffSale ~= true then not (if isLimitedItem(p3) then p3.unitsAvailableForConsumption ~= nil and p3.unitsAvailableForConsumption > 0 else not isLimitedItem(p3)) else true else false then
					var4 = {
						type = enumsModule.PriceLineContentType.Price,
						price = p3.lowestResalePrice
					}
				end
			end
			return reactModule.createElement(catalogItemCard, {
				LayoutOrder = p4,
				title = p3.name,
				presentationSlot = reactModule.createElement(itemCardThumbnail, {
					url = getRbxthumbWithTypeSizeAndOptions(p3.id, var3, 150)
				}),
				onActivated = function()
					-- upvalues: p2 (copy), p3 (ref), p4 (ref)
					p2.openItemDetails(p3.id, p3.itemType, p4)
				end,
				priceLineContent = if fFlagProfileStoreEnableFreeItemPriceLabelFixModule or fFlagProfileStoreShowLimitedResalePriceModule then var4 else p3.price and {
					type = enumsModule.PriceLineContentType.Price,
					price = p3.price
				},
				AutomaticSize = Enum.AutomaticSize.Y
			}), "ItemCard"
		end, { p2.openItemDetails }),
		getItemHeight = var1,
		title = var2.store,
		onActivateHeader = p2.navigateToCatalogSearch,
		overrides = { numColumns = p2.numColumns or 3 }
	})
end