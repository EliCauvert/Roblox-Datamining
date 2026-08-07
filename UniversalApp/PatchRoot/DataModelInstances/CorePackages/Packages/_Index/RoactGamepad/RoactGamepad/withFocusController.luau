local roactModule = require(script.Parent.Parent.Roact)
local focusContextModule = require(script.Parent.FocusContext)

local function FocusControllerConsumer(p0) --[[ line: 9 ]]
	-- upvalues: roactModule (ref), focusContextModule (ref)
	return roactModule.createElement(focusContextModule.Consumer, {
		render = function(p1) --[[ line: 11 ]]
			-- upvalues: p0 (ref)
			return p0.render(if p1 then p1.focusNode.focusController else nil)
		end
	})
end

return function(p2) --[[ line: 24 | named "withFocusController" ]]
	-- upvalues: roactModule (ref), FocusControllerConsumer (ref)
	return roactModule.createElement(FocusControllerConsumer, { render = p2 })
end