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
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView
local useChatInputBarSettingsModule = require(parent.ExpChatIntegration.useChatInputBarSettings)
local useChatInputBarOnFocusModule = require(parent.ExpChatIntegration.useChatInputBarOnFocus)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local name = expChatSharedModule.Logger:new(script.Name)
local t = { commands = nil, emojis = true }

local function isSendResponseAccepted(p0) --[[ line: 86 ]]
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

return function(p1) --[[ line: 106 | named "FriendsChatInputBarHost" ]]
	-- upvalues: foundationModule (ref), expChatConversationListAdapterModule (ref), useChatTimeoutDetailsFromHydrationModule (ref), signalsReactModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useChatInputBarSettingsModule (ref), useInExperienceLocalization (ref), chatUIPrimitivesModule (ref), inputTypeConstants (ref), getConversationInputPlaceholderModule (ref), userInputService (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useInterpolatedClientSettingsModule (ref), useChatInputBarOnFocusModule (ref), getFriendsChatNavigationStoreModule (ref), useConsumeFocusInputBarRequestModule (ref), interventionTreatmentShownSignal (ref), constants (ref), playersService (ref), name (ref), createConversationFromFriendPlaceholderModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), httpService (ref), serializeParticipantIdsForTelemetryModule (ref), appChatNetworkingModule (ref), chatConversationTelemetryEventsModule (ref), getConversationMessageSentInfoModule (ref), isSendResponseAccepted (ref), signalsExperimentalModule (ref), ingestNewerMessagesModule (ref), sendMessageErrorModule (ref), chatInputBoxDisabledPressedSignal (ref), chatInputBoxDisabledModule (ref), resolveFadeModule (ref), layoutConstantsModule (ref), chatInputBarView (ref), t (ref)
	local var37 = foundationModule.Hooks.useTokens()
	local conversationId = p1.conversationId
	local var38 = expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var39 = conversationId ~= nil and (conversationId ~= "" and not var38)
	local var40 = signalsReactModule.useSignalState(useChatTimeoutDetailsFromHydrationModule({
		conversationId = if var39 then conversationId else nil,
		conversationModerationType = p1.conversationModerationType
	}))
	local isTimedOut = var40.isTimedOut
	local var41 = useChatWindowSettingsModule()
	local var42 = reactModule.useMemo(function() --[[ line: 122 ]]
		-- upvalues: var41 (ref)
		return {
			BackgroundColor3 = var41.ChatWindowBackgroundColor3,
			BackgroundTransparency = var41.ChatWindowBackgroundTransparency
		}
	end, { var41 })
	local var43 = not isTimedOut
	local var44 = useChatInputBarSettingsModule()
	local var45 = reactModule.useMemo(function() --[[ line: 133 ]]
		-- upvalues: p1 (ref), var44 (ref)
		return if p1.isSpatialUIEnabled and var44 and var44.SpatialPanelTextSize then var44.SpatialPanelTextSize elseif var44 then var44.TextSize else nil
	end, { var44, p1.isSpatialUIEnabled })
	local var46 = useInExperienceLocalization()
	local var47 = chatUIPrimitivesModule.Hooks.useLastInputGroup()
	local var48 = var47 == inputTypeConstants.Touch
	local var49 = var47 == inputTypeConstants.Gamepad
	local var50 = if var44 and var44.KeyboardKeyCode then var44.KeyboardKeyCode else Enum.KeyCode.Slash
	local var51 = reactModule.useMemo(function() --[[ line: 155 ]]
		-- upvalues: getConversationInputPlaceholderModule (copy), var49 (ref), var48 (ref), var50 (ref), var46 (ref), userInputService (copy)
		return getConversationInputPlaceholderModule({ isGamepad = var49, isTouch = var48 }, var50, var46, userInputService)
	end, { var49, var48, var50, var46 })
	local var52 = var46("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
	local var53 = useLocalization({ timeoutDisabled = "Feature.Chat.Label.ChatDisabled" })
	local var54 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var55 = reactModule.useRef(var54.emit)
	var55.current = var54.emit
	local var56 = useInterpolatedClientSettingsModule(p1.chatWindowSettings or var42)
	local var57 = useChatInputBarOnFocusModule()
	local var58 = getFriendsChatNavigationStoreModule(false)
	local var59 = reactModule.useCallback(function() --[[ line: 183 ]]
		-- upvalues: var58 (ref), var57 (ref)
		var58.setInputBarFocused(true)
		var57.onFocusGained()
	end, { var57.onFocusGained, var58 })
	local var60 = reactModule.useCallback(function() --[[ line: 187 ]]
		-- upvalues: var58 (ref), var57 (ref)
		var58.setInputBarFocused(false)
		var57.onFocusLost()
	end, { var57.onFocusLost, var58 })
	local var61 = chatUIPrimitivesModule.Hooks.useFocusInputBar()
	local ref = var61.ref
	useConsumeFocusInputBarRequestModule(var61.focus)
	reactModule.useEffect(function() --[[ line: 203 ]]
		-- upvalues: var60 (ref)
		return function() --[[ line: 204 ]]
			-- upvalues: var60 (copy)
			var60()
		end
	end, { var60 })
	reactModule.useEffect(function() --[[ line: 209 ]]
		-- upvalues: interventionTreatmentShownSignal (copy), constants (copy), ref (ref)
		local var63 = interventionTreatmentShownSignal:connect(function(p2) --[[ line: 210 ]]
			-- upvalues: constants (copy), ref (copy)
			if p2 == constants.TreatmentType.PartyChatNudgeDialog or p2 == constants.TreatmentType.PartyChatTimeoutDialog then
				local current = ref.current
				
				if current then
					current:ReleaseFocus()
				end
			end
		end)
		
		return function() --[[ line: 221 ]]
			-- upvalues: var63 (ref)
			var63:disconnect()
		end
	end, {})
	local var45_1 = var45 or var37.Typography.CaptionMedium.FontSize
	
	return reactModule.createElement("Frame", {
		Name = "friendsChatInput",
		LayoutOrder = p1.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var56.BackgroundColor3 or var41.ChatWindowBackgroundColor3,
		BackgroundTransparency = resolveFadeModule(var56.BackgroundTransparency, p1.transparencyValue),
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
			onSend = reactModule.useCallback(function(p3) --[[ line: 227 ]]
				-- upvalues: isTimedOut (ref), conversationId (ref), playersService (copy), var38 (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (ref), var39 (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var55 (ref), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
				if isTimedOut then
					return
				end
				task.spawn(function() --[[ line: 234 ]]
					-- upvalues: p3 (ref), conversationId (copy), playersService (copy), var38 (copy), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (copy), var39 (copy), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var55 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
					local var64 = if typeof(p3) == "string" then p3 else ""
					
					if var64 == "" then return end
					local conversationId_1 = conversationId or ""
					local localPlayer = playersService.LocalPlayer
					
					if var38 and conversationId ~= nil then
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId, false)
						
						if conversation == nil then
							name:warning(`Unable to find friend placeholder {conversationId}`)
							
							return
						end
						local var67 = createConversationFromFriendPlaceholderModule(conversation, if localPlayer then localPlayer.UserId else 0)
						
						if var67 == nil then
							name:warning(`Unable to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						local var68, var69 = var67:await()
						
						if not var68 or var69 == nil then
							name:warning(`Failed to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						conversationId_1 = var69.id
						
						if p1.onFriendPlaceholderConversationCreated ~= nil then
							p1.onFriendPlaceholderConversationCreated(conversationId_1)
						end
					elseif var39 then
						local var70 = getConversationMessageStoreModule(false)
						local var71 = getConversationMessageListStoreModule(false)
						local text = "sending-friends-message-" .. httpService:GenerateGUID(false)
						var70.upsertMessages({
							[text] = {
								type = "user",
								status = "Pending",
								id = text,
								content = var64,
								created_at = tostring(os.time()),
								sender_user_id = if localPlayer then localPlayer.UserId else nil,
								conversationId = conversationId_1
							}
						})
						var71.prependMessages(conversationId_1, { text })
						local repeated = string.rep("#", utf8.len(var64) or #var64)
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId_1, false)
						local var75 = serializeParticipantIdsForTelemetryModule(if conversation then conversation.participants else nil, if localPlayer then localPlayer.UserId else 0)
						appChatNetworkingModule.http.SendChatTextMessage(nil, conversationId_1, var64):andThen(function(p5) --[[ line: 303 ]]
							-- upvalues: var55 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), var75 (ref), isSendResponseAccepted (copy), var70 (ref), text (ref), repeated (ref), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), conversationId_1 (write), expChatConversationListAdapterModule (copy), localPlayer (ref), var71 (ref)
							var55.current(chatConversationTelemetryEventsModule.ConversationMessageSent, getConversationMessageSentInfoModule(p5, var75))
							
							if isSendResponseAccepted(p5) then
								local messages = p5.responseBody.messages or {}
								signalsExperimentalModule.batch(function() --[[ line: 320 ]]
									-- upvalues: ingestNewerMessagesModule (copy), conversationId_1 (copy), messages (ref), var70 (copy), text (copy), repeated (copy), expChatConversationListAdapterModule (copy), localPlayer (copy), var71 (copy)
									if #ingestNewerMessagesModule(conversationId_1, messages) == 0 then
										var70.updateMessage(text, { status = "Failed", content = repeated })
										
										return
									end
									expChatConversationListAdapterModule.updateConversationPreviewFromMessages(conversationId_1, messages, {
										hasUnreadMessages = false,
										localUserId = if localPlayer then localPlayer.UserId else 0
									})
									var71.removeMessage(conversationId_1, text)
									var70.removeMessage(text)
								end)
								
								return
							end
							var70.updateMessage(text, { status = "Failed", content = repeated })
						end):catch(function(p4) --[[ line: 345 ]]
							-- upvalues: name (copy), conversationId_1 (write), var55 (copy), chatConversationTelemetryEventsModule (copy), sendMessageErrorModule (copy), var75 (ref), var70 (ref), text (ref), repeated (ref)
							name:warning(`Failed to send message to {conversationId_1}: {tostring(p4)}`)
							var55.current(chatConversationTelemetryEventsModule.ConversationMessageSent, {
								messageSentResult = sendMessageErrorModule.OtherFailure,
								recipientIds = var75
							})
							var70.updateMessage(text, { status = "Failed", content = repeated })
						end)
						
						return
					else
					end
				end)
			end, {
				conversationId,
				var39,
				var38,
				isTimedOut,
				p1.onFriendPlaceholderConversationCreated
			}),
			canLocalUserChat = var43 or false,
			disabledOverlay = if isTimedOut then reactModule.createElement(foundationModule.View, {
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				padding = {
					top = UDim.new(0, var45_1 / 2),
					bottom = UDim.new(0, var45_1 / 2),
					left = UDim.new(0, var37.Padding.Large),
					right = UDim.new(0, var37.Padding.XSmall)
				}
			}, {
				TimeoutContent = reactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					ZIndex = 5,
					GroupTransparency = p1.transparencyValue or 0,
					Size = UDim2.new(1, 0, 0, math.max(var37.Typography.CaptionMedium.LineHeight, var45_1))
				}, {
					DisabledInput = reactModule.createElement(chatInputBoxDisabledModule, {
						bodyText = var53.timeoutDisabled,
						contentSize = var45_1,
						endTimestamp = var40.timeoutEndTimestamp,
						font = Enum.Font.BuilderSans,
						onActivated = reactModule.useCallback(function() --[[ line: 370 ]]
							-- upvalues: chatInputBoxDisabledPressedSignal (copy), var40 (ref)
							chatInputBoxDisabledPressedSignal:fire({
								endTimestamp = var40.timeoutEndTimestamp,
								decisionEventId = var40.decisionEventId,
								duration = var40.duration
							})
						end, {
							var40.timeoutEndTimestamp,
							var40.decisionEventId,
							var40.duration
						}),
						contentVerticalAlignment = Enum.VerticalAlignment.Center
					})
				})
			}) else nil,
			textSize = var45,
			textBoxRef = ref,
			placeholderText = var51,
			disabledChatPlaceholderText = var52,
			autocomplete = t,
			transparencyValue = p1.transparencyValue,
			onFocusGained = var59,
			onFocusLost = var60
		})
	})
end