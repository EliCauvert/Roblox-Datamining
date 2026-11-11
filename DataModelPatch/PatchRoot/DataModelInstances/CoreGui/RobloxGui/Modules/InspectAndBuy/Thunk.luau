local ThunkTag = require(script.Parent.Symbol).named("ThunkTag")

return {
	middleware = function(p1)
		-- upvalues: ThunkTag (copy)
		local P0 = p1 or {}
		
		return function(Callback, p2)
			-- upvalues: ThunkTag (upval), P0 (ref)
			return function(Callback1)
				-- upvalues: ThunkTag (upval), P0 (upval), p2 (copy), Callback (copy)
				if Callback1[ThunkTag] ~= true then
					return Callback(Callback1)
				end
				local t = {}
				
				for _, requiredService in pairs(Callback1.requiredServices) do
					local Entry = P0[requiredService]
					
					if Entry == nil then
						error(("Service with key %s is a dependency but was not provided"):format(requiredService))
					end
					t[requiredService] = Entry
				end
				return Callback1(p2, t)
			end
		end
	end,
	new = function(p2, p3, Callback)
		-- upvalues: ThunkTag (copy)
		assert(typeof(p2) == "string", "Bad arg #1: name must be a string")
		assert(p3 == nil or typeof(p3) == "table", "Bad arg #2: requiredServices must be a table or nil")
		assert(typeof(Callback) == "function", "Bad arg #3: onInvoke must be a function")
		
		return (setmetatable({
			[ThunkTag] = true,
			type = p2,
			requiredServices = p3 or {}
		}, {
			__call = function(_, ...)
				-- upvalues: Callback (copy)
				Callback(...)
			end
		}))
	end,
	test = function(Callback, p2, p3)
		-- upvalues: ThunkTag (copy)
		assert(typeof(Callback) == "table" and Callback[ThunkTag] == true, "Test Error - Bad arg #1: Must provide a valid thunk")
		
		if #Callback.requiredServices > 0 then
			for _, requiredService in ipairs(Callback.requiredServices) do
				assert(p3[requiredService] ~= nil, "Test Error - Bad arg #3: Missing required service " .. tostring(requiredService))
			end
		end
		return Callback(p2, p3)
	end
}