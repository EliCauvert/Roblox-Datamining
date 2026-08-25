local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local navigateIntoChatModule = require(appChat.Actions.NavigateIntoChat)
local navigateToRoute = require(parent.NavigationRodux).Thunks.NavigateToRoute
local appPage = require(parent.RobloxAppEnums).AppPage
local getFFlagEnableStandaloneAppChatModule = require(appChat.Flags.getFFlagEnableStandaloneAppChat)
local enumScreensModule = require(appChat.EnumScreens)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local list = { { name = appPage.Chat } }

return function(p0, p1)
	-- upvalues: fFlagSignalsNavP3Dispatch (ref), var4 (ref), list (ref), navigateToRoute (ref), navigateIntoChatModule (ref), getFFlagEnableStandaloneAppChatModule (ref), enumScreensModule (ref)
	return function(p2)
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var4 (copy), list (copy), p1 (ref), navigateToRoute (copy), navigateIntoChatModule (copy), getFFlagEnableStandaloneAppChatModule (copy), enumScreensModule (copy), p0 (ref)
		if fFlagSignalsNavP3Dispatch then
			var4.to(var4.fromLegacyPage(list[#list]), p1)
		else
			p2:dispatch(navigateToRoute(list, p1))
		end
		p2:dispatch(navigateIntoChatModule({
			screen = if getFFlagEnableStandaloneAppChatModule() then enumScreensModule.ChatConversation else enumScreensModule.RoactChat,
			params = p0
		}))
	end
end