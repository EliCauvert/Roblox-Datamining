local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local ItemCardComponents = require(Parent.AvatarExperienceUIKit).ItemCardComponents
local ItemCardFooter = ItemCardComponents.ItemCardFooter
local ItemCardHeader = ItemCardComponents.ItemCardHeader
local ItemCard = ItemCardComponents.ItemCard
local ItemCardBadge = ItemCardComponents.ItemCardBadge
local ItemCardStatus = ItemCardComponents.ItemCardStatus
local ItemCardHeaderCornersOverlay = ItemCardComponents.ItemCardHeaderCornersOverlay
local _ = ItemCardComponents.ItemCardPriceLine
local ItemCardIcon = ItemCardComponents.ItemCardIcon
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BadgeSize = FoundationModule.Enums.BadgeSize
local IconSize = FoundationModule.Enums.IconSize
local Icon = FoundationModule.Icon
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local IndicatorStackModule = require(AvatarExperienceCommon.Components.IndicatorStack.IndicatorStack)
local ShouldRenderIndicatorStackModule = require(AvatarExperienceCommon.Utils.shouldRenderIndicatorStack)
local LicensingBadgeModule = require(AvatarExperienceCommon.Components.LicensingBadge.LicensingBadge)
local _ = require(script.Parent.Enums.CatalogItemCardItemTypeEnum)
local _ = require(script.Parent.Enums.CatalogItemCardItemInfoEnum)
local CatalogItemCardStatusIconTypeEnumModule = require(script.Parent.Enums.CatalogItemCardStatusIconTypeEnum)
local ItemStatusTypeEnumModule = require(script.Parent.Enums.ItemStatusTypeEnum)
local CatalogItemCardBadgeMapsModule = require(script.Parent.CatalogItemCardBadgeMaps)
local CatalogItemCardSelectedOverlayModule = require(script.Parent.CatalogItemCardSelectedOverlay)
local UseSelectedOverlayButtonModule = require(script.Parent.useSelectedOverlayButton)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXModeratedItemIconUpdates = AvatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local FFlagAXFixBadgeStatusConfigOptions = AvatarExperienceFlagsModule.FFlagAXFixBadgeStatusConfigOptions
local FFlagAXRemoveDynamicHeadBadge = AvatarExperienceFlagsModule.FFlagAXRemoveDynamicHeadBadge
local FFlagAXMarketplaceItemCardIndicatorStack = AvatarExperienceFlagsModule.FFlagAXMarketplaceItemCardIndicatorStack
local FFlagAXMarketplaceLicensingItemCards = AvatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemCards
local _ = require(Parent.AvatarExperienceModel)
local DURABLEICON = CatalogItemCardBadgeMapsModule.DURABLE_ICON
local FAEICON = CatalogItemCardBadgeMapsModule.FAE_ICON
local ItemTypeToContentMap = CatalogItemCardBadgeMapsModule.itemTypeToContentMap
local ItemInfoIconMap = CatalogItemCardBadgeMapsModule.itemInfoIconMap
local ItemStatusIconTypeToIconMap = CatalogItemCardBadgeMapsModule.itemStatusIconTypeToIconMap

local function selectIsPortrait(p1): boolean --[[ Line: 104 ]]
	-- upvalues: ResponsiveModule (copy)
	return p1.DeviceOrientation == ResponsiveModule.Keys.Portrait
end

local function buildBadgeStatusContent(Icon, Text) --[[ Line: 108 ]]
	local List = { { type = "icon", icon = Icon } }
	
	if Text then
		table.insert(List, { type = "text", text = Text })
	end
	return List
end

local function buildItemStatusContent(ItemStatus, Icon, Text, IsSelected) --[[ Line: 121 ]]
	-- upvalues: ItemStatusTypeEnumModule (copy), FFlagAXFixBadgeStatusConfigOptions (copy), FFlagAXShowFaeUpsell (copy), buildBadgeStatusContent (copy), CatalogItemCardStatusIconTypeEnumModule (copy), FFlagAXInventoryDurablesSupport (copy), DURABLEICON (copy)
	if ItemStatus then
		local BadgeStatusContent = if ItemStatus.type == ItemStatusTypeEnumModule.Badge then if FFlagAXFixBadgeStatusConfigOptions or FFlagAXShowFaeUpsell then buildBadgeStatusContent(Icon, ItemStatus.text) else {
			{ type = "icon", icon = Icon },
			{ type = "text", text = ItemStatus.text }
		} else nil
		
		if ItemStatus.type == ItemStatusTypeEnumModule.Text and ItemStatus.text then
			return { type = "text", text = ItemStatus.text }
		elseif ItemStatus.type == ItemStatusTypeEnumModule.Badge and BadgeStatusContent then
			return {
				type = "badge",
				displayBorder = true,
				content = BadgeStatusContent
			}
		elseif Icon then
			return { type = "icon", icon = Icon }
		elseif not IsSelected or ItemStatus.iconType == CatalogItemCardStatusIconTypeEnumModule.Moderated then
			return nil
		end
	end
	return if FFlagAXInventoryDurablesSupport and Text then {
		type = "badge",
		displayBorder = true,
		content = {
			{ type = "icon", icon = DURABLEICON },
			{ type = "text", text = Text }
		}
	} else nil
