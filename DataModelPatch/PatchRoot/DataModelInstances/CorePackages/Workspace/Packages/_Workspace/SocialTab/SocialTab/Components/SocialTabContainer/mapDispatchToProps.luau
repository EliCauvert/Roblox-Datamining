local SocialTab = script:FindFirstAncestor("SocialTab")
local Parent = SocialTab.Parent
local LoggerModule = require(SocialTab.Logger)
local DependenciesModule = require(SocialTab.dependencies)
local Promise = DependenciesModule.Promise
local GetUnreadConversationCount = require(Parent.SocialTabState).Requests.GetUnreadConversationCount
local GetPresencesFromUserIds = DependenciesModule.NetworkingPresence.GetPresencesFromUserIds
local NetworkingFriends = DependenciesModule.NetworkingFriends
local NetworkingUsers = DependenciesModule.NetworkingUsers
local SocialLibraries = DependenciesModule.SocialLibraries
local EnteredChatFromEntryPointModule = require(Parent.AppChat.EnteredChatFromEntryPoint)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(Callback)
	-- upvalues: NetworkingFriends (copy), Promise (copy), GetUnreadConversationCount (copy), SocialLibraries (copy), GetPresencesFromUserIds (copy), NetworkingUsers (copy), LoggerModule (copy), EnteredChatFromEntryPointModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return {
		refreshPageData = function()
			-- upvalues: NetworkingFriends (upval), Promise (upval), Callback (copy), GetUnreadConversationCount (upval), SocialLibraries (upval), GetPresencesFromUserIds (upval), NetworkingUsers (upval), LoggerModule (upval)
			return Promise.all({
				Callback(GetUnreadConversationCount.API()),
				Callback(function(p1)
					-- upvalues: SocialLibraries (upval), Callback (upval), GetPresencesFromUserIds (upval), Promise (upval)
					local SocialTabFriendsByUserIdLocalUserIdDeepValue = SocialLibraries.Dictionary.getDeepValue(p1:getState(), "SocialTab.Friends.byUserId.localUserId")
					
					return if SocialTabFriendsByUserIdLocalUserIdDeepValue then Callback(GetPresencesFromUserIds.API(SocialTabFriendsByUserIdLocalUserIdDeepValue)) else Promise.resolve()
				end),
				Callback(NetworkingFriends.GetFriendRequestsCount.API()),
				Callback(function(p1)
					-- upvalues: Callback (upval), NetworkingUsers (upval)
					return Callback(NetworkingUsers.GetUserV2FromUserId.API(p1:getState().LocalUserId))
				end)
			}):catch(function()
				-- upvalues: LoggerModule (upval)
				LoggerModule:info("Failed to refresh SocialTab data")
			end)
		end,
		fetchFriendsRequestsCount = function()
			-- upvalues: Callback (copy), NetworkingFriends (upval)
			return Callback(NetworkingFriends.GetFriendRequestsCount.API())
		end,
		enteredChatFromEntryPoint = function(p1)
			-- upvalues: Callback (copy), EnteredChatFromEntryPointModule (upval)
			return Callback(EnteredChatFromEntryPointModule(p1))
		end,
		navigateToFriendsPage = function()
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = { name = AppPage.ViewFriends }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end,
		navigateToAddFriendsPage = function()
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = { name = AppPage.AddFriendsPage }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end,
		navigateToUserSearch = function()
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = {
				shouldShowUserSearchLandingPage = true,
				name = AppPage.UserSearch
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end
	}
end