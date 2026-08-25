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

local function OptionSelectorGroupInner(p0)
	-- upvalues: useTokensModule (ref), useOptionSelectorGroupVariantsModule (ref), optionSelectorGroupSizeModule (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), inputLabelModule (ref), optionSelectorGroupContextModule (ref)
	local props = p0.props
	local var14 = useOptionSelectorGroupVariantsModule(useTokensModule(), props.size or optionSelectorGroupSizeModule.Medium, props.orientation)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(props, { tag = var14.container.tag, ref = p0.ref }), {
		Legend = if props.legend ~= nil then nil else reactModule.createElement(inputLabelModule, {
			LayoutOrder = 1,
			Text = props.legend,
			size = var14.legend.size,
			testId = `{props.testId}--legend`
		}),
		List = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var14.list.tag,
			testId = `{props.testId}--list`
		}, {
			OptionSelectorGroupContext = reactModule.createElement(optionSelectorGroupContextModule.Provider, {
				value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
					-- upvalues: p0 (ref), props (ref)
					return {
						value = p0.value,
						onValueChanged = p0.onValueChanged,
						orientation = props.orientation,
						Selectable = props.Selectable,
						testId = props.testId,
						size = p0.sizeOverride,
						fillBehavior = p0.fillBehaviorOverride
					}
				end, {
					p0.value, p0.onValueChanged, props.orientation, props.Selectable, props.testId,
					p0.sizeOverride, p0.fillBehaviorOverride
				}) else nil else {
					value = p0.value,
					onValueChanged = p0.onValueChanged,
					orientation = props.orientation,
					Selectable = props.Selectable,
					testId = props.testId,
					size = p0.sizeOverride,
					fillBehavior = p0.fillBehaviorOverride
				}
			}, props.children)
		})
	})
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), flagsModule (ref), OptionSelectorGroupInner (ref), viewModule (ref), withCommonPropsModule (ref), orientationModule (ref), optionSelectorGroupContextModule (ref)
	local var15 = withDefaultsModule(p1, t)
	local var16, var17 = reactModule.useState(var15.value)
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var17 (ref)
		if var15.value ~= nil then
			var17(var15.value)
		end
	end, { var15.value })
	local var18 = reactModule.useCallback(function(p3)
		-- upvalues: var17 (ref), var15 (ref)
		var17(p3)
		var15.onValueChanged(p3)
	end, { var17, var15.onValueChanged })
	
	return if flagsModule.FoundationOptionSelectorGroupBeta then reactModule.createElement(OptionSelectorGroupInner, {
		props = var15,
		sizeOverride = p1.size,
		fillBehaviorOverride = p1.fillBehavior,
		value = var16,
		onValueChanged = var18,
		ref = p2
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var15, {
		tag = {
			["col size-full-0 auto-y"] = var15.orientation == orientationModule.Vertical,
			["row size-full-0 auto-y"] = flagsModule.FoundationOptionSelectorGroupFixes and var15.orientation == orientationModule.Horizontal,
			["row auto-x"] = not flagsModule.FoundationOptionSelectorGroupFixes and var15.orientation == orientationModule.Horizontal,
			["gap-small"] = true
		},
		ref = p2
	}), {
		OptionSelectorGroupContext = reactModule.createElement(optionSelectorGroupContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
				-- upvalues: var16 (ref), var18 (ref), var15 (ref)
				return {
					value = var16,
					onValueChanged = var18,
					orientation = var15.orientation,
					Selectable = var15.Selectable,
					testId = var15.testId
				}
			end, {
				var16,
				var18,
				var15.orientation,
				var15.Selectable,
				var15.testId
			}) else nil else {
				value = var16,
				onValueChanged = var18,
				orientation = var15.orientation,
				Selectable = var15.Selectable,
				testId = var15.testId
			}
		}, var15.children)
	})
end))