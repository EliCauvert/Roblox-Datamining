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

return reactModule.forwardRef(function(p0, p1) --[[ line: 124 ]]
	-- upvalues: useTokens (ref), t_3 (ref), t_2 (ref), t_1 (ref), reactModule (ref), itemCardHeader (ref), itemCardHeaderCornersOverlay (ref), itemCardBadge (ref), itemCardStatus (ref), itemCardIcon (ref), catalogRowItemCardFooterModule (ref), fFlagAXDurablesForMIS (ref), fFlagAXEnableTimedOptionsForCatalogRowCard (ref), fFlagAXDurables2Option (ref)
	local var12 = useTokens()
	local var13 = if p0.itemInfo then t_3[p0.itemInfo] else nil
	local var14 = if p0.itemType then t_2[p0.itemType] else nil
	local var15 = if p0.itemStatus and p0.itemStatus.type == "icon" then t_1[p0.itemStatus.iconType] else nil
	
	return reactModule.createElement("TextButton", {
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = if p0.isDisabled then nil else p0.onActivated,
		ref = p1,
		AutomaticSize = p0.AutomaticSize,
		LayoutOrder = p0.LayoutOrder,
		SelectionGroup = true,
		ClipsDescendants = false,
		[reactModule.Tag] = p0.tag
	}, {
		HorizontalLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, var12.Gap.Medium)
		}),
		Header = reactModule.createElement(itemCardHeader, {
			LayoutOrder = 1,
			aspectRatio = p0.headerAspectRatio,
			Size = p0.headerSize,
			overlaySlot = reactModule.createElement(itemCardHeaderCornersOverlay, {
				topLeftSlot = if p0.itemStatus and p0.itemStatus.type == "badge" then reactModule.createElement(itemCardBadge, {
					content = {
						{ type = "icon", icon = t_1[p0.itemStatus.iconType] },
						{ type = "text", text = p0.itemStatus.text }
					}
				}) elseif p0.itemStatus then if p0.itemStatus.type == "text" then reactModule.createElement(itemCardStatus, { text = p0.itemStatus.text }) elseif var15 then reactModule.createElement(itemCardIcon, { icon = var15 }) else nil else nil,
				bottomLeftSlot = if var14 then reactModule.createElement(itemCardBadge, { content = var14 }) else nil,
				bottomRightSlot = if var13 then reactModule.createElement(itemCardBadge, { content = { { type = "icon", icon = var13 } } }) else nil
			})
		}, p0.presentationSlot),
		Footer = reactModule.createElement(catalogRowItemCardFooterModule, {
			LayoutOrder = 2,
			title = p0.title,
			creatorName = if p0.creator then p0.creator.name else nil,
			bundlePartsText = p0.bundlePartsText,
			itemSubType = p0.itemSubType,
			creatorHasVerifiedBadge = if p0.creator then p0.creator.verified else nil,
			priceLineContent = p0.priceLineContent,
			expirationTime = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p0.expirationTime else nil,
			isOwned = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p0.isOwned else nil,
			timedOptions = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p0.timedOptions else nil,
			onTimedOptionPriceChanged = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p0.onTimedOptionPriceChanged else nil,
			selectedTimedOptionPrice = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p0.selectedTimedOptionPrice else nil,
			setSelectedTimedOptionPrice = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p0.setSelectedTimedOptionPrice else nil,
			selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p0.selectedTimedOptionIndexInReducer else nil,
			wearTimeSelectedOptionInList = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p0.wearTimeSelectedOptionInList else nil,
			wearTimeOptionButton = if fFlagAXDurables2Option then p0.wearTimeOptionButton else nil,
			onRemove = if fFlagAXDurables2Option then p0.onRemove else nil,
			Size = p0.footerSize,
			AutomaticSize = if p0.footerAutomaticSize then p0.footerAutomaticSize else Enum.AutomaticSize.Y
		})
	})
end)