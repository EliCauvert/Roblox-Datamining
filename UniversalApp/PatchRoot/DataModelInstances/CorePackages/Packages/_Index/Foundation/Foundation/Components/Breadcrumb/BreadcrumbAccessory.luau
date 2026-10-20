local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Uiblox = require(Parent.BuilderIcons).Migration.uiblox
local AvatarIconModule = require(Foundation.Components.AvatarIcon)
local IconModule = require(Foundation.Components.Icon)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local IsMigratedFunction = IconMigrationUtilsModule.isMigrated
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local _ = require(Foundation.Enums.AvatarIconSize)
local _ = require(Foundation.Enums.IconSize)

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: AccessoryTypeModule (copy), ReactModule (copy), AvatarIconModule (copy), IsBuilderOrMigratedIconFunction (copy), IconModule (copy), IsMigratedFunction (copy), Uiblox (copy), ImageModule (copy)
	local Variant = Frame.variant
	local Config = if type(Frame.config) == "string" then { iconName = Frame.config } else Frame.config
	
	if Config.type == AccessoryTypeModule.Avatar then
		return ReactModule.createElement(AvatarIconModule, {
			userId = Config.userId,
			size = Variant.avatarSize,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		})
	else
		local IconName = Config.iconName
		
		return if IsBuilderOrMigratedIconFunction(IconName) then ReactModule.createElement(IconModule, {
			name = if IsMigratedFunction(IconName) then Uiblox[IconName].name else IconName,
			variant = if IsMigratedFunction(IconName) then Uiblox[IconName].variant else Config.iconVariant,
			size = Variant.iconSize,
			style = Variant.style,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		}) else ReactModule.createElement(ImageModule, {
			Image = IconName,
			tag = Variant.tag,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		})
	end
end)