local expChat = script:FindFirstAncestor("ExpChat")
local actions = expChat.Actions

return require(expChat.Parent.Rodux).createReducer(false, {
	[require(actions.ChatPrivacySettingsReceived).name] = function(_, p0)
		return p0.canUserChat
	end,
	[require(actions.ChatPrivacySettingsFetchFailed).name] = function(_, _)
		return false
	end
})