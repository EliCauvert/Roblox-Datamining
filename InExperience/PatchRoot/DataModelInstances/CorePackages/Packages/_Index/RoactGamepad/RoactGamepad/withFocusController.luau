local RoactModule = require(script.Parent.Parent.Roact)
local FocusContextModule = require(script.Parent.FocusContext)

local function FocusControllerConsumer(p1) --[[ Line: 9 ]]
	-- upvalues: RoactModule (copy), FocusContextModule (copy)
	return RoactModule.createElement(FocusContextModule.Consumer, {
		render = function(FocusController) --[[ Line: 11 ]]
			-- upvalues: p1 (copy)
			return p1.render(if FocusController then FocusController.focusNode.focusController else nil)
		end
	})
end

return function(Render) --[[ Line: 24 | Named "withFocusController" ]]
	-- upvalues: RoactModule (copy), FocusControllerConsumer (copy)
	return RoactModule.createElement(FocusControllerConsumer, { render = Render })
end