-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:52 2026 Pacific Standard Time.

local networkRequests = script.Parent.networkRequests
local createGetTagsFromUserIdsModule = require(networkRequests.createGetTagsFromUserIds)
local createSetUserTagModule = require(networkRequests.createSetUserTag)
local _ = require(script.Parent.networkingAliasesTypes)

return function(p0) --[[ line: 6 ]]
	-- upvalues: createGetTagsFromUserIdsModule (ref), createSetUserTagModule (ref)
	return {
		GetTagsFromUserIds = createGetTagsFromUserIdsModule(p0),
		SetUserTag = createSetUserTagModule(p0)
	}
end