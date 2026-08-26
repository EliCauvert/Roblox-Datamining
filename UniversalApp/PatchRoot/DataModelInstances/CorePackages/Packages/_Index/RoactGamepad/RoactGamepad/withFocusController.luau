local roactModule = require(script.Parent.Parent.Roact)
local focusContextModule = require(script.Parent.FocusContext)

local function FocusControllerConsumer(p1)
	-- upvalues: roactModule (ref), focusContextModule (ref)
	return roactModule.createElement(focusContextModule.Consumer, {
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1.render(if p2 then p2.focusNode.focusController else nil)
		end
	})
end

return function(p1)
	-- upvalues: roactModule (ref), FocusControllerConsumer (ref)
	return roactModule.createElement(FocusControllerConsumer, { render = p1 })
end