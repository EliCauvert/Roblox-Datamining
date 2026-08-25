local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local builderIconsModule = require(parent.BuilderIcons)
local responsiveModule = require(parent.Responsive)
local itemCardComponents = avatarExperienceUIKitModule.ItemCardComponents
local itemCardFooter = itemCardComponents.ItemCardFooter
local itemCardHeader = itemCardComponents.ItemCardHeader
local itemCard = itemCardComponents.ItemCard
local itemCardBadge = itemCardComponents.ItemCardBadge
local itemCardStatus = itemCardComponents.ItemCardStatus
local itemCardHeaderCornersOverlay = itemCardComponents.ItemCardHeaderCornersOverlay
local _ = itemCardComponents.ItemCardPriceLine
local itemCardIcon = itemCardComponents.ItemCardIcon
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local iconSize = foundationModule.Enums.IconSize
local icon = foundationModule.Icon
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local catalogItemCardItemTypeEnumModule = require(script.Parent.Enums.CatalogItemCardItemTypeEnum)
local catalogItemCardItemInfoEnumModule = require(script.Parent.Enums.CatalogItemCardItemInfoEnum)
local catalogItemCardStatusIconTypeEnumModule = require(script.Parent.Enums.CatalogItemCardStatusIconTypeEnum)
local catalogItemCardSelectedOverlayModule = require(script.Parent.CatalogItemCardSelectedOverlay)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local moveLimitedBadgeToTopLeft = game:DefineFastFlag("MoveLimitedBadgeToTopLeft", false)
local fFlagAXRootSlotBasedEditorFlag = require(parent.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local fFlagAXMISEnableMultiShopping = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local fFlagAXInventoryDurablesSupport = avatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local fFlagAXModeratedItemIconUpdates = avatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local fFlagAXShowFaeUpsell = avatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local fFlagAXFixBadgeStatusConfigOptions = avatarExperienceFlagsModule.FFlagAXFixBadgeStatusConfigOptions
local fFlagAXSelectedBorderWrapsBackground = avatarExperienceFlagsModule.FFlagAXSelectedBorderWrapsBackground
local _ = {
	Text = "text",
	Icon = "icon",
	Badge = "badge",
	Placeholder = "placeholder"
}
local var11 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/actions/info_small"
local var12 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.ClockDashed else "icons/status/pending_small"
local var13 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.Clock else "icons/status/pending_small"
local var14 = if fFlagAXShowFaeUpsell then if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.LockClosed else "icons/status/private" else nil
local t = {
	[catalogItemCardStatusIconTypeEnumModule.Moderated] = var11,
	[catalogItemCardStatusIconTypeEnumModule.PendingModeration] = var12,
	[catalogItemCardStatusIconTypeEnumModule.Durable] = var13,
	[catalogItemCardStatusIconTypeEnumModule.Info] = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/actions/info_small",
	[catalogItemCardStatusIconTypeEnumModule.Unavailable] = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/status/warning_small",
	[catalogItemCardStatusIconTypeEnumModule.Error] = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.TriangleExclamation else "icons/status/error_large",
	[catalogItemCardStatusIconTypeEnumModule.FAE] = var14
}
local t_1 = {
	[catalogItemCardItemTypeEnumModule.Limited] = { { type = "icon", icon = "icons/status/item/limited" } },
	[catalogItemCardItemTypeEnumModule.Collectible] = {
		{ type = "icon", icon = "icons/status/item/limited" },
		{ type = "text", text = "#" }
	}
}
local t_2 = {
	[catalogItemCardItemInfoEnumModule.DynamicHead] = "icons/menu/clothing/dynamicHead"
}

local function selectIsPortrait(p0)
	-- upvalues: responsiveModule (ref)
	return p0.DeviceOrientation == responsiveModule.Keys.Portrait
end

local function buildBadgeStatusContent(p1, p2)
	local list = { { type = "icon", icon = p1 } }
	
	if p2 then
		table.insert(list, { type = "text", text = p2 })
	end
	return list
end

local function buildSelectedOverlayBadge(p3, p4, p5)
	-- upvalues: fFlagAXShowFaeUpsell (ref), catalogItemCardStatusIconTypeEnumModule (ref), var14 (ref), fFlagAXInventoryDurablesSupport (ref), var13 (ref)
	local iconType = p3 and p3.iconType
	local text = p3 and p3.text
	
	return if fFlagAXShowFaeUpsell and iconType == catalogItemCardStatusIconTypeEnumModule.FAE then { icon = var14 } elseif p4 and text then { icon = p4, text = text } elseif fFlagAXInventoryDurablesSupport and p5 and iconType ~= catalogItemCardStatusIconTypeEnumModule.Moderated then { icon = var13, text = p5 } else nil
end

return reactModule.forwardRef(function(p6, p7)
	-- upvalues: fFlagAXModeratedItemIconUpdates (ref), useTokens (ref), t_2 (ref), t_1 (ref), useSelector (ref), selectIsPortrait (ref), t (ref), fFlagAXSelectedBorderWrapsBackground (ref), reactModule (ref), foundationModule (ref), icon (ref), iconSize (ref), itemCard (ref), fFlagAXMISEnableMultiShopping (ref), itemCardHeader (ref), catalogItemCardSelectedOverlayModule (ref), fFlagAXFixBadgeStatusConfigOptions (ref), buildSelectedOverlayBadge (ref), fFlagAXShowFaeUpsell (ref), catalogItemCardStatusIconTypeEnumModule (ref), var14 (ref), fFlagAXInventoryDurablesSupport (ref), var13 (ref), itemCardHeaderCornersOverlay (ref), itemCardStatus (ref), itemCardBadge (ref), buildBadgeStatusContent (ref), itemCardIcon (ref), moveLimitedBadgeToTopLeft (ref), itemCardFooter (ref), fFlagAXRootSlotBasedEditorFlag (ref)
	local var30
	local var24 = if fFlagAXModeratedItemIconUpdates then useTokens() else nil
	local title = p6.title or (p6.creator or p6.priceLineContent)
	local var26 = if p6.itemInfo then t_2[p6.itemInfo] else nil
	local var27 = if p6.itemType then t_1[p6.itemType] else nil
	local var28 = if fFlagAXModeratedItemIconUpdates then useSelector(selectIsPortrait) else nil
	local var29 = if p6.itemStatus and (p6.itemStatus.type == "icon" or p6.itemStatus.type == "badge") and p6.itemStatus.iconType then t[p6.itemStatus.iconType] else nil
	local backgroundLayers = p6.backgroundLayers
	
	if fFlagAXSelectedBorderWrapsBackground then
		var30 = false
		
		if backgroundLayers ~= nil then
			local _ = #backgroundLayers > 0
		end
	else
		var30 = nil
	end
	local createElement_2
	local function renderPresentationSlot()
		-- upvalues: p6 (ref), reactModule (copy), foundationModule (copy), fFlagAXModeratedItemIconUpdates (copy), icon (copy), t (copy), var24 (ref), var28 (ref), iconSize (copy)
		return if not (not p6.itemStatus or p6.itemStatus.type ~= "placeholder") then if p6.itemStatus.iconType then reactModule.createElement(foundationModule.View, {
			tag = "size-full clip radius-medium row align-x-center align-y-center"
		}, {
			icon = if fFlagAXModeratedItemIconUpdates then reactModule.createElement(icon, {
				name = t[p6.itemStatus.iconType],
				style = var24.Color.Content.Muted,
				size = if var28 then iconSize.Large else 40
			}) else reactModule.createElement(foundationModule.Image, {
				Image = t[p6.itemStatus.iconType],
				Size = UDim2.fromScale(0.33, 0.33)
			})
		}) else nil else p6.presentationSlot
	end
	
	local createElement = reactModule.createElement
	local t_3 = {
		onActivated = p6.onActivated,
		isDisabled = p6.isDisabled,
		ref = p7,
		Size = p6.Size,
		AutomaticSize = p6.AutomaticSize,
		LayoutOrder = p6.LayoutOrder,
		tag = p6.tag,
		Selectable = if fFlagAXMISEnableMultiShopping then p6.Selectable else nil,
		showSelectionBorderWithBackground = if fFlagAXSelectedBorderWrapsBackground then p6.isSelected else nil,
		backgroundLayers = backgroundLayers,
		imageScaleType = p6.imageScaleType
	}
	local createElement_1 = reactModule.createElement
	local var33 = itemCardHeader
	local t_4 = { aspectRatio = p6.headerAspectRatio }
	
	if p6.isSelected then
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(catalogItemCardSelectedOverlayModule, if p6.onOverlayButtonActivated and p6.overlayButtonText then {
			onActivated = p6.onOverlayButtonActivated,
			buttonText = p6.overlayButtonText,
			suppressBorder = if fFlagAXSelectedBorderWrapsBackground then var30 else nil,
			badge = if fFlagAXFixBadgeStatusConfigOptions then buildSelectedOverlayBadge(p6.itemStatus, var29, p6.expirationTime) elseif fFlagAXShowFaeUpsell and p6.itemStatus and p6.itemStatus.iconType == catalogItemCardStatusIconTypeEnumModule.FAE then { icon = var14 } elseif var29 and p6.itemStatus and p6.itemStatus.text then { icon = var29, text = p6.itemStatus.text } elseif fFlagAXInventoryDurablesSupport and p6.expirationTime and (not p6.itemStatus or p6.itemStatus.iconType ~= catalogItemCardStatusIconTypeEnumModule.Moderated) then { icon = var13, text = p6.expirationTime } else nil
		} elseif fFlagAXInventoryDurablesSupport and var29 then {
			itemStatusIcon = var29,
			suppressBorder = if fFlagAXSelectedBorderWrapsBackground then var30 else nil
		} elseif fFlagAXSelectedBorderWrapsBackground and var30 then { suppressBorder = true } else nil)
	else
		local createElement_3
		createElement_2 = reactModule.createElement
		local var35 = itemCardHeaderCornersOverlay
		local t_5 = {}
		
		if p6.itemStatus then
			if p6.itemStatus.type == "text" and p6.itemStatus.text then
				createElement_3 = reactModule.createElement(itemCardStatus, { text = p6.itemStatus.text })
			elseif p6.itemStatus.type == "badge" then
				createElement_3 = reactModule.createElement
				createElement_3 = createElement_3(itemCardBadge, {
					displayBorder = true,
					content = if fFlagAXFixBadgeStatusConfigOptions or fFlagAXShowFaeUpsell then buildBadgeStatusContent(var29, p6.itemStatus.text) else {
						{ type = "icon", icon = var29 },
						{ type = "text", text = p6.itemStatus.text }
					}
				})
			else
				createElement_3 = if var29 then reactModule.createElement(itemCardIcon, { icon = var29 }) else nil
			end
		createElement_3 = if fFlagAXInventoryDurablesSupport and p6.expirationTime then reactModule.createElement(itemCardBadge, {
			displayBorder = true,
			content = {
				{ type = "icon", icon = var13 },
				{ type = "text", text = p6.expirationTime }
			}
		}) elseif moveLimitedBadgeToTopLeft and var27 then reactModule.createElement(itemCardBadge, { content = var27 }) else nil
		t_5.topLeftSlot = createElement_3
		t_5.bottomLeftSlot = if moveLimitedBadgeToTopLeft or not var27 then nil else reactModule.createElement(itemCardBadge, { content = var27 })
		t_5.bottomRightSlot = if var26 then reactModule.createElement(itemCardBadge, { content = { { type = "icon", icon = var26 } } }) else nil
		createElement_2 = createElement_2(var35, t_5)
	end
	t_4.overlaySlot = createElement_2
	t_4.BackgroundTransparency = if backgroundLayers then 1 else nil
	t_4.Size = p6.headerSize
	t_3.headerSlot = createElement_1(var33, t_4, renderPresentationSlot())
	t_3.footerSlot = if title then reactModule.createElement(itemCardFooter, {
		LayoutOrder = 2,
		title = p6.title,
		creatorName = if p6.creator then p6.creator.name else nil,
		creatorHasVerifiedBadge = if p6.creator then p6.creator.verified else nil,
		priceLineContent = p6.priceLineContent,
		titleTextSize = if fFlagAXRootSlotBasedEditorFlag then p6.titleTextSize else nil
	}) else nil
	
	return createElement(itemCard, t_3)
end)