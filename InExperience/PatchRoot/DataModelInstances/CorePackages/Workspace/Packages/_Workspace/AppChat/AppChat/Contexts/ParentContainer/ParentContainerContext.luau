local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(AppChat.App.InExperienceAppChatModal)

return require(Parent.React).createContext({
	getParentContainer = function() --[[ Line: 26 ]]
		return nil
	end,
	visibilitySignal = Instance.new("BindableEvent"),
	getRequestedRoute = function() --[[ Line: 30 ]]
		return nil
	end,
	requestedRouteSignal = Instance.new("BindableEvent"),
	clearRequestedRoute = function() --[[ Line: 34 ]] end,
	getShouldSetAppChatVisible = function(): boolean --[[ Line: 35 ]]
		return false
	end,
	entryPoint = require(Parent.SocialCommon).Enums.ChatEntryPointNames.Unknown,
	showParentContainer = function() --[[ Line: 39 ]] end,
	hideParentContainer = function() --[[ Line: 40 ]] end,
	updateCurrentSquadId = function() --[[ Line: 41 ]] end,
	openFriendsChatConversation = function(_) --[[ Line: 42 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.resolve(false)
	end
})