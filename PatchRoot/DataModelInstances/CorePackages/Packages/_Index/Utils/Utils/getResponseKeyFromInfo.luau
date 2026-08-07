-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.GraphQL)

return {
	getResponseKeyFromInfo = function(a) --[[ line: 14 ]]
		return if a.fieldNodes[1] and a.fieldNodes[1].alias ~= nil then a.fieldNodes[1].alias.value else a.fieldName
	end
}