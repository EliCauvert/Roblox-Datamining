local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local CursorContextModule = require(script.Parent.CursorContext)

return function(Render) --[[ Line: 8 | Named "withCursor" ]]
	-- upvalues: ReactModule (copy), CursorContextModule (copy)
	return ReactModule.createElement(CursorContextModule.Consumer, { render = Render })
end