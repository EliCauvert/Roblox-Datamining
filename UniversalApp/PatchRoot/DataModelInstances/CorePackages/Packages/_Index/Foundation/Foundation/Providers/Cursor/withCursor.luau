local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local cursorContextModule = require(script.Parent.CursorContext)

return function(p0)
	-- upvalues: reactModule (ref), cursorContextModule (ref)
	return reactModule.createElement(cursorContextModule.Consumer, { render = p0 })
end