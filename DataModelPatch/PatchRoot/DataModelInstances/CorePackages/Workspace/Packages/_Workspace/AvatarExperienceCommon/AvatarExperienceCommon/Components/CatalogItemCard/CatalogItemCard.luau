local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
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
local IconSize = FoundationModule.Enums.IconSize
local Icon = FoundationModule.Icon
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CatalogItemCardItemTypeEnumModule = require(script.Parent.Enums.CatalogItemCardItemTypeEnum)
local CatalogItemCardStatusIconTypeEnumModule = require(script.Parent.Enums.CatalogItemCardStatusIconTypeEnum)
local CatalogItemCardSelectedOverlayModule = require(script.Parent.CatalogItemCardSelectedOverlay)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXLookAndFeelBackgrounds = AvatarExperienceFlagsModule.FFlagAXLookAndFeelBackgrounds
local MoveLimitedBadgeToTopLeft = game:DefineFastFlag("MoveLimitedBadgeToTopLeft", false)
local FFlagAXRootSlotBasedEditorFlag = require(Parent.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXModeratedItemIconUpdates = AvatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local FFlagAXFixBadgeStatusConfigOptions = AvatarExperienceFlagsModule.FFlagAXFixBadgeStatusConfigOptions
local FFlagAXSelectedBorderWrapsBackground = AvatarExperienceFlagsModule.FFlagAXSelectedBorderWrapsBackground
local Clock = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.Clock else "icons/status/pending_small"
local LockClosed = if FFlagAXShowFaeUpsell then if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.LockClosed else "icons/status/private" else nil
local config = {
	[CatalogItemCardStatusIconTypeEnumModule.Moderated] = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.CircleI else "icons/actions/info_small",
	[CatalogItemCardStatusIconTypeEnumModule.PendingModeration] = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.ClockDashed else "icons/status/pending_small",
	[CatalogItemCardStatusIconTypeEnumModule.Durable] = Clock,
	[CatalogItemCardStatusIconTypeEnumModule.Info] = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.CircleI else "icons/actions/info_small",
	[CatalogItemCardStatusIconTypeEnumModule.Unavailable] = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.CircleI else "icons/status/warning_small",
	[CatalogItemCardStatusIconTypeEnumModule.Error] = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.TriangleExclamation else "icons/status/error_large",
	[CatalogItemCardStatusIconTypeEnumModule.FAE] = LockClosed
}
local config1 = {
	[CatalogItemCardItemTypeEnumModule.Limited] = { { type = "icon", icon = "icons/status/item/limited" } },
	[CatalogItemCardItemTypeEnumModule.Collectible] = {
		{ type = "icon", icon = "icons/status/item/limited" },
		{ type = "text", text = "#" }
	}
}
local config2 = {
	[require(script.Parent.Enums.CatalogItemCardItemInfoEnum).DynamicHead] = "icons/menu/clothing/dynamicHead"
}

local function selectIsPortrait(p1): boolean
	-- upvalues: ResponsiveModule (copy)
	return p1.DeviceOrientation == ResponsiveModule.Keys.Portrait
end

local function buildBadgeStatusContent(Icon, Text)
	local List = { { type = "icon", icon = Icon } }
	
	if Text then
		table.insert(List, { type = "text", text = Text })
	end
	return List
end

local function buildSelectedOverlayBadge(ItemStatus, Icon, Text)
	-- upvalues: FFlagAXShowFaeUpsell (copy), CatalogItemCardStatusIconTypeEnumModule (copy), LockClosed (copy), FFlagAXInventoryDurablesSupport (copy), Clock (copy)
	local IconType = ItemStatus and ItemStatus.iconType
	local Text1 = ItemStatus and ItemStatus.text
	
	return if FFlagAXShowFaeUpsell and IconType == CatalogItemCardStatusIconTypeEnumModule.FAE then { icon = LockClosed } elseif Icon and Text1 then { icon = Icon, text = Text1 } elseif FFlagAXInventoryDurablesSupport and Text and IconType ~= CatalogItemCardStatusIconTypeEnumModule.Moderated then { icon = Clock, text = Text } else nil
end

return (ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: FFlagAXModeratedItemIconUpdates (copy), UseTokensFunction (copy), config2 (copy), config1 (copy), UseSelectorFunction (copy), selectIsPortrait (copy), config (copy), FFlagAXLookAndFeelBackgrounds (copy), FFlagAXSelectedBorderWrapsBackground (copy), ReactModule (copy), FoundationModule (copy), Icon (copy), IconSize (copy), ItemCard (copy), FFlagAXMISEnableMultiShopping (copy), ItemCardHeader (copy), CatalogItemCardSelectedOverlayModule (copy), FFlagAXFixBadgeStatusConfigOptions (copy), buildSelectedOverlayBadge (copy), FFlagAXShowFaeUpsell (copy), CatalogItemCardStatusIconTypeEnumModule (copy), LockClosed (copy), FFlagAXInventoryDurablesSupport (copy), Clock (copy), ItemCardHeaderCornersOverlay (copy), ItemCardStatus (copy), ItemCardBadge (copy), buildBadgeStatusContent (copy), ItemCardIcon (copy), MoveLimitedBadgeToTopLeft (copy), ItemCardFooter (copy), FFlagAXRootSlotBasedEditorFlag (copy)
	local UseTokensResult = if FFlagAXModeratedItemIconUpdates then UseTokensFunction() else nil
	local Title = Frame.title or (Frame.creator or Frame.priceLineContent)
	local Entry = if Frame.itemInfo then config2[Frame.itemInfo] else nil
	local Entry1 = if Frame.itemType then config1[Frame.itemType] else nil
	local UseSelectorResult = if FFlagAXModeratedItemIconUpdates then UseSelectorFunction(selectIsPortrait) else nil
	local Entry2 = if Frame.itemStatus and (Frame.itemStatus.type == "icon" or Frame.itemStatus.type == "badge") and Frame.itemStatus.iconType then config[Frame.itemStatus.iconType] else nil
	local BackgroundLayers = if FFlagAXLookAndFeelBackgrounds then Frame.backgroundLayers else nil
	local v1 = if FFlagAXSelectedBorderWrapsBackground then BackgroundLayers ~= nil and #BackgroundLayers > 0 else nil
	
	return ReactModule.createElement(ItemCard, {
		onActivated = Frame.onActivated,
		isDisabled = Frame.isDisabled,
		ref = Ref,
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize,
		LayoutOrder = Frame.LayoutOrder,
		tag = Frame.tag,
		Selectable = if FFlagAXMISEnableMultiShopping then Frame.Selectable else nil,
		showSelectionBorderWithBackground = if FFlagAXSelectedBorderWrapsBackground then Frame.isSelected else nil,
		backgroundLayers = if FFlagAXLookAndFeelBackgrounds then BackgroundLayers else nil,
		imageScaleType = if FFlagAXLookAndFeelBackgrounds then Frame.imageScaleType else nil,
		headerSlot = ReactModule.createElement(ItemCardHeader, {
			aspectRatio = Frame.headerAspectRatio,
			overlaySlot = if Frame.isSelected then ReactModule.createElement(CatalogItemCardSelectedOverlayModule, if Frame.onOverlayButtonActivated and Frame.overlayButtonText then {
				onActivated = Frame.onOverlayButtonActivated,
				buttonText = Frame.overlayButtonText,
				suppressBorder = if FFlagAXSelectedBorderWrapsBackground then v1 else nil,
				badge = if FFlagAXFixBadgeStatusConfigOptions then buildSelectedOverlayBadge(Frame.itemStatus, Entry2, Frame.expirationTime) elseif FFlagAXShowFaeUpsell and Frame.itemStatus and Frame.itemStatus.iconType == CatalogItemCardStatusIconTypeEnumModule.FAE then { icon = LockClosed } elseif Entry2 and Frame.itemStatus and Frame.itemStatus.text then { icon = Entry2, text = Frame.itemStatus.text } elseif FFlagAXInventoryDurablesSupport and Frame.expirationTime and (not Frame.itemStatus or Frame.itemStatus.iconType ~= CatalogItemCardStatusIconTypeEnumModule.Moderated) then { icon = Clock, text = Frame.expirationTime } else nil
			} elseif FFlagAXInventoryDurablesSupport and Entry2 then {
				itemStatusIcon = Entry2,
				suppressBorder = if FFlagAXSelectedBorderWrapsBackground then v1 else nil
			} elseif FFlagAXSelectedBorderWrapsBackground and v1 then { suppressBorder = true } else nil) else ReactModule.createElement(ItemCardHeaderCornersOverlay, {
				topLeftSlot = if Frame.itemStatus then if Frame.itemStatus.type == "text" and Frame.itemStatus.text then ReactModule.createElement(ItemCardStatus, { text = Frame.itemStatus.text }) elseif Frame.itemStatus.type == "badge" then ReactModule.createElement(ItemCardBadge, {
					displayBorder = true,
					content = if FFlagAXFixBadgeStatusConfigOptions or FFlagAXShowFaeUpsell then buildBadgeStatusContent(Entry2, Frame.itemStatus.text) else {
						{ type = "icon", icon = Entry2 },
						{ type = "text", text = Frame.itemStatus.text }
					}
				}) elseif Entry2 then ReactModule.createElement(ItemCardIcon, { icon = Entry2 }) else nil elseif FFlagAXInventoryDurablesSupport and Frame.expirationTime then ReactModule.createElement(ItemCardBadge, {
					displayBorder = true,
					content = {
						{ type = "icon", icon = Clock },
						{ type = "text", text = Frame.expirationTime }
					}
				}) elseif MoveLimitedBadgeToTopLeft and Entry1 then ReactModule.createElement(ItemCardBadge, { content = Entry1 }) else nil,
				bottomLeftSlot = if MoveLimitedBadgeToTopLeft or not Entry1 then nil else ReactModule.createElement(ItemCardBadge, { content = Entry1 }),
				bottomRightSlot = if Entry then ReactModule.createElement(ItemCardBadge, { content = { { type = "icon", icon = Entry } } }) else nil
			}),
			BackgroundTransparency = if FFlagAXLookAndFeelBackgrounds and BackgroundLayers then 1 else nil,
			Size = Frame.headerSize
		}, (function()
			-- upvalues: Frame (copy), ReactModule (upval), FoundationModule (upval), FFlagAXModeratedItemIconUpdates (upval), Icon (upval), config (upval), UseTokensResult (copy), UseSelectorResult (copy), IconSize (upval)
			return if Frame.itemStatus and Frame.itemStatus.type == "placeholder" then if Frame.itemStatus.iconType then ReactModule.createElement(FoundationModule.View, {
				tag = "size-full clip radius-medium row align-x-center align-y-center"
			}, {
				icon = if FFlagAXModeratedItemIconUpdates then ReactModule.createElement(Icon, {
					name = config[Frame.itemStatus.iconType],
					style = UseTokensResult.Color.Content.Muted,
					size = if UseSelectorResult then IconSize.Large else 40
				}) else ReactModule.createElement(FoundationModule.Image, {
					Image = config[Frame.itemStatus.iconType],
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
			titleTextSize = if FFlagAXRootSlotBasedEditorFlag then Frame.titleTextSize else nil
		}) else nil
	})
end))