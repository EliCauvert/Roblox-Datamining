local expChat = script:FindFirstAncestor("ExpChat")
local actions = expChat.Actions

return require(expChat.Parent.Rodux).createReducer(false, {
	[require(actions.ChatPrivacySettingsReceived).name] = function(_, p0) --[[ line: 10 ]]
		return p0.canUserChat
	end,
	[require(actions.ChatPrivacySettingsFetchFailed).name] = function(_, _) --[[ line: 14 ]]
		return false
	end
})