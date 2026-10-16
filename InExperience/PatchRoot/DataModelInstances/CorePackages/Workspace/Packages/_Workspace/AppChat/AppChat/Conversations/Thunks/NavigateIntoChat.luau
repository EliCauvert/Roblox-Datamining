local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local NavigateIntoChatModule = require(AppChat.Actions.NavigateIntoChat)
local NavigateToRouteFunction = require(Parent.NavigationRodux).Thunks.NavigateToRoute
local GetFFlagEnableStandaloneAppChatModule = require(AppChat.Flags.getFFlagEnableStandaloneAppChat)
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local list = { { name = require(Parent.RobloxAppEnums).AppPage.Chat } }

return function(Params, p1) --[[ Line: 25 ]]
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), list (copy), NavigateToRouteFunction (copy), NavigateIntoChatModule (copy), GetFFlagEnableStandaloneAppChatModule (copy), EnumScreensModule (copy)
	return function(p2) --[[ Line: 26 ]]
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), list (upval), p1 (copy), NavigateToRouteFunction (upval), NavigateIntoChatModule (upval), GetFFlagEnableStandaloneAppChatModule (upval), EnumScreensModule (upval), Params (copy)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.to(NavigationCommands.fromLegacyPage(list[#list]), p1)
		else
			p2:dispatch(NavigateToRouteFunction(list, p1))
		end
		p2:dispatch(NavigateIntoChatModule({
			screen = if GetFFlagEnableStandaloneAppChatModule() then EnumScreensModule.ChatConversation else EnumScreensModule.RoactChat,
			params = Params
		}))
	end
end