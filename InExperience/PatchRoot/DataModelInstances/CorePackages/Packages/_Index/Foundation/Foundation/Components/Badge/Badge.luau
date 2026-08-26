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
	size = badgeSizeModule.Small
}
local t_1 = {
	[badgeVariantModule.Primary] = badgeVariantModule.Contrast,
	[badgeVariantModule.Secondary] = if flagsModule.FoundationBadgeBetaUpdate then badgeVariantModule.Standard else badgeVariantModule.Neutral,
	[badgeVariantModule.Neutral] = if flagsModule.FoundationBadgeBetaUpdate then badgeVariantModule.Standard else nil
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), t_1 (ref), useScaledValueModule (ref), useTokensModule (ref), reactModule (ref), iconPositionModule (ref), useBadgeVariantsModule (ref), flagsModule (ref), iconSizeModule (ref), useIconSizeModule (ref), isBuilderOrMigratedIcon (ref), iconModule (ref), isMigrated (ref), uiblox (ref), iconVariant (ref), getIconScaleModule (ref), viewModule (ref), imageModule (ref), withCommonPropsModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local variant = t_1[var1.variant] or var1.variant
	local var2 = useScaledValueModule(200)
	local var3 = useTokensModule()
	local var4 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), iconPositionModule (copy)
		return if typeof(var1.icon) == "string" then { name = var1.icon, position = iconPositionModule.Left } else var1.icon
	end, { var1.icon })
	local var5 = var1.text ~= nil and #var1.text > 0
	local var6 = useBadgeVariantsModule(var3, variant, var1.shape, if flagsModule.FoundationBadgeBetaUpdate then var1.size else nil, if flagsModule.FoundationBadgeBetaUpdate and var4 then var4.position else nil, if flagsModule.FoundationBadgeBetaUpdate then nil else not var5)
	local var7 = if flagsModule.FoundationBadgeBetaUpdate then var6.icon.size else iconSizeModule.XSmall
	local var8 = useIconSizeModule(var7, true)
	local var9 = nil
	
	if var4 ~= nil then
		local var10 = if var4.position == iconPositionModule.Left then 1 else 3
		
		if isBuilderOrMigratedIcon(var4.name) then
			var9 = reactModule.createElement(iconModule, {
				name = if isMigrated(var4.name) then uiblox[var4.name].name else var4.name,
				variant = if isMigrated(var4.name) then uiblox[var4.name].variant elseif flagsModule.FoundationBadgeBetaUpdate then var4.variant or iconVariant.Filled else var4.variant,
				size = var7,
				style = if flagsModule.FoundationBadgeBetaUpdate then var6.icon.style else var6.content.style,
				LayoutOrder = var10,
				testId = `{var1.testId}--icon`
			})
		else
			local var11, var12 = getIconScaleModule(var4.name, var7)
			
			if var11 then
				var9 = reactModule.createElement(viewModule, { Size = var8 }, reactModule.createElement(imageModule, {
					Image = var4.name,
					Size = UDim2.fromOffset(var11.X, var11.Y),
					imageStyle = if flagsModule.FoundationBadgeBetaUpdate then var6.icon.style else var6.content.style,
					scale = var12,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					LayoutOrder = var10,
					testId = `{var1.testId}--icon`
				}))
			end
		end
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		backgroundStyle = var6.container.backgroundStyle,
		stroke = if flagsModule.FoundationBadgeBetaUpdate then nil else var6.container.stroke,
		tag = var6.container.tag,
		ref = p2
	}), {
		Icon = var9,
		Text = if var5 then reactModule.createElement(textModule, {
			RichText = true,
			LayoutOrder = 2,
			Text = var1.text,
			textStyle = var6.content.style,
			tag = var6.text.tag,
			testId = `{var1.testId}--text`,
			sizeConstraint = if flagsModule.FoundationBadgeBetaUpdate then { MaxSize = Vector2.new(var2, 1e999) } else nil
		}) else nil
	})
end))