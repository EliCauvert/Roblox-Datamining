local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local promiseModule = require(parent.Promise)
local _ = require(appChat.App.InExperienceAppChatModal)

return require(parent.React).createContext({
	getParentContainer = function()
		return nil
	end,
	visibilitySignal = Instance.new("BindableEvent"),
	getRequestedRoute = function()
		return nil
	end,
	requestedRouteSignal = Instance.new("BindableEvent"),
	clearRequestedRoute = function() end,
	getShouldSetAppChatVisible = function()
		return false
	end,
	entryPoint = require(parent.SocialCommon).Enums.ChatEntryPointNames.Unknown,
	showParentContainer = function() end,
	hideParentContainer = function() end,
	updateCurrentSquadId = function() end,
	openFriendsChatConversation = function(_)
		-- upvalues: promiseModule (ref)
		return promiseModule.resolve(false)
	end
})