end

local function buildSelectedOverlayBadge(ItemStatus, Icon, Text) --[[ Line: 166 ]]
	-- upvalues: FFlagAXShowFaeUpsell (copy), CatalogItemCardStatusIconTypeEnumModule (copy), FAEICON (copy), FFlagAXInventoryDurablesSupport (copy), DURABLEICON (copy)
	local IconType = ItemStatus and ItemStatus.iconType
	local Text1 = ItemStatus and ItemStatus.text
	
	return if FFlagAXShowFaeUpsell and IconType == CatalogItemCardStatusIconTypeEnumModule.FAE then { icon = FAEICON } elseif Icon and Text1 then { icon = Icon, text = Text1 } elseif FFlagAXInventoryDurablesSupport and Text and IconType ~= CatalogItemCardStatusIconTypeEnumModule.Moderated then { icon = DURABLEICON, text = Text } else nil
end

local function SelectedIndicatorCorners(p1) --[[ Line: 193 ]]
	-- upvalues: UseSelectedOverlayButtonModule (copy), ReactModule (copy), ItemCardHeaderCornersOverlay (copy), FFlagAXMarketplaceLicensingItemCards (copy)
	local UseSelectedOverlayButtonModuleResult = UseSelectedOverlayButtonModule(p1.hasOverlayButton)
	
	return ReactModule.createElement(ItemCardHeaderCornersOverlay, {
		topLeftSlot = if FFlagAXMarketplaceLicensingItemCards then p1.topLeftSlot else nil,
		bottomRightSlot = p1.bottomRightSlot,
		bottomInset = if UseSelectedOverlayButtonModuleResult.isVisible then UseSelectedOverlayButtonModuleResult.occupiedHeight else nil,
		constrainTopLeftSlot = FFlagAXMarketplaceLicensingItemCards and p1.topLeftSlot ~= nil
	})
end

