local httpModule = require(script:FindFirstAncestor("AppChatNetworking").Parent.Http)
local t = {
	ABUSE_TYPE_PROFANITY = "ABUSE_CATEGORY_SWEARING",
	ABUSE_TYPE_PRIVACY_ASKING_FOR_PII = "ABUSE_CATEGORY_PERSONAL_QUESTION",
	ABUSE_TYPE_HARASSMENT = "ABUSE_CATEGORY_BULLYING",
	ABUSE_TYPE_DATING_AND_ROMANTIC_CONTENT = "ABUSE_CATEGORY_DATING",
	ABUSE_TYPE_CHEAT_AND_EXPLOITS = "ABUSE_CATEGORY_CHEATING",
	ABUSE_TYPE_SCAMMING = "ABUSE_CATEGORY_SCAMMING",
	ABUSE_TYPE_SEXUAL_CONTENT = "ABUSE_CATEGORY_INAPT_CONTENT",
	ABUSE_TYPE_REAL_LIFE_THREATS = "ABUSE_CATEGORY_REAL_LIFE_THREATS_AND_SUICIDE_THREATS",
	ABUSE_TYPE_OTHER = "ABUSE_CATEGORY_OTHER"
}

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2)
	-- upvalues: httpModule (ref), t (ref)
	return p1(httpModule.Url.APIS_URL):path("abuse-reporting"):path("v1"):path("abuse-report"):body({
		abuseVector = "web_chat",
		targetType = "user",
		category = t[p2.reportCategory] or "ABUSE_CATEGORY_OTHER",
		comment = if string.len(p2.comment) > 0 then p2.comment else " ",
		custom = { COMMUNICATION_CHANNEL_ID = p2.conversationId },
		submitterId = p2.submitterUserId,
		targetIdStr = p2.reportedUserId
	})
end)