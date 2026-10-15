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
local flagsModule = require(foundation.Utility.Flags)
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
	-- upvalues: useTokensModule (ref), reactModule (ref), useAccessoryVariantsModule (ref), flagsModule (ref), AvatarGroupWrapper (ref), isBuilderOrMigratedIcon (ref), iconModule (ref), isMigrated (ref), uiblox (ref), imageModule (ref), viewModule (ref)
	local var1
	local var2 = useTokensModule()
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if type(p1.config) == "string" then { isCircular = false, iconName = p1.config } else p1.config
	end, { p1.config })
	local size = p1.size
	local isLeading = p1.isLeading
	
	if flagsModule.FoundationFixChipAccessoryLayout then
		local _ = var3.type == "AvatarGroup"
	else
		var1 = if var3.type ~= "AvatarGroup" then var3.isCircular or false else true
	end
	local var4 = useAccessoryVariantsModule(var2, size, isLeading, var1, p1.isIconOnly)
	
	return reactModule.createElement(viewModule, {
		tag = "auto-xy",
		padding = var4.accessory.padding,
		onActivated = var3.onActivated,
		isDisabled = p1.isDisabled,
		LayoutOrder = if p1.isLeading then 1 else 3,
		testId = p1.testId
	}, if var3.type == "AvatarGroup" then reactModule.createElement(AvatarGroupWrapper, p1) elseif isBuilderOrMigratedIcon(var3.iconName) then reactModule.createElement(iconModule, {
		name = if isMigrated(var3.iconName) then uiblox[var3.iconName].name else var3.iconName,
		variant = if isMigrated(var3.iconName) then uiblox[var3.iconName].variant else var3.iconVariant,
		size = var4.accessory.Size.Y.Offset,
		style = p1.contentStyle
	}) else reactModule.createElement(imageModule, {
		Image = var3.iconName,
		Size = var4.accessory.Size,
		imageStyle = p1.contentStyle
	}))
end)