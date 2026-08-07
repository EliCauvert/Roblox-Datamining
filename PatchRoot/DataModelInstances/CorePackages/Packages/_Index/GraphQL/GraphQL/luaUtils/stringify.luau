-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local httpService = game:GetService("HttpService")
local null = httpService:JSONEncode(require(script.Parent.null))

return function(p0) --[[ line: 5 | named "stringify" ]]
	-- upvalues: httpService (ref), null (ref)
	return httpService:JSONEncode(p0):gsub(null, "null")
end