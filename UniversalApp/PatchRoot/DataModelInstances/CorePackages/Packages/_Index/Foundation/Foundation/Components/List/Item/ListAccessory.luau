local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Uiblox = require(Parent.BuilderIcons).Migration.uiblox
local IconModule = require(Foundation.Components.Icon)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local IsMigratedFunction = IconMigrationUtilsModule.isMigrated
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local StateLayerAffordanceModule = require(Parent.Foundation.Enums.StateLayerAffordance)
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local AvatarModule = require(Foundation.Components.Avatar)
local UseListAccessoryVariantsModule = require(script.Parent.useListAccessoryVariants)
local _ = require(Foundation.Enums.InputSize)

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), AccessoryTypeModule (copy), IsBuilderOrMigratedIconFunction (copy), UseListAccessoryVariantsModule (copy), AvatarModule (copy), IconModule (copy), IsMigratedFunction (copy), Uiblox (copy), ImageModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy)
		return if type(Frame.config) == "string" then { iconName = Frame.config } else Frame.config
	end, { Frame.config })
	local UseListAccessoryVariantsModuleResult = UseListAccessoryVariantsModule(UseTokensModuleResult, Frame.size, if UseMemoResult.type == AccessoryTypeModule.Avatar then AccessoryTypeModule.Avatar elseif type(Frame.config) == "string" or IsBuilderOrMigratedIconFunction(UseMemoResult.iconName) then AccessoryTypeModule.Icon else AccessoryTypeModule.Media)
	
	return ReactModule.createElement(ViewModule, {
		tag = "align-x-center align-y-center",
		Size = UseListAccessoryVariantsModuleResult.container.Size,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		isDisabled = Frame.isDisabled,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, if UseMemoResult.type == AccessoryTypeModule.Avatar then ReactModule.createElement(AvatarModule, {
		userId = UseMemoResult.userId,
		backplateStyle = UseTokensModuleResult.Color.Shift.Shift_200,
		size = Frame.size
	}) elseif IsBuilderOrMigratedIconFunction(UseMemoResult.iconName) then ReactModule.createElement(IconModule, {
		name = if IsMigratedFunction(UseMemoResult.iconName) then Uiblox[UseMemoResult.iconName].name else UseMemoResult.iconName,
		variant = if IsMigratedFunction(UseMemoResult.iconName) then Uiblox[UseMemoResult.iconName].variant else UseMemoResult.iconVariant,
		size = UseListAccessoryVariantsModuleResult.accessory.Size.Y.Offset
	}) else ReactModule.createElement(ImageModule, {
		Image = UseMemoResult.iconName,
		Size = UseListAccessoryVariantsModuleResult.accessory.Size,
		cornerRadius = UseListAccessoryVariantsModuleResult.accessory.cornerRadius
	}))
end)