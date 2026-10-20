local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local CursorContextModule = require(script.Parent.CursorContext)

return function(Callback)
	-- upvalues: ReactModule (copy), CursorContextModule (copy)
	return ReactModule.createElement(CursorContextModule.Consumer, {
		render = function(p1)
			-- upvalues: Callback (copy)
			return Callback(p1.getCursor)
		end
	})
end