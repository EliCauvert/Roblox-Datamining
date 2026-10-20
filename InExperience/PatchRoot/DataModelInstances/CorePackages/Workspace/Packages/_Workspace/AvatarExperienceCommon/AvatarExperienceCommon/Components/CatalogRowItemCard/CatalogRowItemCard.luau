local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ItemCardComponents = require(Parent.AvatarExperienceUIKit).ItemCardComponents
local ItemCardHeader = ItemCardComponents.ItemCardHeader
local ItemCardBadge = ItemCardComponents.ItemCardBadge
local ItemCardStatus = ItemCardComponents.ItemCardStatus
local ItemCardHeaderCornersOverlay = ItemCardComponents.ItemCardHeaderCornersOverlay
local ItemCardIcon = ItemCardComponents.ItemCardIcon
local IndicatorStackModule = require(AvatarExperienceCommon.Components.IndicatorStack.IndicatorStack)
local ShouldRenderIndicatorStackModule = require(AvatarExperienceCommon.Utils.shouldRenderIndicatorStack)
local LicensingBadgeModule = require(AvatarExperienceCommon.Components.LicensingBadge.LicensingBadge)
local CatalogRowItemCardFooterModule = require(script.Parent.CatalogRowItemCardFooter)
local _ = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemTypeEnum)
local _ = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemInfoEnum)
local _ = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardStatusIconTypeEnum)
local CatalogItemCardBadgeMapsModule = require(script.Parent.Parent.CatalogItemCard.CatalogItemCardBadgeMaps)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagAXDurables2Option = AvatarExperienceFlagsModule.FFlagAXDurables2Option
local FFlagAXMISOffersChip = AvatarExperienceFlagsModule.FFlagAXMISOffersChip
local FFlagAXMarketplaceItemCardIndicatorStack = AvatarExperienceFlagsModule.FFlagAXMarketplaceItemCardIndicatorStack
local FFlagAXMarketplaceLicensingItemCards = AvatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemCards
local FFlagAXGifting = AvatarExperienceFlagsModule.FFlagAXGifting
local _ = require(Parent.AvatarExperienceModel)
local _ = require(AvatarExperienceCommon.Types.TimedOptionType)
local FFlagAXEnableTimedOptionsForCatalogRowCard = AvatarExperienceFlagsModule.FFlagAXEnableTimedOptionsForCatalogRowCard
local FFlagAXRemoveDynamicHeadBadge = AvatarExperienceFlagsModule.FFlagAXRemoveDynamicHeadBadge
local ItemTypeToContentMap = CatalogItemCardBadgeMapsModule.itemTypeToContentMap
local ItemInfoIconMap = CatalogItemCardBadgeMapsModule.itemInfoIconMap
local ItemStatusIconTypeToIconMap = if FFlagAXMarketplaceItemCardIndicatorStack then CatalogItemCardBadgeMapsModule.itemStatusIconTypeToIconMap else CatalogItemCardBadgeMapsModule.rowItemStatusIconTypeToIconMap

local function buildItemStatusContent(ItemStatus, Icon)
	return if ItemStatus.type == "text" then { type = "text", text = ItemStatus.text } elseif ItemStatus.type == "badge" then {
		type = "badge",
		content = {
			{ type = "icon", icon = Icon },
			{ type = "text", text = ItemStatus.text }
		}
	} elseif Icon then { type = "icon", icon = Icon } else nil
end

