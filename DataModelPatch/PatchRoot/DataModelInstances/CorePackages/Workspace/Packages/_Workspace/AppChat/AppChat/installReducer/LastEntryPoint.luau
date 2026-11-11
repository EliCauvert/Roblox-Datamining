local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.SocialCommon)

return require(Parent.Rodux).createReducer("NotSet", {
	[require(AppChat.Actions.EnteredChatFromEntryPoint).name] = function(_, p1)
		return p1.entryPoint
	end
})