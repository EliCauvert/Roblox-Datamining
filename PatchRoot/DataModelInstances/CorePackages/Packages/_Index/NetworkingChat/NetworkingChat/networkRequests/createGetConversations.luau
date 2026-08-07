-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:53 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p0) --[[ line: 6 ]]
	-- upvalues: CHAT_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetConversations" }, function(p1, p2) --[[ line: 9 ]]
		-- upvalues: CHAT_URLModule (copy)
		return p1(CHAT_URLModule):path("v2"):path("get-conversations"):expandedQueryArgsWithIds("conversationIds", p2)
	end)
end