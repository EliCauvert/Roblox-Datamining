local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local expChatSharedModule = require(parent.ExpChatShared)
local inExperienceAppChatModalModule = require(parent.AppChat.InExperienceAppChatModal)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatRealtimeStore)
local getFriendsChatNavigationStoreModule = require(script.Parent.Parent.Stores.GetFriendsChatNavigationStore)
local friendsChatTabNameModule = require(script.Parent.Parent.FriendsChatTabName)
local name = expChatSharedModule.Logger:new(script.Name)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab

return function(p1)
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), getFriendsChatRealtimeStoreModule (ref), getFriendsChatNavigationStoreModule (ref), signalsReactModule (ref), friendsChatTabNameModule (ref), reactModule (ref), inExperienceAppChatModalModule (ref), appChatNetworkingModule (ref), name (ref), signalsModule (ref)
	if fFlagExpChatEnableFriendsTab then
		local setTabUnread = p1.setTabUnread
		local selectedTabName = p1.selectedTabName
		local isChatWindowVisible = p1.isChatWindowVisible
		local var1 = getFriendsChatRealtimeStoreModule(false)
		local var2 = signalsReactModule.useSignalState(getFriendsChatNavigationStoreModule(false).getEffectiveConversationId)
		
		local function _()
			-- upvalues: var1 (ref)
			return next(var1.getLocalUnreadConversationIds(false)) ~= nil
		end
		
		local var3 = isChatWindowVisible == true and selectedTabName == friendsChatTabNameModule
		local var4 = var3 and var2 == nil
		reactModule.useEffect(function()
			-- upvalues: var3 (ref), inExperienceAppChatModalModule (copy), appChatNetworkingModule (copy), name (copy), setTabUnread (ref), var1 (ref)
			local function onGlobalCount()
				-- upvalues: var3 (copy), inExperienceAppChatModalModule (copy), appChatNetworkingModule (copy), name (copy), setTabUnread (copy), var1 (copy)
				if var3 and (inExperienceAppChatModalModule.default.unreadCount or 0) > 0 then
					inExperienceAppChatModalModule:setUnreadCount(0)
					appChatNetworkingModule.http.ClearGlobalUnreadCount():catch(function(p2)
						-- upvalues: name (copy)
						name:warning(`Failed to clear global unread count: {tostring(p2)}`)
					end)
				end
				setTabUnread(if (inExperienceAppChatModalModule.default.unreadCount or 0) <= 0 then next(var1.getLocalUnreadConversationIds(false)) ~= nil else true)
			end
			
			onGlobalCount()
			local eventConnection = inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(onGlobalCount)
			
			return function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end, { var3, setTabUnread })
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var1 (ref), var3 (ref), var2 (ref), var4 (ref), setTabUnread (ref), inExperienceAppChatModalModule (copy)
			local var5 = signalsModule.createEffect(function(p2)
				-- upvalues: var1 (copy), var3 (copy), var2 (copy), var4 (copy), setTabUnread (copy), inExperienceAppChatModalModule (copy)
				local localUnreadConversationIds = var1.getLocalUnreadConversationIds(p2)
				
				if (var3 and (var2 ~= nil and localUnreadConversationIds[var2] == true)) or var4 and next(localUnreadConversationIds) ~= nil then
					var1.clearLocalUnread()
				end
				setTabUnread(if (inExperienceAppChatModalModule.default.unreadCount or 0) <= 0 then next(var1.getLocalUnreadConversationIds(false)) ~= nil else true)
			end)
			
			return function()
				-- upvalues: var5 (ref)
				var5()
			end
		end, { var4, var3, var2, setTabUnread })
		
		return nil
	end
	return nil
end