local parent = script:FindFirstAncestor("AppChat").Parent

return require(parent.React).createContext({
	getParentContainer = function() --[[ line: 18 ]]
		return nil
	end,
	visibilitySignal = Instance.new("BindableEvent"),
	getShouldSetAppChatVisible = function() --[[ line: 22 ]]
		return false
	end,
	entryPoint = require(parent.SocialCommon).Enums.ChatEntryPointNames.Unknown,
	showParentContainer = function() --[[ line: 26 ]] end,
	hideParentContainer = function() --[[ line: 27 ]] end,
	updateCurrentSquadId = function() --[[ line: 28 ]] end
})