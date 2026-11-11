local Parent = script:FindFirstAncestor("NavigationRodux").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local RNAdapterThunkTag = require(Parent.AppCommonLib).Symbol.named("RNAdapterThunkTag")

return {
	middleware = function(p1)
		-- upvalues: ArgCheckModule (copy), RNAdapterThunkTag (copy)
		ArgCheckModule.isType(p1, "function", "rnDispatcher")
		
		return function(Callback, p2)
			-- upvalues: RNAdapterThunkTag (upval), p1 (copy)
			return function(Callback1)
				-- upvalues: RNAdapterThunkTag (upval), p2 (copy), p1 (upval), Callback (copy)
				return if typeof(Callback1) == "table" and Callback1[RNAdapterThunkTag] == true then Callback1(p2, p1) else Callback(Callback1)
			end
		end
	end,
	new = function(p1, Callback)
		-- upvalues: ArgCheckModule (copy), RNAdapterThunkTag (copy)
		ArgCheckModule.isNonEmptyString(p1, "name")
		ArgCheckModule.isType(Callback, "function", "onInvoke")
		
		return (setmetatable({ [RNAdapterThunkTag] = true, type = p1 }, {
			__call = function(_, ...)
				-- upvalues: Callback (copy)
				Callback(...)
			end
		}))
	end,
	test = function(Callback, p1, p2)
		-- upvalues: ArgCheckModule (copy), RNAdapterThunkTag (copy)
		ArgCheckModule.assert(type(Callback) == "table" and Callback[RNAdapterThunkTag] == true, "'thunk' must be a valid RNAdapterThunk")
		
		return Callback(p1, p2)
	end,
	is = function(p1): boolean
		-- upvalues: RNAdapterThunkTag (copy)
		return type(p1) == "table" and p1[RNAdapterThunkTag] == true
	end
}