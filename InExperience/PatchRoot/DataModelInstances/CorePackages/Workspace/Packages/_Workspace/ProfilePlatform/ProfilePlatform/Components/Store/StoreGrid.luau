local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local squareCollectionGridViewModule = require(profilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local catalogItemCard = require(parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local enumsModule = require(profilePlatform.Common.Enums)
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local _ = require(profilePlatform.Common.AssetInfo)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local fFlagProfileStoreEnableFreeItemPriceLabelFixModule = require(profilePlatform.Flags.FFlagProfileStoreEnableFreeItemPriceLabelFix)
local asset = constants.RbxthumbTypes.Asset
local bundleThumbnail = constants.RbxthumbTypes.BundleThumbnail

local var7 = function(p0) --[[ line: 37 ]]
	return p0 + 49
end

return function(p1) --[[ line: 41 | named "StoreGrid" ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), enumsModule (ref), bundleThumbnail (ref), asset (ref), fFlagProfileStoreEnableFreeItemPriceLabelFixModule (ref), catalogItemCard (ref), itemCardThumbnail (ref), getRbxthumbWithTypeSizeAndOptions (ref), squareCollectionGridViewModule (ref), var7 (ref)
	local var8 = useLocalization({
		store = textKeysModule.Store,
		free = textKeysModule.CatalogLabelFree
	})
	
	return reactModule.createElement(squareCollectionGridViewModule, {
		layoutOrder = p1.layoutOrder,
		items = p1.assets,
		renderItem = reactModule.useCallback(function(p2, p3) --[[ line: 47 ]]
			-- upvalues: enumsModule (copy), bundleThumbnail (copy), asset (copy), fFlagProfileStoreEnableFreeItemPriceLabelFixModule (copy), var8 (ref), reactModule (copy), catalogItemCard (copy), itemCardThumbnail (copy), getRbxthumbWithTypeSizeAndOptions (copy), p1 (ref)
			return reactModule.createElement(catalogItemCard, {
				LayoutOrder = p3,
				title = p2.name,
				presentationSlot = reactModule.createElement(itemCardThumbnail, {
					url = getRbxthumbWithTypeSizeAndOptions(p2.id, if p2.itemType == enumsModule.ItemTypes.Bundle then bundleThumbnail else asset, 150)
				}),
				onActivated = function() --[[ line: 69 ]]
					-- upvalues: p1 (copy), p2 (ref), p3 (ref)
					p1.openItemDetails(p2.id, p2.itemType, p3)
				end,
				priceLineContent = if fFlagProfileStoreEnableFreeItemPriceLabelFixModule then if fFlagProfileStoreEnableFreeItemPriceLabelFixModule and p2.price and p2.price == 0 then {
					type = enumsModule.PriceLineContentType.Text,
					text = var8.free
				} else p2.price and {
					type = enumsModule.PriceLineContentType.Price,
					price = p2.price
				} else p2.price and {
					type = enumsModule.PriceLineContentType.Price,
					price = p2.price
				},
				AutomaticSize = Enum.AutomaticSize.Y
			}), "ItemCard"
		end, { p1.openItemDetails }),
		getItemHeight = var7,
		title = var8.store,
		onActivateHeader = p1.navigateToCatalogSearch,
		overrides = { numColumns = p1.numColumns or 3 }
	})
end