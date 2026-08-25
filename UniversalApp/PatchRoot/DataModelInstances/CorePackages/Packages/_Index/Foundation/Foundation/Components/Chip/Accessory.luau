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

local function AvatarGroupWrapper(p0)
	-- upvalues: useBackgroundStyle (ref), useCumulativeBackgroundModule (ref), reactModule (ref), avatarGroupModule (ref)
	local var11 = useBackgroundStyle()
	local cloned = table.clone(p0.config.props)
	cloned.size = p0.size
	cloned.backplateStyle = useCumulativeBackgroundModule(var11, p0.chipBackgroundStyle)
	
	return reactModule.createElement(avatarGroupModule, cloned)
end

return reactModule.memo(function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), useAccessoryVariantsModule (ref), AvatarGroupWrapper (ref), isBuilderOrMigratedIcon (ref), iconModule (ref), isMigrated (ref), uiblox (ref), imageModule (ref), viewModule (ref)
	local var13 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if type(p1.config) == "string" then { isCircular = false, iconName = p1.config } else p1.config
	end, { p1.config })
	local var14 = useAccessoryVariantsModule(useTokensModule(), p1.size, p1.isLeading, if var13.type ~= "AvatarGroup" then var13.isCircular or false else true)
	
	return reactModule.createElement(viewModule, {
		tag = "auto-xy",
		padding = var14.accessory.padding,
		onActivated = var13.onActivated,
		isDisabled = p1.isDisabled,
		LayoutOrder = if p1.isLeading then 1 else 3,
		testId = p1.testId
	}, if var13.type == "AvatarGroup" then reactModule.createElement(AvatarGroupWrapper, p1) elseif isBuilderOrMigratedIcon(var13.iconName) then reactModule.createElement(iconModule, {
		name = if isMigrated(var13.iconName) then uiblox[var13.iconName].name else var13.iconName,
		variant = if isMigrated(var13.iconName) then uiblox[var13.iconName].variant else var13.iconVariant,
		size = var14.accessory.Size.Y.Offset,
		style = p1.contentStyle
	}) else reactModule.createElement(imageModule, {
		Image = var13.iconName,
		Size = var14.accessory.Size,
		imageStyle = p1.contentStyle
	}))
end)