return (ReactModule.forwardRef(function(Frame: Frame, Ref) --[[ Line: 208 ]]
	-- upvalues: FFlagAXModeratedItemIconUpdates (copy), FFlagAXMarketplaceLicensingItemCards (copy), UseTokensFunction (copy), ReactModule (copy), ItemInfoIconMap (copy), ItemTypeToContentMap (copy), UseSelectorFunction (copy), selectIsPortrait (copy), ItemStatusTypeEnumModule (copy), ItemStatusIconTypeToIconMap (copy), LicensingBadgeModule (copy), BadgeSize (copy), FFlagAXMarketplaceItemCardIndicatorStack (copy), buildItemStatusContent (copy), ShouldRenderIndicatorStackModule (copy), IndicatorStackModule (copy), FoundationModule (copy), Icon (copy), IconSize (copy), ItemCard (copy), ItemCardHeader (copy), SelectedIndicatorCorners (copy), ItemCardHeaderCornersOverlay (copy), CatalogItemCardSelectedOverlayModule (copy), FFlagAXFixBadgeStatusConfigOptions (copy), buildSelectedOverlayBadge (copy), FFlagAXShowFaeUpsell (copy), CatalogItemCardStatusIconTypeEnumModule (copy), FAEICON (copy), FFlagAXInventoryDurablesSupport (copy), DURABLEICON (copy), ItemCardStatus (copy), ItemCardBadge (copy), buildBadgeStatusContent (copy), ItemCardIcon (copy), FFlagAXRemoveDynamicHeadBadge (copy), ItemCardFooter (copy)
	local UseTokensResult = if FFlagAXModeratedItemIconUpdates or FFlagAXMarketplaceLicensingItemCards then UseTokensFunction() else nil
	local v1 = false
	local Ref1 = Ref
	local OnAbsoluteSizeChanged = nil
	
	if FFlagAXMarketplaceLicensingItemCards then
		local Size3000 = UseTokensResult.Size.Size_3000
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		v1 = UseStateResult
		local UseRefResult = ReactModule.useRef(UseStateResult)
		local UseRefResult1 = ReactModule.useRef(nil)
		Ref1 = UseRefResult1
		ReactModule.useImperativeHandle(Ref, function() --[[ Line: 222 ]]
			-- upvalues: UseRefResult1 (copy)
			return UseRefResult1.current
		end, {})
		local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 225 ]]
			-- upvalues: Size3000 (copy), UseRefResult (copy), UseStateResult2 (copy)
			local X = Frame.AbsoluteSize.X
			
			if X == 0 then return end
			local IsXBelow = X <= Size3000
			
			if IsXBelow ~= UseRefResult.current then
				UseRefResult.current = IsXBelow
				UseStateResult2(IsXBelow)
			end
		end, { Size3000 })
		OnAbsoluteSizeChanged = UseResult
		ReactModule.useLayoutEffect(function() --[[ Line: 238 ]]
			-- upvalues: UseRefResult1 (copy), UseResult (copy)
			if UseRefResult1.current then
				UseResult(UseRefResult1.current)
			end
		end, { UseResult })
	end
	local Title = Frame.title or (Frame.creator or Frame.priceLineContent)
	local ItemInfoIcon = if Frame.itemInfo then ItemInfoIconMap[Frame.itemInfo] else nil
	local ItemTypeToContent = if Frame.itemType then ItemTypeToContentMap[Frame.itemType] else nil
	local UseSelectorResult = if FFlagAXModeratedItemIconUpdates then UseSelectorFunction(selectIsPortrait) else nil
	local ItemStatusIconTypeToIcon = if Frame.itemStatus and (Frame.itemStatus.type == ItemStatusTypeEnumModule.Icon or Frame.itemStatus.type == ItemStatusTypeEnumModule.Badge) and Frame.itemStatus.iconType then ItemStatusIconTypeToIconMap[Frame.itemStatus.iconType] else nil
	local BackgroundLayers = Frame.backgroundLayers
	local SuppressBorder: boolean = BackgroundLayers ~= nil and #BackgroundLayers > 0
	local Element = if FFlagAXMarketplaceLicensingItemCards and Frame.itemLicensingInfo then ReactModule.createElement(LicensingBadgeModule, {
		isInteractive = false,
		itemLicensingInfo = Frame.itemLicensingInfo,
		passiveSize = if v1 then BadgeSize.XSmall else BadgeSize.Small
	}) else nil
	local BottomRightSlot = nil
	
	if FFlagAXMarketplaceItemCardIndicatorStack then
		local ItemStatusContent = buildItemStatusContent(Frame.itemStatus, ItemStatusIconTypeToIcon, Frame.expirationTime, Frame.isSelected)
		BottomRightSlot = if ShouldRenderIndicatorStackModule(ItemStatusContent, ItemTypeToContent) then ReactModule.createElement(IndicatorStackModule, {
			statusContent = ItemStatusContent,
			itemTypeContent = ItemTypeToContent
		}) else nil
	end
	return ReactModule.createElement(ItemCard, {
		onActivated = Frame.onActivated,
		isDisabled = Frame.isDisabled,
		ref = Ref1,
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize,
		LayoutOrder = Frame.LayoutOrder,
		tag = Frame.tag,
		Selectable = Frame.Selectable,
		showSelectionBorderWithBackground = Frame.isSelected,
		backgroundLayers = BackgroundLayers,
		imageScaleType = Frame.imageScaleType,
		onAbsoluteSizeChanged = OnAbsoluteSizeChanged,
		headerSlot = ReactModule.createElement(ItemCardHeader, {
			aspectRatio = Frame.headerAspectRatio,
			overlaySlot = if FFlagAXMarketplaceItemCardIndicatorStack then ReactModule.createElement(ReactModule.Fragment, nil, {
				CatalogItemCardCorners = if Frame.isSelected and BottomRightSlot then ReactModule.createElement(SelectedIndicatorCorners, {
					topLeftSlot = Element,
					bottomRightSlot = BottomRightSlot,
					hasOverlayButton = Frame.onOverlayButtonActivated ~= nil and Frame.overlayButtonText ~= nil
				}) else ReactModule.createElement(ItemCardHeaderCornersOverlay, {
					topLeftSlot = Element,
					bottomRightSlot = BottomRightSlot,
					constrainTopLeftSlot = Element ~= nil
				}),
				CatalogItemCardSelection = if Frame.isSelected then ReactModule.createElement(CatalogItemCardSelectedOverlayModule, if Frame.onOverlayButtonActivated and Frame.overlayButtonText then {
					onActivated = Frame.onOverlayButtonActivated,
					buttonText = Frame.overlayButtonText,
					suppressBorder = SuppressBorder
				} elseif SuppressBorder then { suppressBorder = true } else nil) else nil
			}) elseif Frame.isSelected then ReactModule.createElement(CatalogItemCardSelectedOverlayModule, if Frame.onOverlayButtonActivated and Frame.overlayButtonText then {
				onActivated = Frame.onOverlayButtonActivated,
				buttonText = Frame.overlayButtonText,
				suppressBorder = SuppressBorder,
				badge = if FFlagAXFixBadgeStatusConfigOptions then buildSelectedOverlayBadge(Frame.itemStatus, ItemStatusIconTypeToIcon, Frame.expirationTime) elseif FFlagAXShowFaeUpsell and Frame.itemStatus and Frame.itemStatus.iconType == CatalogItemCardStatusIconTypeEnumModule.FAE then { icon = FAEICON } elseif ItemStatusIconTypeToIcon and Frame.itemStatus and Frame.itemStatus.text then {
					icon = ItemStatusIconTypeToIcon,
					text = Frame.itemStatus.text
				} elseif FFlagAXInventoryDurablesSupport and Frame.expirationTime and (not Frame.itemStatus or Frame.itemStatus.iconType ~= CatalogItemCardStatusIconTypeEnumModule.Moderated) then { icon = DURABLEICON, text = Frame.expirationTime } else nil
			} elseif FFlagAXInventoryDurablesSupport and ItemStatusIconTypeToIcon then {
				itemStatusIcon = ItemStatusIconTypeToIcon,
				suppressBorder = SuppressBorder
			} elseif SuppressBorder then { suppressBorder = true } else nil) else ReactModule.createElement(ItemCardHeaderCornersOverlay, {
				topLeftSlot = if Frame.itemStatus then if Frame.itemStatus.type == ItemStatusTypeEnumModule.Text and Frame.itemStatus.text then ReactModule.createElement(ItemCardStatus, { text = Frame.itemStatus.text }) elseif Frame.itemStatus.type == ItemStatusTypeEnumModule.Badge then ReactModule.createElement(ItemCardBadge, {
					displayBorder = true,
					content = if FFlagAXFixBadgeStatusConfigOptions or FFlagAXShowFaeUpsell then buildBadgeStatusContent(ItemStatusIconTypeToIcon, Frame.itemStatus.text) else {
						{ type = "icon", icon = ItemStatusIconTypeToIcon },
						{ type = "text", text = Frame.itemStatus.text }
					}
				}) elseif ItemStatusIconTypeToIcon then ReactModule.createElement(ItemCardIcon, { icon = ItemStatusIconTypeToIcon }) else nil elseif FFlagAXInventoryDurablesSupport and Frame.expirationTime then ReactModule.createElement(ItemCardBadge, {
					displayBorder = true,
					content = {
						{ type = "icon", icon = DURABLEICON },
						{ type = "text", text = Frame.expirationTime }
					}
				}) elseif ItemTypeToContent then ReactModule.createElement(ItemCardBadge, { content = ItemTypeToContent }) else nil,
				bottomRightSlot = if FFlagAXRemoveDynamicHeadBadge then nil elseif ItemInfoIcon then ReactModule.createElement(ItemCardBadge, { content = { { type = "icon", icon = ItemInfoIcon } } }) else nil
			}),
			BackgroundTransparency = if BackgroundLayers then 1 else nil,
			Size = Frame.headerSize
		}, (function() --[[ Line: 280 | Named "renderPresentationSlot" ]]
			-- upvalues: Frame (copy), ItemStatusTypeEnumModule (upval), ReactModule (upval), FoundationModule (upval), FFlagAXModeratedItemIconUpdates (upval), Icon (upval), ItemStatusIconTypeToIconMap (upval), UseTokensResult (copy), UseSelectorResult (copy), IconSize (upval)
			return if Frame.itemStatus and Frame.itemStatus.type == ItemStatusTypeEnumModule.Placeholder then if Frame.itemStatus.iconType then ReactModule.createElement(FoundationModule.View, {
				tag = "size-full clip radius-medium row align-x-center align-y-center"
			}, {
				icon = if FFlagAXModeratedItemIconUpdates then ReactModule.createElement(Icon, {
					name = ItemStatusIconTypeToIconMap[Frame.itemStatus.iconType],
					style = UseTokensResult.Color.Content.Muted,
					size = if UseSelectorResult then IconSize.Large else 40
				}) else ReactModule.createElement(FoundationModule.Image, {
					Image = ItemStatusIconTypeToIconMap[Frame.itemStatus.iconType],
					Size = UDim2.fromScale(0.33, 0.33)
				})
			}) else nil else Frame.presentationSlot
		end)()),
		footerSlot = if Title then ReactModule.createElement(ItemCardFooter, {
			LayoutOrder = 2,
			title = Frame.title,
			creatorName = if Frame.creator then Frame.creator.name else nil,
			creatorHasVerifiedBadge = if Frame.creator then Frame.creator.verified else nil,
			priceLineContent = Frame.priceLineContent,
			titleTextSize = Frame.titleTextSize
		}) else nil
	})
end))