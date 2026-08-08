local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local promiseModule = require(parent.Promise)
local _ = require(appChat.App.InExperienceAppChatModal)

return require(parent.React).createContext({
	getParentContainer = function() --[[ line: 26 ]]
		return nil
	end,
	visibilitySignal = Instance.new("BindableEvent"),
	getRequestedRoute = function() --[[ line: 30 ]]
		return nil
	end,
	requestedRouteSignal = Instance.new("BindableEvent"),
	clearRequestedRoute = function() --[[ line: 34 ]] end,
	getShouldSetAppChatVisible = function() --[[ line: 35 ]]
		return false
	end,
	entryPoint = require(parent.SocialCommon).Enums.ChatEntryPointNames.Unknown,
	showParentContainer = function() --[[ line: 39 ]] end,
	hideParentContainer = function() --[[ line: 40 ]] end,
	updateCurrentSquadId = function() --[[ line: 41 ]] end,
	openFriendsChatConversation = function(_) --[[ line: 42 ]]
		-- upvalues: promiseModule (ref)
		return promiseModule.resolve(false)
	end
})