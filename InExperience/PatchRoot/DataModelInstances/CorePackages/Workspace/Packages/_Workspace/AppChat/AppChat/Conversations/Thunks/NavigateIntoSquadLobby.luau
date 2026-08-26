local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local navigateIntoChatModule = require(appChat.Actions.NavigateIntoChat)
local navigateToRoute = require(parent.NavigationRodux).Thunks.NavigateToRoute
local appPage = require(parent.RobloxAppEnums).AppPage
local enumScreensModule = require(appChat.EnumScreens)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local list = { { name = appPage.Chat } }

return function(p1, p2)
	-- upvalues: fFlagSignalsNavP3Dispatch (ref), var1 (ref), list (ref), navigateToRoute (ref), navigateIntoChatModule (ref), enumScreensModule (ref)
	return function(p3)
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), list (copy), p2 (ref), navigateToRoute (copy), navigateIntoChatModule (copy), enumScreensModule (copy), p1 (ref)
		if fFlagSignalsNavP3Dispatch then
			var1.to(var1.fromLegacyPage(list[#list]), p2)
		else
			p3:dispatch(navigateToRoute(list, p2))
		end
		p3:dispatch(navigateIntoChatModule({ screen = enumScreensModule.SquadLobby, params = p1 }))
	end
end