-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

local _ = require(script.Parent.ObjMap)

return {
	toObjMap = function(p0) --[[ line: 12 ]]
		local t = {}
		
		for i, v in pairs(p0) do
			t[i] = v
		end
		return t
	end
}