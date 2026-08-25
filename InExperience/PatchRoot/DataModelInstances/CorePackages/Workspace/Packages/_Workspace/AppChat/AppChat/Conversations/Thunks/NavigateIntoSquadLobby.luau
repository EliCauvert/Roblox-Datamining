local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local navigateIntoChatModule = require(appChat.Actions.NavigateIntoChat)
local navigateToRoute = require(parent.NavigationRodux).Thunks.NavigateToRoute
local appPage = require(parent.RobloxAppEnums).AppPage
local enumScreensModule = require(appChat.EnumScreens)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var3 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local list = { { name = appPage.Chat } }

return function(p0, p1)
	-- upvalues: fFlagSignalsNavP3Dispatch (ref), var3 (ref), list (ref), navigateToRoute (ref), navigateIntoChatModule (ref), enumScreensModule (ref)
	return function(p2)
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var3 (copy), list (copy), p1 (ref), navigateToRoute (copy), navigateIntoChatModule (copy), enumScreensModule (copy), p0 (ref)
		if fFlagSignalsNavP3Dispatch then
			var3.to(var3.fromLegacyPage(list[#list]), p1)
		else
			p2:dispatch(navigateToRoute(list, p1))
		end
		p2:dispatch(navigateIntoChatModule({ screen = enumScreensModule.SquadLobby, params = p0 }))
	end
end