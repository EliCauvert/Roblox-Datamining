local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local cursorContextModule = require(script.Parent.CursorContext)

return function(p1)
	-- upvalues: reactModule (ref), cursorContextModule (ref)
	return reactModule.createElement(cursorContextModule.Consumer, { render = p1 })
end