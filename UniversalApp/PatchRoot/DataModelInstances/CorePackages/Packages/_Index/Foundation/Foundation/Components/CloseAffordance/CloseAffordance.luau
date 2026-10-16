local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local IconModule = require(Foundation.Components.Icon)
local ReactModule = require(Parent.React)
local IconVariant = BuilderIconsModule.IconVariant
local _ = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.Radius)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ConstantsModule = require(Foundation.Constants)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseCloseAffordanceVariantsModule = require(script.Parent.useCloseAffordanceVariants)
local config = {
	isDisabled = false,
	isCircular = false,
	hasPadding = true,
	testId = "--foundation-close-affordance",
	size = require(Foundation.Enums.InputSize).Medium,
	variant = require(Foundation.Enums.CloseAffordanceVariant).OverMedia
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 53 | Named "CloseAffordance" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePresentationContextFunction (copy), UseCloseAffordanceVariantsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), IconModule (copy), BuilderIconsModule (copy), IconVariant (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseCloseAffordanceVariantsModuleResult = UseCloseAffordanceVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, UsePresentationContextFunction().colorNamespace, WithDefaultsModuleResult.hasPadding, WithDefaultsModuleResult.isCircular)
	local _UDim = UDim.new(0, UseCloseAffordanceVariantsModuleResult.container.radius)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = UseCloseAffordanceVariantsModuleResult.container.size,
		onActivated = WithDefaultsModuleResult.onActivated,
		selection = {
			Selectable = not WithDefaultsModuleResult.isDisabled and WithDefaultsModuleResult.Selectable,
			NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
			NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
			NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
			NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
		},
		isDisabled = WithDefaultsModuleResult.isDisabled,
		padding = UseCloseAffordanceVariantsModuleResult.container.padding,
		cornerRadius = _UDim,
		stateLayer = UseCloseAffordanceVariantsModuleResult.container.stateLayer,
		cursor = ReactModule.useMemo(function() --[[ Line: 68 ]]
			-- upvalues: _UDim (copy), UseTokensModuleResult (copy)
			return {
				radius = _UDim,
				offset = UseTokensModuleResult.Size.Size_150,
				borderWidth = UseTokensModuleResult.Stroke.Thicker
			}
		end, { UseTokensModuleResult, _UDim }),
		tag = UseCloseAffordanceVariantsModuleResult.container.tag,
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		ref = Ref
	}), {
		Icon = ReactModule.createElement(IconModule, {
			name = BuilderIconsModule.Icon.X,
			variant = IconVariant.Regular,
			size = UseCloseAffordanceVariantsModuleResult.content.iconSize,
			style = UseCloseAffordanceVariantsModuleResult.content.style
		})
	})
end))