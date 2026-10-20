local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local InExperienceAppChatModalModule = require(Parent.AppChat.InExperienceAppChatModal)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local GetFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local GetFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab

return function(p1)
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), GetFriendsChatRealtimeStoreModule (copy), GetFriendsChatNavigationStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), InExperienceAppChatModalModule (copy), AppChatNetworkingModule (copy), NewResult (copy), SignalsModule (copy)
	if FFlagExpChatEnableFriendsTab then
		local SetTabUnreadFunction = p1.setTabUnread
		local SelectedTabName = p1.selectedTabName
		local IsChatWindowVisible = p1.isChatWindowVisible
		local FriendsChatRealtimeStoreModule = GetFriendsChatRealtimeStoreModule(false)
		local UseSignalStateResult = SignalsReactModule.useSignalState(GetFriendsChatNavigationStoreModule(false).getSelectedConversationId)
		local IsFriendsChat: boolean = IsChatWindowVisible == true and SelectedTabName == "FriendsChat"
		local NoUseSignalStateResult: boolean = IsFriendsChat and UseSignalStateResult == nil
		ReactModule.useEffect(function()
			-- upvalues: IsFriendsChat (copy), InExperienceAppChatModalModule (upval), AppChatNetworkingModule (upval), NewResult (upval), SetTabUnreadFunction (copy), FriendsChatRealtimeStoreModule (copy)
			local function onGlobalCount()
				-- upvalues: IsFriendsChat (upval), InExperienceAppChatModalModule (upval), AppChatNetworkingModule (upval), NewResult (upval), SetTabUnreadFunction (upval), FriendsChatRealtimeStoreModule (upval)
				if IsFriendsChat and (InExperienceAppChatModalModule.default.unreadCount or 0) > 0 then
					InExperienceAppChatModalModule:setUnreadCount(0)
					AppChatNetworkingModule.http.ClearGlobalUnreadCount():catch(function(Err)
						-- upvalues: NewResult (upval)
						NewResult:warning(`Failed to clear global unread count: {tostring(Err)}`)
					end)
				end
				SetTabUnreadFunction((InExperienceAppChatModalModule.default.unreadCount or 0) > 0 or FriendsChatRealtimeStoreModule.getHasLocalUnread(false))
			end
			
			onGlobalCount()
			local EventConnection = InExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(onGlobalCount)
			
			return function()
				-- upvalues: EventConnection (copy)
				EventConnection:Disconnect()
			end
		end, { IsFriendsChat, SetTabUnreadFunction })
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), FriendsChatRealtimeStoreModule (copy), NoUseSignalStateResult (copy), SetTabUnreadFunction (copy), InExperienceAppChatModalModule (upval)
			local Effect = SignalsModule.createEffect(function(p2)
				-- upvalues: FriendsChatRealtimeStoreModule (upval), NoUseSignalStateResult (upval), SetTabUnreadFunction (upval), InExperienceAppChatModalModule (upval)
				local HasLocalUnread = FriendsChatRealtimeStoreModule.getHasLocalUnread(p2)
				
				if NoUseSignalStateResult and HasLocalUnread then
					FriendsChatRealtimeStoreModule.setHasLocalUnread(false)
				end
				SetTabUnreadFunction((InExperienceAppChatModalModule.default.unreadCount or 0) > 0 or FriendsChatRealtimeStoreModule.getHasLocalUnread(false))
			end)
			
			return function()
				-- upvalues: Effect (copy)
				Effect()
			end
		end, { NoUseSignalStateResult, SetTabUnreadFunction })
		
		return nil
	else
		return nil
	end
end