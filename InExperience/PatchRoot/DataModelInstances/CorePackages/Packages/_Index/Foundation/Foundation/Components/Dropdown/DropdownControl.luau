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
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local GetInputTextSizeModule = require(Foundation.Utility.getInputTextSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseDropdownVariantsModule = require(script.Parent.useDropdownVariants)
local ControlStateModule = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Enums.CursorType)
local _ = require(Foundation.Enums.InputSize)
local BuilderIconsModule = require(Parent.BuilderIcons)
local ChevronLargeUp = BuilderIconsModule.Icon.ChevronLargeUp
local ChevronLargeDown = BuilderIconsModule.Icon.ChevronLargeDown
local config = {
	isMenuOpen = false,
	placeholder = "",
	Selectable = true,
	variant = require(Foundation.Enums.InputVariant).Standard
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ControlStateModule (copy), UseDropdownVariantsModule (copy), InputFieldModule (copy), WithCommonPropsModule (copy), GetInputTextSizeModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), BlendTransparenciesModule (copy), ConstantsModule (copy), TextModule (copy), IconModule (copy), ChevronLargeUp (copy), ChevronLargeDown (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Initialize)
	local UseDropdownVariantsModuleResult = UseDropdownVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, UseStateResult, WithDefaultsModuleResult.item == nil, WithDefaultsModuleResult.hasError or false, WithDefaultsModuleResult.isMenuOpen, UseStateResult == ControlStateModule.Hover)
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
			-- upvalues: ReactModule (upval), ViewModule (upval), UseStateResult2 (copy), WithDefaultsModuleResult (copy), UseMemoResult (copy), StateLayerAffordanceModule (upval), UseDropdownVariantsModuleResult (copy), BlendTransparenciesModule (upval), ConstantsModule (upval), TextModule (upval), IconModule (upval), ChevronLargeUp (upval), ChevronLargeDown (upval), UseTokensModuleResult (copy)
			return ReactModule.createElement(ViewModule, {
				onStateChanged = UseStateResult2,
				isDisabled = WithDefaultsModuleResult.isDisabled,
				onActivated = WithDefaultsModuleResult.onActivated,
				selection = {
					Selectable = not WithDefaultsModuleResult.isDisabled and WithDefaultsModuleResult.Selectable,
					NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
					NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
					NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
					NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
				},
				cursor = UseMemoResult,
				stateLayer = { affordance = StateLayerAffordanceModule.None },
				backgroundStyle = if UseDropdownVariantsModuleResult.container.bgStyle then {
					Color3 = UseDropdownVariantsModuleResult.container.bgStyle.Color3,
					Transparency = if WithDefaultsModuleResult.isDisabled then BlendTransparenciesModule(UseDropdownVariantsModuleResult.container.bgStyle.Transparency, ConstantsModule.DISABLED_TRANSPARENCY) else UseDropdownVariantsModuleResult.container.bgStyle.Transparency
				} else nil,
				stroke = if UseDropdownVariantsModuleResult.container.strokeStyle then {
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