local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local IconVariant = require(Parent.BuilderIcons).IconVariant
local ConstantsModule = require(Foundation.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local AccessoryModule = require(script.Parent.Accessory)
local IconPositionModule = require(Foundation.Enums.IconPosition)
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local StateLayerModeModule = require(Foundation.Enums.StateLayerMode)
local _ = require(Foundation.Enums.CursorType)
local UseChipVariantsModule = require(script.Parent.useChipVariants)
local config = {
	isChecked = false,
	Selectable = true,
	isDisabled = false,
	testId = "--foundation-chip",
	size = require(Foundation.Enums.ChipSize).Medium,
	variant = require(Foundation.Enums.ChipVariant).Standard
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 72 | Named "Chip" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), IconPositionModule (copy), IconVariant (copy), FlagsModule (copy), UseChipVariantsModule (copy), ColorNamespaceModule (copy), ViewModule (copy), WithCommonPropsModule (copy), StateLayerModeModule (copy), ConstantsModule (copy), PresentationContextModule (copy), AccessoryModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 76 ]]
		-- upvalues: WithDefaultsModuleResult (copy), IconPositionModule (upval), IconVariant (upval)
		local Leading = WithDefaultsModuleResult.leading
		local Trailing = WithDefaultsModuleResult.trailing
		
		if WithDefaultsModuleResult.icon ~= nil then
			if typeof(WithDefaultsModuleResult.icon) == "string" then
				Leading = { iconName = WithDefaultsModuleResult.icon }
			else
				local config = { iconName = WithDefaultsModuleResult.icon.name }
				
				if WithDefaultsModuleResult.icon.position == IconPositionModule.Left then
					Leading = config
				else
					Trailing = config
				end
			end
		end
		if typeof(Leading) == "table" and Leading.isCircular then
			Leading.iconVariant = IconVariant.Filled
		end
		if typeof(Trailing) == "table" and Trailing.isCircular then
			Trailing.iconVariant = IconVariant.Filled
		end
		return Leading, Trailing
	end, {
		WithDefaultsModuleResult.leading,
		WithDefaultsModuleResult.icon,
		WithDefaultsModuleResult.trailing
	})
	local IsNotTextMatch: boolean = WithDefaultsModuleResult.text ~= nil and WithDefaultsModuleResult.text ~= ""
	local IsIconOnly = if FlagsModule.FoundationFixChipAccessoryLayout then not IsNotTextMatch and UseMemoResult == nil ~= (UseMemoResult2 == nil) else nil
	local UseChipVariantsModuleResult = UseChipVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, WithDefaultsModuleResult.isChecked, UseMemoResult ~= nil, UseMemoResult2 ~= nil)
	local Floored = math.floor(UseTokensModuleResult.Stroke.Thicker)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		isDisabled = WithDefaultsModuleResult.isDisabled,
		selection = {
			Selectable = not WithDefaultsModuleResult.isDisabled and WithDefaultsModuleResult.Selectable,
			NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
			NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
			NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
			NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
		},
		onActivated = WithDefaultsModuleResult.onActivated,
		stateLayer = if WithDefaultsModuleResult.isChecked then { mode = StateLayerModeModule.Inverse } else nil,
		backgroundStyle = UseChipVariantsModuleResult.chip.backgroundStyle,
		padding = UseChipVariantsModuleResult.chip.padding,
		cursor = {
			radius = UDim.new(0, UseTokensModuleResult.Radius.Circle),
			offset = Floored * 2,
			borderWidth = Floored
		},
		tag = UseChipVariantsModuleResult.chip.tag,
		ref = Ref,
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else 0
	}), ReactModule.createElement(PresentationContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 116 ]]
			-- upvalues: WithDefaultsModuleResult (copy), ColorNamespaceModule (upval)
			return {
				isIconSize = true,
				colorNamespace = if WithDefaultsModuleResult.isChecked then ColorNamespaceModule.Inverse else ColorNamespaceModule.Color
			}
		end, { WithDefaultsModuleResult.isChecked })
	}, {
		Leading = if UseMemoResult then ReactModule.createElement(AccessoryModule, {
			isLeading = true,
			config = UseMemoResult,
			size = WithDefaultsModuleResult.size,
			chipBackgroundStyle = UseChipVariantsModuleResult.chip.backgroundStyle,
			contentStyle = UseChipVariantsModuleResult.text.contentStyle,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			isIconOnly = IsIconOnly,
			testId = `{WithDefaultsModuleResult.testId}--leading-accessory`
		}) else nil,
		Text = if IsNotTextMatch then ReactModule.createElement(TextModule, {
			LayoutOrder = 2,
			Text = WithDefaultsModuleResult.text,
			textStyle = UseChipVariantsModuleResult.text.contentStyle,
			tag = UseChipVariantsModuleResult.text.tag,
			padding = UseChipVariantsModuleResult.text.padding,
			testId = `{WithDefaultsModuleResult.testId}--text`
		}) else nil,
		Trailing = if UseMemoResult2 then ReactModule.createElement(AccessoryModule, {
			isLeading = false,
			config = UseMemoResult2,
			size = WithDefaultsModuleResult.size,
			chipBackgroundStyle = UseChipVariantsModuleResult.chip.backgroundStyle,
			contentStyle = UseChipVariantsModuleResult.text.contentStyle,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			isIconOnly = IsIconOnly,
			testId = `{WithDefaultsModuleResult.testId}--trailing-accessory`
		}) else nil
	}))
end))