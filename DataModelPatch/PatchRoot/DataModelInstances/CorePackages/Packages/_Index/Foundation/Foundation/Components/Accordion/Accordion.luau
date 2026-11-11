local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local AccordionContextModule = require(script.Parent.AccordionContext)
local _ = require(script.Parent.useAccordion)
local config = {
	testId = "--foundation-accordion",
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
			value = {
				onAccordionItemActivated = WithDefaultsModuleResult.onActivated,
				itemSize = WithDefaultsModuleResult.size,
				testId = WithDefaultsModuleResult.testId
			}
		}, WithDefaultsModuleResult.children)
	})
end))