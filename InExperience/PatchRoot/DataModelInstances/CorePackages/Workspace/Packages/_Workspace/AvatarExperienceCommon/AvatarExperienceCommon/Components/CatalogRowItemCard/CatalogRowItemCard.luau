local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local itemCardComponents = require(parent.AvatarExperienceUIKit).ItemCardComponents
local itemCardHeader = itemCardComponents.ItemCardHeader
local itemCardBadge = itemCardComponents.ItemCardBadge
local itemCardStatus = itemCardComponents.ItemCardStatus
local itemCardHeaderCornersOverlay = itemCardComponents.ItemCardHeaderCornersOverlay
local itemCardIcon = itemCardComponents.ItemCardIcon
local indicatorStackModule = require(avatarExperienceCommon.Components.IndicatorStack.IndicatorStack)
local shouldRenderIndicatorStackModule = require(avatarExperienceCommon.Utils.shouldRenderIndicatorStack)
local licensingBadgeModule = require(avatarExperienceCommon.Components.LicensingBadge.LicensingBadge)
local catalogRowItemCardFooterModule = require(script.Parent.CatalogRowItemCardFooter)
local _ = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemTypeEnum)
local _ = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemInfoEnum)
local _ = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardStatusIconTypeEnum)
local catalogItemCardBadgeMapsModule = require(script.Parent.Parent.CatalogItemCard.CatalogItemCardBadgeMaps)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXDurablesForMIS = avatarExperienceFlagsModule.FFlagAXDurablesForMIS
local fFlagAXDurables2Option = avatarExperienceFlagsModule.FFlagAXDurables2Option
local fFlagAXMarketplaceItemCardIndicatorStack = avatarExperienceFlagsModule.FFlagAXMarketplaceItemCardIndicatorStack
local fFlagAXMarketplaceLicensingItemCards = avatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemCards
local _ = require(parent.AvatarExperienceModel)
local _ = require(avatarExperienceCommon.Types.TimedOptionType)
local fFlagAXEnableTimedOptionsForCatalogRowCard = avatarExperienceFlagsModule.FFlagAXEnableTimedOptionsForCatalogRowCard
local fFlagAXRemoveDynamicHeadBadge = avatarExperienceFlagsModule.FFlagAXRemoveDynamicHeadBadge
local itemTypeToContentMap = catalogItemCardBadgeMapsModule.itemTypeToContentMap
local itemInfoIconMap = catalogItemCardBadgeMapsModule.itemInfoIconMap
local var1 = if fFlagAXMarketplaceItemCardIndicatorStack then catalogItemCardBadgeMapsModule.itemStatusIconTypeToIconMap else catalogItemCardBadgeMapsModule.rowItemStatusIconTypeToIconMap

local function buildItemStatusContent(p1, p2)
	return if p1.type == "text" then { type = "text", text = p1.text } elseif p1.type == "badge" then {
		type = "badge",
		content = {
			{ type = "icon", icon = p2 },
			{ type = "text", text = p1.text }
		}
	} elseif p2 then { type = "icon", icon = p2 } else nil
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), itemInfoIconMap (ref), itemTypeToContentMap (ref), fFlagAXMarketplaceItemCardIndicatorStack (ref), var1 (ref), fFlagAXMarketplaceLicensingItemCards (ref), reactModule (ref), licensingBadgeModule (ref), foundationModule (ref), buildItemStatusContent (ref), shouldRenderIndicatorStackModule (ref), indicatorStackModule (ref), itemCardHeader (ref), itemCardHeaderCornersOverlay (ref), itemCardBadge (ref), itemCardStatus (ref), itemCardIcon (ref), fFlagAXRemoveDynamicHeadBadge (ref), catalogRowItemCardFooterModule (ref), fFlagAXDurables2Option (ref), fFlagAXDurablesForMIS (ref), fFlagAXEnableTimedOptionsForCatalogRowCard (ref)
	local var2 = useTokens()
	local var3 = if p1.itemInfo then itemInfoIconMap[p1.itemInfo] else nil
	local var4 = if p1.itemType then itemTypeToContentMap[p1.itemType] else nil
	local var5 = if p1.itemStatus and p1.itemStatus.type ~= "text" and (p1.itemStatus.type == "icon" or fFlagAXMarketplaceItemCardIndicatorStack and p1.itemStatus.type == "badge") then var1[p1.itemStatus.iconType] else nil
	local var6 = if fFlagAXMarketplaceLicensingItemCards and p1.itemLicensingInfo then reactModule.createElement(licensingBadgeModule, {
		isInteractive = false,
		itemLicensingInfo = p1.itemLicensingInfo,
		passiveSize = foundationModule.Enums.BadgeSize.XSmall
	}) else nil
	local var7 = nil
	
	if fFlagAXMarketplaceItemCardIndicatorStack then
		local var8 = if p1.itemStatus then buildItemStatusContent(p1.itemStatus, var5) else nil
		var7 = if shouldRenderIndicatorStackModule(var8, var4) then reactModule.createElement(indicatorStackModule, { statusContent = var8, itemTypeContent = var4 }) else nil
	end
	local createElement_2
	local createElement = reactModule.createElement
	local var9 = "TextButton"
	local t = {
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
	}
	local t_1 = {
		HorizontalLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, var2.Gap.Medium)
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		LayoutOrder = 1,
		aspectRatio = p1.headerAspectRatio,
		Size = p1.headerSize
	}
	
	if fFlagAXMarketplaceItemCardIndicatorStack then
		createElement_2 = reactModule.createElement(itemCardHeaderCornersOverlay, {
			topLeftSlot = var6,
			bottomRightSlot = var7,
			constrainTopLeftSlot = var6 ~= nil
		})
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(itemCardHeaderCornersOverlay, {
			topLeftSlot = if p1.itemStatus and p1.itemStatus.type == "badge" then reactModule.createElement(itemCardBadge, {
				content = {
					{ type = "icon", icon = var1[p1.itemStatus.iconType] },
					{ type = "text", text = p1.itemStatus.text }
				}
			}) elseif p1.itemStatus then if p1.itemStatus.type == "text" then reactModule.createElement(itemCardStatus, { text = p1.itemStatus.text }) elseif var5 then reactModule.createElement(itemCardIcon, { icon = var5 }) else nil else nil,
			bottomLeftSlot = if var4 then reactModule.createElement(itemCardBadge, { content = var4 }) else nil,
			bottomRightSlot = if fFlagAXRemoveDynamicHeadBadge then nil elseif var3 then reactModule.createElement(itemCardBadge, { content = { { type = "icon", icon = var3 } } }) else nil
		})
	end
	t_2.overlaySlot = createElement_2
	t_1.Header = createElement_1(itemCardHeader, t_2, p1.presentationSlot)
	t_1.Footer = reactModule.createElement(catalogRowItemCardFooterModule, {
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
	
	return createElement(var9, t, t_1)
end)