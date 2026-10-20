local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local IconVariant = BuilderIconsModule.IconVariant
local IconModule = require(Foundation.Components.Icon)
local ImageModule = require(Foundation.Components.Image)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetIconScaleModule = require(Foundation.Utility.getIconScale)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local UseBadgeVariantsModule = require(script.Parent.useBadgeVariants)
local UseIconSizeModule = require(Foundation.Utility.useIconSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local IsMigratedFunction = IconMigrationUtilsModule.isMigrated
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local FlagsModule = require(Foundation.Utility.Flags)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local BadgeVariantModule = require(Foundation.Enums.BadgeVariant)
local IconSizeModule = require(Foundation.Enums.IconSize)
local IconPositionModule = require(Foundation.Enums.IconPosition)
local config = {
	testId = "--foundation-badge",
	variant = BadgeVariantModule.Contrast,
	shape = require(Foundation.Enums.BadgeShape).Pill,
	size = require(Foundation.Enums.BadgeSize).Small
}
local config1 = {
	[BadgeVariantModule.Primary] = BadgeVariantModule.Contrast,
	[BadgeVariantModule.Secondary] = if FlagsModule.FoundationBadgeBetaUpdate then BadgeVariantModule.Standard else BadgeVariantModule.Neutral,
	[BadgeVariantModule.Neutral] = if FlagsModule.FoundationBadgeBetaUpdate then BadgeVariantModule.Standard else nil
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), config1 (copy), UseScaledValueModule (copy), UseTokensModule (copy), ReactModule (copy), IconPositionModule (copy), UseBadgeVariantsModule (copy), FlagsModule (copy), IconSizeModule (copy), UseIconSizeModule (copy), IsBuilderOrMigratedIconFunction (copy), IconModule (copy), IsMigratedFunction (copy), Uiblox (copy), IconVariant (copy), GetIconScaleModule (copy), ViewModule (copy), ImageModule (copy), WithCommonPropsModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Entry = config1[WithDefaultsModuleResult.variant] or WithDefaultsModuleResult.variant
	local UseScaledValueModuleResult = UseScaledValueModule(200)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), IconPositionModule (upval)
		return if typeof(WithDefaultsModuleResult.icon) == "string" then {
			name = WithDefaultsModuleResult.icon,
			position = IconPositionModule.Left
		} else WithDefaultsModuleResult.icon
	end, { WithDefaultsModuleResult.icon })
	local v1: boolean = WithDefaultsModuleResult.text ~= nil and #WithDefaultsModuleResult.text > 0
	local NoV29 = not v1
	local UseBadgeVariantsModuleResult = UseBadgeVariantsModule(UseTokensModule(), Entry, WithDefaultsModuleResult.shape, if FlagsModule.FoundationBadgeBetaUpdate then WithDefaultsModuleResult.size else nil, if FlagsModule.FoundationBadgeBetaUpdate and UseMemoResult then UseMemoResult.position else nil, if FlagsModule.FoundationBadgeBetaUpdate then nil else NoV29)
	local Size = if FlagsModule.FoundationBadgeBetaUpdate then UseBadgeVariantsModuleResult.icon.size else IconSizeModule.XSmall
	local UseIconSizeModuleResult = UseIconSizeModule(Size, true)
	local Element = nil
	
	if UseMemoResult ~= nil then
		local LayoutOrder: number = if UseMemoResult.position == IconPositionModule.Left then 1 else 3
		
		if IsBuilderOrMigratedIconFunction(UseMemoResult.name) then
			Element = ReactModule.createElement(IconModule, {
				name = if IsMigratedFunction(UseMemoResult.name) then Uiblox[UseMemoResult.name].name else UseMemoResult.name,
				variant = if IsMigratedFunction(UseMemoResult.name) then Uiblox[UseMemoResult.name].variant elseif FlagsModule.FoundationBadgeBetaUpdate then UseMemoResult.variant or IconVariant.Filled else UseMemoResult.variant,
				size = Size,
				style = if FlagsModule.FoundationBadgeBetaUpdate then UseBadgeVariantsModuleResult.icon.style else UseBadgeVariantsModuleResult.content.style,
				LayoutOrder = LayoutOrder,
				testId = `{WithDefaultsModuleResult.testId}--icon`
			})
		else
			local IconScaleModule, IconScaleModule2 = GetIconScaleModule(UseMemoResult.name, Size)
			
			if IconScaleModule then
				Element = ReactModule.createElement(ViewModule, { Size = UseIconSizeModuleResult }, ReactModule.createElement(ImageModule, {
					Image = UseMemoResult.name,
					Size = UDim2.fromOffset(IconScaleModule.X, IconScaleModule.Y),
					imageStyle = if FlagsModule.FoundationBadgeBetaUpdate then UseBadgeVariantsModuleResult.icon.style else UseBadgeVariantsModuleResult.content.style,
					scale = IconScaleModule2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					LayoutOrder = LayoutOrder,
					testId = `{WithDefaultsModuleResult.testId}--icon`
				}))
			end
		end
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		backgroundStyle = UseBadgeVariantsModuleResult.container.backgroundStyle,
		stroke = if FlagsModule.FoundationBadgeBetaUpdate then nil else UseBadgeVariantsModuleResult.container.stroke,
		tag = UseBadgeVariantsModuleResult.container.tag,
		ref = Ref
	}), {
		Icon = Element,
		Text = if v1 then ReactModule.createElement(TextModule, {
			RichText = true,
			LayoutOrder = 2,
			Text = WithDefaultsModuleResult.text,
			textStyle = UseBadgeVariantsModuleResult.content.style,
			tag = UseBadgeVariantsModuleResult.text.tag,
			testId = `{WithDefaultsModuleResult.testId}--text`,
			sizeConstraint = if FlagsModule.FoundationBadgeBetaUpdate then { MaxSize = Vector2.new(UseScaledValueModuleResult, 1e999) } else nil
		}) else nil
	})
end))