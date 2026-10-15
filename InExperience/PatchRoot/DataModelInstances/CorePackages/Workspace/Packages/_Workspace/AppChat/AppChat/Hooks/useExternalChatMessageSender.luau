local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local httpModule = require(parent.Http)
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local retrievalStatus = httpModule.Enum.RetrievalStatus
local statusCodes = httpModule.StatusCodes
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local navigateIntoChatModule = require(appChat.Actions.NavigateIntoChat)
local navigateIntoChatModule_1 = require(appChat.Conversations.Thunks.NavigateIntoChat)
local receivedConversationModule = require(appChat.Conversations.Actions.ReceivedConversation)
local sendTextMessageModule = require(appChat.Conversations.Thunks.SendTextMessage)
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)
local createConversationFromFriendPlaceholderModule = require(appChat.Conversations.createConversationFromFriendPlaceholder)
local enumScreensModule = require(appChat.EnumScreens)
local getChatModerationStatusDataHydrationModule = require(appChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(appChat.Stores.GetConversationStore)
local getConversationSendEligibilityStatusModule = require(appChat.Utils.getConversationSendEligibilityStatus)
local getUserSendEligibilityStatusModule = require(appChat.Utils.getUserSendEligibilityStatus)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local navigateWithOsaGateModule = require(appChat.Utils.navigateWithOsaGate)
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local useIsChatUserMessagesEnabledModule = require(appChat.Hooks.useIsChatUserMessagesEnabled)
local useIsGroupChatEnabledModule = require(appChat.Hooks.useIsGroupChatEnabled)
local isNavigationAvailable = require(parent.RobloxAppNavigation).isNavigationAvailable
local fFlagShareSheetFriendsSort = require(parent.SharedFlags).FFlagShareSheetFriendsSort
local _ = {
	Success = "success",
	Failure = "failure",
	Declined = "declined"
}

local function _(p1, p2)
	return { conversationId = p2, status = p1 }
end

local _ = function(p1)
	-- upvalues: statusCodes (ref), appChatNetworkingModule (ref)
	local var1 = p1 and (p1.responseCode == statusCodes.OK and (p1.responseBody and (p1.responseBody.messages and p1.responseBody.messages[1])))
	local status = var1 and var1.status
	
	return var1 ~= nil and (if status ~= nil then if status ~= "" then status == appChatNetworkingModule.Constants.ResponseStatus.SUCCESS else true else true)
end

return function(p1)
	-- upvalues: useDispatch (ref), getChatModerationStatusDataHydrationModule (ref), useAppPolicyModule (ref), useSelector (ref), getDeepValue2Module (ref), useIsChatEnabledModule (ref), useIsChatUserMessagesEnabledModule (ref), useIsGroupChatEnabledModule (ref), retrievalStatus (ref), reactModule (ref), getConversationSendEligibilityStatusModule (ref), getUserSendEligibilityStatusModule (ref), receivedConversationModule (ref), promiseModule (ref), sendTextMessageModule (ref), statusCodes (ref), appChatNetworkingModule (ref), navigateWithOsaGateModule (ref), createConversationFromFriendPlaceholderModule (ref), fFlagShareSheetFriendsSort (ref), createConversationModule (ref), navigateIntoChatModule_1 (ref), navigateIntoChatModule (ref), enumScreensModule (ref), isNavigationAvailable (ref)
	local var1 = useDispatch()
	local var2 = getChatModerationStatusDataHydrationModule()
	local var3 = useAppPolicyModule(function(p2)
		return p2.getCanUsePlatformChat()
	end)
	local var4 = useAppPolicyModule(function(p2)
		return p2.getCanSeeChatTerminology()
	end)
	local var5 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy)
		return getDeepValue2Module(p2, "ChatAppReducer.ChatSettings.retrievalStatus")
	end)
	local var6 = useSelector(function(p2)
		return tonumber(p2.LocalUserId) or 0
	end)
	local var7 = useSelector(function(p2)
		return p2.Navigation ~= nil
	end)
	local var8 = useIsChatEnabledModule()
	local var9 = useIsChatUserMessagesEnabledModule()
	local var10 = useIsGroupChatEnabledModule()
	local var11 = var5 ~= retrievalStatus.Done
	local var12 = not var11 and (var3 and (var4 and (var8 and var9)))
	local var13 = reactModule.useCallback(function(p2, p3)
		-- upvalues: getConversationSendEligibilityStatusModule (copy), var12 (ref), var10 (ref), var2 (ref)
		return getConversationSendEligibilityStatusModule({
			scope = false,
			allowConversationStatusLoading = p3,
			conversation = p2,
			currentTimestamp = DateTime.now().UnixTimestamp,
			isAvailable = var12,
			isGroupChatEnabled = var10,
			timeoutStore = var2
		})
	end, { var12, var10, var2 })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref)
		return var13(p2, false) == "eligible"
	end, { var13 })
	local var15 = reactModule.useCallback(function(_)
		-- upvalues: getUserSendEligibilityStatusModule (copy), var12 (ref)
		return getUserSendEligibilityStatusModule({
			scope = false,
			currentTimestamp = DateTime.now().UnixTimestamp,
			isAvailable = var12
		}) == "eligible"
	end, { var12 })
	local var16 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var13 (ref), var1 (ref), receivedConversationModule (copy), promiseModule (copy), sendTextMessageModule (copy), statusCodes (copy), appChatNetworkingModule (copy), navigateWithOsaGateModule (copy)
		return p2:andThen(function(p5)
			-- upvalues: var13 (copy), p3 (ref), var1 (copy), receivedConversationModule (copy), promiseModule (copy), sendTextMessageModule (copy), p4 (ref), statusCodes (copy), appChatNetworkingModule (copy), navigateWithOsaGateModule (copy)
			local id = p5 and p5.id
			
			if p5 == nil or id == nil or (id == "" or p5.source == "friends") or var13(p5, p3) ~= "eligible" then
				return { conversationId = nil, status = "failure" }
			elseif p3 then
				var1(receivedConversationModule(p5))
			end
			return promiseModule.new(function(p6)
				-- upvalues: var1 (copy), sendTextMessageModule (copy), id (ref), p4 (copy), statusCodes (copy), appChatNetworkingModule (copy), navigateWithOsaGateModule (copy)
				local function sendMessage()
					-- upvalues: var1 (copy), sendTextMessageModule (copy), id (copy), p4 (copy), p6 (ref), statusCodes (copy), appChatNetworkingModule (copy)
					var1(sendTextMessageModule(id, p4, nil)):andThen(function(p7)
						-- upvalues: p6 (copy), statusCodes (copy), appChatNetworkingModule (copy), id (copy)
						local var17 = p7 and (p7.responseCode == statusCodes.OK and (p7.responseBody and (p7.responseBody.messages and p7.responseBody.messages[1])))
						local status = var17 and var17.status
						p6(if var17 ~= nil and (if status ~= nil then if status ~= "" then status == appChatNetworkingModule.Constants.ResponseStatus.SUCCESS else true else true) then { status = "success", conversationId = id } else { conversationId = nil, status = "failure" })
					end, function()
						-- upvalues: p6 (copy)
						p6({ conversationId = nil, status = "failure" })
					end)
				end
				
				navigateWithOsaGateModule({
					conversationId = id,
					dispatch = var1,
					onAccepted = function()
						-- upvalues: sendMessage (ref)
						sendMessage()
					end,
					onDeclined = function()
						-- upvalues: p6 (ref)
						p6({ conversationId = nil, status = "declined" })
					end,
					onError = function()
						-- upvalues: p6 (ref)
						p6({ conversationId = nil, status = "failure" })
					end
				})
			end)
		end):catch(function()
			return { conversationId = nil, status = "failure" }
		end)
	end, { var1, var13 })
	local var17 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var14 (ref), promiseModule (copy), createConversationFromFriendPlaceholderModule (copy), var6 (ref), fFlagShareSheetFriendsSort (copy), var16 (ref), var13 (ref), var1 (ref), receivedConversationModule (copy), sendTextMessageModule (copy), statusCodes (copy), appChatNetworkingModule (copy), navigateWithOsaGateModule (copy)
		if not var14(p2) then
			return promiseModule.resolve({ conversationId = nil, status = "failure" })
		end
		local var18
		local isFriends = p2.source == "friends"
		local _ = nil
		
		if isFriends then
			var18 = createConversationFromFriendPlaceholderModule(p2, var6)
			
			return if var18 == nil then promiseModule.resolve({ conversationId = nil, status = "failure" }) elseif fFlagShareSheetFriendsSort then var16(var18, isFriends, p3) else var18:andThen(function(p4)
				-- upvalues: var13 (copy), isFriends (ref), var1 (copy), receivedConversationModule (copy), promiseModule (copy), sendTextMessageModule (copy), p3 (ref), statusCodes (copy), appChatNetworkingModule (copy), navigateWithOsaGateModule (copy)
				local id = p4 and p4.id
				
				if p4 == nil or id == nil or (id == "" or p4.source == "friends") or var13(p4, isFriends) ~= "eligible" then
					return { conversationId = nil, status = "failure" }
				elseif isFriends then
					var1(receivedConversationModule(p4))
				end
				return promiseModule.new(function(p5)
					-- upvalues: var1 (copy), sendTextMessageModule (copy), id (ref), p3 (copy), statusCodes (copy), appChatNetworkingModule (copy), navigateWithOsaGateModule (copy)
					local function sendMessage()
						-- upvalues: var1 (copy), sendTextMessageModule (copy), id (copy), p3 (copy), p5 (ref), statusCodes (copy), appChatNetworkingModule (copy)
						var1(sendTextMessageModule(id, p3, nil)):andThen(function(p6)
							-- upvalues: p5 (copy), statusCodes (copy), appChatNetworkingModule (copy), id (copy)
							local var19 = p6 and (p6.responseCode == statusCodes.OK and (p6.responseBody and (p6.responseBody.messages and p6.responseBody.messages[1])))
							local status = var19 and var19.status
							p5(if var19 ~= nil and (if status ~= nil then if status ~= "" then status == appChatNetworkingModule.Constants.ResponseStatus.SUCCESS else true else true) then { status = "success", conversationId = id } else { conversationId = nil, status = "failure" })
						end, function()
							-- upvalues: p5 (copy)
							p5({ conversationId = nil, status = "failure" })
						end)
					end
					
					navigateWithOsaGateModule({
						conversationId = id,
						dispatch = var1,
						onAccepted = function()
							-- upvalues: sendMessage (ref)
							sendMessage()
						end,
						onDeclined = function()
							-- upvalues: p5 (ref)
							p5({ conversationId = nil, status = "declined" })
						end,
						onError = function()
							-- upvalues: p5 (ref)
							p5({ conversationId = nil, status = "failure" })
						end
					})
				end)
			end):catch(function()
				return { conversationId = nil, status = "failure" }
			end)
		end
		var18 = promiseModule.resolve(p2)
	end, {
		var14,
		var1,
		var13,
		var6,
		var16
	})
	local var18 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var15 (ref), promiseModule (copy), var16 (ref), var1 (ref), createConversationModule (copy)
		return if var15(p2) then var16(var1(createConversationModule("one_to_one", { p2 })), true, p3) else promiseModule.resolve({ conversationId = nil, status = "failure" })
	end, { var15, var1, var16 })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), navigateIntoChatModule_1 (copy), navigateIntoChatModule (copy), enumScreensModule (copy)
		var1(navigateIntoChatModule_1({ conversationId = p2 }, true))
		
		if p2 == nil then
			var1(navigateIntoChatModule({ screen = enumScreensModule.ChatLanding, params = {} }))
		end
	end, { var1 })
	local var20 = not p1 and (isNavigationAvailable() or var7)
	
	return reactModule.useMemo(function()
		-- upvalues: var12 (ref), var10 (ref), var11 (ref), var14 (ref), var15 (ref), var20 (ref), var19 (ref), var17 (ref), var18 (ref)
		return {
			isAvailable = var12,
			isGroupChatEnabled = var10,
			isLoading = var11,
			canSendToConversation = var14,
			canSendToUser = var15,
			navigateToChat = if var20 then var19 else nil,
			sendToConversation = var17,
			sendToUser = var18
		}
	end, {
		var12, var10, var11, var14, var15, var19, var20, var17, var18
	})
end