-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)

return function(p0, p1, p2) --[[ line: 10 ]]
	-- upvalues: getExpectedPartSizeModule (ref)
	local t = {}
	
	for i, v in p0 do
		local var2 = p1(v)
		t[v] = getExpectedPartSizeModule(var2, p2) / getExpectedPartSizeModule(var2, p2, true)
	end
	return t
end