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
local var1 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/actions/info_small"
local var2 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.ClockDashed else "icons/status/pending_small"
local var3 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.Clock else "icons/status/pending_small"
local var4 = if fFlagAXShowFaeUpsell then if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.LockClosed else "icons/status/private" else nil
local t = {
	[catalogItemCardStatusIconTypeEnumModule.Moderated] = var1,
	[catalogItemCardStatusIconTypeEnumModule.PendingModeration] = var2,
	[catalogItemCardStatusIconTypeEnumModule.Durable] = var3,
	[catalogItemCardStatusIconTypeEnumModule.Info] = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/actions/info_small",
	[catalogItemCardStatusIconTypeEnumModule.Unavailable] = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/status/warning_small",
	[catalogItemCardStatusIconTypeEnumModule.Error] = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.TriangleExclamation else "icons/status/error_large",
	[catalogItemCardStatusIconTypeEnumModule.FAE] = var4
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

local function selectIsPortrait(p1)
	-- upvalues: responsiveModule (ref)
	return p1.DeviceOrientation == responsiveModule.Keys.Portrait
end

local function buildBadgeStatusContent(p1, p2)
	local list = { { type = "icon", icon = p1 } }
	
	if p2 then
		table.insert(list, { type = "text", text = p2 })
	end
	return list
end

local function buildSelectedOverlayBadge(p1, p2, p3)
	-- upvalues: fFlagAXShowFaeUpsell (ref), catalogItemCardStatusIconTypeEnumModule (ref), var4 (ref), fFlagAXInventoryDurablesSupport (ref), var3 (ref)
	local iconType = p1 and p1.iconType
	local text = p1 and p1.text
	
	return if fFlagAXShowFaeUpsell and iconType == catalogItemCardStatusIconTypeEnumModule.FAE then { icon = var4 } elseif p2 and text then { icon = p2, text = text } elseif fFlagAXInventoryDurablesSupport and p3 and iconType ~= catalogItemCardStatusIconTypeEnumModule.Moderated then { icon = var3, text = p3 } else nil
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: fFlagAXModeratedItemIconUpdates (ref), useTokens (ref), t_2 (ref), t_1 (ref), useSelector (ref), selectIsPortrait (ref), t (ref), fFlagAXSelectedBorderWrapsBackground (ref), reactModule (ref), foundationModule (ref), icon (ref), iconSize (ref), itemCard (ref), fFlagAXMISEnableMultiShopping (ref), itemCardHeader (ref), catalogItemCardSelectedOverlayModule (ref), fFlagAXFixBadgeStatusConfigOptions (ref), buildSelectedOverlayBadge (ref), fFlagAXShowFaeUpsell (ref), catalogItemCardStatusIconTypeEnumModule (ref), var4 (ref), fFlagAXInventoryDurablesSupport (ref), var3 (ref), itemCardHeaderCornersOverlay (ref), itemCardStatus (ref), itemCardBadge (ref), buildBadgeStatusContent (ref), itemCardIcon (ref), moveLimitedBadgeToTopLeft (ref), itemCardFooter (ref), fFlagAXRootSlotBasedEditorFlag (ref)
	local var5
	local var6 = if fFlagAXModeratedItemIconUpdates then useTokens() else nil
	local title = p1.title or (p1.creator or p1.priceLineContent)
	local var7 = if p1.itemInfo then t_2[p1.itemInfo] else nil
	local var8 = if p1.itemType then t_1[p1.itemType] else nil
	local var9 = if fFlagAXModeratedItemIconUpdates then useSelector(selectIsPortrait) else nil
	local var10 = if p1.itemStatus and (p1.itemStatus.type == "icon" or p1.itemStatus.type == "badge") and p1.itemStatus.iconType then t[p1.itemStatus.iconType] else nil
	local backgroundLayers = p1.backgroundLayers
	
	if fFlagAXSelectedBorderWrapsBackground then
		var5 = false
		
		if backgroundLayers ~= nil then
			local _ = #backgroundLayers > 0
		end
	else
		var5 = nil
	end
	local createElement_2
	local function renderPresentationSlot()
		-- upvalues: p1 (ref), reactModule (copy), foundationModule (copy), fFlagAXModeratedItemIconUpdates (copy), icon (copy), t (copy), var6 (ref), var9 (ref), iconSize (copy)
		return if not (not p1.itemStatus or p1.itemStatus.type ~= "placeholder") then if p1.itemStatus.iconType then reactModule.createElement(foundationModule.View, {
			tag = "size-full clip radius-medium row align-x-center align-y-center"
		}, {
			icon = if fFlagAXModeratedItemIconUpdates then reactModule.createElement(icon, {
				name = t[p1.itemStatus.iconType],
				style = var6.Color.Content.Muted,
				size = if var9 then iconSize.Large else 40
			}) else reactModule.createElement(foundationModule.Image, {
				Image = t[p1.itemStatus.iconType],
				Size = UDim2.fromScale(0.33, 0.33)
			})
		}) else nil else p1.presentationSlot
	end
	
	local createElement = reactModule.createElement
	local t_3 = {
		onActivated = p1.onActivated,
		isDisabled = p1.isDisabled,
		ref = p2,
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize,
		LayoutOrder = p1.LayoutOrder,
		tag = p1.tag,
		Selectable = if fFlagAXMISEnableMultiShopping then p1.Selectable else nil,
		showSelectionBorderWithBackground = if fFlagAXSelectedBorderWrapsBackground then p1.isSelected else nil,
		backgroundLayers = backgroundLayers,
		imageScaleType = p1.imageScaleType
	}
	local createElement_1 = reactModule.createElement
	local var11 = itemCardHeader
	local t_4 = { aspectRatio = p1.headerAspectRatio }
	
	if p1.isSelected then
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(catalogItemCardSelectedOverlayModule, if p1.onOverlayButtonActivated and p1.overlayButtonText then {
			onActivated = p1.onOverlayButtonActivated,
			buttonText = p1.overlayButtonText,
			suppressBorder = if fFlagAXSelectedBorderWrapsBackground then var5 else nil,
			badge = if fFlagAXFixBadgeStatusConfigOptions then buildSelectedOverlayBadge(p1.itemStatus, var10, p1.expirationTime) elseif fFlagAXShowFaeUpsell and p1.itemStatus and p1.itemStatus.iconType == catalogItemCardStatusIconTypeEnumModule.FAE then { icon = var4 } elseif var10 and p1.itemStatus and p1.itemStatus.text then { icon = var10, text = p1.itemStatus.text } elseif fFlagAXInventoryDurablesSupport and p1.expirationTime and (not p1.itemStatus or p1.itemStatus.iconType ~= catalogItemCardStatusIconTypeEnumModule.Moderated) then { icon = var3, text = p1.expirationTime } else nil
		} elseif fFlagAXInventoryDurablesSupport and var10 then {
			itemStatusIcon = var10,
			suppressBorder = if fFlagAXSelectedBorderWrapsBackground then var5 else nil
		} elseif fFlagAXSelectedBorderWrapsBackground and var5 then { suppressBorder = true } else nil)
	else
		local createElement_3
		createElement_2 = reactModule.createElement
		local var12 = itemCardHeaderCornersOverlay
		local t_5 = {}
		
		if p1.itemStatus then
			if p1.itemStatus.type == "text" and p1.itemStatus.text then
				createElement_3 = reactModule.createElement(itemCardStatus, { text = p1.itemStatus.text })
			elseif p1.itemStatus.type == "badge" then
				createElement_3 = reactModule.createElement
				createElement_3 = createElement_3(itemCardBadge, {
					displayBorder = true,
					content = if fFlagAXFixBadgeStatusConfigOptions or fFlagAXShowFaeUpsell then buildBadgeStatusContent(var10, p1.itemStatus.text) else {
						{ type = "icon", icon = var10 },
						{ type = "text", text = p1.itemStatus.text }
					}
				})
			else
				createElement_3 = if var10 then reactModule.createElement(itemCardIcon, { icon = var10 }) else nil
			end
		createElement_3 = if fFlagAXInventoryDurablesSupport and p1.expirationTime then reactModule.createElement(itemCardBadge, {
			displayBorder = true,
			content = {
				{ type = "icon", icon = var3 },
				{ type = "text", text = p1.expirationTime }
			}
		}) elseif moveLimitedBadgeToTopLeft and var8 then reactModule.createElement(itemCardBadge, { content = var8 }) else nil
		t_5.topLeftSlot = createElement_3
		t_5.bottomLeftSlot = if moveLimitedBadgeToTopLeft or not var8 then nil else reactModule.createElement(itemCardBadge, { content = var8 })
		t_5.bottomRightSlot = if var7 then reactModule.createElement(itemCardBadge, { content = { { type = "icon", icon = var7 } } }) else nil
		createElement_2 = createElement_2(var12, t_5)
	end
	t_4.overlaySlot = createElement_2
	t_4.BackgroundTransparency = if backgroundLayers then 1 else nil
	t_4.Size = p1.headerSize
	t_3.headerSlot = createElement_1(var11, t_4, renderPresentationSlot())
	t_3.footerSlot = if title then reactModule.createElement(itemCardFooter, {
		LayoutOrder = 2,
		title = p1.title,
		creatorName = if p1.creator then p1.creator.name else nil,
		creatorHasVerifiedBadge = if p1.creator then p1.creator.verified else nil,
		priceLineContent = p1.priceLineContent,
		titleTextSize = if fFlagAXRootSlotBasedEditorFlag then p1.titleTextSize else nil
	}) else nil
	
	return createElement(itemCard, t_3)
end)