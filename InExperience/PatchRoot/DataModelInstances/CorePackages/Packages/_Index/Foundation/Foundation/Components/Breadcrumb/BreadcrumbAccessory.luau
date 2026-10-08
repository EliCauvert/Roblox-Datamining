local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local uiblox = require(parent.BuilderIcons).Migration.uiblox
local avatarIconModule = require(foundation.Components.AvatarIcon)
local iconModule = require(foundation.Components.Icon)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local iconMigrationUtilsModule = require(foundation.Utility.iconMigrationUtils)
local isMigrated = iconMigrationUtilsModule.isMigrated
local isBuilderOrMigratedIcon = iconMigrationUtilsModule.isBuilderOrMigratedIcon
local accessoryTypeModule = require(foundation.Enums.AccessoryType)
local _ = require(foundation.Enums.AvatarIconSize)
local _ = require(foundation.Enums.IconSize)

return reactModule.memo(function(p1)
	-- upvalues: accessoryTypeModule (ref), reactModule (ref), avatarIconModule (ref), isBuilderOrMigratedIcon (ref), iconModule (ref), isMigrated (ref), uiblox (ref), imageModule (ref)
	local variant = p1.variant
	local var1 = if type(p1.config) == "string" then { iconName = p1.config } else p1.config
	
	if var1.type == accessoryTypeModule.Avatar then
		return reactModule.createElement(avatarIconModule, {
			userId = var1.userId,
			size = variant.avatarSize,
			LayoutOrder = p1.LayoutOrder,
			testId = p1.testId
		})
	end
	local iconName = var1.iconName
	
	return if isBuilderOrMigratedIcon(iconName) then reactModule.createElement(iconModule, {
		name = if isMigrated(iconName) then uiblox[iconName].name else iconName,
		variant = if isMigrated(iconName) then uiblox[iconName].variant else var1.iconVariant,
		size = variant.iconSize,
		style = variant.style,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}) else reactModule.createElement(imageModule, {
		Image = iconName,
		tag = variant.tag,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	})
end)