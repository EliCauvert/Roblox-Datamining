local RoactModule = require(script.Parent.Parent.Roact)
local FocusContextModule = require(script.Parent.FocusContext)

local function FocusControllerConsumer(p1)
	-- upvalues: RoactModule (copy), FocusContextModule (copy)
	return RoactModule.createElement(FocusContextModule.Consumer, {
		render = function(FocusController)
			-- upvalues: p1 (copy)
			return p1.render(if FocusController then FocusController.focusNode.focusController else nil)
		end
	})
end

return function(Render)
	-- upvalues: RoactModule (copy), FocusControllerConsumer (copy)
	return RoactModule.createElement(FocusControllerConsumer, { render = Render })
end