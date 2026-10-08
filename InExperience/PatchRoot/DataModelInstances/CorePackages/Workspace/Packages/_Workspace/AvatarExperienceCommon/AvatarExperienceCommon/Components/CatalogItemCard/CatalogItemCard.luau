local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local itemCardComponents = require(parent.AvatarExperienceUIKit).ItemCardComponents
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
local badgeSize = foundationModule.Enums.BadgeSize
local iconSize = foundationModule.Enums.IconSize
local icon = foundationModule.Icon
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local indicatorStackModule = require(avatarExperienceCommon.Components.IndicatorStack.IndicatorStack)
local shouldRenderIndicatorStackModule = require(avatarExperienceCommon.Utils.shouldRenderIndicatorStack)
local licensingBadgeModule = require(avatarExperienceCommon.Components.LicensingBadge.LicensingBadge)
local _ = require(script.Parent.Enums.CatalogItemCardItemTypeEnum)
local _ = require(script.Parent.Enums.CatalogItemCardItemInfoEnum)
local catalogItemCardStatusIconTypeEnumModule = require(script.Parent.Enums.CatalogItemCardStatusIconTypeEnum)
local itemStatusTypeEnumModule = require(script.Parent.Enums.ItemStatusTypeEnum)
local catalogItemCardBadgeMapsModule = require(script.Parent.CatalogItemCardBadgeMaps)
local catalogItemCardSelectedOverlayModule = require(script.Parent.CatalogItemCardSelectedOverlay)
local useSelectedOverlayButtonModule = require(script.Parent.useSelectedOverlayButton)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXInventoryDurablesSupport = avatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local fFlagAXModeratedItemIconUpdates = avatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local fFlagAXShowFaeUpsell = avatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local fFlagAXFixBadgeStatusConfigOptions = avatarExperienceFlagsModule.FFlagAXFixBadgeStatusConfigOptions
local fFlagAXRemoveDynamicHeadBadge = avatarExperienceFlagsModule.FFlagAXRemoveDynamicHeadBadge
local fFlagAXMarketplaceItemCardIndicatorStack = avatarExperienceFlagsModule.FFlagAXMarketplaceItemCardIndicatorStack
local fFlagAXMarketplaceLicensingItemCards = avatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemCards
local _ = require(parent.AvatarExperienceModel)
local DURABLE_ICON = catalogItemCardBadgeMapsModule.DURABLE_ICON
local FAE_ICON = catalogItemCardBadgeMapsModule.FAE_ICON
local itemTypeToContentMap = catalogItemCardBadgeMapsModule.itemTypeToContentMap
local itemInfoIconMap = catalogItemCardBadgeMapsModule.itemInfoIconMap
local itemStatusIconTypeToIconMap = catalogItemCardBadgeMapsModule.itemStatusIconTypeToIconMap

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

local function buildItemStatusContent(p1, p2, p3, p4)
	-- upvalues: itemStatusTypeEnumModule (ref), fFlagAXFixBadgeStatusConfigOptions (ref), fFlagAXShowFaeUpsell (ref), buildBadgeStatusContent (ref), catalogItemCardStatusIconTypeEnumModule (ref), fFlagAXInventoryDurablesSupport (ref), DURABLE_ICON (ref)
	if p1 then
		local var1 = if p1.type ~= itemStatusTypeEnumModule.Badge then if fFlagAXFixBadgeStatusConfigOptions or fFlagAXShowFaeUpsell then buildBadgeStatusContent(p2, p1.text) else {
			{ type = "icon", icon = p2 },
			{ type = "text", text = p1.text }
		} else nil
		
		return if p1.type == itemStatusTypeEnumModule.Text and p1.text then { type = "text", text = p1.text } elseif p1.type == itemStatusTypeEnumModule.Badge and var1 then { type = "badge", displayBorder = true, content = var1 } elseif p2 then { type = "icon", icon = p2 } elseif not (not p4 or p1.iconType == catalogItemCardStatusIconTypeEnumModule.Moderated) then if fFlagAXInventoryDurablesSupport and p3 then {
			type = "badge",
			displayBorder = true,
			content = {
				{ type = "icon", icon = DURABLE_ICON },
				{ type = "text", text = p3 }
			}
		} else nil else nil
	end
