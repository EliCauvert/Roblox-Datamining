-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 35 | named "Accordion" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), accordionContextModule (ref)
	local var7 = withDefaultsModule(p0, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var7, {
		tag = "col flex-y-evenly auto-y",
		Size = UDim2.new(var7.width, UDim.new(0, 0)),
		ref = p1
	}), {
		AccordionContext = reactModule.createElement(accordionContextModule.Provider, {
			value = {
				onAccordionItemActivated = var7.onActivated,
				itemSize = var7.size,
				testId = var7.testId
			}
		}, var7.children)
	})
end))