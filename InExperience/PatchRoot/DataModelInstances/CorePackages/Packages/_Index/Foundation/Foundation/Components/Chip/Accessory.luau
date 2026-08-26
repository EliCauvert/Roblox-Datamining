local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local uiblox = require(parent.BuilderIcons).Migration.uiblox
local iconModule = require(foundation.Components.Icon)
local imageModule = require(foundation.Components.Image)
local viewModule = require(foundation.Components.View)
local iconMigrationUtilsModule = require(foundation.Utility.iconMigrationUtils)
local useCumulativeBackgroundModule = require(foundation.Utility.useCumulativeBackground)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local isMigrated = iconMigrationUtilsModule.isMigrated
local isBuilderOrMigratedIcon = iconMigrationUtilsModule.isBuilderOrMigratedIcon
local avatarGroupModule = require(foundation.Components.AvatarGroup)
local _ = require(foundation.Enums.AvatarGroupType)
local useBackgroundStyle = require(foundation.Providers.Style.BackgroundStyleContext).useBackgroundStyle
local _ = require(foundation.Components.Types)
local useAccessoryVariantsModule = require(script.Parent.useAccessoryVariants)
local _ = require(foundation.Enums.ChipSize)

local function AvatarGroupWrapper(p1)
	-- upvalues: useBackgroundStyle (ref), useCumulativeBackgroundModule (ref), reactModule (ref), avatarGroupModule (ref)
	local var1 = useBackgroundStyle()
	local cloned = table.clone(p1.config.props)
	cloned.size = p1.size
	cloned.backplateStyle = useCumulativeBackgroundModule(var1, p1.chipBackgroundStyle)
	
	return reactModule.createElement(avatarGroupModule, cloned)
end

return reactModule.memo(function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), useAccessoryVariantsModule (ref), AvatarGroupWrapper (ref), isBuilderOrMigratedIcon (ref), iconModule (ref), isMigrated (ref), uiblox (ref), imageModule (ref), viewModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if type(p1.config) == "string" then { isCircular = false, iconName = p1.config } else p1.config
	end, { p1.config })
	local var2 = useAccessoryVariantsModule(useTokensModule(), p1.size, p1.isLeading, if var1.type ~= "AvatarGroup" then var1.isCircular or false else true)
	
	return reactModule.createElement(viewModule, {
		tag = "auto-xy",
		padding = var2.accessory.padding,
		onActivated = var1.onActivated,
		isDisabled = p1.isDisabled,
		LayoutOrder = if p1.isLeading then 1 else 3,
		testId = p1.testId
	}, if var1.type == "AvatarGroup" then reactModule.createElement(AvatarGroupWrapper, p1) elseif isBuilderOrMigratedIcon(var1.iconName) then reactModule.createElement(iconModule, {
		name = if isMigrated(var1.iconName) then uiblox[var1.iconName].name else var1.iconName,
		variant = if isMigrated(var1.iconName) then uiblox[var1.iconName].variant else var1.iconVariant,
		size = var2.accessory.Size.Y.Offset,
		style = p1.contentStyle
	}) else reactModule.createElement(imageModule, {
		Image = var1.iconName,
		Size = var2.accessory.Size,
		imageStyle = p1.contentStyle
	}))
end)