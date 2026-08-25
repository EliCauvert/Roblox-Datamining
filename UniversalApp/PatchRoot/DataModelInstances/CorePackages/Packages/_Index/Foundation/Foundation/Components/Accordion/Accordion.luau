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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), accordionContextModule (ref)
	local var8 = withDefaultsModule(p0, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var8, {
		tag = "col flex-y-evenly auto-y",
		Size = UDim2.new(var8.width, UDim.new(0, 0)),
		ref = p1
	}), {
		AccordionContext = reactModule.createElement(accordionContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
				-- upvalues: var8 (ref)
				return {
					onAccordionItemActivated = var8.onActivated,
					itemSize = var8.size,
					testId = var8.testId
				}
			end, { var8.onActivated, var8.size, var8.testId }) else nil else {
				onAccordionItemActivated = var8.onActivated,
				itemSize = var8.size,
				testId = var8.testId
			}
		}, var8.children)
	})
end))