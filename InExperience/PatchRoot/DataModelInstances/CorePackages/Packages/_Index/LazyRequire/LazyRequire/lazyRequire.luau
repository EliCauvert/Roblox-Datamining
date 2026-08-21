return function(p0) --[[ line: 1 ]]
	local t = {}
	local var1 = nil
	
	local _ = function() --[[ line: 5 ]]
		-- upvalues: var1 (write), p0 (ref)
		if var1 then
			return var1
		end
		var1 = require(p0)
		
		return var1
	end
	
	setmetatable(t, {
		__mode = "kv",
		__index = function(_, p1) --[[ line: 15 ]]
			-- upvalues: var1 (write), p0 (ref)
			local var2
			if var1 then
				var2 = var1
			else
				var1 = require(p0)
				var2 = var1
			end
			return var2[p1]
		end,
		__newindex = function(_, p2, p3) --[[ line: 20 ]]
			-- upvalues: var1 (write), p0 (ref)
			local var3
			if var1 then
				var3 = var1
			else
				var1 = require(p0)
				var3 = var1
			end
			var3[p2] = p3
		end,
		__call = function(_, ...) --[[ line: 25 ]]
			-- upvalues: var1 (write), p0 (ref)
			local var4
			if var1 then
				var4 = var1
			else
				var1 = require(p0)
				var4 = var1
			end
			return var4(...)
		end,
		__len = function(_) --[[ line: 30 ]]
			-- upvalues: var1 (write), p0 (ref)
			local var5
			if var1 then
				var5 = var1
			else
				var1 = require(p0)
				var5 = var1
			end
			return #var5
		end,
		__iter = function(_) --[[ line: 34 ]]
			-- upvalues: var1 (write), p0 (ref)
			local _next = next
			
			if var1 then
				return _next, var1
			end
			var1 = require(p0)
			
			return _next, var1
		end
	})
	
	return t
end