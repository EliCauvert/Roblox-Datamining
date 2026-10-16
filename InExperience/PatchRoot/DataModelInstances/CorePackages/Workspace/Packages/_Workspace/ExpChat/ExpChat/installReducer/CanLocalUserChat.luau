local ExpChat = script:FindFirstAncestor("ExpChat")
local Actions = ExpChat.Actions

return require(ExpChat.Parent.Rodux).createReducer(false, {
	[require(Actions.ChatPrivacySettingsReceived).name] = function(_, p1) --[[ Line: 10 ]]
		return p1.canUserChat
	end,
	[require(Actions.ChatPrivacySettingsFetchFailed).name] = function(_, _): boolean --[[ Line: 14 ]]
		return false
	end
})