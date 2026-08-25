local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local orientationModule = require(foundation.Enums.Orientation)
local optionSelectorGroupSizeModule = require(foundation.Enums.OptionSelectorGroupSize)
local _ = require(foundation.Enums.FillBehavior)
local flagsModule = require(foundation.Utility.Flags)
local inputLabelModule = require(foundation.Components.InputLabel)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local optionSelectorGroupContextModule = require(script.Parent.OptionSelectorGroupContext)
local useOptionSelectorGroupVariantsModule = require(script.Parent.useOptionSelectorGroupVariants)
local t = {
	Selectable = true,
	testId = "--foundation-option-selector-group",
	orientation = orientationModule.Vertical,
	size = if flagsModule.FoundationOptionSelectorGroupBeta then optionSelectorGroupSizeModule.Medium else nil
}

local function OptionSelectorGroupInner(p1)
	-- upvalues: useTokensModule (ref), useOptionSelectorGroupVariantsModule (ref), optionSelectorGroupSizeModule (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), inputLabelModule (ref), optionSelectorGroupContextModule (ref)
	local props = p1.props
	local var1 = useOptionSelectorGroupVariantsModule(useTokensModule(), props.size or optionSelectorGroupSizeModule.Medium, props.orientation)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(props, { tag = var1.container.tag, ref = p1.ref }), {
		Legend = if props.legend ~= nil then nil else reactModule.createElement(inputLabelModule, {
			LayoutOrder = 1,
			Text = props.legend,
			size = var1.legend.size,
			testId = `{props.testId}--legend`
		}),
		List = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var1.list.tag,
			testId = `{props.testId}--list`
		}, {
			OptionSelectorGroupContext = reactModule.createElement(optionSelectorGroupContextModule.Provider, {
				value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
					-- upvalues: p1 (ref), props (ref)
					return {
						value = p1.value,
						onValueChanged = p1.onValueChanged,
						orientation = props.orientation,
						Selectable = props.Selectable,
						testId = props.testId,
						size = p1.sizeOverride,
						fillBehavior = p1.fillBehaviorOverride
					}
				end, {
					p1.value, p1.onValueChanged, props.orientation, props.Selectable, props.testId,
					p1.sizeOverride, p1.fillBehaviorOverride
				}) else nil else {
					value = p1.value,
					onValueChanged = p1.onValueChanged,
					orientation = props.orientation,
					Selectable = props.Selectable,
					testId = props.testId,
					size = p1.sizeOverride,
					fillBehavior = p1.fillBehaviorOverride
				}
			}, props.children)
		})
	})
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), flagsModule (ref), OptionSelectorGroupInner (ref), viewModule (ref), withCommonPropsModule (ref), orientationModule (ref), optionSelectorGroupContextModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2, var3 = reactModule.useState(var1.value)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		if var1.value ~= nil then
			var3(var1.value)
		end
	end, { var1.value })
	local var4 = reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref), var1 (ref)
		var3(p1)
		var1.onValueChanged(p1)
	end, { var3, var1.onValueChanged })
	
	return if flagsModule.FoundationOptionSelectorGroupBeta then reactModule.createElement(OptionSelectorGroupInner, {
		props = var1,
		sizeOverride = p1.size,
		fillBehaviorOverride = p1.fillBehavior,
		value = var2,
		onValueChanged = var4,
		ref = p2
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = {
			["col size-full-0 auto-y"] = var1.orientation == orientationModule.Vertical,
			["row size-full-0 auto-y"] = flagsModule.FoundationOptionSelectorGroupFixes and var1.orientation == orientationModule.Horizontal,
			["row auto-x"] = not flagsModule.FoundationOptionSelectorGroupFixes and var1.orientation == orientationModule.Horizontal,
			["gap-small"] = true
		},
		ref = p2
	}), {
		OptionSelectorGroupContext = reactModule.createElement(optionSelectorGroupContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
				-- upvalues: var2 (ref), var4 (ref), var1 (ref)
				return {
					value = var2,
					onValueChanged = var4,
					orientation = var1.orientation,
					Selectable = var1.Selectable,
					testId = var1.testId
				}
			end, {
				var2,
				var4,
				var1.orientation,
				var1.Selectable,
				var1.testId
			}) else nil else {
				value = var2,
				onValueChanged = var4,
				orientation = var1.orientation,
				Selectable = var1.Selectable,
				testId = var1.testId
			}
		}, var1.children)
	})
end))