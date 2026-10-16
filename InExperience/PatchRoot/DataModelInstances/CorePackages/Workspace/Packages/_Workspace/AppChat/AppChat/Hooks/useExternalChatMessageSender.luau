local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local HttpModule = require(Parent.Http)
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local RetrievalStatus = HttpModule.Enum.RetrievalStatus
local StatusCodes = HttpModule.StatusCodes
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local NavigateIntoChatModule = require(AppChat.Actions.NavigateIntoChat)
local NavigateIntoChatModule1 = require(AppChat.Conversations.Thunks.NavigateIntoChat)
local ReceivedConversationModule = require(AppChat.Conversations.Actions.ReceivedConversation)
local SendTextMessageModule = require(AppChat.Conversations.Thunks.SendTextMessage)
local CreateConversationModule = require(AppChat.Conversations.Thunks.createConversation)
local CreateConversationFromFriendPlaceholderModule = require(AppChat.Conversations.createConversationFromFriendPlaceholder)
local EnumScreensModule = require(AppChat.EnumScreens)
local GetChatModerationStatusDataHydrationModule = require(AppChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(AppChat.Stores.GetConversationStore)
local GetConversationSendEligibilityStatusModule = require(AppChat.Utils.getConversationSendEligibilityStatus)
local GetUserSendEligibilityStatusModule = require(AppChat.Utils.getUserSendEligibilityStatus)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local NavigateWithOsaGateModule = require(AppChat.Utils.navigateWithOsaGate)
local UseAppPolicyModule = require(AppChat.Hooks.useAppPolicy)
local UseIsChatEnabledModule = require(AppChat.Hooks.useIsChatEnabled)
local UseIsChatUserMessagesEnabledModule = require(AppChat.Hooks.useIsChatUserMessagesEnabled)
local UseIsGroupChatEnabledModule = require(AppChat.Hooks.useIsGroupChatEnabled)
local IsNavigationAvailableFunction = require(Parent.RobloxAppNavigation).isNavigationAvailable
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort

local function _(Status, ConversationId) --[[ Line: 64 | Named "makeSendResult" ]]
	return { conversationId = ConversationId, status = Status }
end

local _ = function(p1): boolean --[[ Line: 71 | Named "isSuccessfulResponse" ]]
	-- upvalues: StatusCodes (copy), AppChatNetworkingModule (copy)
	local Message = p1 and (p1.responseCode == StatusCodes.OK and (p1.responseBody and (p1.responseBody.messages and p1.responseBody.messages[1])))
	local Status = Message and Message.status
	
	return Message ~= nil and (Status == nil or (Status == "" or Status == AppChatNetworkingModule.Constants.ResponseStatus.SUCCESS))
end

return function(p1) --[[ Line: 82 | Named "useExternalChatMessageSender" ]]
	-- upvalues: UseDispatchFunction (copy), GetChatModerationStatusDataHydrationModule (copy), UseAppPolicyModule (copy), UseSelectorFunction (copy), GetDeepValue2Module (copy), UseIsChatEnabledModule (copy), UseIsChatUserMessagesEnabledModule (copy), UseIsGroupChatEnabledModule (copy), RetrievalStatus (copy), ReactModule (copy), GetConversationSendEligibilityStatusModule (copy), GetUserSendEligibilityStatusModule (copy), ReceivedConversationModule (copy), PromiseModule (copy), SendTextMessageModule (copy), StatusCodes (copy), AppChatNetworkingModule (copy), NavigateWithOsaGateModule (copy), CreateConversationFromFriendPlaceholderModule (copy), FFlagShareSheetFriendsSort (copy), CreateConversationModule (copy), NavigateIntoChatModule1 (copy), NavigateIntoChatModule (copy), EnumScreensModule (copy), IsNavigationAvailableFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local ChatModerationStatusDataHydrationModule = GetChatModerationStatusDataHydrationModule()
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2) --[[ Line: 85 ]]
		return p2.getCanUsePlatformChat()
	end)
	local UseAppPolicyModuleResult1 = UseAppPolicyModule(function(p2) --[[ Line: 88 ]]
		return p2.getCanSeeChatTerminology()
	end)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 91 ]]
		-- upvalues: GetDeepValue2Module (upval)
		return GetDeepValue2Module(p2, "ChatAppReducer.ChatSettings.retrievalStatus")
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2): number --[[ Line: 94 ]]
		return tonumber(p2.LocalUserId) or 0
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2): boolean --[[ Line: 97 ]]
		return p2.Navigation ~= nil
	end)
	local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
	local UseIsChatUserMessagesEnabledModuleResult = UseIsChatUserMessagesEnabledModule()
	local UseIsGroupChatEnabledModuleResult = UseIsGroupChatEnabledModule()
	local IsNotUseSelectorResultMatch = UseSelectorResult ~= RetrievalStatus.Done
	local UseIsChatUserMessagesEnabledModuleResult1 = not IsNotUseSelectorResultMatch and (UseAppPolicyModuleResult and (UseAppPolicyModuleResult1 and (UseIsChatEnabledModuleResult and UseIsChatUserMessagesEnabledModuleResult)))
	local UseResult = ReactModule.useCallback(function(Conversation, AllowConversationStatusLoading) --[[ Line: 112 ]]
		-- upvalues: GetConversationSendEligibilityStatusModule (upval), UseIsChatUserMessagesEnabledModuleResult1 (copy), UseIsGroupChatEnabledModuleResult (copy), ChatModerationStatusDataHydrationModule (copy)
		return GetConversationSendEligibilityStatusModule({
			scope = false,
			allowConversationStatusLoading = AllowConversationStatusLoading,
			conversation = Conversation,
			currentTimestamp = DateTime.now().UnixTimestamp,
			isAvailable = UseIsChatUserMessagesEnabledModuleResult1,
			isGroupChatEnabled = UseIsGroupChatEnabledModuleResult,
			timeoutStore = ChatModerationStatusDataHydrationModule
		})
	end, {
		UseIsChatUserMessagesEnabledModuleResult1,
		UseIsGroupChatEnabledModuleResult,
		ChatModerationStatusDataHydrationModule
	})
	local UseResult1 = ReactModule.useCallback(function(p2): boolean --[[ Line: 125 ]]
		-- upvalues: UseResult (copy)
		return UseResult(p2, false) == "eligible"
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function(_): boolean --[[ Line: 129 ]]
		-- upvalues: GetUserSendEligibilityStatusModule (upval), UseIsChatUserMessagesEnabledModuleResult1 (copy)
		return GetUserSendEligibilityStatusModule({
			scope = false,
			currentTimestamp = DateTime.now().UnixTimestamp,
			isAvailable = UseIsChatUserMessagesEnabledModuleResult1
		}) == "eligible"
	end, { UseIsChatUserMessagesEnabledModuleResult1 })
	local UseResult3 = ReactModule.useCallback(function(Promise, p2, p3) --[[ Line: 138 ]]
		-- upvalues: UseResult (copy), UseDispatchResult (copy), ReceivedConversationModule (upval), PromiseModule (upval), SendTextMessageModule (upval), StatusCodes (upval), AppChatNetworkingModule (upval), NavigateWithOsaGateModule (upval)
		return Promise:andThen(function(Result) --[[ Line: 140 ]]
			-- upvalues: UseResult (upval), p2 (copy), UseDispatchResult (upval), ReceivedConversationModule (upval), PromiseModule (upval), SendTextMessageModule (upval), p3 (copy), StatusCodes (upval), AppChatNetworkingModule (upval), NavigateWithOsaGateModule (upval)
			local Id = Result and Result.id
			
			if Result == nil or Id == nil or Id == "" or Result.source == "friends" or UseResult(Result, p2) ~= "eligible" then
				return { conversationId = nil, status = "failure" }
			end
			if p2 then
				UseDispatchResult(ReceivedConversationModule(Result))
			end
			return PromiseModule.new(function(Callback) --[[ Line: 156 ]]
				-- upvalues: UseDispatchResult (upval), SendTextMessageModule (upval), Id (copy), p3 (upval), StatusCodes (upval), AppChatNetworkingModule (upval), NavigateWithOsaGateModule (upval)
				local function sendMessage() --[[ Line: 157 ]]
					-- upvalues: UseDispatchResult (upval), SendTextMessageModule (upval), Id (upval), p3 (upval), Callback (copy), StatusCodes (upval), AppChatNetworkingModule (upval)
					UseDispatchResult(SendTextMessageModule(Id, p3, nil)):andThen(function(Result) --[[ Line: 158 ]]
						-- upvalues: Callback (upval), StatusCodes (upval), AppChatNetworkingModule (upval), Id (upval)
						local Message = Result and (Result.responseCode == StatusCodes.OK and (Result.responseBody and (Result.responseBody.messages and Result.responseBody.messages[1])))
						local Status = Message and Message.status
						local NoStatus: boolean = Message ~= nil and (Status == nil or (Status == "" or Status == AppChatNetworkingModule.Constants.ResponseStatus.SUCCESS))
						Callback(if NoStatus then { status = "success", conversationId = Id } else { conversationId = nil, status = "failure" })
					end, function() --[[ Line: 164 ]]
						-- upvalues: Callback (upval)
						Callback({ conversationId = nil, status = "failure" })
					end)
				end
				
				NavigateWithOsaGateModule({
					conversationId = Id,
					dispatch = UseDispatchResult,
					onAccepted = function() --[[ Line: 172 ]]
						-- upvalues: sendMessage (copy)
						sendMessage()
					end,
					onDeclined = function() --[[ Line: 175 ]]
						-- upvalues: Callback (copy)
						Callback({ conversationId = nil, status = "declined" })
					end,
					onError = function() --[[ Line: 178 ]]
						-- upvalues: Callback (copy)
						Callback({ conversationId = nil, status = "failure" })
					end
				})
			end)
		end):catch(function() --[[ Line: 184 ]]
			return { conversationId = nil, status = "failure" }
		end)
	end, { UseDispatchResult, UseResult })
	local UseResult4 = ReactModule.useCallback(function(p2, p3) --[[ Line: 191 ]]
		-- upvalues: UseResult1 (copy), PromiseModule (upval), CreateConversationFromFriendPlaceholderModule (upval), UseSelectorResult1 (copy), FFlagShareSheetFriendsSort (upval), UseResult3 (copy), UseResult (copy), UseDispatchResult (copy), ReceivedConversationModule (upval), SendTextMessageModule (upval), StatusCodes (upval), AppChatNetworkingModule (upval), NavigateWithOsaGateModule (upval)
		if not UseResult1(p2) then
			return PromiseModule.resolve({ conversationId = nil, status = "failure" })
		end
		local IsFriends = p2.source == "friends"
		local ConversationFromFriendPlaceholderModule = nil
		
		if IsFriends then
			ConversationFromFriendPlaceholderModule = CreateConversationFromFriendPlaceholderModule(p2, UseSelectorResult1)
			
			if ConversationFromFriendPlaceholderModule == nil then
				return PromiseModule.resolve({ conversationId = nil, status = "failure" })
			end
		else
			ConversationFromFriendPlaceholderModule = PromiseModule.resolve(p2)
		end
		return if FFlagShareSheetFriendsSort then UseResult3(ConversationFromFriendPlaceholderModule, IsFriends, p3) else ConversationFromFriendPlaceholderModule:andThen(function(Result) --[[ Line: 211 ]]
			-- upvalues: UseResult (upval), IsFriends (copy), UseDispatchResult (upval), ReceivedConversationModule (upval), PromiseModule (upval), SendTextMessageModule (upval), p3 (copy), StatusCodes (upval), AppChatNetworkingModule (upval), NavigateWithOsaGateModule (upval)
			local Id = Result and Result.id
			
			if Result == nil or Id == nil or Id == "" or Result.source == "friends" or UseResult(Result, IsFriends) ~= "eligible" then
				return { conversationId = nil, status = "failure" }
			end
			if IsFriends then
				UseDispatchResult(ReceivedConversationModule(Result))
			end
			return PromiseModule.new(function(Callback) --[[ Line: 227 ]]
				-- upvalues: UseDispatchResult (upval), SendTextMessageModule (upval), Id (copy), p3 (upval), StatusCodes (upval), AppChatNetworkingModule (upval), NavigateWithOsaGateModule (upval)
				local function sendMessage() --[[ Line: 228 ]]
					-- upvalues: UseDispatchResult (upval), SendTextMessageModule (upval), Id (upval), p3 (upval), Callback (copy), StatusCodes (upval), AppChatNetworkingModule (upval)
					UseDispatchResult(SendTextMessageModule(Id, p3, nil)):andThen(function(Result) --[[ Line: 230 ]]
						-- upvalues: Callback (upval), StatusCodes (upval), AppChatNetworkingModule (upval), Id (upval)
						local Message = Result and (Result.responseCode == StatusCodes.OK and (Result.responseBody and (Result.responseBody.messages and Result.responseBody.messages[1])))
						local Status = Message and Message.status
						local NoStatus: boolean = Message ~= nil and (Status == nil or (Status == "" or Status == AppChatNetworkingModule.Constants.ResponseStatus.SUCCESS))
						Callback(if NoStatus then { status = "success", conversationId = Id } else { conversationId = nil, status = "failure" })
					end, function() --[[ Line: 237 ]]
						-- upvalues: Callback (upval)
						Callback({ conversationId = nil, status = "failure" })
					end)
				end
				
				NavigateWithOsaGateModule({
					conversationId = Id,
					dispatch = UseDispatchResult,
					onAccepted = function() --[[ Line: 246 ]]
						-- upvalues: sendMessage (copy)
						sendMessage()
					end,
					onDeclined = function() --[[ Line: 249 ]]
						-- upvalues: Callback (copy)
						Callback({ conversationId = nil, status = "declined" })
					end,
					onError = function() --[[ Line: 252 ]]
						-- upvalues: Callback (copy)
						Callback({ conversationId = nil, status = "failure" })
					end
				})
			end)
		end):catch(function() --[[ Line: 258 ]]
			return { conversationId = nil, status = "failure" }
		end)
	end, {
		UseResult1,
		UseDispatchResult,
		UseResult,
		UseSelectorResult1,
		UseResult3
	})
	local UseResult5 = ReactModule.useCallback(function(p2, p3) --[[ Line: 265 ]]
		-- upvalues: UseResult2 (copy), PromiseModule (upval), UseResult3 (copy), UseDispatchResult (copy), CreateConversationModule (upval)
		return if UseResult2(p2) then UseResult3(UseDispatchResult(CreateConversationModule("one_to_one", { p2 })), true, p3) else PromiseModule.resolve({ conversationId = nil, status = "failure" })
	end, { UseResult2, UseDispatchResult, UseResult3 })
	local UseResult6 = ReactModule.useCallback(function(ConversationId) --[[ Line: 271 ]]
		-- upvalues: UseDispatchResult (copy), NavigateIntoChatModule1 (upval), NavigateIntoChatModule (upval), EnumScreensModule (upval)
		UseDispatchResult(NavigateIntoChatModule1({ conversationId = ConversationId }, true))
		
		if ConversationId == nil then
			UseDispatchResult(NavigateIntoChatModule({ screen = EnumScreensModule.ChatLanding, params = {} }))
		end
	end, { UseDispatchResult })
	local IsNavigationAvailable = not p1 and (IsNavigationAvailableFunction() or UseSelectorResult2)
	
	return ReactModule.useMemo(function() --[[ Line: 284 ]]
		-- upvalues: UseIsChatUserMessagesEnabledModuleResult1 (copy), UseIsGroupChatEnabledModuleResult (copy), IsNotUseSelectorResultMatch (copy), UseResult1 (copy), UseResult2 (copy), IsNavigationAvailable (copy), UseResult6 (copy), UseResult4 (copy), UseResult5 (copy)
		return {
			isAvailable = UseIsChatUserMessagesEnabledModuleResult1,
			isGroupChatEnabled = UseIsGroupChatEnabledModuleResult,
			isLoading = IsNotUseSelectorResultMatch,
			canSendToConversation = UseResult1,
			canSendToUser = UseResult2,
			navigateToChat = if IsNavigationAvailable then UseResult6 else nil,
			sendToConversation = UseResult4,
			sendToUser = UseResult5
		}
	end, {
		UseIsChatUserMessagesEnabledModuleResult1, UseIsGroupChatEnabledModuleResult,
		IsNotUseSelectorResultMatch, UseResult1, UseResult2, UseResult6,
		IsNavigationAvailable, UseResult4, UseResult5
	})
end