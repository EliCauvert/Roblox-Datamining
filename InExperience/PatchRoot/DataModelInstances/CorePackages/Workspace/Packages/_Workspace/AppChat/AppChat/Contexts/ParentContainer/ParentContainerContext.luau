local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local SocialCommonModule = require(Parent.SocialCommon)
local _ = require(AppChat.App.InExperienceAppChatModal)

return ReactModule.createContext({
	getParentContainer = function()
		return nil
	end,
	visibilitySignal = Instance.new("BindableEvent"),
	getRequestedRoute = function()
		return nil
	end,
	requestedRouteSignal = Instance.new("BindableEvent"),
	clearRequestedRoute = function() end,
	getShouldSetAppChatVisible = function(): boolean
		return false
	end,
	entryPoint = SocialCommonModule.Enums.ChatEntryPointNames.Unknown,
	showParentContainer = function() end,
	hideParentContainer = function() end,
	updateCurrentSquadId = function() end,
	openFriendsChatConversation = function(_)
		-- upvalues: PromiseModule (copy)
		return PromiseModule.resolve(false)
	end
})