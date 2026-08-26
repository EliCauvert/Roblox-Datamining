local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)
local t = {
	ABUSE_TYPE_PROFANITY = 3,
	ABUSE_TYPE_PRIVACY_ASKING_FOR_PII = 11,
	ABUSE_TYPE_HARASSMENT = 4,
	ABUSE_TYPE_DATING_AND_ROMANTIC_CONTENT = 7,
	ABUSE_TYPE_CHEAT_AND_EXPLOITS = 25,
	ABUSE_TYPE_SCAMMING = 6,
	ABUSE_TYPE_SEXUAL_CONTENT = 8,
	ABUSE_TYPE_REAL_LIFE_THREATS = 23,
	ABUSE_TYPE_OTHER = 2
}

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref), t (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("create-chat-abuse-report"):body({
		comment = if string.len(p2.comment) > 0 then p2.comment else " ",
		reported_user_id = tonumber(p2.reportedUserId),
		report_category = t[p2.reportCategory] or 1,
		conversation_id = p2.conversationId,
		entry_point = p2.entryPoint
	})
end)