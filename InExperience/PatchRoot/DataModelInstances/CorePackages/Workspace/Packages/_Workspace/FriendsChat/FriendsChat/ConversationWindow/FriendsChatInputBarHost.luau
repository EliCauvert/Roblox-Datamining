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
local inputTypeConstants = require(parent.InputType).InputTypeConstants
local appChatNetworkingModule = require(parent.AppChatNetworking)
local chatInputBoxDisabledModule = require(parent.AppChat.ChatInputBoxDisabled)
local _ = require(parent.AppChat.ConversationChannels)
local createConversationFromFriendPlaceholderModule = require(parent.AppChat.createConversationFromFriendPlaceholder)
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
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)
local useConsumeFocusInputBarRequestModule = require(script.Parent.useConsumeFocusInputBarRequest)
local getConversationInputPlaceholderModule = require(script.Parent.getConversationInputPlaceholder)
local resolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local useInExperienceLocalization = chatUIPrimitivesModule.Hooks.useInExperienceLocalization
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local getConversationMessageSentInfoModule = require(script.Parent.Parent.Telemetry.ChatConversation.getConversationMessageSentInfo)
local serializeParticipantIdsForTelemetryModule = require(script.Parent.Parent.Telemetry.App.serializeParticipantIdsForTelemetry)
local chatAiAgentMessageTransformModule = require(parent.AppChat.ChatAiAgentMessageTransform)
local fFlagChatAiAgentToggle = require(parent.SharedFlags).FFlagChatAiAgentToggle
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView
local useChatInputBarSettingsModule = require(parent.ExpChatIntegration.useChatInputBarSettings)
local useChatInputBarOnFocusModule = require(parent.ExpChatIntegration.useChatInputBarOnFocus)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local name = expChatSharedModule.Logger:new(script.Name)
local t = { commands = nil, emojis = true }

local function isSendResponseAccepted(p0) --[[ line: 90 ]]
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

