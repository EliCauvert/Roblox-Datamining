local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local InExperienceAppChatModalModule = require(Parent.AppChat.InExperienceAppChatModal)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local GetFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local GetFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local FriendsChatTabNameModule = require(script.Parent.Parent.FriendsChatTabName)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab

return function(p1)
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), GetFriendsChatRealtimeStoreModule (copy), GetFriendsChatNavigationStoreModule (copy), SignalsReactModule (copy), FriendsChatTabNameModule (copy), ReactModule (copy), InExperienceAppChatModalModule (copy), AppChatNetworkingModule (copy), NewResult (copy), SignalsModule (copy)
	if FFlagExpChatEnableFriendsTab then
		local SetTabUnreadFunction = p1.setTabUnread
		local SelectedTabName = p1.selectedTabName
		local IsChatWindowVisible = p1.isChatWindowVisible
		local FriendsChatRealtimeStoreModule = GetFriendsChatRealtimeStoreModule(false)
		local UseSignalStateResult = SignalsReactModule.useSignalState(GetFriendsChatNavigationStoreModule(false).getEffectiveConversationId)
		
		local function _(): boolean
			-- upvalues: FriendsChatRealtimeStoreModule (copy)
			return next(FriendsChatRealtimeStoreModule.getLocalUnreadConversationIds(false)) ~= nil
		end
		
		local IsSelectedTabNameMatch: boolean = IsChatWindowVisible == true and SelectedTabName == FriendsChatTabNameModule
		local NoUseSignalStateResult: boolean = IsSelectedTabNameMatch and UseSignalStateResult == nil
		ReactModule.useEffect(function()
			-- upvalues: IsSelectedTabNameMatch (copy), InExperienceAppChatModalModule (upval), AppChatNetworkingModule (upval), NewResult (upval), SetTabUnreadFunction (copy), FriendsChatRealtimeStoreModule (copy)
			local function onGlobalCount()
				-- upvalues: IsSelectedTabNameMatch (upval), InExperienceAppChatModalModule (upval), AppChatNetworkingModule (upval), NewResult (upval), SetTabUnreadFunction (upval), FriendsChatRealtimeStoreModule (upval)
				if IsSelectedTabNameMatch and (InExperienceAppChatModalModule.default.unreadCount or 0) > 0 then
					InExperienceAppChatModalModule:setUnreadCount(0)
					AppChatNetworkingModule.http.ClearGlobalUnreadCount():catch(function(Err)
						-- upvalues: NewResult (upval)
						NewResult:warning(`Failed to clear global unread count: {tostring(Err)}`)
					end)
				end
				SetTabUnreadFunction((InExperienceAppChatModalModule.default.unreadCount or 0) > 0 or next(FriendsChatRealtimeStoreModule.getLocalUnreadConversationIds(false)) ~= nil)
			end
			
			onGlobalCount()
			local EventConnection = InExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(onGlobalCount)
			
			return function()
				-- upvalues: EventConnection (copy)
				EventConnection:Disconnect()
			end
		end, { IsSelectedTabNameMatch, SetTabUnreadFunction })
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), FriendsChatRealtimeStoreModule (copy), IsSelectedTabNameMatch (copy), UseSignalStateResult (copy), NoUseSignalStateResult (copy), SetTabUnreadFunction (copy), InExperienceAppChatModalModule (upval)
			local Effect = SignalsModule.createEffect(function(p2)
				-- upvalues: FriendsChatRealtimeStoreModule (upval), IsSelectedTabNameMatch (upval), UseSignalStateResult (upval), NoUseSignalStateResult (upval), SetTabUnreadFunction (upval), InExperienceAppChatModalModule (upval)
				local LocalUnreadConversationIds = FriendsChatRealtimeStoreModule.getLocalUnreadConversationIds(p2)
				
				if IsSelectedTabNameMatch and (UseSignalStateResult ~= nil and LocalUnreadConversationIds[UseSignalStateResult] == true) or NoUseSignalStateResult and next(LocalUnreadConversationIds) ~= nil then
					FriendsChatRealtimeStoreModule.clearLocalUnread()
				end
				SetTabUnreadFunction((InExperienceAppChatModalModule.default.unreadCount or 0) > 0 or next(FriendsChatRealtimeStoreModule.getLocalUnreadConversationIds(false)) ~= nil)
			end)
			
			return function()
				-- upvalues: Effect (copy)
				Effect()
			end
		end, {
			NoUseSignalStateResult,
			IsSelectedTabNameMatch,
			UseSignalStateResult,
			SetTabUnreadFunction
		})
		
		return nil
	else
		return nil
	end
end