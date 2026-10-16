local _ = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.AppChatNetworking)
local ModalAction = { View = "RecordHasSeen", Close = "RecordDontShowAgain" }
local config = {
	[ModalAction.View] = "record_has_seen",
	[ModalAction.Close] = "record_dont_show_again"
}

return {
	ModalAction = ModalAction,
	toRecordedModalAction = function(p1) --[[ Line: 23 ]]
		-- upvalues: config (copy)
		return if typeof(p1) == "string" then config[p1] else nil
	end
}