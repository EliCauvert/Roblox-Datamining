local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.App.InExperienceAppChatModal)

return require(Parent.React).createContext({
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
	entryPoint = require(Parent.SocialCommon).Enums.ChatEntryPointNames.Unknown,
	showParentContainer = function() end,
	hideParentContainer = function() end,
	updateCurrentSquadId = function() end
})