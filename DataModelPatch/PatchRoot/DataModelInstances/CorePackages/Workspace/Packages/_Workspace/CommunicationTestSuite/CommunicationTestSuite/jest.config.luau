_G.__TESTEZ_RUNNING_TEST__ = true
local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.VoiceChat)["jest.config"],
		require(Parent.VoiceChatCore)["jest.config"]
	}
}