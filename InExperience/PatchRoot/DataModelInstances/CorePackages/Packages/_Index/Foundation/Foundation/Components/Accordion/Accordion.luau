local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local accordionContextModule = require(script.Parent.AccordionContext)
local _ = require(script.Parent.useAccordion)
local t = {
	testId = "--foundation-accordion",
	size = require(foundation.Enums.InputSize).Medium,
	width = UDim.new(1, 0)
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), accordionContextModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = "col flex-y-evenly auto-y",
		Size = UDim2.new(var1.width, UDim.new(0, 0)),
		ref = p2
	}), {
		AccordionContext = reactModule.createElement(accordionContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
				-- upvalues: var1 (ref)
				return {
					onAccordionItemActivated = var1.onActivated,
					itemSize = var1.size,
					testId = var1.testId
				}
			end, { var1.onActivated, var1.size, var1.testId }) else nil else {
				onAccordionItemActivated = var1.onActivated,
				itemSize = var1.size,
				testId = var1.testId
			}
		}, var1.children)
	})
end))