return function(p1)
	local t = {}
	local Module = nil
	
	local function _()
		-- upvalues: Module (ref), p1 (copy)
		if Module then
			return Module
		else
			Module = require(p1)
			
			return Module
		end
	end
	
	setmetatable(t, {
		__mode = "kv",
		__index = function(_, p2)
			-- upvalues: Module (ref), p1 (copy)
			local Module1 = nil
			if Module then
				Module1 = Module
			else
				Module = require(p1)
				Module1 = Module
			end
			return Module1[p2]
		end,
		__newindex = function(_, Key, p2)
			-- upvalues: Module (ref), p1 (copy)
			local Module1 = nil
			if Module then
				Module1 = Module
			else
				Module = require(p1)
				Module1 = Module
			end
			Module1[Key] = p2
		end,
		__call = function(_, ...)
			-- upvalues: Module (ref), p1 (copy)
			local Callback = nil
			if Module then
				Callback = Module
			else
				Module = require(p1)
				Callback = Module
			end
			return Callback(...)
		end,
		__len = function(_): number
			-- upvalues: Module (ref), p1 (copy)
			local Module1 = nil
			if Module then
				Module1 = Module
			else
				Module = require(p1)
				Module1 = Module
			end
			return #Module1
		end,
		__iter = function(_)
			-- upvalues: Module (ref), p1 (copy)
			local Iterator = next
			
			if Module then
				return Iterator, Module
			else
				Module = require(p1)
				
				return Iterator, Module
			end
		end
	})
	
	return t
end