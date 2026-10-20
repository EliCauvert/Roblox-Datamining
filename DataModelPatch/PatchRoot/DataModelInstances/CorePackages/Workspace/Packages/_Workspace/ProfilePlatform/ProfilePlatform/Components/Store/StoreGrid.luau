local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local SquareCollectionGridViewModule = require(ProfilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local CatalogItemCard = require(Parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local _ = require(ProfilePlatform.Common.AssetInfo)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FFlagProfileStoreEnableFreeItemPriceLabelFixModule = require(ProfilePlatform.Flags.FFlagProfileStoreEnableFreeItemPriceLabelFix)
local Asset = Constants.RbxthumbTypes.Asset
local BundleThumbnail = Constants.RbxthumbTypes.BundleThumbnail

local function GetItemHeight(p1: number): number
	return p1 + 49
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), EnumsModule (copy), BundleThumbnail (copy), Asset (copy), FFlagProfileStoreEnableFreeItemPriceLabelFixModule (copy), CatalogItemCard (copy), ItemCardThumbnail (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), SquareCollectionGridViewModule (copy), GetItemHeight (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		store = TextKeysModule.Store,
		free = TextKeysModule.CatalogLabelFree
	})
	
	return ReactModule.createElement(SquareCollectionGridViewModule, {
		layoutOrder = p1.layoutOrder,
		items = p1.assets,
		renderItem = ReactModule.useCallback(function(p2, LayoutOrder)
			-- upvalues: EnumsModule (upval), BundleThumbnail (upval), Asset (upval), FFlagProfileStoreEnableFreeItemPriceLabelFixModule (upval), UseLocalizationResult (copy), ReactModule (upval), CatalogItemCard (upval), ItemCardThumbnail (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), p1 (copy)
			local Config = if p2.price then if FFlagProfileStoreEnableFreeItemPriceLabelFixModule and p2.price and p2.price == 0 then {
				type = EnumsModule.PriceLineContentType.Text,
				text = UseLocalizationResult.free
			} else {
				type = EnumsModule.PriceLineContentType.Price,
				price = p2.price
			} elseif FFlagProfileStoreEnableFreeItemPriceLabelFixModule and p2.price and p2.price == 0 then {
				type = EnumsModule.PriceLineContentType.Text,
				text = UseLocalizationResult.free
			} else p2.price
			
			return ReactModule.createElement(CatalogItemCard, {
				LayoutOrder = LayoutOrder,
				title = p2.name,
				presentationSlot = ReactModule.createElement(ItemCardThumbnail, {
					url = GetRbxthumbWithTypeSizeAndOptionsFunction(p2.id, if p2.itemType == EnumsModule.ItemTypes.Bundle then BundleThumbnail else Asset, 150)
				}),
				onActivated = function()
					-- upvalues: p1 (upval), p2 (copy), LayoutOrder (copy)
					p1.openItemDetails(p2.id, p2.itemType, LayoutOrder)
				end,
				priceLineContent = if FFlagProfileStoreEnableFreeItemPriceLabelFixModule then Config else p2.price and {
					type = EnumsModule.PriceLineContentType.Price,
					price = p2.price
				},
				AutomaticSize = Enum.AutomaticSize.Y
			}), "ItemCard"
		end, { p1.openItemDetails }),
		getItemHeight = GetItemHeight,
		title = UseLocalizationResult.store,
		onActivateHeader = p1.navigateToCatalogSearch,
		overrides = { numColumns = p1.numColumns or 3 }
	})
end