-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:04 2026 Pacific Standard Time.

local httpService = game:GetService("HttpService")

return {
	enc = function(p0) --[[ line: 5 ]]
		-- upvalues: httpService (ref)
		return httpService:JSONEncode(p0)
	end,
	dec = function(p1) --[[ line: 9 ]]
		-- upvalues: httpService (ref)
		return httpService:JSONDecode(p1)
	end
}