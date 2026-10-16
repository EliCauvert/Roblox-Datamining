local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local CursorContextModule = require(script.Parent.CursorContext)

return function(Callback) --[[ Line: 8 | Named "withCursorMigration" ]]
	-- upvalues: ReactModule (copy), CursorContextModule (copy)
	return ReactModule.createElement(CursorContextModule.Consumer, {
		render = function(p1) --[[ Line: 10 ]]
			-- upvalues: Callback (copy)
			return Callback(p1.getCursor)
		end
	})
end