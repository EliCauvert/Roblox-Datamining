-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

local ok, status = pcall(function() --[[ line: 1 ]]
	return game:GetService("StudioService")
end)
local var0 = if ok then status else nil
local _ = require(script.Parent.Parent.util.Types)

return function() --[[ line: 10 | named "getRestrictedUserTable" ]]
	-- upvalues: var0 (ref)
	return if var0 then { { creatorType = "User", id = var0:GetUserId() } } else {}
end