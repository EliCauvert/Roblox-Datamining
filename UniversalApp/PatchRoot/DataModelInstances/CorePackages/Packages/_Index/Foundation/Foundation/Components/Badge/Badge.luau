local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local uiblox = builderIconsModule.Migration.uiblox
local iconVariant = builderIconsModule.IconVariant
local iconModule = require(foundation.Components.Icon)
local imageModule = require(foundation.Components.Image)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local getIconScaleModule = require(foundation.Utility.getIconScale)
local iconMigrationUtilsModule = require(foundation.Utility.iconMigrationUtils)
local useBadgeVariantsModule = require(script.Parent.useBadgeVariants)
local useIconSizeModule = require(foundation.Utility.useIconSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local isMigrated = iconMigrationUtilsModule.isMigrated
local isBuilderOrMigratedIcon = iconMigrationUtilsModule.isBuilderOrMigratedIcon
local flagsModule = require(foundation.Utility.Flags)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local badgeVariantModule = require(foundation.Enums.BadgeVariant)
local badgeShapeModule = require(foundation.Enums.BadgeShape)
local badgeSizeModule = require(foundation.Enums.BadgeSize)
local iconSizeModule = require(foundation.Enums.IconSize)
local iconPositionModule = require(foundation.Enums.IconPosition)
local t = {
	testId = "--foundation-badge",
	variant = badgeVariantModule.Contrast,
	shape = badgeShapeModule.Pill,
	size = badgeSizeModule.XSmall
}
local t_1 = {
	[badgeVariantModule.Primary] = badgeVariantModule.Contrast,
	[badgeVariantModule.Secondary] = badgeVariantModule.Neutral
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 71 | named "Badge" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), t_1 (ref), useScaledValueModule (ref), useTokensModule (ref), reactModule (ref), iconPositionModule (ref), useBadgeVariantsModule (ref), flagsModule (ref), iconSizeModule (ref), useIconSizeModule (ref), isBuilderOrMigratedIcon (ref), iconModule (ref), isMigrated (ref), uiblox (ref), iconVariant (ref), getIconScaleModule (ref), viewModule (ref), imageModule (ref), withCommonPropsModule (ref), textModule (ref)
	local var23 = withDefaultsModule(p0, t)
	local variant = t_1[var23.variant] or var23.variant
	local var25 = useScaledValueModule(200)
	local var26 = useTokensModule()
	local var27 = reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: var23 (ref), iconPositionModule (copy)
		return if typeof(var23.icon) == "string" then { name = var23.icon, position = iconPositionModule.Left } else var23.icon
	end, { var23.icon })
	local var28 = var23.text ~= nil and #var23.text > 0
	local var29 = useBadgeVariantsModule(var26, variant, var23.shape, if flagsModule.FoundationBadgeBetaUpdate then var23.size else nil, if flagsModule.FoundationBadgeBetaUpdate and var27 then var27.position else nil, if flagsModule.FoundationBadgeBetaUpdate then nil else not var28)
	local var30 = if flagsModule.FoundationBadgeBetaUpdate then var29.icon.size else iconSizeModule.XSmall
	local var31 = useIconSizeModule(var30, true)
	local var32 = nil
	
	if var27 ~= nil then
		local var33 = if var27.position == iconPositionModule.Left then 1 else 3
		
		if isBuilderOrMigratedIcon(var27.name) then
			var32 = reactModule.createElement(iconModule, {
				name = if isMigrated(var27.name) then uiblox[var27.name].name else var27.name,
				variant = if isMigrated(var27.name) then uiblox[var27.name].variant elseif flagsModule.FoundationBadgeBetaUpdate then var27.variant or iconVariant.Filled else var27.variant,
				size = var30,
				style = if flagsModule.FoundationBadgeBetaUpdate then var29.icon.style else var29.content.style,
				LayoutOrder = var33,
				testId = `{var23.testId}--icon`
			})
		else
			local var34, var35 = getIconScaleModule(var27.name, var30)
			
			if var34 then
				var32 = reactModule.createElement(viewModule, { Size = var31 }, reactModule.createElement(imageModule, {
					Image = var27.name,
					Size = UDim2.fromOffset(var34.X, var34.Y),
					imageStyle = if flagsModule.FoundationBadgeBetaUpdate then var29.icon.style else var29.content.style,
					scale = var35,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					LayoutOrder = var33,
					testId = `{var23.testId}--icon`
				}))
			end
		end
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var23, {
		backgroundStyle = var29.container.backgroundStyle,
		stroke = if flagsModule.FoundationBadgeBetaUpdate then nil else var29.container.stroke,
		tag = var29.container.tag,
		ref = p1
	}), {
		Icon = var32,
		Text = if var28 then reactModule.createElement(textModule, {
			RichText = true,
			LayoutOrder = 2,
			Text = var23.text,
			textStyle = var29.content.style,
			tag = var29.text.tag,
			testId = `{var23.testId}--text`,
			sizeConstraint = if flagsModule.FoundationBadgeBetaUpdate then { MaxSize = Vector2.new(var25, 1e999) } else nil
		}) else nil
	})
end))