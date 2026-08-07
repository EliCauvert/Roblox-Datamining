-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:44 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 30 ]]
	local t = {}
	t.__index = t
	
	function t:__tostring() --[[ line: 33 ]]
		-- upvalues: p0 (ref)
		return getmetatable(p0).__tostring(self)
	end
	
	local t_1 = {}
	
	function t.new(...) --[[ line: 39 ]]
		-- upvalues: p2 (ref), t (ref)
		local t_1 = {}
		p2(t_1, ...)
		
		return setmetatable(t_1, t)
	end
	
	if typeof(getmetatable(p0)) == "table" and getmetatable(p0).__call then
		function t_1:__call(...) --[[ line: 46 ]]
			-- upvalues: t (ref)
			return t.new(...)
		end
	end
	t_1.__index = p0
	
	function t_1:__tostring() --[[ line: 52 ]]
		-- upvalues: t (ref), p1 (ref), p0 (ref)
		return if self == t then tostring(p1) else getmetatable(p0).__tostring(self)
	end
	
	setmetatable(t, t_1)
	
	return t
end