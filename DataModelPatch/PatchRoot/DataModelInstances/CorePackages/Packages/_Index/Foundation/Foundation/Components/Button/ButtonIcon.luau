local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local ReactModule = require(Parent.React)
local _ = require(Foundation.Enums.ButtonVariant)
local _ = require(Foundation.Enums.InputSize)
local ImageModule = require(Foundation.Components.Image)
local TextModule = require(Foundation.Components.Text)
local GetIconScaleModule = require(Foundation.Utility.getIconScale)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local IsMigratedFunction = IconMigrationUtilsModule.isMigrated
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local UseButtonVariantsModule = require(script.Parent.useButtonVariants)
local UseTextSizeOffsetModule = require(Foundation.Providers.Style.useTextSizeOffset)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext

return function(p1)
	-- upvalues: UseTokensModule (copy), UseTextSizeOffsetModule (copy), GetIconScaleModule (copy), UsePresentationContextFunction (copy), UseButtonVariantsModule (copy), IsBuilderOrMigratedIconFunction (copy), ReactModule (copy), TextModule (copy), IsMigratedFunction (copy), Uiblox (copy), BuilderIconsModule (copy), ImageModule (copy)
	local DisabledTransparencyBinding = p1.disabledTransparencyBinding
	local TextTransparencyBinding = p1.textTransparencyBinding
	local UseTokensModuleResult = UseTokensModule()
	local UseTextSizeOffsetModuleResult: number = UseTextSizeOffsetModule()
	local IconScaleModule, IconScaleModule2 = GetIconScaleModule(p1.icon, p1.size)
	local UsePresentationContextResult = UsePresentationContextFunction()
	local UseButtonVariantsModuleResult = UseButtonVariantsModule(UseTokensModuleResult, p1.size, p1.variant, if UsePresentationContextResult then UsePresentationContextResult.colorMode else nil)
	
	return if p1.icon then if IsBuilderOrMigratedIconFunction(p1.icon) then ReactModule.createElement(TextModule, {
		tag = "position-center-center anchor-center-center",
		Text = if IsMigratedFunction(p1.icon) then Uiblox[p1.icon].name else p1.icon,
		fontStyle = {
			Font = BuilderIconsModule.Font[if IsMigratedFunction(p1.icon) then Uiblox[p1.icon].variant else BuilderIconsModule.IconVariant.Regular],
			FontSize = UseButtonVariantsModuleResult.icon.size.Y.Offset
		},
		Size = UseButtonVariantsModuleResult.icon.size,
		textStyle = ReactModule.joinBindings({ DisabledTransparencyBinding, TextTransparencyBinding }):map(function(Entry)
			-- upvalues: UseButtonVariantsModuleResult (copy)
			return {
				Color3 = UseButtonVariantsModuleResult.content.style.Color3,
				Transparency = Entry[2] + Entry[1]
			}
		end),
		testId = `{p1.testId}--icon`
	}, {
		UITextSizeConstraint = if UseTextSizeOffsetModuleResult > 0 then ReactModule.createElement("UITextSizeConstraint", {
			MaxTextSize = UseButtonVariantsModuleResult.icon.size.Y.Offset
		}) else nil
	}) else ReactModule.createElement(ImageModule, {
		tag = "position-center-center anchor-center-center",
		Image = p1.icon,
		Size = if IconScaleModule then UDim2.fromOffset(IconScaleModule.X, IconScaleModule.Y) else UseButtonVariantsModuleResult.icon.size,
		imageStyle = ReactModule.joinBindings({ DisabledTransparencyBinding, TextTransparencyBinding }):map(function(Entry)
			-- upvalues: UseButtonVariantsModuleResult (copy)
			return {
				Color3 = UseButtonVariantsModuleResult.content.style.Color3,
				Transparency = Entry[2] + Entry[1]
			}
		end),
		scale = IconScaleModule2,
		testId = `{p1.testId}--icon`
	}) else nil
end