local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Components = Foundation.Components
local _ = require(Components.BaseMenu)
local ViewModule = require(Components.View)
local ConstantsModule = require(Foundation.Constants)
local IconModule = require(Components.Icon)
local InputFieldModule = require(Components.InputField)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local TextModule = require(Components.Text)
local _ = require(Foundation.Components.Types)
local FlagsModule = require(Foundation.Utility.Flags)
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local GetInputTextSizeModule = require(Foundation.Utility.getInputTextSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseDropdownVariantsModule = require(script.Parent.useDropdownVariants)
local ControlStateModule = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Enums.CursorType)
local _ = require(Foundation.Enums.InputSize)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local BuilderIconsModule = require(Parent.BuilderIcons)
local ChevronLargeUp = BuilderIconsModule.Icon.ChevronLargeUp
local ChevronLargeDown = BuilderIconsModule.Icon.ChevronLargeDown
local config = {
	isMenuOpen = false,
	placeholder = "",
	variant = if FlagsModule.FoundationDropdownVariant then InputVariantModule.Standard else nil,
	Selectable = if FlagsModule.FoundationDropdownSelectionProps then true else nil
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ControlStateModule (copy), FlagsModule (copy), InputVariantModule (copy), UseDropdownVariantsModule (copy), InputFieldModule (copy), WithCommonPropsModule (copy), GetInputTextSizeModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), BlendTransparenciesModule (copy), ConstantsModule (copy), TextModule (copy), IconModule (copy), ChevronLargeUp (copy), ChevronLargeDown (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Initialize)
	local NoItem = WithDefaultsModuleResult.item == nil
	
	if FlagsModule.FoundationDropdownVariant and WithDefaultsModuleResult.variant == nil then
		WithDefaultsModuleResult.variant = InputVariantModule.Standard
	end
	local UseDropdownVariantsModuleResult = UseDropdownVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, if FlagsModule.FoundationDropdownVariant then WithDefaultsModuleResult.variant else nil, UseStateResult, NoItem, WithDefaultsModuleResult.hasError or false, if FlagsModule.FoundationDropdownVariant then WithDefaultsModuleResult.isMenuOpen else nil, if FlagsModule.FoundationDropdownVariant then UseStateResult == ControlStateModule.Hover else nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensModuleResult (copy)
		return {
			radius = UDim.new(0, UseTokensModuleResult.Radius.Small),
			offset = UseTokensModuleResult.Size.Size_200,
			borderWidth = UseTokensModuleResult.Stroke.Thicker
		}
	end, { UseTokensModuleResult })
	
	return ReactModule.createElement(InputFieldModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		size = GetInputTextSizeModule(WithDefaultsModuleResult.size),
		hasError = WithDefaultsModuleResult.hasError,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		label = WithDefaultsModuleResult.label,
		hint = WithDefaultsModuleResult.hint,
		ref = Ref,
		width = WithDefaultsModuleResult.width,
		input = function(_)
			-- upvalues: ReactModule (upval), ViewModule (upval), UseStateResult2 (copy), WithDefaultsModuleResult (copy), FlagsModule (upval), UseMemoResult (copy), StateLayerAffordanceModule (upval), UseDropdownVariantsModuleResult (copy), BlendTransparenciesModule (upval), ConstantsModule (upval), TextModule (upval), IconModule (upval), ChevronLargeUp (upval), ChevronLargeDown (upval), UseTokensModuleResult (copy)
			return ReactModule.createElement(ViewModule, {
				onStateChanged = UseStateResult2,
				isDisabled = WithDefaultsModuleResult.isDisabled,
				onActivated = WithDefaultsModuleResult.onActivated,
				selection = {
					Selectable = if FlagsModule.FoundationDropdownSelectionProps then not WithDefaultsModuleResult.isDisabled and WithDefaultsModuleResult.Selectable else not WithDefaultsModuleResult.isDisabled,
					NextSelectionUp = if FlagsModule.FoundationDropdownSelectionProps then WithDefaultsModuleResult.NextSelectionUp else nil,
					NextSelectionDown = if FlagsModule.FoundationDropdownSelectionProps then WithDefaultsModuleResult.NextSelectionDown else nil,
					NextSelectionLeft = if FlagsModule.FoundationDropdownSelectionProps then WithDefaultsModuleResult.NextSelectionLeft else nil,
					NextSelectionRight = if FlagsModule.FoundationDropdownSelectionProps then WithDefaultsModuleResult.NextSelectionRight else nil
				},
				cursor = UseMemoResult,
				stateLayer = { affordance = StateLayerAffordanceModule.None },
				backgroundStyle = if FlagsModule.FoundationDropdownVariant and UseDropdownVariantsModuleResult.container.bgStyle then {
					Color3 = UseDropdownVariantsModuleResult.container.bgStyle.Color3,
					Transparency = if WithDefaultsModuleResult.isDisabled then BlendTransparenciesModule(UseDropdownVariantsModuleResult.container.bgStyle.Transparency, ConstantsModule.DISABLED_TRANSPARENCY) else UseDropdownVariantsModuleResult.container.bgStyle.Transparency
				} else nil,
				stroke = if FlagsModule.FoundationDropdownVariant and UseDropdownVariantsModuleResult.container.strokeStyle then {
					Color = UseDropdownVariantsModuleResult.container.strokeStyle.Color3,
					Transparency = if WithDefaultsModuleResult.isDisabled then BlendTransparenciesModule(UseDropdownVariantsModuleResult.container.strokeStyle.Transparency, ConstantsModule.DISABLED_TRANSPARENCY) else UseDropdownVariantsModuleResult.container.strokeStyle.Transparency,
					Thickness = UseDropdownVariantsModuleResult.container.strokeThickness,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				} else nil,
				tag = UseDropdownVariantsModuleResult.container.tag,
				ref = WithDefaultsModuleResult.inputRef,
				testId = `{WithDefaultsModuleResult.testId}--control`
			}, {
				Text = ReactModule.createElement(TextModule, {
					LayoutOrder = 1,
					Text = if WithDefaultsModuleResult.item then WithDefaultsModuleResult.item.text else WithDefaultsModuleResult.placeholder,
					tag = UseDropdownVariantsModuleResult.text.tag
				}),
				Arrow = ReactModule.createElement(IconModule, {
					LayoutOrder = 2,
					name = if WithDefaultsModuleResult.isMenuOpen then ChevronLargeUp else ChevronLargeDown,
					size = UseDropdownVariantsModuleResult.arrow.size,
					style = if WithDefaultsModuleResult.isDisabled then UseTokensModuleResult.Color.Content.Muted else nil,
					tag = UseDropdownVariantsModuleResult.text.tag,
					testId = `{WithDefaultsModuleResult.testId}--arrow`
				})
			})
		end
	}))
end))