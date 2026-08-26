local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local uiblox = require(parent.BuilderIcons).Migration.uiblox
local iconModule = require(foundation.Components.Icon)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local iconMigrationUtilsModule = require(foundation.Utility.iconMigrationUtils)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local isMigrated = iconMigrationUtilsModule.isMigrated
local isBuilderOrMigratedIcon = iconMigrationUtilsModule.isBuilderOrMigratedIcon
local stateLayerAffordanceModule = require(parent.Foundation.Enums.StateLayerAffordance)
local accessoryTypeModule = require(foundation.Enums.AccessoryType)
local avatarModule = require(foundation.Components.Avatar)
local useListAccessoryVariantsModule = require(script.Parent.useListAccessoryVariants)
local _ = require(foundation.Enums.InputSize)

return reactModule.memo(function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), accessoryTypeModule (ref), isBuilderOrMigratedIcon (ref), useListAccessoryVariantsModule (ref), avatarModule (ref), iconModule (ref), isMigrated (ref), uiblox (ref), imageModule (ref), viewModule (ref), stateLayerAffordanceModule (ref)
	local var1 = useTokensModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if type(p1.config) == "string" then { iconName = p1.config } else p1.config
	end, { p1.config })
	local var3 = useListAccessoryVariantsModule(var1, p1.size, if var2.type == accessoryTypeModule.Avatar then accessoryTypeModule.Avatar elseif type(p1.config) == "string" or isBuilderOrMigratedIcon(var2.iconName) then accessoryTypeModule.Icon else accessoryTypeModule.Media)
	
	return reactModule.createElement(viewModule, {
		tag = "align-x-center align-y-center",
		Size = var3.container.Size,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		isDisabled = p1.isDisabled,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, if var2.type == accessoryTypeModule.Avatar then reactModule.createElement(avatarModule, {
		userId = var2.userId,
		backplateStyle = var1.Color.Shift.Shift_200,
		size = p1.size
	}) elseif isBuilderOrMigratedIcon(var2.iconName) then reactModule.createElement(iconModule, {
		name = if isMigrated(var2.iconName) then uiblox[var2.iconName].name else var2.iconName,
		variant = if isMigrated(var2.iconName) then uiblox[var2.iconName].variant else var2.iconVariant,
		size = var3.accessory.Size.Y.Offset
	}) else reactModule.createElement(imageModule, {
		Image = var2.iconName,
		Size = var3.accessory.Size,
		cornerRadius = var3.accessory.cornerRadius
	}))
end)