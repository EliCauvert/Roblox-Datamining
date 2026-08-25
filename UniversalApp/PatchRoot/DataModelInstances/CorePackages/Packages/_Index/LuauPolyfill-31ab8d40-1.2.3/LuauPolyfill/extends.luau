return function(p0, p1, p2)
	local t = {}
	t.__index = t
	
	function t:__tostring()
		-- upvalues: p0 (ref)
		return getmetatable(p0).__tostring(self)
	end
	
	local t_1 = {}
	
	function t.new(...)
		-- upvalues: p2 (ref), t (ref)
		local t_1 = {}
		p2(t_1, ...)
		
		return setmetatable(t_1, t)
	end
	
	if typeof(getmetatable(p0)) == "table" and getmetatable(p0).__call then
		function t_1:__call(...)
			-- upvalues: t (ref)
			return t.new(...)
		end
	end
	t_1.__index = p0
	
	function t_1:__tostring()
		-- upvalues: t (ref), p1 (ref), p0 (ref)
		return if self == t then tostring(p1) else getmetatable(p0).__tostring(self)
	end
	
	setmetatable(t, t_1)
	
	return t
end