local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CatalogRowItemCard = require(Parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogRowItemCard
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local GetPriceLineContentFunction = require(Parent.AvatarExperienceInspectAndBuy).Utils.getPriceLineContent
local View = FoundationModule.View
local Checkbox = FoundationModule.Checkbox
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagProfileInspectAvatarBuyAllModule = require(ProfilePlatform.Flags.FFlagProfileInspectAvatarBuyAll)
local _ = require(ProfilePlatform.Common.Types)
local ItemDisplayHelpersModule = require(script.Parent.ItemDisplayHelpers)

return function(p1) --[[ Line: 41 | Named "CatalogItemRowCardContainer" ]]
	-- upvalues: UseTokensFunction (copy), ItemDisplayHelpersModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), FFlagProfileInspectAvatarBuyAllModule (copy), Checkbox (copy), InputSize (copy), CatalogRowItemCard (copy), ItemCardThumbnail (copy), GetPriceLineContentFunction (copy)
	local Asset = p1.asset
	local Id = Asset.id
	
	return ReactModule.createElement(View, {
		tag = "row align-y-top gap-medium",
		Size = UDim2.new(1, 0, 0, p1.rowHeight),
		LayoutOrder = p1.index
	}, {
		ItemCheckbox = if FFlagProfileInspectAvatarBuyAllModule then nil else ReactModule.createElement(Checkbox, {
			label = "",
			LayoutOrder = 1,
			isChecked = p1.isPurchasable and p1.isChecked,
			isDisabled = not p1.isPurchasable,
			size = InputSize.Small,
			onActivated = function(_) --[[ Line: 70 ]]
				-- upvalues: p1 (copy), Id (copy)
				p1.onToggleItem(Id)
			end
		}),
		ItemCard = ReactModule.createElement(View, { tag = "fill size-0-full", LayoutOrder = 2 }, {
			Card = ReactModule.createElement(CatalogRowItemCard, {
				tag = "size-full",
				title = Asset.name,
				presentationSlot = ReactModule.createElement(ItemCardThumbnail, { url = ItemDisplayHelpersModule.getThumbnailUrl(Asset) }),
				creator = if Asset.creator and Asset.creator.creatorName then {
					name = Asset.creator.creatorName,
					verified = Asset.creator.creatorHasVerifiedBadge
				} else nil,
				itemSubType = ItemDisplayHelpersModule.getItemTypeDisplayName(Asset, p1.localizedStrings),
				bundlePartsText = UseLocalizationFunction(if ItemDisplayHelpersModule.shouldShowBundleParts(Asset) then {
					bundleParts = {
						"Feature.Catalog.Label.UsingBundleParts",
						count = Asset.bundlePartsCount
					}
				} else {}).bundleParts,
				priceLineContent = GetPriceLineContentFunction(Asset, UseTokensFunction(), p1.priceStatusLocalized, { isShopContext = true }),
				headerSize = UDim2.fromOffset(p1.rowHeight, p1.rowHeight),
				footerSize = UDim2.fromScale(0, 1),
				footerAutomaticSize = Enum.AutomaticSize.X,
				onActivated = function() --[[ Line: 99 ]]
					-- upvalues: p1 (copy), Id (copy), Asset (copy)
					p1.openItemDetails(Id, Asset.itemType or "Asset", p1.index)
				end
			})
		})
	})
end