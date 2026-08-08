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
local createConversationFromFriendPlaceholderModule = require(appChat.Conversations.createConversationFromFriendPlaceholder)
local enumScreensModule = require(appChat.EnumScreens)
local getChatModerationStatusDataHydrationModule = require(appChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(appChat.Stores.GetConversationStore)
local getConversationSendEligibilityStatusModule = require(appChat.Utils.getConversationSendEligibilityStatus)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local navigateWithOsaGateModule = require(appChat.Utils.navigateWithOsaGate)
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local useIsChatUserMessagesEnabledModule = require(appChat.Hooks.useIsChatUserMessagesEnabled)
local useIsGroupChatEnabledModule = require(appChat.Hooks.useIsGroupChatEnabled)
local isNavigationAvailable = require(parent.RobloxAppNavigation).isNavigationAvailable
local fFlagAppChatNilGuardReceivedChatResponseModule = require(appChat.Flags.FFlagAppChatNilGuardReceivedChatResponse)
local _ = {
	Success = "success",
	Failure = "failure",
	Declined = "declined"
}

local function _(p0, p1) --[[ line: 58 | named "makeSendResult" ]]
	return { conversationId = p1, status = p0 }
end

local _ = function(p2) --[[ line: 65 | named "isSuccessfulResponse" ]]
	-- upvalues: statusCodes (ref), appChatNetworkingModule (ref)
	local var20 = p2 and (p2.responseCode == statusCodes.OK and (p2.responseBody and (p2.responseBody.messages and p2.responseBody.messages[1])))
	local status = var20 and var20.status
	
	return var20 ~= nil and (if status ~= nil then if status ~= "" then status == appChatNetworkingModule.Constants.ResponseStatus.SUCCESS else true else true)
end

return function(p3) --[[ line: 76 | named "useExternalChatMessageSender" ]]
	-- upvalues: useDispatch (ref), getChatModerationStatusDataHydrationModule (ref), useAppPolicyModule (ref), useSelector (ref), getDeepValue2Module (ref), useIsChatEnabledModule (ref), useIsChatUserMessagesEnabledModule (ref), useIsGroupChatEnabledModule (ref), retrievalStatus (ref), fFlagAppChatNilGuardReceivedChatResponseModule (ref), reactModule (ref), getConversationSendEligibilityStatusModule (ref), promiseModule (ref), createConversationFromFriendPlaceholderModule (ref), receivedConversationModule (ref), sendTextMessageModule (ref), statusCodes (ref), appChatNetworkingModule (ref), navigateWithOsaGateModule (ref), navigateIntoChatModule_1 (ref), navigateIntoChatModule (ref), enumScreensModule (ref), isNavigationAvailable (ref)
	local var22 = useDispatch()
	local var23 = getChatModerationStatusDataHydrationModule()
	local var24 = useAppPolicyModule(function(p4) --[[ line: 79 ]]
		return p4.getCanUsePlatformChat()
	end)
	local var25 = useAppPolicyModule(function(p5) --[[ line: 82 ]]
		return p5.getCanSeeChatTerminology()
	end)
	local var26 = useSelector(function(p6) --[[ line: 85 ]]
		-- upvalues: getDeepValue2Module (copy)
		return getDeepValue2Module(p6, "ChatAppReducer.ChatSettings.retrievalStatus")
	end)
	local var27 = useSelector(function(p7) --[[ line: 88 ]]
		return tonumber(p7.LocalUserId) or 0
	end)
	local var28 = useSelector(function(p8) --[[ line: 91 ]]
		return p8.Navigation ~= nil
	end)
	local var29 = useIsChatEnabledModule()
	local var30 = useIsChatUserMessagesEnabledModule()
	local var31 = useIsGroupChatEnabledModule()
	local var32 = var26 ~= retrievalStatus.Done
	local fFlagAppChatNilGuardReceivedChatResponseModule_1 = not var32 and (var24 and (var25 and (var29 and (var30 and (fFlagAppChatNilGuardReceivedChatResponseModule or not p3)))))
	local var34 = reactModule.useCallback(function(p9, p10) --[[ line: 107 ]]
		-- upvalues: getConversationSendEligibilityStatusModule (copy), fFlagAppChatNilGuardReceivedChatResponseModule_1 (ref), var31 (ref), var23 (ref)
		return getConversationSendEligibilityStatusModule({
			scope = false,
			allowConversationStatusLoading = p10,
			conversation = p9,
			currentTimestamp = DateTime.now().UnixTimestamp,
			isAvailable = fFlagAppChatNilGuardReceivedChatResponseModule_1,
			isGroupChatEnabled = var31,
			timeoutStore = var23
		})
	end, {
		fFlagAppChatNilGuardReceivedChatResponseModule_1,
		var31,
		var23
	})
	local var35 = reactModule.useCallback(function(p11) --[[ line: 120 ]]
		-- upvalues: var34 (ref)
		return var34(p11, false) == "eligible"
	end, { var34 })
	local var36 = reactModule.useCallback(function(p12, p13) --[[ line: 125 ]]
		-- upvalues: var35 (ref), promiseModule (copy), createConversationFromFriendPlaceholderModule (copy), var27 (ref), var34 (ref), var22 (ref), receivedConversationModule (copy), sendTextMessageModule (copy), statusCodes (copy), appChatNetworkingModule (copy), navigateWithOsaGateModule (copy)
		if not var35(p12) then
			return promiseModule.resolve({ conversationId = nil, status = "failure" })
		end
		local var40
		local isFriends = p12.source == "friends"
		local _ = nil
		
		if isFriends then
			var40 = createConversationFromFriendPlaceholderModule(p12, var27)
			
			return if var40 == nil then promiseModule.resolve({ conversationId = nil, status = "failure" }) else var40:andThen(function(p14) --[[ line: 142 ]]
				-- upvalues: var34 (copy), isFriends (ref), var22 (copy), receivedConversationModule (copy), promiseModule (copy), sendTextMessageModule (copy), p13 (ref), statusCodes (copy), appChatNetworkingModule (copy), navigateWithOsaGateModule (copy)
				local id = p14 and p14.id
				
				if p14 == nil or id == nil or (id == "" or p14.source == "friends") or var34(p14, isFriends) ~= "eligible" then
					return { conversationId = nil, status = "failure" }
				elseif isFriends then
					var22(receivedConversationModule(p14))
				end
				return promiseModule.new(function(p15) --[[ line: 158 ]]
					-- upvalues: var22 (copy), sendTextMessageModule (copy), id (ref), p13 (copy), statusCodes (copy), appChatNetworkingModule (copy), navigateWithOsaGateModule (copy)
					local function sendMessage() --[[ line: 159 ]]
						-- upvalues: var22 (copy), sendTextMessageModule (copy), id (copy), p13 (copy), p15 (ref), statusCodes (copy), appChatNetworkingModule (copy)
						var22(sendTextMessageModule(id, p13, nil)):andThen(function(p16) --[[ line: 160 ]]
							-- upvalues: p15 (copy), statusCodes (copy), appChatNetworkingModule (copy), id (copy)
							local var43 = p16 and (p16.responseCode == statusCodes.OK and (p16.responseBody and (p16.responseBody.messages and p16.responseBody.messages[1])))
							local status = var43 and var43.status
							p15(if var43 ~= nil and (if status ~= nil then if status ~= "" then status == appChatNetworkingModule.Constants.ResponseStatus.SUCCESS else true else true) then { status = "success", conversationId = id } else { conversationId = nil, status = "failure" })
						end, function() --[[ line: 166 ]]
							-- upvalues: p15 (copy)
							p15({ conversationId = nil, status = "failure" })
						end)
					end
					
					navigateWithOsaGateModule({
						conversationId = id,
						dispatch = var22,
						onAccepted = function() --[[ line: 174 ]]
							-- upvalues: sendMessage (ref)
							sendMessage()
						end,
						onDeclined = function() --[[ line: 177 ]]
							-- upvalues: p15 (ref)
							p15({ conversationId = nil, status = "declined" })
						end,
						onError = function() --[[ line: 180 ]]
							-- upvalues: p15 (ref)
							p15({ conversationId = nil, status = "failure" })
						end
					})
				end)
			end):catch(function() --[[ line: 186 ]]
				return { conversationId = nil, status = "failure" }
			end)
		end
		var40 = promiseModule.resolve(p12)
	end, { var35, var22, var34, var27 })
	local var37 = reactModule.useCallback(function(p17) --[[ line: 192 ]]
		-- upvalues: var22 (ref), navigateIntoChatModule_1 (copy), navigateIntoChatModule (copy), enumScreensModule (copy)
		var22(navigateIntoChatModule_1({ conversationId = p17 }, true))
		
		if p17 == nil then
			var22(navigateIntoChatModule({ screen = enumScreensModule.ChatLanding, params = {} }))
		end
	end, { var22 })
	local var38 = not p3 and (isNavigationAvailable() or var28)
	
	return reactModule.useMemo(function() --[[ line: 205 ]]
		-- upvalues: fFlagAppChatNilGuardReceivedChatResponseModule_1 (ref), var31 (ref), var32 (ref), var35 (ref), var38 (ref), var37 (ref), var36 (ref)
		return {
			isAvailable = fFlagAppChatNilGuardReceivedChatResponseModule_1,
			isGroupChatEnabled = var31,
			isLoading = var32,
			canSendToConversation = var35,
			navigateToChat = if var38 then var37 else nil,
			sendToConversation = var36
		}
	end, {
		fFlagAppChatNilGuardReceivedChatResponseModule_1, var31, var32, var35, var37,
		var38, var36
	})
end