local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local catalogRowItemCard = require(parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogRowItemCard
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local getPriceLineContent = require(parent.AvatarExperienceInspectAndBuy).Utils.getPriceLineContent
local view = foundationModule.View
local checkbox = foundationModule.Checkbox
local useTokens = foundationModule.Hooks.useTokens
local inputSize = foundationModule.Enums.InputSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagProfileInspectAvatarBuyAllModule = require(profilePlatform.Flags.FFlagProfileInspectAvatarBuyAll)
local _ = require(profilePlatform.Common.Types)
local itemDisplayHelpersModule = require(script.Parent.ItemDisplayHelpers)

return function(p0) --[[ line: 41 | named "CatalogItemRowCardContainer" ]]
	-- upvalues: useTokens (ref), itemDisplayHelpersModule (ref), useLocalization (ref), reactModule (ref), view (ref), fFlagProfileInspectAvatarBuyAllModule (ref), checkbox (ref), inputSize (ref), catalogRowItemCard (ref), itemCardThumbnail (ref), getPriceLineContent (ref)
	local var5 = useTokens()
	local asset = p0.asset
	local id = asset.id
	
	return reactModule.createElement(view, {
		tag = "row align-y-top gap-medium",
		Size = UDim2.new(1, 0, 0, p0.rowHeight),
		LayoutOrder = p0.index
	}, {
		ItemCheckbox = if fFlagProfileInspectAvatarBuyAllModule then nil else reactModule.createElement(checkbox, {
			label = "",
			LayoutOrder = 1,
			isChecked = p0.isPurchasable and p0.isChecked,
			isDisabled = not p0.isPurchasable,
			size = inputSize.Small,
			onActivated = function(_) --[[ line: 70 ]]
				-- upvalues: p0 (ref), id (ref)
				p0.onToggleItem(id)
			end
		}),
		ItemCard = reactModule.createElement(view, { tag = "fill size-0-full", LayoutOrder = 2 }, {
			Card = reactModule.createElement(catalogRowItemCard, {
				tag = "size-full",
				title = asset.name,
				presentationSlot = reactModule.createElement(itemCardThumbnail, { url = itemDisplayHelpersModule.getThumbnailUrl(asset) }),
				creator = if asset.creator and asset.creator.creatorName then {
					name = asset.creator.creatorName,
					verified = asset.creator.creatorHasVerifiedBadge
				} else nil,
				itemSubType = itemDisplayHelpersModule.getItemTypeDisplayName(asset, p0.localizedStrings),
				bundlePartsText = useLocalization(if itemDisplayHelpersModule.shouldShowBundleParts(asset) then {
					bundleParts = {
						"Feature.Catalog.Label.UsingBundleParts",
						count = asset.bundlePartsCount
					}
				} else {}).bundleParts,
				priceLineContent = getPriceLineContent(asset, var5, p0.priceStatusLocalized, { isShopContext = true }),
				headerSize = UDim2.fromOffset(p0.rowHeight, p0.rowHeight),
				footerSize = UDim2.fromScale(0, 1),
				footerAutomaticSize = Enum.AutomaticSize.X,
				onActivated = function() --[[ line: 99 ]]
					-- upvalues: p0 (ref), id (ref), asset (ref)
					p0.openItemDetails(id, asset.itemType or "Asset", p0.index)
				end
			})
		})
	})
end