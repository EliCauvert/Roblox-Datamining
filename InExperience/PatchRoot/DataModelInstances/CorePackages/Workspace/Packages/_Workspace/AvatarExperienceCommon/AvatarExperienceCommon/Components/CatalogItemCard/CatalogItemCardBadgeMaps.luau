local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local _ = require(Parent.AvatarExperienceUIKit)
local BuilderIconsModule = require(Parent.BuilderIcons)
local CatalogItemCardItemTypeEnumModule = require(script.Parent.Enums.CatalogItemCardItemTypeEnum)
local CatalogItemCardStatusIconTypeEnumModule = require(script.Parent.Enums.CatalogItemCardStatusIconTypeEnum)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXModeratedItemIconUpdates = AvatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local CircleI = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.CircleI else "icons/actions/info_small"
local ClockDashed = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.ClockDashed else "icons/status/pending_small"
local Clock = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.Clock else "icons/status/pending_small"
local CircleI1 = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.CircleI else "icons/actions/info_small"
local LockClosed = if FFlagAXShowFaeUpsell then if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.LockClosed else "icons/status/private" else nil
local CircleI2 = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.CircleI else "icons/status/warning_small"
local TriangleExclamation = if FFlagAXModeratedItemIconUpdates then BuilderIconsModule.Icon.TriangleExclamation else "icons/status/error_large"

return {
	itemTypeToContentMap = {
		[CatalogItemCardItemTypeEnumModule.Limited] = { { type = "icon", icon = "icons/status/item/limited" } },
		[CatalogItemCardItemTypeEnumModule.Collectible] = {
			{ type = "icon", icon = "icons/status/item/limited" },
			{ type = "text", text = "#" }
		}
	},
	itemInfoIconMap = {
		[require(script.Parent.Enums.CatalogItemCardItemInfoEnum).DynamicHead] = "icons/menu/clothing/dynamicHead"
	},
	itemStatusIconTypeToIconMap = {
		[CatalogItemCardStatusIconTypeEnumModule.Moderated] = CircleI,
		[CatalogItemCardStatusIconTypeEnumModule.PendingModeration] = ClockDashed,
		[CatalogItemCardStatusIconTypeEnumModule.Durable] = Clock,
		[CatalogItemCardStatusIconTypeEnumModule.Info] = CircleI1,
		[CatalogItemCardStatusIconTypeEnumModule.Unavailable] = CircleI2,
		[CatalogItemCardStatusIconTypeEnumModule.Error] = TriangleExclamation,
		[CatalogItemCardStatusIconTypeEnumModule.FAE] = LockClosed
	},
	rowItemStatusIconTypeToIconMap = {
		[CatalogItemCardStatusIconTypeEnumModule.Moderated] = CircleI,
		[CatalogItemCardStatusIconTypeEnumModule.PendingModeration] = ClockDashed,
		[CatalogItemCardStatusIconTypeEnumModule.Unavailable] = CircleI2,
		[CatalogItemCardStatusIconTypeEnumModule.Durable] = Clock
	},
	MODERATED_ICON = CircleI,
	PENDING_MODERATION_ICON = ClockDashed,
	DURABLE_ICON = Clock,
	INFO_ICON = CircleI1,
	FAE_ICON = LockClosed,
	UNAVAILABLE_ICON = CircleI2,
	ERROR_ICON = TriangleExclamation
}