local Parent = script:FindFirstAncestor("SocialTab").Parent
local FetchChatMetadataModule = require(Parent.AppChat.fetchChatMetadata)
local NavigateIntoChatModule = require(Parent.AppChat.NavigateIntoChat)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub

return function(Callback)
	-- upvalues: FetchChatMetadataModule (copy), NavigateIntoChatModule (copy), FFlagCreateConnectionsHub (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return {
		fetchChatSettings = function(_)
			-- upvalues: Callback (copy), FetchChatMetadataModule (upval)
			return Callback(FetchChatMetadataModule()):andThen(function(_) end)
		end,
		navigateIntoChat = function(p1)
			-- upvalues: Callback (copy), NavigateIntoChatModule (upval)
			Callback(NavigateIntoChatModule(p1))
		end,
		navigateToAddFriends = if FFlagCreateConnectionsHub then nil else function()
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = { name = AppPage.AddFriendsPage }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end
	}
end