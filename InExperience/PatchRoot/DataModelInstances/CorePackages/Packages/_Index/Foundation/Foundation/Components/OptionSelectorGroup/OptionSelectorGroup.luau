local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local OptionSelectorGroupSizeModule = require(Foundation.Enums.OptionSelectorGroupSize)
local _ = require(Foundation.Enums.FillBehavior)
local InputLabelModule = require(Foundation.Components.InputLabel)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local OptionSelectorGroupContextModule = require(script.Parent.OptionSelectorGroupContext)
local UseOptionSelectorGroupVariantsModule = require(script.Parent.useOptionSelectorGroupVariants)
local config = {
	Selectable = true,
	testId = "--foundation-option-selector-group",
	orientation = require(Foundation.Enums.Orientation).Vertical,
	size = OptionSelectorGroupSizeModule.Medium
}

local function OptionSelectorGroupInner(p1)
	-- upvalues: UseTokensModule (copy), UseOptionSelectorGroupVariantsModule (copy), OptionSelectorGroupSizeModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), InputLabelModule (copy), OptionSelectorGroupContextModule (copy)
	local Props = p1.props
	local UseOptionSelectorGroupVariantsModuleResult = UseOptionSelectorGroupVariantsModule(UseTokensModule(), Props.size or OptionSelectorGroupSizeModule.Medium, Props.orientation)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(Props, {
		tag = UseOptionSelectorGroupVariantsModuleResult.container.tag,
		ref = p1.ref
	}), {
		Legend = if Props.legend == nil then nil else ReactModule.createElement(InputLabelModule, {
			LayoutOrder = 1,
			Text = Props.legend,
			size = UseOptionSelectorGroupVariantsModuleResult.legend.size,
			testId = `{Props.testId}--legend`
		}),
		List = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = UseOptionSelectorGroupVariantsModuleResult.list.tag,
			testId = `{Props.testId}--list`
		}, {
			OptionSelectorGroupContext = ReactModule.createElement(OptionSelectorGroupContextModule.Provider, {
				value = ReactModule.useMemo(function()
					-- upvalues: p1 (copy), Props (copy)
					return {
						value = p1.value,
						onValueChanged = p1.onValueChanged,
						orientation = Props.orientation,
						Selectable = Props.Selectable,
						testId = Props.testId,
						size = p1.sizeOverride,
						fillBehavior = p1.fillBehaviorOverride
					}
				end, {
					p1.value, p1.onValueChanged, Props.orientation, Props.Selectable, Props.testId,
					p1.sizeOverride, p1.fillBehaviorOverride
				})
			}, Props.children)
		})
	})
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), OptionSelectorGroupInner (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.value)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2 (copy)
		if WithDefaultsModuleResult.value ~= nil then
			UseStateResult2(WithDefaultsModuleResult.value)
		end
	end, { WithDefaultsModuleResult.value })
	
	return (ReactModule.createElement(OptionSelectorGroupInner, {
		props = WithDefaultsModuleResult,
		sizeOverride = p1.size,
		fillBehaviorOverride = p1.fillBehavior,
		value = UseStateResult,
		onValueChanged = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
			UseStateResult2(p2)
			WithDefaultsModuleResult.onValueChanged(p2)
		end, { UseStateResult2, WithDefaultsModuleResult.onValueChanged }),
		ref = Ref
	}))
end))