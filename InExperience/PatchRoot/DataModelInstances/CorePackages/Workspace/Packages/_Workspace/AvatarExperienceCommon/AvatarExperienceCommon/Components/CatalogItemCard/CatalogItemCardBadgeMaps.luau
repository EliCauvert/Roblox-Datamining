local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local _ = require(parent.AvatarExperienceUIKit)
local builderIconsModule = require(parent.BuilderIcons)
local catalogItemCardItemTypeEnumModule = require(script.Parent.Enums.CatalogItemCardItemTypeEnum)
local catalogItemCardItemInfoEnumModule = require(script.Parent.Enums.CatalogItemCardItemInfoEnum)
local catalogItemCardStatusIconTypeEnumModule = require(script.Parent.Enums.CatalogItemCardStatusIconTypeEnum)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXModeratedItemIconUpdates = avatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local fFlagAXShowFaeUpsell = avatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local var1 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/actions/info_small"
local var2 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.ClockDashed else "icons/status/pending_small"
local var3 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.Clock else "icons/status/pending_small"
local var4 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/actions/info_small"
local var5 = if fFlagAXShowFaeUpsell then if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.LockClosed else "icons/status/private" else nil
local var6 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.CircleI else "icons/status/warning_small"
local var7 = if fFlagAXModeratedItemIconUpdates then builderIconsModule.Icon.TriangleExclamation else "icons/status/error_large"

return {
	itemTypeToContentMap = {
		[catalogItemCardItemTypeEnumModule.Limited] = { { type = "icon", icon = "icons/status/item/limited" } },
		[catalogItemCardItemTypeEnumModule.Collectible] = {
			{ type = "icon", icon = "icons/status/item/limited" },
			{ type = "text", text = "#" }
		}
	},
	itemInfoIconMap = {
		[catalogItemCardItemInfoEnumModule.DynamicHead] = "icons/menu/clothing/dynamicHead"
	},
	itemStatusIconTypeToIconMap = {
		[catalogItemCardStatusIconTypeEnumModule.Moderated] = var1,
		[catalogItemCardStatusIconTypeEnumModule.PendingModeration] = var2,
		[catalogItemCardStatusIconTypeEnumModule.Durable] = var3,
		[catalogItemCardStatusIconTypeEnumModule.Info] = var4,
		[catalogItemCardStatusIconTypeEnumModule.Unavailable] = var6,
		[catalogItemCardStatusIconTypeEnumModule.Error] = var7,
		[catalogItemCardStatusIconTypeEnumModule.FAE] = var5
	},
	rowItemStatusIconTypeToIconMap = {
		[catalogItemCardStatusIconTypeEnumModule.Moderated] = var1,
		[catalogItemCardStatusIconTypeEnumModule.PendingModeration] = var2,
		[catalogItemCardStatusIconTypeEnumModule.Unavailable] = var6,
		[catalogItemCardStatusIconTypeEnumModule.Durable] = var3
	},
	MODERATED_ICON = var1,
	PENDING_MODERATION_ICON = var2,
	DURABLE_ICON = var3,
	INFO_ICON = var4,
	FAE_ICON = var5,
	UNAVAILABLE_ICON = var6,
	ERROR_ICON = var7
}