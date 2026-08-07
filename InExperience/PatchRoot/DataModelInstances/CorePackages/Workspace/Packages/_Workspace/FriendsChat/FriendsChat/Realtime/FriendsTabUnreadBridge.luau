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
local name = expChatSharedModule.Logger:new(script.Name)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab

return function(p0) --[[ line: 60 | named "FriendsTabUnreadBridge" ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), getFriendsChatRealtimeStoreModule (ref), getFriendsChatNavigationStoreModule (ref), signalsReactModule (ref), reactModule (ref), inExperienceAppChatModalModule (ref), appChatNetworkingModule (ref), name (ref), signalsModule (ref)
	if fFlagExpChatEnableFriendsTab then
		local setTabUnread = p0.setTabUnread
		local selectedTabName = p0.selectedTabName
		local isChatWindowVisible = p0.isChatWindowVisible
		local var10 = getFriendsChatRealtimeStoreModule(false)
		local var11 = signalsReactModule.useSignalState(getFriendsChatNavigationStoreModule(false).getSelectedConversationId)
		
		local function _() --[[ line: 72 | named "readHasLocalUnread" ]]
			-- upvalues: var10 (ref)
			return next(var10.getLocalUnreadConversationIds(false)) ~= nil
		end
		
		local var12 = isChatWindowVisible == true and selectedTabName == "FriendsChat"
		local var13 = var12 and var11 == nil
		reactModule.useEffect(function() --[[ line: 94 ]]
			-- upvalues: var12 (ref), inExperienceAppChatModalModule (copy), appChatNetworkingModule (copy), name (copy), setTabUnread (ref), var10 (ref)
			local function onGlobalCount() --[[ line: 95 ]]
				-- upvalues: var12 (copy), inExperienceAppChatModalModule (copy), appChatNetworkingModule (copy), name (copy), setTabUnread (copy), var10 (copy)
				if var12 and (inExperienceAppChatModalModule.default.unreadCount or 0) > 0 then
					inExperienceAppChatModalModule:setUnreadCount(0)
					appChatNetworkingModule.http.ClearGlobalUnreadCount():catch(function(p1) --[[ line: 102 ]]
						-- upvalues: name (copy)
						name:warning(`Failed to clear global unread count: {tostring(p1)}`)
					end)
				end
				setTabUnread(if (inExperienceAppChatModalModule.default.unreadCount or 0) <= 0 then next(var10.getLocalUnreadConversationIds(false)) ~= nil else true)
			end
			
			onGlobalCount()
			local eventConnection = inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(onGlobalCount)
			
			return function() --[[ line: 112 ]]
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end, { var12, setTabUnread })
		reactModule.useEffect(function() --[[ line: 126 ]]
			-- upvalues: signalsModule (copy), var10 (ref), var12 (ref), var11 (ref), var13 (ref), setTabUnread (ref), inExperienceAppChatModalModule (copy)
			local var16 = signalsModule.createEffect(function(p2) --[[ line: 127 ]]
				-- upvalues: var10 (copy), var12 (copy), var11 (copy), var13 (copy), setTabUnread (copy), inExperienceAppChatModalModule (copy)
				local localUnreadConversationIds = var10.getLocalUnreadConversationIds(p2)
				
				if (var12 and (var11 ~= nil and localUnreadConversationIds[var11] == true)) or var13 and next(localUnreadConversationIds) ~= nil then
					var10.clearLocalUnread()
				end
				setTabUnread(if (inExperienceAppChatModalModule.default.unreadCount or 0) <= 0 then next(var10.getLocalUnreadConversationIds(false)) ~= nil else true)
			end)
			
			return function() --[[ line: 143 ]]
				-- upvalues: var16 (ref)
				var16()
			end
		end, { var13, var12, var11, setTabUnread })
		
		return nil
	end
	return nil
end