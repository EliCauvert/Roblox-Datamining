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
local serializeParticipantIdsForTelemetryModule = require(script.Parent.Parent.Telemetry.App.serializeParticipantIdsForTelemetry)
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView
local useChatInputBarSettingsModule = require(parent.ExpChatIntegration.useChatInputBarSettings)
local useChatInputBarOnFocusModule = require(parent.ExpChatIntegration.useChatInputBarOnFocus)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local name = expChatSharedModule.Logger:new(script.Name)
local t = { commands = nil, emojis = true }

local function isSendResponseAccepted(p0) --[[ line: 89 ]]
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

return function(p1) --[[ line: 109 | named "FriendsChatInputBarHost" ]]
	-- upvalues: foundationModule (ref), expChatConversationListAdapterModule (ref), useChatTimeoutDetailsFromHydrationModule (ref), signalsReactModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useChatInputBarSettingsModule (ref), useInExperienceLocalization (ref), chatUIPrimitivesModule (ref), inputTypeConstants (ref), getConversationInputPlaceholderModule (ref), userInputService (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useInterpolatedClientSettingsModule (ref), useChatInputBarOnFocusModule (ref), getFriendsChatNavigationStoreModule (ref), useConsumeFocusInputBarRequestModule (ref), interventionTreatmentShownSignal (ref), constants (ref), playersService (ref), name (ref), createConversationFromFriendPlaceholderModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), httpService (ref), serializeParticipantIdsForTelemetryModule (ref), appChatNetworkingModule (ref), chatConversationTelemetryEventsModule (ref), getConversationMessageSentInfoModule (ref), isSendResponseAccepted (ref), signalsExperimentalModule (ref), ingestNewerMessagesModule (ref), sendMessageErrorModule (ref), chatInputBoxDisabledPressedSignal (ref), chatInputBoxDisabledModule (ref), resolveFadeModule (ref), layoutConstantsModule (ref), chatInputBarView (ref), t (ref), fFlagFriendsChatEnforceInputCharacterLimitModule (ref), messageCharacterLimitModule (ref)
	local var39 = foundationModule.Hooks.useTokens()
	local conversationId = p1.conversationId
	local var40 = expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var41 = conversationId ~= nil and (conversationId ~= "" and not var40)
	local var42 = signalsReactModule.useSignalState(useChatTimeoutDetailsFromHydrationModule({
		conversationId = if var41 then conversationId else nil,
		conversationModerationType = p1.conversationModerationType
	}))
	local isTimedOut = var42.isTimedOut
	local var43 = useChatWindowSettingsModule()
	local var44 = reactModule.useMemo(function() --[[ line: 125 ]]
		-- upvalues: var43 (ref)
		return {
			BackgroundColor3 = var43.ChatWindowBackgroundColor3,
			BackgroundTransparency = var43.ChatWindowBackgroundTransparency
		}
	end, { var43 })
	local var45 = not isTimedOut
	local var46 = useChatInputBarSettingsModule()
	local var47 = reactModule.useMemo(function() --[[ line: 136 ]]
		-- upvalues: p1 (ref), var46 (ref)
		return if p1.isSpatialUIEnabled and var46 and var46.SpatialPanelTextSize then var46.SpatialPanelTextSize elseif var46 then var46.TextSize else nil
	end, { var46, p1.isSpatialUIEnabled })
	local var48 = useInExperienceLocalization()
	local var49 = chatUIPrimitivesModule.Hooks.useLastInputGroup()
	local var50 = var49 == inputTypeConstants.Touch
	local var51 = var49 == inputTypeConstants.Gamepad
	local var52 = if var46 and var46.KeyboardKeyCode then var46.KeyboardKeyCode else Enum.KeyCode.Slash
	local var53 = reactModule.useMemo(function() --[[ line: 158 ]]
		-- upvalues: getConversationInputPlaceholderModule (copy), var51 (ref), var50 (ref), var52 (ref), var48 (ref), userInputService (copy)
		return getConversationInputPlaceholderModule({ isGamepad = var51, isTouch = var50 }, var52, var48, userInputService)
	end, { var51, var50, var52, var48 })
	local var54 = var48("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
	local var55 = useLocalization({ timeoutDisabled = "Feature.Chat.Label.ChatDisabled" })
	local var56 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var57 = reactModule.useRef(var56.emit)
	var57.current = var56.emit
	local var58 = useInterpolatedClientSettingsModule(p1.chatWindowSettings or var44)
	local var59 = useChatInputBarOnFocusModule()
	local var60 = getFriendsChatNavigationStoreModule(false)
	local var61 = reactModule.useCallback(function() --[[ line: 186 ]]
		-- upvalues: var60 (ref), var59 (ref)
		var60.setInputBarFocused(true)
		var59.onFocusGained()
	end, { var59.onFocusGained, var60 })
	local var62 = reactModule.useCallback(function() --[[ line: 190 ]]
		-- upvalues: var60 (ref), var59 (ref)
		var60.setInputBarFocused(false)
		var59.onFocusLost()
	end, { var59.onFocusLost, var60 })
	local var63 = chatUIPrimitivesModule.Hooks.useFocusInputBar()
	local ref = var63.ref
	useConsumeFocusInputBarRequestModule(var63.focus)
	reactModule.useEffect(function() --[[ line: 206 ]]
		-- upvalues: var62 (ref)
		return function() --[[ line: 207 ]]
			-- upvalues: var62 (copy)
			var62()
		end
	end, { var62 })
	reactModule.useEffect(function() --[[ line: 212 ]]
		-- upvalues: interventionTreatmentShownSignal (copy), constants (copy), ref (ref)
		local var65 = interventionTreatmentShownSignal:connect(function(p2) --[[ line: 213 ]]
			-- upvalues: constants (copy), ref (copy)
			if p2 == constants.TreatmentType.PartyChatNudgeDialog or p2 == constants.TreatmentType.PartyChatTimeoutDialog then
				local current = ref.current
				
				if current then
					current:ReleaseFocus()
				end
			end
		end)
		
		return function() --[[ line: 224 ]]
			-- upvalues: var65 (ref)
			var65:disconnect()
		end
	end, {})
	local var47_1 = var47 or var39.Typography.CaptionMedium.FontSize
	
	return reactModule.createElement("Frame", {
		Name = "friendsChatInput",
		LayoutOrder = p1.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var58.BackgroundColor3 or var43.ChatWindowBackgroundColor3,
		BackgroundTransparency = resolveFadeModule(var58.BackgroundTransparency, p1.transparencyValue),
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
			onSend = reactModule.useCallback(function(p3) --[[ line: 230 ]]
				-- upvalues: isTimedOut (ref), conversationId (ref), playersService (copy), var40 (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (ref), var41 (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var57 (ref), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
				if isTimedOut then
					return
				end
				task.spawn(function() --[[ line: 237 ]]
					-- upvalues: p3 (ref), conversationId (copy), playersService (copy), var40 (copy), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (copy), var41 (copy), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var57 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
					local var66 = if typeof(p3) == "string" then p3 else ""
					
					if var66 == "" then return end
					local conversationId_1 = conversationId or ""
					local localPlayer = playersService.LocalPlayer
					
					if var40 and conversationId ~= nil then
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId, false)
						
						if conversation == nil then
							name:warning(`Unable to find friend placeholder {conversationId}`)
							
							return
						end
						local var69 = createConversationFromFriendPlaceholderModule(conversation, if localPlayer then localPlayer.UserId else 0)
						
						if var69 == nil then
							name:warning(`Unable to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						local var70, var71 = var69:await()
						
						if not var70 or var71 == nil then
							name:warning(`Failed to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						conversationId_1 = var71.id
						
						if p1.onFriendPlaceholderConversationCreated ~= nil then
							p1.onFriendPlaceholderConversationCreated(conversationId_1)
						end
					elseif var41 then
						local var72 = getConversationMessageStoreModule(false)
						local var73 = getConversationMessageListStoreModule(false)
						local text = "sending-friends-message-" .. httpService:GenerateGUID(false)
						var72.upsertMessages({
							[text] = {
								type = "user",
								status = "Pending",
								id = text,
								content = var66,
								created_at = tostring(os.time()),
								sender_user_id = if localPlayer then localPlayer.UserId else nil,
								conversationId = conversationId_1
							}
						})
						var73.prependMessages(conversationId_1, { text })
						local repeated = string.rep("#", utf8.len(var66) or #var66)
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId_1, false)
						local var77 = serializeParticipantIdsForTelemetryModule(if conversation then conversation.participants else nil, if localPlayer then localPlayer.UserId else 0)
						appChatNetworkingModule.http.SendChatTextMessage(nil, conversationId_1, var66):andThen(function(p5) --[[ line: 306 ]]
							-- upvalues: var57 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), var77 (ref), isSendResponseAccepted (copy), var72 (ref), text (ref), repeated (ref), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), conversationId_1 (write), expChatConversationListAdapterModule (copy), localPlayer (ref), var73 (ref)
							var57.current(chatConversationTelemetryEventsModule.ConversationMessageSent, getConversationMessageSentInfoModule(p5, var77))
							
							if isSendResponseAccepted(p5) then
								local messages = p5.responseBody.messages or {}
								signalsExperimentalModule.batch(function() --[[ line: 323 ]]
									-- upvalues: ingestNewerMessagesModule (copy), conversationId_1 (copy), messages (ref), var72 (copy), text (copy), repeated (copy), expChatConversationListAdapterModule (copy), localPlayer (copy), var73 (copy)
									if #ingestNewerMessagesModule(conversationId_1, messages) == 0 then
										var72.updateMessage(text, { status = "Failed", content = repeated })
										
										return
									end
									expChatConversationListAdapterModule.updateConversationPreviewFromMessages(conversationId_1, messages, {
										hasUnreadMessages = false,
										localUserId = if localPlayer then localPlayer.UserId else 0
									})
									var73.removeMessage(conversationId_1, text)
									var72.removeMessage(text)
								end)
								
								return
							end
							var72.updateMessage(text, { status = "Failed", content = repeated })
						end):catch(function(p4) --[[ line: 348 ]]
							-- upvalues: name (copy), conversationId_1 (write), var57 (copy), chatConversationTelemetryEventsModule (copy), sendMessageErrorModule (copy), var77 (ref), var72 (ref), text (ref), repeated (ref)
							name:warning(`Failed to send message to {conversationId_1}: {tostring(p4)}`)
							var57.current(chatConversationTelemetryEventsModule.ConversationMessageSent, {
								messageSentResult = sendMessageErrorModule.OtherFailure,
								recipientIds = var77
							})
							var72.updateMessage(text, { status = "Failed", content = repeated })
						end)
						
						return
					else
					end
				end)
			end, {
				conversationId,
				var41,
				var40,
				isTimedOut,
				p1.onFriendPlaceholderConversationCreated
			}),
			canLocalUserChat = var45 or false,
			disabledOverlay = if isTimedOut then reactModule.createElement(foundationModule.View, {
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				padding = {
					top = UDim.new(0, var47_1 / 2),
					bottom = UDim.new(0, var47_1 / 2),
					left = UDim.new(0, var39.Padding.Large),
					right = UDim.new(0, var39.Padding.XSmall)
				}
			}, {
				TimeoutContent = reactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					ZIndex = 5,
					GroupTransparency = p1.transparencyValue or 0,
					Size = UDim2.new(1, 0, 0, math.max(var39.Typography.CaptionMedium.LineHeight, var47_1))
				}, {
					DisabledInput = reactModule.createElement(chatInputBoxDisabledModule, {
						bodyText = var55.timeoutDisabled,
						contentSize = var47_1,
						endTimestamp = var42.timeoutEndTimestamp,
						font = Enum.Font.BuilderSans,
						onActivated = reactModule.useCallback(function() --[[ line: 373 ]]
							-- upvalues: chatInputBoxDisabledPressedSignal (copy), var42 (ref)
							chatInputBoxDisabledPressedSignal:fire({
								endTimestamp = var42.timeoutEndTimestamp,
								decisionEventId = var42.decisionEventId,
								duration = var42.duration
							})
						end, {
							var42.timeoutEndTimestamp,
							var42.decisionEventId,
							var42.duration
						}),
						contentVerticalAlignment = Enum.VerticalAlignment.Center
					})
				})
			}) else nil,
			textSize = var47,
			textBoxRef = ref,
			placeholderText = var53,
			disabledChatPlaceholderText = var54,
			autocomplete = t,
			transparencyValue = p1.transparencyValue,
			onFocusGained = var61,
			onFocusLost = var62,
			maximumCharacterLimit = if fFlagFriendsChatEnforceInputCharacterLimitModule then messageCharacterLimitModule else nil
		})
	})
end