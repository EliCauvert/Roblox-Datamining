return function(p1, p2, Callback)
	local Module = {}
	Module.__index = Module
	
	function Module.__tostring(p3)
		-- upvalues: p1 (copy)
		return getmetatable(p1).__tostring(p3)
	end
	
	local t = {}
	
	function Module.new(...)
		-- upvalues: Callback (copy), Module (copy)
		local t = {}
		Callback(t, ...)
		
		return (setmetatable(t, Module))
	end
	
	if typeof((getmetatable(p1))) == "table" and getmetatable(p1).__call then
		function t:__call(...)
			-- upvalues: Module (copy)
			return Module.new(...)
		end
	end
	t.__index = p1
	
	function t.__tostring(p3)
		-- upvalues: Module (copy), p2 (copy), p1 (copy)
		return if p3 == Module then tostring(p2) else getmetatable(p1).__tostring(p3)
	end
	
	setmetatable(Module, t)
	
	return Module
end