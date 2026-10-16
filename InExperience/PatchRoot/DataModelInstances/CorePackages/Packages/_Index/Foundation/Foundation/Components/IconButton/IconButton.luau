local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local Uiblox = BuilderIconsModule.Migration.uiblox
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local _ = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.Radius)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext
local GetIconScaleModule = require(Foundation.Utility.getIconScale)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local IsBuilderIconModule = require(Foundation.Utility.isBuilderIcon)
local UseIconButtonVariantsModule = require(script.Parent.useIconButtonVariants)
local UseIconSizeModule = require(Foundation.Utility.useIconSize)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local IsMigratedFunction = IconMigrationUtilsModule.isMigrated
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local ConstantsModule = require(Foundation.Constants)
local ImageModule = require(Foundation.Components.Image)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local config = {
	isDisabled = false,
	isCircular = false,
	testId = "--foundation-icon-button",
	size = require(Foundation.Enums.InputSize).Medium,
	width = UDim.new(0, 0),
	variant = require(Foundation.Enums.ButtonVariant).Utility
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 79 | Named "IconButton" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePresentationContextFunction (copy), IsBuilderOrMigratedIconFunction (copy), GetIconScaleModule (copy), UseIconButtonVariantsModule (copy), UseIconSizeModule (copy), IsBuilderIconModule (copy), ReactModule (copy), FillBehaviorModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), TextModule (copy), IsMigratedFunction (copy), Uiblox (copy), BuilderIconsModule (copy), ImageModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UsePresentationContextResult = UsePresentationContextFunction()
	local Name = if typeof(WithDefaultsModuleResult.icon) == "table" then WithDefaultsModuleResult.icon.name else WithDefaultsModuleResult.icon
	local Variant = if typeof(WithDefaultsModuleResult.icon) == "table" then WithDefaultsModuleResult.icon.variant else nil
	local Vector = nil
	local Scale = nil
	
	if IsBuilderOrMigratedIconFunction(Name) then
		Vector = nil
		Scale = 1
	else
		Vector, Scale = GetIconScaleModule(Name, WithDefaultsModuleResult.size)
	end
	local UseIconButtonVariantsModuleResult = UseIconButtonVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, if UsePresentationContextResult then UsePresentationContextResult.colorNamespace else nil)
	local Size = UseIconButtonVariantsModuleResult.container.size
	local _UDim: UDim = if WithDefaultsModuleResult.isCircular then UDim.new(0, UseTokensModuleResult.Radius.Circle) else UDim.new(0, UseIconButtonVariantsModuleResult.container.radius or UseTokensModuleResult.Radius.Large)
	local UseIconSizeModuleResult = UseIconSizeModule(WithDefaultsModuleResult.size, IsBuilderIconModule(Name), true)
	local IsFillBehaviorMatch = WithDefaultsModuleResult.fillBehavior == FillBehaviorModule.Fill
	local IsNotScaleMatch: boolean = WithDefaultsModuleResult.width.Scale ~= 0 or WithDefaultsModuleResult.width.Offset ~= 0
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		onActivated = WithDefaultsModuleResult.onActivated,
		Size = UDim2.new(if IsFillBehaviorMatch then UDim.new(1, 0) elseif IsNotScaleMatch then WithDefaultsModuleResult.width else Size.X, UDim.new(0, Size.Y.Offset)),
		flexItem = if WithDefaultsModuleResult.fillBehavior then {
			FlexMode = if WithDefaultsModuleResult.fillBehavior == FillBehaviorModule.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
		} else nil,
		selection = {
			Selectable = not WithDefaultsModuleResult.isDisabled and WithDefaultsModuleResult.Selectable,
			NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
			NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
			NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
			NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
		},
		isDisabled = WithDefaultsModuleResult.isDisabled,
		stateLayer = UseIconButtonVariantsModuleResult.container.stateLayer,
		padding = UseIconButtonVariantsModuleResult.container.padding,
		cornerRadius = _UDim,
		backgroundStyle = UseIconButtonVariantsModuleResult.container.style,
		stroke = UseIconButtonVariantsModuleResult.container.stroke,
		cursor = ReactModule.useMemo(function() --[[ Line: 111 ]]
			-- upvalues: _UDim (copy), UseTokensModuleResult (copy)
			return {
				radius = _UDim,
				offset = UseTokensModuleResult.Size.Size_150,
				borderWidth = UseTokensModuleResult.Stroke.Thicker
			}
		end, { UseTokensModuleResult, _UDim }),
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		ref = Ref
	}), {
		Icon = if IsBuilderOrMigratedIconFunction(Name) then ReactModule.createElement(TextModule, {
			tag = "position-center-center anchor-center-center",
			Text = if IsMigratedFunction(Name) then Uiblox[Name].name else Name,
			fontStyle = {
				Font = BuilderIconsModule.Font[if IsMigratedFunction(Name) then Uiblox[Name].variant else Variant or BuilderIconsModule.IconVariant.Regular],
				FontSize = UseIconSizeModuleResult.Y.Offset
			},
			Size = UseIconSizeModuleResult,
			textStyle = UseIconButtonVariantsModuleResult.content.style,
			testId = `{WithDefaultsModuleResult.testId}--icon`
		}) else ReactModule.createElement(ImageModule, {
			tag = "position-center-center anchor-center-center",
			Image = Name,
			Size = if Vector then UDim2.fromOffset(Vector.X, Vector.Y) else UseIconSizeModuleResult,
			imageStyle = UseIconButtonVariantsModuleResult.content.style,
			scale = Scale,
			testId = `{WithDefaultsModuleResult.testId}--image`
		})
	})
end))