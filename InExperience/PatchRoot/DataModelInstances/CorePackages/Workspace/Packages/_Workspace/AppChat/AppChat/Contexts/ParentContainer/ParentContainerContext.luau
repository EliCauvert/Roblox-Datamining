local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.App.InExperienceAppChatModal)

return require(parent.React).createContext({
	getParentContainer = function() --[[ line: 22 ]]
		return nil
	end,
	visibilitySignal = Instance.new("BindableEvent"),
	getRequestedRoute = function() --[[ line: 26 ]]
		return nil
	end,
	requestedRouteSignal = Instance.new("BindableEvent"),
	clearRequestedRoute = function() --[[ line: 30 ]] end,
	getShouldSetAppChatVisible = function() --[[ line: 31 ]]
		return false
	end,
	entryPoint = require(parent.SocialCommon).Enums.ChatEntryPointNames.Unknown,
	showParentContainer = function() --[[ line: 35 ]] end,
	hideParentContainer = function() --[[ line: 36 ]] end,
	updateCurrentSquadId = function() --[[ line: 37 ]] end
})