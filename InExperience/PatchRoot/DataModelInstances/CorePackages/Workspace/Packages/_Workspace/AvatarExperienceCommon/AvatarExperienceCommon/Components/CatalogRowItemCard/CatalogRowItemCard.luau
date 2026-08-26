local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local useTokens = require(parent.Foundation).Hooks.useTokens
local itemCardComponents = require(parent.AvatarExperienceUIKit).ItemCardComponents
local itemCardHeader = itemCardComponents.ItemCardHeader
local itemCardBadge = itemCardComponents.ItemCardBadge
local itemCardStatus = itemCardComponents.ItemCardStatus
local itemCardHeaderCornersOverlay = itemCardComponents.ItemCardHeaderCornersOverlay
local itemCardIcon = itemCardComponents.ItemCardIcon
local catalogRowItemCardFooterModule = require(script.Parent.CatalogRowItemCardFooter)
local catalogItemCardItemTypeEnumModule = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemTypeEnum)
local catalogItemCardItemInfoEnumModule = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemInfoEnum)
local catalogItemCardStatusIconTypeEnumModule = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardStatusIconTypeEnum)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXDurablesForMIS = avatarExperienceFlagsModule.FFlagAXDurablesForMIS
local fFlagAXDurables2Option = avatarExperienceFlagsModule.FFlagAXDurables2Option
local fFlagAXModeratedItemIconUpdates = avatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local _ = require(avatarExperienceCommon.Types.TimedOptionType)
local fFlagAXEnableTimedOptionsForCatalogRowCard = avatarExperienceFlagsModule.FFlagAXEnableTimedOptionsForCatalogRowCard
local t = {
	DYNAMIC_HEAD = "icons/menu/clothing/dynamicHead",
	LIMITED = "icons/status/item/limited",
	MODERATED = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/actions/info_small",
	PENDING_MODERATION = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.ClockDashed else "icons/status/pending_small",
	UNAVAILABLE = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/status/warning_small",
	DURABLE = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.Clock else "icons/status/pending_small"
}
local t_1 = {
	[catalogItemCardStatusIconTypeEnumModule.Moderated] = t.MODERATED,
	[catalogItemCardStatusIconTypeEnumModule.PendingModeration] = t.PENDING_MODERATION,
	[catalogItemCardStatusIconTypeEnumModule.Unavailable] = t.UNAVAILABLE,
	[catalogItemCardStatusIconTypeEnumModule.Durable] = t.DURABLE
}
local t_2 = {
	[catalogItemCardItemTypeEnumModule.Limited] = { { type = "icon", icon = t.LIMITED } },
	[catalogItemCardItemTypeEnumModule.Collectible] = {
		{ type = "icon", icon = t.LIMITED },
		{ type = "text", text = "#" }
	}
}
local t_3 = {
	[catalogItemCardItemInfoEnumModule.DynamicHead] = t.DYNAMIC_HEAD
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), t_3 (ref), t_2 (ref), t_1 (ref), reactModule (ref), itemCardHeader (ref), itemCardHeaderCornersOverlay (ref), itemCardBadge (ref), itemCardStatus (ref), itemCardIcon (ref), catalogRowItemCardFooterModule (ref), fFlagAXDurables2Option (ref), fFlagAXDurablesForMIS (ref), fFlagAXEnableTimedOptionsForCatalogRowCard (ref)
	local var1 = useTokens()
	local var2 = if p1.itemInfo then t_3[p1.itemInfo] else nil
	local var3 = if p1.itemType then t_2[p1.itemType] else nil
	local var4 = if p1.itemStatus and p1.itemStatus.type == "icon" then t_1[p1.itemStatus.iconType] else nil
	
	return reactModule.createElement("TextButton", {
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = if p1.isDisabled then nil else p1.onActivated,
		ref = p2,
		AutomaticSize = p1.AutomaticSize,
		LayoutOrder = p1.LayoutOrder,
		SelectionGroup = true,
		ClipsDescendants = false,
		[reactModule.Tag] = p1.tag
	}, {
		HorizontalLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, var1.Gap.Medium)
		}),
		Header = reactModule.createElement(itemCardHeader, {
			LayoutOrder = 1,
			aspectRatio = p1.headerAspectRatio,
			Size = p1.headerSize,
			overlaySlot = reactModule.createElement(itemCardHeaderCornersOverlay, {
				topLeftSlot = if p1.itemStatus and p1.itemStatus.type == "badge" then reactModule.createElement(itemCardBadge, {
					content = {
						{ type = "icon", icon = t_1[p1.itemStatus.iconType] },
						{ type = "text", text = p1.itemStatus.text }
					}
				}) elseif p1.itemStatus then if p1.itemStatus.type == "text" then reactModule.createElement(itemCardStatus, { text = p1.itemStatus.text }) elseif var4 then reactModule.createElement(itemCardIcon, { icon = var4 }) else nil else nil,
				bottomLeftSlot = if var3 then reactModule.createElement(itemCardBadge, { content = var3 }) else nil,
				bottomRightSlot = if var2 then reactModule.createElement(itemCardBadge, { content = { { type = "icon", icon = var2 } } }) else nil
			})
		}, p1.presentationSlot),
		Footer = reactModule.createElement(catalogRowItemCardFooterModule, {
			LayoutOrder = 2,
			title = p1.title,
			creatorName = if p1.creator then p1.creator.name else nil,
			bundlePartsText = p1.bundlePartsText,
			itemSubType = p1.itemSubType,
			creatorHasVerifiedBadge = if p1.creator then p1.creator.verified else nil,
			priceLineContent = p1.priceLineContent,
			itemStatusInCheckout = if fFlagAXDurables2Option then p1.itemStatusInCheckout else nil,
			expirationTime = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p1.expirationTime else nil,
			isOwned = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p1.isOwned else nil,
			timedOptions = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p1.timedOptions else nil,
			onTimedOptionPriceChanged = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p1.onTimedOptionPriceChanged else nil,
			selectedTimedOptionPrice = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p1.selectedTimedOptionPrice else nil,
			setSelectedTimedOptionPrice = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p1.setSelectedTimedOptionPrice else nil,
			selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p1.selectedTimedOptionIndexInReducer else nil,
			wearTimeSelectedOptionInList = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p1.wearTimeSelectedOptionInList else nil,
			onRemove = if fFlagAXDurables2Option then p1.onRemove else nil,
			hideTimedOptionSelections = if fFlagAXDurables2Option then p1.hideTimedOptionSelections else nil,
			Size = p1.footerSize,
			AutomaticSize = if p1.footerAutomaticSize then p1.footerAutomaticSize else Enum.AutomaticSize.Y,
			offersLocalized = if fFlagAXDurables2Option then p1.offersLocalized else nil,
			offerApplied = if fFlagAXDurables2Option then p1.offerApplied else nil,
			showOfferPillTooltip = if fFlagAXDurables2Option then p1.showOfferPillTooltip else nil
		})
	})
end)