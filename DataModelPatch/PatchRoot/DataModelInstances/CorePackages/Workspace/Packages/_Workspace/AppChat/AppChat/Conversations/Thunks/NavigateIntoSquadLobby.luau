local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local NavigateIntoChatModule = require(AppChat.Actions.NavigateIntoChat)
local NavigateToRouteFunction = require(Parent.NavigationRodux).Thunks.NavigateToRoute
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local list = { { name = require(Parent.RobloxAppEnums).AppPage.Chat } }

return function(Params, p1)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), list (copy), NavigateToRouteFunction (copy), NavigateIntoChatModule (copy), EnumScreensModule (copy)
	return function(p2)
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), list (upval), p1 (copy), NavigateToRouteFunction (upval), NavigateIntoChatModule (upval), EnumScreensModule (upval), Params (copy)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.to(NavigationCommands.fromLegacyPage(list[#list]), p1)
		else
			p2:dispatch(NavigateToRouteFunction(list, p1))
		end
		p2:dispatch(NavigateIntoChatModule({ screen = EnumScreensModule.SquadLobby, params = Params }))
	end
end