return (ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: UseTokensFunction (copy), ItemInfoIconMap (copy), ItemTypeToContentMap (copy), FFlagAXMarketplaceItemCardIndicatorStack (copy), ItemStatusIconTypeToIconMap (copy), FFlagAXMarketplaceLicensingItemCards (copy), ReactModule (copy), LicensingBadgeModule (copy), FoundationModule (copy), buildItemStatusContent (copy), ShouldRenderIndicatorStackModule (copy), IndicatorStackModule (copy), ItemCardHeader (copy), ItemCardHeaderCornersOverlay (copy), ItemCardBadge (copy), ItemCardStatus (copy), ItemCardIcon (copy), FFlagAXRemoveDynamicHeadBadge (copy), CatalogRowItemCardFooterModule (copy), FFlagAXDurables2Option (copy), FFlagAXDurablesForMIS (copy), FFlagAXEnableTimedOptionsForCatalogRowCard (copy), FFlagAXGifting (copy), FFlagAXMISOffersChip (copy)
	local UseTokensResult = UseTokensFunction()
	local ItemInfoIcon = if Frame.itemInfo then ItemInfoIconMap[Frame.itemInfo] else nil
	local ItemTypeToContent = if Frame.itemType then ItemTypeToContentMap[Frame.itemType] else nil
	local ItemStatusIconTypeToIcon = if Frame.itemStatus and Frame.itemStatus.type ~= "text" and (Frame.itemStatus.type == "icon" or FFlagAXMarketplaceItemCardIndicatorStack and Frame.itemStatus.type == "badge") then ItemStatusIconTypeToIconMap[Frame.itemStatus.iconType] else nil
	local Element = if FFlagAXMarketplaceLicensingItemCards and Frame.itemLicensingInfo then ReactModule.createElement(LicensingBadgeModule, {
		isInteractive = false,
		itemLicensingInfo = Frame.itemLicensingInfo,
		passiveSize = FoundationModule.Enums.BadgeSize.XSmall
	}) else nil
	local Element1 = nil
	
	if FFlagAXMarketplaceItemCardIndicatorStack then
		local ItemStatusContent = if Frame.itemStatus then buildItemStatusContent(Frame.itemStatus, ItemStatusIconTypeToIcon) else nil
		Element1 = if ShouldRenderIndicatorStackModule(ItemStatusContent, ItemTypeToContent) then ReactModule.createElement(IndicatorStackModule, {
			statusContent = ItemStatusContent,
			itemTypeContent = ItemTypeToContent
		}) else nil
	end
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
			Padding = UDim.new(0, UseTokensResult.Gap.Medium)
		}),
		Header = ReactModule.createElement(ItemCardHeader, {
			LayoutOrder = 1,
			aspectRatio = Frame.headerAspectRatio,
			Size = Frame.headerSize,
			overlaySlot = if FFlagAXMarketplaceItemCardIndicatorStack then ReactModule.createElement(ItemCardHeaderCornersOverlay, {
				topLeftSlot = Element,
				bottomRightSlot = Element1,
				constrainTopLeftSlot = Element ~= nil
			}) else ReactModule.createElement(ItemCardHeaderCornersOverlay, {
				topLeftSlot = if Frame.itemStatus and Frame.itemStatus.type == "badge" then ReactModule.createElement(ItemCardBadge, {
					content = {
						{
							type = "icon",
							icon = ItemStatusIconTypeToIconMap[Frame.itemStatus.iconType]
						},
						{ type = "text", text = Frame.itemStatus.text }
					}
				}) elseif Frame.itemStatus then if Frame.itemStatus.type == "text" then ReactModule.createElement(ItemCardStatus, { text = Frame.itemStatus.text }) elseif ItemStatusIconTypeToIcon then ReactModule.createElement(ItemCardIcon, { icon = ItemStatusIconTypeToIcon }) else nil else nil,
				bottomLeftSlot = if ItemTypeToContent then ReactModule.createElement(ItemCardBadge, { content = ItemTypeToContent }) else nil,
				bottomRightSlot = if FFlagAXRemoveDynamicHeadBadge then nil elseif ItemInfoIcon then ReactModule.createElement(ItemCardBadge, { content = { { type = "icon", icon = ItemInfoIcon } } }) else nil
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
			giftButton = if FFlagAXGifting then Frame.giftButton else nil,
			hideTimedOptionSelections = if FFlagAXDurables2Option then Frame.hideTimedOptionSelections else nil,
			Size = Frame.footerSize,
			AutomaticSize = if Frame.footerAutomaticSize then Frame.footerAutomaticSize else Enum.AutomaticSize.Y,
			offersLocalized = if FFlagAXMISOffersChip then Frame.offersLocalized else nil,
			offerApplied = if FFlagAXMISOffersChip then Frame.offerApplied else nil,
			showOfferPillTooltip = if FFlagAXDurables2Option then Frame.showOfferPillTooltip else nil
		})
	})
end))