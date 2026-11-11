local Object = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Object
local _ = require(script.Parent.Parent.core.types)

return {
	createOperation = function(p1, p2)
		-- upvalues: Object (copy)
		local AssignResult = Object.assign({}, p1)
		
		return (setmetatable(p2, {
			__index = {
				setContext = function(_, Callback)
					-- upvalues: AssignResult (ref), Object (upval)
					if typeof(Callback) == "function" then
						AssignResult = Object.assign({}, AssignResult, Callback(AssignResult))
						
						return
					else
						AssignResult = Object.assign({}, AssignResult, Callback)
					end
				end,
				getContext = function(_)
					-- upvalues: Object (upval), AssignResult (ref)
					return Object.assign({}, AssignResult)
				end
			}
		}))
	end
}