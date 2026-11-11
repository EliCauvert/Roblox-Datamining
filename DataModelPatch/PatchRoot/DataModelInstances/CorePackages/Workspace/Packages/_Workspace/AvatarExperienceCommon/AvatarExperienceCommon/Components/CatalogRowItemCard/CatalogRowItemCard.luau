local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ItemCardComponents = require(Parent.AvatarExperienceUIKit).ItemCardComponents
local ItemCardHeader = ItemCardComponents.ItemCardHeader
local ItemCardBadge = ItemCardComponents.ItemCardBadge
local ItemCardStatus = ItemCardComponents.ItemCardStatus
local ItemCardHeaderCornersOverlay = ItemCardComponents.ItemCardHeaderCornersOverlay
local ItemCardIcon = ItemCardComponents.ItemCardIcon
local CatalogRowItemCardFooterModule = require(script.Parent.CatalogRowItemCardFooter)
local CatalogItemCardItemTypeEnumModule = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemTypeEnum)
local CatalogItemCardStatusIconTypeEnumModule = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardStatusIconTypeEnum)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagAXDurables2Option = AvatarExperienceFlagsModule.FFlagAXDurables2Option
local FFlagAXModeratedItemIconUpdates = AvatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local _ = require(AvatarExperienceCommon.Types.TimedOptionType)
local FFlagAXEnableTimedOptionsForCatalogRowCard = AvatarExperienceFlagsModule.FFlagAXEnableTimedOptionsForCatalogRowCard
local config = {
	DYNAMIC_HEAD = "icons/menu/clothing/dynamicHead",
	LIMITED = "icons/status/item/limited",
	MODERATED = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.CircleI else "icons/actions/info_small",
	PENDING_MODERATION = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.ClockDashed else "icons/status/pending_small",
	UNAVAILABLE = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.CircleI else "icons/status/warning_small",
	DURABLE = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.Clock else "icons/status/pending_small"
}
local config1 = {
	[CatalogItemCardStatusIconTypeEnumModule.Moderated] = config.MODERATED,
	[CatalogItemCardStatusIconTypeEnumModule.PendingModeration] = config.PENDING_MODERATION,
	[CatalogItemCardStatusIconTypeEnumModule.Unavailable] = config.UNAVAILABLE,
	[CatalogItemCardStatusIconTypeEnumModule.Durable] = config.DURABLE
}
local config2 = {
	[CatalogItemCardItemTypeEnumModule.Limited] = { { type = "icon", icon = config.LIMITED } },
	[CatalogItemCardItemTypeEnumModule.Collectible] = {
		{ type = "icon", icon = config.LIMITED },
		{ type = "text", text = "#" }
	}
}
local config3 = {
	[require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemInfoEnum).DynamicHead] = config.DYNAMIC_HEAD
}

return (ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: UseTokensFunction (copy), config3 (copy), config2 (copy), config1 (copy), ReactModule (copy), ItemCardHeader (copy), ItemCardHeaderCornersOverlay (copy), ItemCardBadge (copy), ItemCardStatus (copy), ItemCardIcon (copy), CatalogRowItemCardFooterModule (copy), FFlagAXDurables2Option (copy), FFlagAXDurablesForMIS (copy), FFlagAXEnableTimedOptionsForCatalogRowCard (copy)
	local Entry = if Frame.itemInfo then config3[Frame.itemInfo] else nil
	local Entry1 = if Frame.itemType then config2[Frame.itemType] else nil
	local Entry2 = if Frame.itemStatus and Frame.itemStatus.type == "icon" then config1[Frame.itemStatus.iconType] else nil
	
	return ReactModule.createElement("TextButton", {
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Event.Activated] = if Frame.isDisabled then nil else Frame.onActivated,
		ref = Ref,
		AutomaticSize = Frame.AutomaticSize,
		LayoutOrder = Frame.LayoutOrder,
		SelectionGroup = true,
		ClipsDescendants = false,
		[ReactModule.Tag] = Frame.tag
	}, {
		HorizontalLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, UseTokensFunction().Gap.Medium)
		}),
		Header = ReactModule.createElement(ItemCardHeader, {
			LayoutOrder = 1,
			aspectRatio = Frame.headerAspectRatio,
			Size = Frame.headerSize,
			overlaySlot = ReactModule.createElement(ItemCardHeaderCornersOverlay, {
				topLeftSlot = if Frame.itemStatus and Frame.itemStatus.type == "badge" then ReactModule.createElement(ItemCardBadge, {
					content = {
						{ type = "icon", icon = config1[Frame.itemStatus.iconType] },
						{ type = "text", text = Frame.itemStatus.text }
					}
				}) elseif Frame.itemStatus then if Frame.itemStatus.type == "text" then ReactModule.createElement(ItemCardStatus, { text = Frame.itemStatus.text }) elseif Entry2 then ReactModule.createElement(ItemCardIcon, { icon = Entry2 }) else nil else nil,
				bottomLeftSlot = if Entry1 then ReactModule.createElement(ItemCardBadge, { content = Entry1 }) else nil,
				bottomRightSlot = if Entry then ReactModule.createElement(ItemCardBadge, { content = { { type = "icon", icon = Entry } } }) else nil
			})
		}, Frame.presentationSlot),
		Footer = ReactModule.createElement(CatalogRowItemCardFooterModule, {
			LayoutOrder = 2,
			title = Frame.title,
			creatorName = if Frame.creator then Frame.creator.name else nil,
			bundlePartsText = Frame.bundlePartsText,
			itemSubType = Frame.itemSubType,
			creatorHasVerifiedBadge = if Frame.creator then Frame.creator.verified else nil,
			priceLineContent = Frame.priceLineContent,
			itemStatusInCheckout = if FFlagAXDurables2Option then Frame.itemStatusInCheckout else nil,
			expirationTime = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.expirationTime else nil,
			isOwned = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.isOwned else nil,
			timedOptions = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.timedOptions else nil,
			onTimedOptionPriceChanged = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.onTimedOptionPriceChanged else nil,
			selectedTimedOptionPrice = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.selectedTimedOptionPrice else nil,
			setSelectedTimedOptionPrice = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.setSelectedTimedOptionPrice else nil,
			selectedTimedOptionIndexInReducer = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.selectedTimedOptionIndexInReducer else nil,
			wearTimeSelectedOptionInList = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.wearTimeSelectedOptionInList else nil,
			onRemove = if FFlagAXDurables2Option then Frame.onRemove else nil,
			hideTimedOptionSelections = if FFlagAXDurables2Option then Frame.hideTimedOptionSelections else nil,
			Size = Frame.footerSize,
			AutomaticSize = if Frame.footerAutomaticSize then Frame.footerAutomaticSize else Enum.AutomaticSize.Y,
			offersLocalized = if FFlagAXDurables2Option then Frame.offersLocalized else nil,
			offerApplied = if FFlagAXDurables2Option then Frame.offerApplied else nil,
			showOfferPillTooltip = if FFlagAXDurables2Option then Frame.showOfferPillTooltip else nil
		})
	})
end))