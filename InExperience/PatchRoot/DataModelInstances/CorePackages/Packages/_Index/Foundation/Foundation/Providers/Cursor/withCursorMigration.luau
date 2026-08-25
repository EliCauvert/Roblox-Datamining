local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local cursorContextModule = require(script.Parent.CursorContext)

return function(p0)
	-- upvalues: reactModule (ref), cursorContextModule (ref)
	return reactModule.createElement(cursorContextModule.Consumer, {
		render = function(p1)
			-- upvalues: p0 (ref)
			return p0(p1.getCursor)
		end
	})
end