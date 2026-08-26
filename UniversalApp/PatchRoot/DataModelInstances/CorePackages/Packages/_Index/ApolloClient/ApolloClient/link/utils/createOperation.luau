local t = {}
local object = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Object
local _ = require(script.Parent.Parent.core.types)

function t.createOperation(p1, p2)
	-- upvalues: object (ref)
	local var1 = object.assign({}, p1)
	
	return setmetatable(p2, {
		__index = {
			setContext = function(_, p3)
				-- upvalues: var1 (write), object (copy)
				if typeof(p3) == "function" then
					var1 = object.assign({}, var1, p3(var1))
					
					return
				end
				var1 = object.assign({}, var1, p3)
			end,
			getContext = function(_)
				-- upvalues: object (copy), var1 (write)
				return object.assign({}, var1)
			end
		}
	})
end

return t