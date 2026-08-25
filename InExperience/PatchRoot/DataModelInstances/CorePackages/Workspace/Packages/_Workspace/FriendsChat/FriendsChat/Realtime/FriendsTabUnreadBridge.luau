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

return function(p0)
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), getFriendsChatRealtimeStoreModule (ref), getFriendsChatNavigationStoreModule (ref), signalsReactModule (ref), friendsChatTabNameModule (ref), reactModule (ref), inExperienceAppChatModalModule (ref), appChatNetworkingModule (ref), name (ref), signalsModule (ref)
	if fFlagExpChatEnableFriendsTab then
		local setTabUnread = p0.setTabUnread
		local selectedTabName = p0.selectedTabName
		local isChatWindowVisible = p0.isChatWindowVisible
		local var11 = getFriendsChatRealtimeStoreModule(false)
		local var12 = signalsReactModule.useSignalState(getFriendsChatNavigationStoreModule(false).getEffectiveConversationId)
		
		local function _()
			-- upvalues: var11 (ref)
			return next(var11.getLocalUnreadConversationIds(false)) ~= nil
		end
		
		local var13 = isChatWindowVisible == true and selectedTabName == friendsChatTabNameModule
		local var14 = var13 and var12 == nil
		reactModule.useEffect(function()
			-- upvalues: var13 (ref), inExperienceAppChatModalModule (copy), appChatNetworkingModule (copy), name (copy), setTabUnread (ref), var11 (ref)
			local function onGlobalCount()
				-- upvalues: var13 (copy), inExperienceAppChatModalModule (copy), appChatNetworkingModule (copy), name (copy), setTabUnread (copy), var11 (copy)
				if var13 and (inExperienceAppChatModalModule.default.unreadCount or 0) > 0 then
					inExperienceAppChatModalModule:setUnreadCount(0)
					appChatNetworkingModule.http.ClearGlobalUnreadCount():catch(function(p1)
						-- upvalues: name (copy)
						name:warning(`Failed to clear global unread count: {tostring(p1)}`)
					end)
				end
				setTabUnread(if (inExperienceAppChatModalModule.default.unreadCount or 0) <= 0 then next(var11.getLocalUnreadConversationIds(false)) ~= nil else true)
			end
			
			onGlobalCount()
			local eventConnection = inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(onGlobalCount)
			
			return function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end, { var13, setTabUnread })
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var11 (ref), var13 (ref), var12 (ref), var14 (ref), setTabUnread (ref), inExperienceAppChatModalModule (copy)
			local var17 = signalsModule.createEffect(function(p2)
				-- upvalues: var11 (copy), var13 (copy), var12 (copy), var14 (copy), setTabUnread (copy), inExperienceAppChatModalModule (copy)
				local localUnreadConversationIds = var11.getLocalUnreadConversationIds(p2)
				
				if (var13 and (var12 ~= nil and localUnreadConversationIds[var12] == true)) or var14 and next(localUnreadConversationIds) ~= nil then
					var11.clearLocalUnread()
				end
				setTabUnread(if (inExperienceAppChatModalModule.default.unreadCount or 0) <= 0 then next(var11.getLocalUnreadConversationIds(false)) ~= nil else true)
			end)
			
			return function()
				-- upvalues: var17 (ref)
				var17()
			end
		end, { var14, var13, var12, setTabUnread })
		
		return nil
	end
	return nil
end