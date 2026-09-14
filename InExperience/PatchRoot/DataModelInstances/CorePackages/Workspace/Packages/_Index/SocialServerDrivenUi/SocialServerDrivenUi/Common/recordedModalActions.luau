local _ = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.AppChatNetworking)
local t = { View = "RecordHasSeen", Close = "RecordDontShowAgain" }
local t_1 = {
	[t.View] = "record_has_seen",
	[t.Close] = "record_dont_show_again"
}

return {
	ModalAction = t,
	toRecordedModalAction = function(p1)
		-- upvalues: t_1 (ref)
		return if typeof(p1) == "string" then t_1[p1] else nil
	end
}