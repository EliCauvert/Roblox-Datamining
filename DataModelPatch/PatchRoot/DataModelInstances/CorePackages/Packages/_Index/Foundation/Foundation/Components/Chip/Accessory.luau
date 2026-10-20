local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Uiblox = require(Parent.BuilderIcons).Migration.uiblox
local IconModule = require(Foundation.Components.Icon)
local ImageModule = require(Foundation.Components.Image)
local ViewModule = require(Foundation.Components.View)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local UseCumulativeBackgroundModule = require(Foundation.Utility.useCumulativeBackground)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local IsMigratedFunction = IconMigrationUtilsModule.isMigrated
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local AvatarGroupModule = require(Foundation.Components.AvatarGroup)
local _ = require(Foundation.Enums.AvatarGroupType)
local UseBackgroundStyleFunction = require(Foundation.Providers.Style.BackgroundStyleContext).useBackgroundStyle
local _ = require(Foundation.Components.Types)
local UseAccessoryVariantsModule = require(script.Parent.useAccessoryVariants)
local _ = require(Foundation.Enums.ChipSize)

local function AvatarGroupWrapper(p1)
	-- upvalues: UseBackgroundStyleFunction (copy), UseCumulativeBackgroundModule (copy), ReactModule (copy), AvatarGroupModule (copy)
	local UseBackgroundStyleResult = UseBackgroundStyleFunction()
	local Copy = table.clone(p1.config.props)
	Copy.size = p1.size
	Copy.backplateStyle = UseCumulativeBackgroundModule(UseBackgroundStyleResult, p1.chipBackgroundStyle)
	
	return ReactModule.createElement(AvatarGroupModule, Copy)
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), UseAccessoryVariantsModule (copy), AvatarGroupWrapper (copy), IsBuilderOrMigratedIconFunction (copy), IconModule (copy), IsMigratedFunction (copy), Uiblox (copy), ImageModule (copy), ViewModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return if type(p1.config) == "string" then { isCircular = false, iconName = p1.config } else p1.config
	end, { p1.config })
	local UseAccessoryVariantsModuleResult = UseAccessoryVariantsModule(UseTokensModule(), p1.size, p1.isLeading, UseMemoResult.type == "AvatarGroup" or (UseMemoResult.isCircular or false))
	
	return ReactModule.createElement(ViewModule, {
		tag = "auto-xy",
		padding = UseAccessoryVariantsModuleResult.accessory.padding,
		onActivated = UseMemoResult.onActivated,
		isDisabled = p1.isDisabled,
		LayoutOrder = if p1.isLeading then 1 else 3,
		testId = p1.testId
	}, if UseMemoResult.type == "AvatarGroup" then ReactModule.createElement(AvatarGroupWrapper, p1) elseif IsBuilderOrMigratedIconFunction(UseMemoResult.iconName) then ReactModule.createElement(IconModule, {
		name = if IsMigratedFunction(UseMemoResult.iconName) then Uiblox[UseMemoResult.iconName].name else UseMemoResult.iconName,
		variant = if IsMigratedFunction(UseMemoResult.iconName) then Uiblox[UseMemoResult.iconName].variant else UseMemoResult.iconVariant,
		size = UseAccessoryVariantsModuleResult.accessory.Size.Y.Offset,
		style = p1.contentStyle
	}) else ReactModule.createElement(ImageModule, {
		Image = UseMemoResult.iconName,
		Size = UseAccessoryVariantsModuleResult.accessory.Size,
		imageStyle = p1.contentStyle
	}))
end)