-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local httpService = game:GetService("HttpService")

return {
	stringify = function(p0, ...) --[[ line: 20 ]]
		-- upvalues: httpService (ref)
		if select("#", ...) > 0 then
			warn("JSON.stringify doesn't currently support more than 1 argument. All additional arguments will be ignored.")
		end
		return httpService:JSONEncode(p0)
	end,
	parse = function(p1, ...) --[[ line: 28 ]]
		-- upvalues: httpService (ref)
		if select("#", ...) > 0 then
			warn("JSON.parse doesn't currently support more than 1 argument. All additional arguments will be ignored.")
		end
		return httpService:JSONDecode(p1)
	end
}