-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

local t = { instanceProcessingLimit = 1000 }

return {
	new = function(p0) --[[ line: 24 ]]
		-- upvalues: t (ref)
		local cloned = table.clone(t)
		
		if p0 then
			for i, v in p0 do
				cloned[i] = v
			end
		end
		return cloned
	end
}