return function(p1) --[[ line: 110 | named "FriendsChatInputBarHost" ]]
	-- upvalues: foundationModule (ref), expChatConversationListAdapterModule (ref), useChatTimeoutDetailsFromHydrationModule (ref), signalsReactModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useChatInputBarSettingsModule (ref), useInExperienceLocalization (ref), chatUIPrimitivesModule (ref), inputTypeConstants (ref), getConversationInputPlaceholderModule (ref), userInputService (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useInterpolatedClientSettingsModule (ref), useChatInputBarOnFocusModule (ref), getFriendsChatNavigationStoreModule (ref), useConsumeFocusInputBarRequestModule (ref), interventionTreatmentShownSignal (ref), constants (ref), playersService (ref), name (ref), createConversationFromFriendPlaceholderModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), httpService (ref), serializeParticipantIdsForTelemetryModule (ref), fFlagChatAiAgentToggle (ref), chatAiAgentMessageTransformModule (ref), appChatNetworkingModule (ref), chatConversationTelemetryEventsModule (ref), getConversationMessageSentInfoModule (ref), isSendResponseAccepted (ref), signalsExperimentalModule (ref), ingestNewerMessagesModule (ref), sendMessageErrorModule (ref), chatInputBoxDisabledPressedSignal (ref), chatInputBoxDisabledModule (ref), resolveFadeModule (ref), layoutConstantsModule (ref), chatInputBarView (ref), t (ref)
	local var38 = foundationModule.Hooks.useTokens()
	local conversationId = p1.conversationId
	local var39 = expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var40 = conversationId ~= nil and (conversationId ~= "" and not var39)
	local var41 = signalsReactModule.useSignalState(useChatTimeoutDetailsFromHydrationModule({
		conversationId = if var40 then conversationId else nil,
		conversationModerationType = p1.conversationModerationType
	}))
	local isTimedOut = var41.isTimedOut
	local var42 = useChatWindowSettingsModule()
	local var43 = reactModule.useMemo(function() --[[ line: 126 ]]
		-- upvalues: var42 (ref)
		return {
			BackgroundColor3 = var42.ChatWindowBackgroundColor3,
			BackgroundTransparency = var42.ChatWindowBackgroundTransparency
		}
	end, { var42 })
	local var44 = not isTimedOut
	local var45 = useChatInputBarSettingsModule()
	local var46 = reactModule.useMemo(function() --[[ line: 137 ]]
		-- upvalues: p1 (ref), var45 (ref)
		return if p1.isSpatialUIEnabled and var45 and var45.SpatialPanelTextSize then var45.SpatialPanelTextSize elseif var45 then var45.TextSize else nil
	end, { var45, p1.isSpatialUIEnabled })
	local var47 = useInExperienceLocalization()
	local var48 = chatUIPrimitivesModule.Hooks.useLastInputGroup()
	local var49 = var48 == inputTypeConstants.Touch
	local var50 = var48 == inputTypeConstants.Gamepad
	local var51 = if var45 and var45.KeyboardKeyCode then var45.KeyboardKeyCode else Enum.KeyCode.Slash
	local var52 = reactModule.useMemo(function() --[[ line: 159 ]]
		-- upvalues: getConversationInputPlaceholderModule (copy), var50 (ref), var49 (ref), var51 (ref), var47 (ref), userInputService (copy)
		return getConversationInputPlaceholderModule({ isGamepad = var50, isTouch = var49 }, var51, var47, userInputService)
	end, { var50, var49, var51, var47 })
	local var53 = var47("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
	local var54 = useLocalization({ timeoutDisabled = "Feature.Chat.Label.ChatDisabled" })
	local var55 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var56 = reactModule.useRef(var55.emit)
	var56.current = var55.emit
	local var57 = useInterpolatedClientSettingsModule(p1.chatWindowSettings or var43)
	local var58 = useChatInputBarOnFocusModule()
	local var59 = getFriendsChatNavigationStoreModule(false)
	local var60 = reactModule.useCallback(function() --[[ line: 187 ]]
		-- upvalues: var59 (ref), var58 (ref)
		var59.setInputBarFocused(true)
		var58.onFocusGained()
	end, { var58.onFocusGained, var59 })
	local var61 = reactModule.useCallback(function() --[[ line: 191 ]]
		-- upvalues: var59 (ref), var58 (ref)
		var59.setInputBarFocused(false)
		var58.onFocusLost()
	end, { var58.onFocusLost, var59 })
	local var62 = chatUIPrimitivesModule.Hooks.useFocusInputBar()
	local ref = var62.ref
	useConsumeFocusInputBarRequestModule(var62.focus)
	reactModule.useEffect(function() --[[ line: 207 ]]
		-- upvalues: var61 (ref)
		return function() --[[ line: 208 ]]
			-- upvalues: var61 (copy)
			var61()
		end
	end, { var61 })
	reactModule.useEffect(function() --[[ line: 213 ]]
		-- upvalues: interventionTreatmentShownSignal (copy), constants (copy), ref (ref)
		local var64 = interventionTreatmentShownSignal:connect(function(p2) --[[ line: 214 ]]
			-- upvalues: constants (copy), ref (copy)
			if p2 == constants.TreatmentType.PartyChatNudgeDialog or p2 == constants.TreatmentType.PartyChatTimeoutDialog then
				local current = ref.current
				
				if current then
					current:ReleaseFocus()
				end
			end
		end)
		
		return function() --[[ line: 225 ]]
			-- upvalues: var64 (ref)
			var64:disconnect()
		end
	end, {})
	local var46_1 = var46 or var38.Typography.CaptionMedium.FontSize
	
	return reactModule.createElement("Frame", {
		Name = "friendsChatInput",
		LayoutOrder = p1.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var57.BackgroundColor3 or var42.ChatWindowBackgroundColor3,
		BackgroundTransparency = resolveFadeModule(var57.BackgroundTransparency, p1.transparencyValue),
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
			onSend = reactModule.useCallback(function(p3) --[[ line: 231 ]]
				-- upvalues: isTimedOut (ref), conversationId (ref), playersService (copy), var39 (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (ref), var40 (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), fFlagChatAiAgentToggle (copy), chatAiAgentMessageTransformModule (copy), appChatNetworkingModule (copy), var56 (ref), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
				if isTimedOut then
					return
				end
				task.spawn(function() --[[ line: 238 ]]
					-- upvalues: p3 (ref), conversationId (copy), playersService (copy), var39 (copy), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (copy), var40 (copy), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), fFlagChatAiAgentToggle (copy), chatAiAgentMessageTransformModule (copy), appChatNetworkingModule (copy), var56 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
					local var65 = if typeof(p3) == "string" then p3 else ""
					
					if var65 == "" then return end
					local conversationId_1 = conversationId or ""
					local localPlayer = playersService.LocalPlayer
					
					if var39 and conversationId ~= nil then
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId, false)
						
						if conversation == nil then
							name:warning(`Unable to find friend placeholder {conversationId}`)
							
							return
						end
						local var68 = createConversationFromFriendPlaceholderModule(conversation, if localPlayer then localPlayer.UserId else 0)
						
						if var68 == nil then
							name:warning(`Unable to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						local var69, var70 = var68:await()
						
						if not var69 or var70 == nil then
							name:warning(`Failed to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						conversationId_1 = var70.id
						
						if p1.onFriendPlaceholderConversationCreated ~= nil then
							p1.onFriendPlaceholderConversationCreated(conversationId_1)
						end
					elseif var40 then
						local var71 = getConversationMessageStoreModule(false)
						local var72 = getConversationMessageListStoreModule(false)
						local text = "sending-friends-message-" .. httpService:GenerateGUID(false)
						var71.upsertMessages({
							[text] = {
								type = "user",
								status = "Pending",
								id = text,
								content = var65,
								created_at = tostring(os.time()),
								sender_user_id = if localPlayer then localPlayer.UserId else nil,
								conversationId = conversationId_1
							}
						})
						var72.prependMessages(conversationId_1, { text })
						local repeated = string.rep("#", utf8.len(var65) or #var65)
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId_1, false)
						local var76 = serializeParticipantIdsForTelemetryModule(if conversation then conversation.participants else nil, if localPlayer then localPlayer.UserId else 0)
						appChatNetworkingModule.http.SendChatTextMessage(nil, conversationId_1, if fFlagChatAiAgentToggle then chatAiAgentMessageTransformModule.prependUserSendPrefixForApi(var65) else var65):andThen(function(p5) --[[ line: 311 ]]
							-- upvalues: var56 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), var76 (ref), isSendResponseAccepted (copy), var71 (ref), text (ref), repeated (ref), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), conversationId_1 (write), expChatConversationListAdapterModule (copy), localPlayer (ref), var72 (ref)
							var56.current(chatConversationTelemetryEventsModule.ConversationMessageSent, getConversationMessageSentInfoModule(p5, var76))
							
							if isSendResponseAccepted(p5) then
								local messages = p5.responseBody.messages or {}
								signalsExperimentalModule.batch(function() --[[ line: 328 ]]
									-- upvalues: ingestNewerMessagesModule (copy), conversationId_1 (copy), messages (ref), var71 (copy), text (copy), repeated (copy), expChatConversationListAdapterModule (copy), localPlayer (copy), var72 (copy)
									if #ingestNewerMessagesModule(conversationId_1, messages) == 0 then
										var71.updateMessage(text, { status = "Failed", content = repeated })
										
										return
									end
									expChatConversationListAdapterModule.updateConversationPreviewFromMessages(conversationId_1, messages, {
										hasUnreadMessages = false,
										localUserId = if localPlayer then localPlayer.UserId else 0
									})
									var72.removeMessage(conversationId_1, text)
									var71.removeMessage(text)
								end)
								
								return
							end
							var71.updateMessage(text, { status = "Failed", content = repeated })
						end):catch(function(p4) --[[ line: 353 ]]
							-- upvalues: name (copy), conversationId_1 (write), var56 (copy), chatConversationTelemetryEventsModule (copy), sendMessageErrorModule (copy), var76 (ref), var71 (ref), text (ref), repeated (ref)
							name:warning(`Failed to send message to {conversationId_1}: {tostring(p4)}`)
							var56.current(chatConversationTelemetryEventsModule.ConversationMessageSent, {
								messageSentResult = sendMessageErrorModule.OtherFailure,
								recipientIds = var76
							})
							var71.updateMessage(text, { status = "Failed", content = repeated })
						end)
						
						return
					else
					end
				end)
			end, {
				conversationId,
				var40,
				var39,
				isTimedOut,
				p1.onFriendPlaceholderConversationCreated
			}),
			canLocalUserChat = var44 or false,
			disabledOverlay = if isTimedOut then reactModule.createElement(foundationModule.View, {
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				padding = {
					top = UDim.new(0, var46_1 / 2),
					bottom = UDim.new(0, var46_1 / 2),
					left = UDim.new(0, var38.Padding.Large),
					right = UDim.new(0, var38.Padding.XSmall)
				}
			}, {
				TimeoutContent = reactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					ZIndex = 5,
					GroupTransparency = p1.transparencyValue or 0,
					Size = UDim2.new(1, 0, 0, math.max(var38.Typography.CaptionMedium.LineHeight, var46_1))
				}, {
					DisabledInput = reactModule.createElement(chatInputBoxDisabledModule, {
						bodyText = var54.timeoutDisabled,
						contentSize = var46_1,
						endTimestamp = var41.timeoutEndTimestamp,
						font = Enum.Font.BuilderSans,
						onActivated = reactModule.useCallback(function() --[[ line: 378 ]]
							-- upvalues: chatInputBoxDisabledPressedSignal (copy), var41 (ref)
							chatInputBoxDisabledPressedSignal:fire({
								endTimestamp = var41.timeoutEndTimestamp,
								decisionEventId = var41.decisionEventId,
								duration = var41.duration
							})
						end, {
							var41.timeoutEndTimestamp,
							var41.decisionEventId,
							var41.duration
						}),
						contentVerticalAlignment = Enum.VerticalAlignment.Center
					})
				})
			}) else nil,
			textSize = var46,
			textBoxRef = ref,
			placeholderText = var52,
			disabledChatPlaceholderText = var53,
			autocomplete = t,
			transparencyValue = p1.transparencyValue,
			onFocusGained = var60,
			onFocusLost = var61
		})
	})
end