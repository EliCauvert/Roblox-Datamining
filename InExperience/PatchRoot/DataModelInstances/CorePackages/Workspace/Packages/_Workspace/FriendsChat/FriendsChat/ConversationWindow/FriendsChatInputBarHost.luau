local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local signalsReactModule = require(parent.SignalsReact)
local expChatSharedModule = require(parent.ExpChatShared)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local expChatPerfTracker = chatUIPrimitivesModule.Telemetry.ExpChatPerfTracker
local inputTypeConstants = require(parent.InputType).InputTypeConstants
local appChatNetworkingModule = require(parent.AppChatNetworking)
local chatInputBoxDisabledModule = require(parent.AppChat.ChatInputBoxDisabled)
local _ = require(parent.AppChat.ConversationChannels)
local createConversationFromFriendPlaceholderModule = require(parent.AppChat.createConversationFromFriendPlaceholder)
local messageCharacterLimitModule = require(parent.AppChat.MessageCharacterLimit)
local getConversationMessageStoreModule = require(parent.AppChat.GetConversationMessageStore)
local getConversationMessageListStoreModule = require(parent.AppChat.GetConversationMessageListStore)
local ingestNewerMessagesModule = require(parent.AppChat.ingestNewerMessages)
local chatConversationTelemetryLayerModule = require(parent.AppChat.ChatConversationTelemetryLayer)
local chatConversationTelemetryEventsModule = require(parent.AppChat.ChatConversationTelemetryEvents)
local sendMessageErrorModule = require(parent.AppChat.SendMessageError)
local useChatTimeoutDetailsFromHydrationModule = require(parent.AppChat.useChatTimeoutDetailsFromHydration)
local useTelemetryModule = require(parent.AppChat.useTelemetry)
local interventionSharedModule = require(parent.InterventionShared)
local chatInputBoxDisabledPressedSignal = interventionSharedModule.Signals.chatInputBoxDisabledPressedSignal
local interventionTreatmentShownSignal = interventionSharedModule.Signals.interventionTreatmentShownSignal
local constants = interventionSharedModule.Utils.Constants
local fFlagFriendsChatEnforceInputCharacterLimitModule = require(friendsChat.Flags.FFlagFriendsChatEnforceInputCharacterLimit)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)
local useConsumeFocusInputBarRequestModule = require(script.Parent.useConsumeFocusInputBarRequest)
local getConversationInputPlaceholderModule = require(script.Parent.getConversationInputPlaceholder)
local resolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local useInExperienceLocalization = chatUIPrimitivesModule.Hooks.useInExperienceLocalization
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local getConversationMessageSentInfoModule = require(script.Parent.Parent.Telemetry.ChatConversation.getConversationMessageSentInfo)
local fFlagFriendsChatMessageSendPerfTrackingModule = require(friendsChat.Flags.FFlagFriendsChatMessageSendPerfTracking)
local friendsChatTabNameModule = require(friendsChat.FriendsChatTabName)
local serializeParticipantIdsForTelemetryModule = require(script.Parent.Parent.Telemetry.App.serializeParticipantIdsForTelemetry)
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView
local useChatInputBarSettingsModule = require(parent.ExpChatIntegration.useChatInputBarSettings)
local useChatInputBarOnFocusModule = require(parent.ExpChatIntegration.useChatInputBarOnFocus)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local name = expChatSharedModule.Logger:new(script.Name)
local t = { commands = nil, emojis = true }

local function isSendResponseAccepted(p0) --[[ line: 92 ]]
	if p0 == nil or p0.responseBody == nil then
		return false
	elseif p0.responseCode ~= nil and p0.responseCode ~= 200 then
		return false
	elseif p0.StatusCode ~= nil and p0.StatusCode ~= 200 then
		return false
	end
	local messages = p0.responseBody.messages
	
	if messages == nil or #messages == 0 then
		return false
	end
	local status = messages[1].status
	
	return if status ~= nil then if status ~= "" then status == "success" else true else true
end