end

local function buildSelectedOverlayBadge(p1, p2, p3)
	-- upvalues: fFlagAXShowFaeUpsell (ref), catalogItemCardStatusIconTypeEnumModule (ref), FAE_ICON (ref), fFlagAXInventoryDurablesSupport (ref), DURABLE_ICON (ref)
	local iconType = p1 and p1.iconType
	local text = p1 and p1.text
	
	return if fFlagAXShowFaeUpsell and iconType == catalogItemCardStatusIconTypeEnumModule.FAE then { icon = FAE_ICON } elseif p2 and text then { icon = p2, text = text } elseif fFlagAXInventoryDurablesSupport and p3 and iconType ~= catalogItemCardStatusIconTypeEnumModule.Moderated then { icon = DURABLE_ICON, text = p3 } else nil
end

local function SelectedIndicatorCorners(p1)
	-- upvalues: useSelectedOverlayButtonModule (ref), reactModule (ref), itemCardHeaderCornersOverlay (ref), fFlagAXMarketplaceLicensingItemCards (ref)
	local var1 = useSelectedOverlayButtonModule(p1.hasOverlayButton)
	
	return reactModule.createElement(itemCardHeaderCornersOverlay, {
		topLeftSlot = if fFlagAXMarketplaceLicensingItemCards then p1.topLeftSlot else nil,
		bottomRightSlot = p1.bottomRightSlot,
		bottomInset = if var1.isVisible then var1.occupiedHeight else nil,
		constrainTopLeftSlot = fFlagAXMarketplaceLicensingItemCards and p1.topLeftSlot ~= nil
	})
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: fFlagAXModeratedItemIconUpdates (ref), fFlagAXMarketplaceLicensingItemCards (ref), useTokens (ref), reactModule (ref), itemInfoIconMap (ref), itemTypeToContentMap (ref), useSelector (ref), selectIsPortrait (ref), itemStatusTypeEnumModule (ref), itemStatusIconTypeToIconMap (ref), licensingBadgeModule (ref), badgeSize (ref), fFlagAXMarketplaceItemCardIndicatorStack (ref), buildItemStatusContent (ref), shouldRenderIndicatorStackModule (ref), indicatorStackModule (ref), foundationModule (ref), icon (ref), iconSize (ref), itemCard (ref), itemCardHeader (ref), SelectedIndicatorCorners (ref), itemCardHeaderCornersOverlay (ref), catalogItemCardSelectedOverlayModule (ref), fFlagAXFixBadgeStatusConfigOptions (ref), buildSelectedOverlayBadge (ref), fFlagAXShowFaeUpsell (ref), catalogItemCardStatusIconTypeEnumModule (ref), FAE_ICON (ref), fFlagAXInventoryDurablesSupport (ref), DURABLE_ICON (ref), itemCardStatus (ref), itemCardBadge (ref), buildBadgeStatusContent (ref), itemCardIcon (ref), fFlagAXRemoveDynamicHeadBadge (ref), itemCardFooter (ref)
	local var1 = if fFlagAXModeratedItemIconUpdates or fFlagAXMarketplaceLicensingItemCards then useTokens() else nil
	local var2 = false
	local var3 = p2
	local var4 = nil
	
	if fFlagAXMarketplaceLicensingItemCards then
		local size3000 = var1.Size.Size_3000
		local var5, var6 = reactModule.useState(false)
		var2 = var5
		local var7 = reactModule.useRef(var5)
		local var8 = reactModule.useRef(nil)
		var3 = var8
		reactModule.useImperativeHandle(p2, function()
			-- upvalues: var8 (ref)
			return var8.current
		end, {})
		local var9 = reactModule.useCallback(function(p3)
			-- upvalues: size3000 (ref), var7 (ref), var6 (ref)
			local x = p3.AbsoluteSize.X
			
			if x == 0 then return end
			local var10 = x <= size3000
			
			if var10 ~= var7.current then
				var7.current = var10
				var6(var10)
			end
		end, { size3000 })
		var4 = var9
		reactModule.useLayoutEffect(function()
			-- upvalues: var8 (ref), var9 (ref)
			if var8.current then
				var9(var8.current)
			end
		end, { var9 })
	end
	local title = p1.title or (p1.creator or p1.priceLineContent)
	local var10 = if p1.itemInfo then itemInfoIconMap[p1.itemInfo] else nil
	local var11 = if p1.itemType then itemTypeToContentMap[p1.itemType] else nil
	local var12 = if fFlagAXModeratedItemIconUpdates then useSelector(selectIsPortrait) else nil
	local var13 = if p1.itemStatus and (p1.itemStatus.type == itemStatusTypeEnumModule.Icon or p1.itemStatus.type == itemStatusTypeEnumModule.Badge) and p1.itemStatus.iconType then itemStatusIconTypeToIconMap[p1.itemStatus.iconType] else nil
	local backgroundLayers = p1.backgroundLayers
	local var14 = backgroundLayers ~= nil and #backgroundLayers > 0
	local var15 = if fFlagAXMarketplaceLicensingItemCards and p1.itemLicensingInfo then reactModule.createElement(licensingBadgeModule, {
		isInteractive = false,
		itemLicensingInfo = p1.itemLicensingInfo,
		passiveSize = if var2 then badgeSize.XSmall else badgeSize.Small
	}) else nil
	local var16 = nil
	
	if fFlagAXMarketplaceItemCardIndicatorStack then
		local var17 = buildItemStatusContent(p1.itemStatus, var13, p1.expirationTime, p1.isSelected)
		var16 = if shouldRenderIndicatorStackModule(var17, var11) then reactModule.createElement(indicatorStackModule, { statusContent = var17, itemTypeContent = var11 }) else nil
	end
	local createElement_2
	local function renderPresentationSlot()
		-- upvalues: p1 (ref), itemStatusTypeEnumModule (copy), reactModule (copy), foundationModule (copy), fFlagAXModeratedItemIconUpdates (copy), icon (copy), itemStatusIconTypeToIconMap (copy), var1 (ref), var12 (ref), iconSize (copy)
		return if not (not p1.itemStatus or p1.itemStatus.type ~= itemStatusTypeEnumModule.Placeholder) then if p1.itemStatus.iconType then reactModule.createElement(foundationModule.View, {
			tag = "size-full clip radius-medium row align-x-center align-y-center"
		}, {
			icon = if fFlagAXModeratedItemIconUpdates then reactModule.createElement(icon, {
				name = itemStatusIconTypeToIconMap[p1.itemStatus.iconType],
				style = var1.Color.Content.Muted,
				size = if var12 then iconSize.Large else 40
			}) else reactModule.createElement(foundationModule.Image, {
				Image = itemStatusIconTypeToIconMap[p1.itemStatus.iconType],
				Size = UDim2.fromScale(0.33, 0.33)
			})
		}) else nil else p1.presentationSlot
	end
	
	local createElement = reactModule.createElement
	local t = {
		onActivated = p1.onActivated,
		isDisabled = p1.isDisabled,
		ref = var3,
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize,
		LayoutOrder = p1.LayoutOrder,
		tag = p1.tag,
		Selectable = p1.Selectable,
		showSelectionBorderWithBackground = p1.isSelected,
		backgroundLayers = backgroundLayers,
		imageScaleType = p1.imageScaleType,
		onAbsoluteSizeChanged = var4
	}
	local createElement_1 = reactModule.createElement
	local var18 = itemCardHeader
	local t_1 = { aspectRatio = p1.headerAspectRatio }
	
	if fFlagAXMarketplaceItemCardIndicatorStack then
		local var19
		createElement_2 = reactModule.createElement
		local fragment = reactModule.Fragment
		local var20 = nil
		local t_2 = {}
		
		if p1.isSelected and var16 then
			var19 = reactModule.createElement
			var19 = var19(SelectedIndicatorCorners, {
				topLeftSlot = var15,
				bottomRightSlot = var16,
				hasOverlayButton = p1.onOverlayButtonActivated ~= nil and p1.overlayButtonText ~= nil
			})
		else
			var19 = reactModule.createElement(itemCardHeaderCornersOverlay, {
				topLeftSlot = var15,
				bottomRightSlot = var16,
				constrainTopLeftSlot = var15 ~= nil
			})
		end
		local createElement_3
		t_2.CatalogItemCardCorners = var19
		
		if p1.isSelected then
			createElement_3 = reactModule.createElement
			createElement_3 = createElement_3(catalogItemCardSelectedOverlayModule, if p1.onOverlayButtonActivated and p1.overlayButtonText then {
				onActivated = p1.onOverlayButtonActivated,
				buttonText = p1.overlayButtonText,
				suppressBorder = var14
			} elseif var14 then { suppressBorder = true } else nil)
		else
			createElement_3 = nil
		end
		t_2.CatalogItemCardSelection = createElement_3
		createElement_2 = createElement_2(fragment, var20, t_2)
	elseif p1.isSelected then
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(catalogItemCardSelectedOverlayModule, if p1.onOverlayButtonActivated and p1.overlayButtonText then {
			onActivated = p1.onOverlayButtonActivated,
			buttonText = p1.overlayButtonText,
			suppressBorder = var14,
			badge = if fFlagAXFixBadgeStatusConfigOptions then buildSelectedOverlayBadge(p1.itemStatus, var13, p1.expirationTime) elseif fFlagAXShowFaeUpsell and p1.itemStatus and p1.itemStatus.iconType == catalogItemCardStatusIconTypeEnumModule.FAE then { icon = FAE_ICON } elseif var13 and p1.itemStatus and p1.itemStatus.text then { icon = var13, text = p1.itemStatus.text } elseif fFlagAXInventoryDurablesSupport and p1.expirationTime and (not p1.itemStatus or p1.itemStatus.iconType ~= catalogItemCardStatusIconTypeEnumModule.Moderated) then { icon = DURABLE_ICON, text = p1.expirationTime } else nil
		} elseif fFlagAXInventoryDurablesSupport and var13 then { itemStatusIcon = var13, suppressBorder = var14 } elseif var14 then { suppressBorder = true } else nil)
	else
		local createElement_4
		createElement_2 = reactModule.createElement
		local var21 = itemCardHeaderCornersOverlay
		local t_2 = {}
		
		if p1.itemStatus then
			if p1.itemStatus.type == itemStatusTypeEnumModule.Text and p1.itemStatus.text then
				createElement_4 = reactModule.createElement(itemCardStatus, { text = p1.itemStatus.text })
			elseif p1.itemStatus.type == itemStatusTypeEnumModule.Badge then
				createElement_4 = reactModule.createElement
				createElement_4 = createElement_4(itemCardBadge, {
					displayBorder = true,
					content = if fFlagAXFixBadgeStatusConfigOptions or fFlagAXShowFaeUpsell then buildBadgeStatusContent(var13, p1.itemStatus.text) else {
						{ type = "icon", icon = var13 },
						{ type = "text", text = p1.itemStatus.text }
					}
				})
			else
				createElement_4 = if var13 then reactModule.createElement(itemCardIcon, { icon = var13 }) else nil
			end
		createElement_4 = if fFlagAXInventoryDurablesSupport and p1.expirationTime then reactModule.createElement(itemCardBadge, {
			displayBorder = true,
			content = {
				{ type = "icon", icon = DURABLE_ICON },
				{ type = "text", text = p1.expirationTime }
			}
		}) elseif var11 then reactModule.createElement(itemCardBadge, { content = var11 }) else nil
		t_2.topLeftSlot = createElement_4
		t_2.bottomRightSlot = if fFlagAXRemoveDynamicHeadBadge then nil elseif var10 then reactModule.createElement(itemCardBadge, { content = { { type = "icon", icon = var10 } } }) else nil
		createElement_2 = createElement_2(var21, t_2)
	end
	t_1.overlaySlot = createElement_2
	t_1.BackgroundTransparency = if backgroundLayers then 1 else nil
	t_1.Size = p1.headerSize
	t.headerSlot = createElement_1(var18, t_1, renderPresentationSlot())
	t.footerSlot = if title then reactModule.createElement(itemCardFooter, {
		LayoutOrder = 2,
		title = p1.title,
		creatorName = if p1.creator then p1.creator.name else nil,
		creatorHasVerifiedBadge = if p1.creator then p1.creator.verified else nil,
		priceLineContent = p1.priceLineContent,
		titleTextSize = p1.titleTextSize
	}) else nil
	
	return createElement(itemCard, t)
end)