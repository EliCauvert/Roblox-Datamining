-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local httpService = game:GetService("HttpService")

return function(p0, p1) --[[ line: 3 ]]
	-- upvalues: httpService (ref)
	if p1 == "POST" or p1 == "PATCH" then
		if type(p0) == "table" then
			return httpService:JSONEncode(p0)
		elseif type(p0) == "string" then
			return p0
		end
		error("Expected postBody to be a string or table")
	end
	return nil
end