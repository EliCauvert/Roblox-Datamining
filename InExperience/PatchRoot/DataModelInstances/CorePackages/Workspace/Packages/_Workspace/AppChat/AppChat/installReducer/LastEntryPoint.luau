local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.SocialCommon)

return require(parent.Rodux).createReducer("NotSet", {
	[require(appChat.Actions.EnteredChatFromEntryPoint).name] = function(_, p0)
		return p0.entryPoint
	end
})