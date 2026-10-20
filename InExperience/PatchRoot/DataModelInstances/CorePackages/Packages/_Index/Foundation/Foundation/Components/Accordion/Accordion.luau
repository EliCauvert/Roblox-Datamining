local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local AccordionContextModule = require(script.Parent.AccordionContext)
local _ = require(script.Parent.useAccordion)
local config = {
	isContained = false,
	testId = "--foundation-accordion",
	chevronPosition = require(Foundation.Enums.InputPlacement).End,
	size = require(Foundation.Enums.InputSize).Medium,
	width = UDim.new(1, 0)
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), AccordionContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "col flex-y-evenly auto-y",
		Size = UDim2.new(WithDefaultsModuleResult.width, UDim.new(0, 0)),
		ref = Ref
	}), {
		AccordionContext = ReactModule.createElement(AccordionContextModule.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: WithDefaultsModuleResult (copy)
				return {
					onAccordionItemActivated = WithDefaultsModuleResult.onActivated,
					itemSize = WithDefaultsModuleResult.size,
					isContained = WithDefaultsModuleResult.isContained,
					chevronPosition = WithDefaultsModuleResult.chevronPosition,
					testId = WithDefaultsModuleResult.testId
				}
			end, {
				WithDefaultsModuleResult.onActivated,
				WithDefaultsModuleResult.size,
				WithDefaultsModuleResult.isContained,
				WithDefaultsModuleResult.chevronPosition,
				WithDefaultsModuleResult.testId
			})
		}, WithDefaultsModuleResult.children)
	})
end))