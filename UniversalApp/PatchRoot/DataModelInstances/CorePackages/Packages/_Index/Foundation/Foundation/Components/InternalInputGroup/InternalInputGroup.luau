local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local Components = Foundation.Components
local TextModule = require(Components.Text)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local InputGroupContextModule = require(script.Parent.InputGroupContext)
local UseInputGroupVariantsModule = require(script.Parent.useInputGroupVariants)
local config = {
	testId = "--foundation-internal-input-group",
	size = require(Foundation.Enums.InputSize).Medium,
	placement = require(Foundation.Enums.InputPlacement).Start
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 29 | Named "InternalInputGroup" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseInputGroupVariantsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), InputGroupContextModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseInputGroupVariantsModuleResult = UseInputGroupVariantsModule(UseTokensModule(), WithDefaultsModuleResult.size)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseInputGroupVariantsModuleResult.container.tag,
		ref = Ref
	}), {
		InputGroupContext = ReactModule.createElement(InputGroupContextModule.Provider, {
			value = ReactModule.useMemo(function() --[[ Line: 34 ]]
				-- upvalues: WithDefaultsModuleResult (copy)
				return {
					size = WithDefaultsModuleResult.size,
					placement = WithDefaultsModuleResult.placement
				}
			end, {
				WithDefaultsModuleResult.size,
				WithDefaultsModuleResult.placement
			})
		}, {
			GroupLabel = if WithDefaultsModuleResult.legend == nil or WithDefaultsModuleResult.legend == "" then nil else ReactModule.createElement(TextModule, {
				LayoutOrder = 0,
				Text = WithDefaultsModuleResult.legend,
				tag = UseInputGroupVariantsModuleResult.legend.tag,
				testId = `{WithDefaultsModuleResult.testId}--label`
			}),
			Children = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = UseInputGroupVariantsModuleResult.children.tag
			}, WithDefaultsModuleResult.children)
		})
	})
end))