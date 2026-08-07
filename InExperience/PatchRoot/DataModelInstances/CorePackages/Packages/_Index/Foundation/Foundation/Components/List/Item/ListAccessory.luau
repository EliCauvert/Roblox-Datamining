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

return reactModule.memo(function(p0) --[[ line: 45 | named "ListAccessory" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), accessoryTypeModule (ref), isBuilderOrMigratedIcon (ref), useListAccessoryVariantsModule (ref), avatarModule (ref), iconModule (ref), isMigrated (ref), uiblox (ref), imageModule (ref), viewModule (ref), stateLayerAffordanceModule (ref)
	local var11 = useTokensModule()
	local var12 = reactModule.useMemo(function() --[[ line: 47 ]]
		-- upvalues: p0 (ref)
		return if type(p0.config) == "string" then { iconName = p0.config } else p0.config
	end, { p0.config })
	local var13 = useListAccessoryVariantsModule(var11, p0.size, if var12.type == accessoryTypeModule.Avatar then accessoryTypeModule.Avatar elseif type(p0.config) == "string" or isBuilderOrMigratedIcon(var12.iconName) then accessoryTypeModule.Icon else accessoryTypeModule.Media)
	
	return reactModule.createElement(viewModule, {
		tag = "align-x-center align-y-center",
		Size = var13.container.Size,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		isDisabled = p0.isDisabled,
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId
	}, if var12.type == accessoryTypeModule.Avatar then reactModule.createElement(avatarModule, {
		userId = var12.userId,
		backplateStyle = var11.Color.Shift.Shift_200,
		size = p0.size
	}) elseif isBuilderOrMigratedIcon(var12.iconName) then reactModule.createElement(iconModule, {
		name = if isMigrated(var12.iconName) then uiblox[var12.iconName].name else var12.iconName,
		variant = if isMigrated(var12.iconName) then uiblox[var12.iconName].variant else var12.iconVariant,
		size = var13.accessory.Size.Y.Offset
	}) else reactModule.createElement(imageModule, {
		Image = var12.iconName,
		Size = var13.accessory.Size,
		cornerRadius = var13.accessory.cornerRadius
	}))
end)