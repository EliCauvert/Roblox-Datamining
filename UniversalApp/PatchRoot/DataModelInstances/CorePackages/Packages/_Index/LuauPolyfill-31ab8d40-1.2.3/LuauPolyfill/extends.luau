return function(p1, p2, p3)
	local t = {}
	t.__index = t
	
	function t:__tostring()
		-- upvalues: p1 (ref)
		return getmetatable(p1).__tostring(self)
	end
	
	local t_1 = {}
	
	function t.new(...)
		-- upvalues: p3 (ref), t (ref)
		local t_1 = {}
		p3(t_1, ...)
		
		return setmetatable(t_1, t)
	end
	
	if typeof(getmetatable(p1)) == "table" and getmetatable(p1).__call then
		function t_1:__call(...)
			-- upvalues: t (ref)
			return t.new(...)
		end
	end
	t_1.__index = p1
	
	function t_1:__tostring()
		-- upvalues: t (ref), p2 (ref), p1 (ref)
		return if self == t then tostring(p2) else getmetatable(p1).__tostring(self)
	end
	
	setmetatable(t, t_1)
	
	return t
end