return function(p1) --[[ line: 112 | named "FriendsChatInputBarHost" ]]
	-- upvalues: foundationModule (ref), expChatConversationListAdapterModule (ref), useChatTimeoutDetailsFromHydrationModule (ref), signalsReactModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useChatInputBarSettingsModule (ref), useInExperienceLocalization (ref), chatUIPrimitivesModule (ref), inputTypeConstants (ref), getConversationInputPlaceholderModule (ref), userInputService (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useInterpolatedClientSettingsModule (ref), useChatInputBarOnFocusModule (ref), getFriendsChatNavigationStoreModule (ref), useConsumeFocusInputBarRequestModule (ref), interventionTreatmentShownSignal (ref), constants (ref), httpService (ref), fFlagFriendsChatMessageSendPerfTrackingModule (ref), expChatPerfTracker (ref), friendsChatTabNameModule (ref), playersService (ref), name (ref), createConversationFromFriendPlaceholderModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), serializeParticipantIdsForTelemetryModule (ref), appChatNetworkingModule (ref), chatConversationTelemetryEventsModule (ref), getConversationMessageSentInfoModule (ref), isSendResponseAccepted (ref), signalsExperimentalModule (ref), ingestNewerMessagesModule (ref), sendMessageErrorModule (ref), chatInputBoxDisabledPressedSignal (ref), chatInputBoxDisabledModule (ref), resolveFadeModule (ref), layoutConstantsModule (ref), chatInputBarView (ref), t (ref), fFlagFriendsChatEnforceInputCharacterLimitModule (ref), messageCharacterLimitModule (ref)
	local var41 = foundationModule.Hooks.useTokens()
	local conversationId = p1.conversationId
	local var42 = expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var43 = conversationId ~= nil and (conversationId ~= "" and not var42)
	local var44 = signalsReactModule.useSignalState(useChatTimeoutDetailsFromHydrationModule({
		conversationId = if var43 then conversationId else nil,
		conversationModerationType = p1.conversationModerationType
	}))
	local isTimedOut = var44.isTimedOut
	local var45 = useChatWindowSettingsModule()
	local var46 = reactModule.useMemo(function() --[[ line: 128 ]]
		-- upvalues: var45 (ref)
		return {
			BackgroundColor3 = var45.ChatWindowBackgroundColor3,
			BackgroundTransparency = var45.ChatWindowBackgroundTransparency
		}
	end, { var45 })
	local var47 = not isTimedOut
	local var48 = useChatInputBarSettingsModule()
	local var49 = reactModule.useMemo(function() --[[ line: 139 ]]
		-- upvalues: p1 (ref), var48 (ref)
		return if p1.isSpatialUIEnabled and var48 and var48.SpatialPanelTextSize then var48.SpatialPanelTextSize elseif var48 then var48.TextSize else nil
	end, { var48, p1.isSpatialUIEnabled })
	local var50 = useInExperienceLocalization()
	local var51 = chatUIPrimitivesModule.Hooks.useLastInputGroup()
	local var52 = var51 == inputTypeConstants.Touch
	local var53 = var51 == inputTypeConstants.Gamepad
	local var54 = if var48 and var48.KeyboardKeyCode then var48.KeyboardKeyCode else Enum.KeyCode.Slash
	local var55 = reactModule.useMemo(function() --[[ line: 161 ]]
		-- upvalues: getConversationInputPlaceholderModule (copy), var53 (ref), var52 (ref), var54 (ref), var50 (ref), userInputService (copy)
		return getConversationInputPlaceholderModule({ isGamepad = var53, isTouch = var52 }, var54, var50, userInputService)
	end, { var53, var52, var54, var50 })
	local var56 = var50("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
	local var57 = useLocalization({ timeoutDisabled = "Feature.Chat.Label.ChatDisabled" })
	local var58 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var59 = reactModule.useRef(var58.emit)
	var59.current = var58.emit
	local var60 = useInterpolatedClientSettingsModule(p1.chatWindowSettings or var46)
	local var61 = useChatInputBarOnFocusModule()
	local var62 = getFriendsChatNavigationStoreModule(false)
	local var63 = reactModule.useCallback(function() --[[ line: 189 ]]
		-- upvalues: var62 (ref), var61 (ref)
		var62.setInputBarFocused(true)
		var61.onFocusGained()
	end, { var61.onFocusGained, var62 })
	local var64 = reactModule.useCallback(function() --[[ line: 193 ]]
		-- upvalues: var62 (ref), var61 (ref)
		var62.setInputBarFocused(false)
		var61.onFocusLost()
	end, { var61.onFocusLost, var62 })
	local var65 = chatUIPrimitivesModule.Hooks.useFocusInputBar()
	local ref = var65.ref
	useConsumeFocusInputBarRequestModule(var65.focus)
	reactModule.useEffect(function() --[[ line: 209 ]]
		-- upvalues: var64 (ref)
		return function() --[[ line: 210 ]]
			-- upvalues: var64 (copy)
			var64()
		end
	end, { var64 })
	reactModule.useEffect(function() --[[ line: 215 ]]
		-- upvalues: interventionTreatmentShownSignal (copy), constants (copy), ref (ref)
		local var67 = interventionTreatmentShownSignal:connect(function(p2) --[[ line: 216 ]]
			-- upvalues: constants (copy), ref (copy)
			if p2 == constants.TreatmentType.PartyChatNudgeDialog or p2 == constants.TreatmentType.PartyChatTimeoutDialog then
				local current = ref.current
				
				if current then
					current:ReleaseFocus()
				end
			end
		end)
		
		return function() --[[ line: 227 ]]
			-- upvalues: var67 (ref)
			var67:disconnect()
		end
	end, {})
	local var49_1 = var49 or var41.Typography.CaptionMedium.FontSize
	
	return reactModule.createElement("Frame", {
		Name = "friendsChatInput",
		LayoutOrder = p1.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var60.BackgroundColor3 or var45.ChatWindowBackgroundColor3,
		BackgroundTransparency = resolveFadeModule(var60.BackgroundTransparency, p1.transparencyValue),
		Active = true,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 0),
		[reactModule.Event.MouseEnter] = p1.onHovered,
		[reactModule.Event.MouseLeave] = p1.onUnhovered
	}, {
		bottomCorner = reactModule.createElement("UICorner", {
			BottomLeftRadius = UDim.new(0, layoutConstantsModule.PanelBottomCornerRadius),
			BottomRightRadius = UDim.new(0, layoutConstantsModule.PanelBottomCornerRadius),
			TopLeftRadius = UDim.new(0, 0),
			TopRightRadius = UDim.new(0, 0)
		}),
		padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, layoutConstantsModule.InputBarTopPadding),
			PaddingBottom = UDim.new(0, layoutConstantsModule.InputBarBottomPadding + layoutConstantsModule.PanelBottomCornerRadius),
			PaddingLeft = UDim.new(0, layoutConstantsModule.InputBarSidePadding),
			PaddingRight = UDim.new(0, layoutConstantsModule.InputBarSidePadding)
		}),
		inputBar = reactModule.createElement(chatInputBarView, {
			showSideChip = false,
			onSend = reactModule.useCallback(function(p3) --[[ line: 233 ]]
				-- upvalues: isTimedOut (ref), httpService (copy), fFlagFriendsChatMessageSendPerfTrackingModule (copy), expChatPerfTracker (copy), friendsChatTabNameModule (copy), conversationId (ref), playersService (copy), var42 (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (ref), var43 (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var59 (ref), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
				if isTimedOut then return end
				local var68 = if typeof(p3) == "string" then p3 else ""
				
				if var68 == "" then
					return
				end
				local text = "sending-friends-message-" .. httpService:GenerateGUID(false)
				local var70 = if fFlagFriendsChatMessageSendPerfTrackingModule then expChatPerfTracker.start(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = text }, { tabName = friendsChatTabNameModule }) else false
				task.spawn(function() --[[ line: 262 ]]
					-- upvalues: conversationId (copy), playersService (copy), var42 (copy), var70 (write), expChatPerfTracker (copy), text (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (copy), var43 (copy), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), var68 (ref), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var59 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
					local var74
					local conversationId_1 = conversationId or ""
					local localPlayer = playersService.LocalPlayer
					
					if var42 and conversationId ~= nil then
						if var70 then
							expChatPerfTracker.cancel(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = text })
						end
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId, false)
						
						if conversation == nil then
							name:warning(`Unable to find friend placeholder {conversationId}`)
							
							return
						end
						local var73 = createConversationFromFriendPlaceholderModule(conversation, if localPlayer then localPlayer.UserId else 0)
						
						if var73 == nil then
							name:warning(`Unable to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						var74, var75 = var73:await()
						
						if not var74 or var75 == nil then
							name:warning(`Failed to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						conversationId_1 = var75.id
						
						if p1.onFriendPlaceholderConversationCreated ~= nil then
							p1.onFriendPlaceholderConversationCreated(conversationId_1)
						end
					elseif var43 then
						local var76 = getConversationMessageStoreModule(false)
						local var77 = getConversationMessageListStoreModule(false)
						var76.upsertMessages({
							[text] = {
								type = "user",
								status = "Pending",
								id = text,
								content = var68,
								created_at = tostring(os.time()),
								sender_user_id = if localPlayer then localPlayer.UserId else nil,
								conversationId = conversationId_1
							}
						})
						var77.prependMessages(conversationId_1, { text })
						var74 = string.rep("#", utf8.len(var68) or #var68)
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId_1, false)
						local var79 = serializeParticipantIdsForTelemetryModule(if conversation then conversation.participants else nil, if localPlayer then localPlayer.UserId else 0)
						appChatNetworkingModule.http.SendChatTextMessage(nil, conversationId_1, var68):andThen(function(p5) --[[ line: 343 ]]
							-- upvalues: var59 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), var79 (ref), isSendResponseAccepted (copy), var76 (ref), text (copy), var74 (ref), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), conversationId_1 (write), expChatConversationListAdapterModule (copy), localPlayer (ref), var77 (ref)
							var59.current(chatConversationTelemetryEventsModule.ConversationMessageSent, getConversationMessageSentInfoModule(p5, var79))
							
							if isSendResponseAccepted(p5) then
								local messages = p5.responseBody.messages or {}
								signalsExperimentalModule.batch(function() --[[ line: 360 ]]
									-- upvalues: ingestNewerMessagesModule (copy), conversationId_1 (copy), messages (ref), var76 (copy), text (copy), var74 (copy), expChatConversationListAdapterModule (copy), localPlayer (copy), var77 (copy)
									if #ingestNewerMessagesModule(conversationId_1, messages) == 0 then
										var76.updateMessage(text, { status = "Failed", content = var74 })
										
										return
									end
									expChatConversationListAdapterModule.updateConversationPreviewFromMessages(conversationId_1, messages, {
										hasUnreadMessages = false,
										localUserId = if localPlayer then localPlayer.UserId else 0
									})
									var77.removeMessage(conversationId_1, text)
									var76.removeMessage(text)
								end)
								
								return
							end
							var76.updateMessage(text, { status = "Failed", content = var74 })
						end):catch(function(p4) --[[ line: 385 ]]
							-- upvalues: name (copy), conversationId_1 (write), var59 (copy), chatConversationTelemetryEventsModule (copy), sendMessageErrorModule (copy), var79 (ref), var76 (ref), text (copy), var74 (ref)
							name:warning(`Failed to send message to {conversationId_1}: {tostring(p4)}`)
							var59.current(chatConversationTelemetryEventsModule.ConversationMessageSent, {
								messageSentResult = sendMessageErrorModule.OtherFailure,
								recipientIds = var79
							})
							var76.updateMessage(text, { status = "Failed", content = var74 })
						end)
						
						return
					elseif var70 then
						expChatPerfTracker.cancel(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = text })
					end
				end)
			end, {
				conversationId,
				var43,
				var42,
				isTimedOut,
				p1.onFriendPlaceholderConversationCreated
			}),
			canLocalUserChat = var47 or false,
			disabledOverlay = if isTimedOut then reactModule.createElement(foundationModule.View, {
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				padding = {
					top = UDim.new(0, var49_1 / 2),
					bottom = UDim.new(0, var49_1 / 2),
					left = UDim.new(0, var41.Padding.Large),
					right = UDim.new(0, var41.Padding.XSmall)
				}
			}, {
				TimeoutContent = reactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					ZIndex = 5,
					GroupTransparency = p1.transparencyValue or 0,
					Size = UDim2.new(1, 0, 0, math.max(var41.Typography.CaptionMedium.LineHeight, var49_1))
				}, {
					DisabledInput = reactModule.createElement(chatInputBoxDisabledModule, {
						bodyText = var57.timeoutDisabled,
						contentSize = var49_1,
						endTimestamp = var44.timeoutEndTimestamp,
						font = Enum.Font.BuilderSans,
						onActivated = reactModule.useCallback(function() --[[ line: 410 ]]
							-- upvalues: chatInputBoxDisabledPressedSignal (copy), var44 (ref)
							chatInputBoxDisabledPressedSignal:fire({
								endTimestamp = var44.timeoutEndTimestamp,
								decisionEventId = var44.decisionEventId,
								duration = var44.duration
							})
						end, {
							var44.timeoutEndTimestamp,
							var44.decisionEventId,
							var44.duration
						}),
						contentVerticalAlignment = Enum.VerticalAlignment.Center
					})
				})
			}) else nil,
			textSize = var49,
			textBoxRef = ref,
			placeholderText = var55,
			disabledChatPlaceholderText = var56,
			autocomplete = t,
			transparencyValue = p1.transparencyValue,
			onFocusGained = var63,
			onFocusLost = var64,
			maximumCharacterLimit = if fFlagFriendsChatEnforceInputCharacterLimitModule then messageCharacterLimitModule else nil
		})
	})
end