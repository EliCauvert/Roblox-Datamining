-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:04 2026 Pacific Standard Time.

local function deepcopy(p0) --[[ line: 1 ]]
	-- upvalues: deepcopy (ref)
	local _ = nil
	
	if type(p0) ~= "table" then
		return p0
	end
	local t = {}
	
	for i, v in next, p0 do
		t[deepcopy(i)] = deepcopy(v)
	end
	setmetatable(t, deepcopy(getmetatable(p0)))
	
	return t
end

return deepcopy