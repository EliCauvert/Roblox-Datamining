local t = {}
local object = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Object
local _ = require(script.Parent.Parent.core.types)

function t.createOperation(p0, p1) --[[ line: 19 ]]
	-- upvalues: object (ref)
	local var1 = object.assign({}, p0)
	
	return setmetatable(p1, {
		__index = {
			setContext = function(_, p2) --[[ line: 22 ]]
				-- upvalues: var1 (write), object (copy)
				if typeof(p2) == "function" then
					var1 = object.assign({}, var1, p2(var1))
					
					return
				end
				var1 = object.assign({}, var1, p2)
			end,
			getContext = function(_) --[[ line: 30 ]]
				-- upvalues: object (copy), var1 (write)
				return object.assign({}, var1)
			end
		}
	})
end

return t