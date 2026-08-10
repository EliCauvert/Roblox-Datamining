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

local function _(p0, p1) --[[ line: 88 | named "resolveFade" ]]
	return if type(p1) == "number" then p0 + p1 * (1 - p0) elseif p1 == nil then p0 else p1:map(function(p2) --[[ line: 92 ]]
		-- upvalues: p0 (ref)
		return p0 + p2 * (1 - p0)
	end)
end

local function isSendResponseAccepted(p3) --[[ line: 99 ]]
	if p3 == nil or p3.responseBody == nil then
		return false
	elseif p3.responseCode ~= nil and p3.responseCode ~= 200 then
		return false
	elseif p3.StatusCode ~= nil and p3.StatusCode ~= 200 then
		return false
	end
	local messages = p3.responseBody.messages
	
	if messages == nil or #messages == 0 then
		return false
	end
	local status = messages[1].status
	
	return if status ~= nil then if status ~= "" then status == "success" else true else true
end

return function(p4) --[[ line: 119 | named "FriendsChatInputBarHost" ]]
	-- upvalues: foundationModule (ref), expChatConversationListAdapterModule (ref), useChatTimeoutDetailsFromHydrationModule (ref), signalsReactModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useChatInputBarSettingsModule (ref), useInExperienceLocalization (ref), chatUIPrimitivesModule (ref), inputTypeConstants (ref), getConversationInputPlaceholderModule (ref), userInputService (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useInterpolatedClientSettingsModule (ref), useChatInputBarOnFocusModule (ref), getFriendsChatNavigationStoreModule (ref), useConsumeFocusInputBarRequestModule (ref), interventionTreatmentShownSignal (ref), constants (ref), playersService (ref), name (ref), createConversationFromFriendPlaceholderModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), httpService (ref), serializeParticipantIdsForTelemetryModule (ref), appChatNetworkingModule (ref), chatConversationTelemetryEventsModule (ref), getConversationMessageSentInfoModule (ref), isSendResponseAccepted (ref), signalsExperimentalModule (ref), ingestNewerMessagesModule (ref), sendMessageErrorModule (ref), chatInputBoxDisabledPressedSignal (ref), chatInputBoxDisabledModule (ref), layoutConstantsModule (ref), chatInputBarView (ref), t (ref)
	local var36 = foundationModule.Hooks.useTokens()
	local conversationId = p4.conversationId
	local var37 = expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var38 = conversationId ~= nil and (conversationId ~= "" and not var37)
	local var39 = signalsReactModule.useSignalState(useChatTimeoutDetailsFromHydrationModule({
		conversationId = if var38 then conversationId else nil,
		conversationModerationType = p4.conversationModerationType
	}))
	local isTimedOut = var39.isTimedOut
	local var40 = useChatWindowSettingsModule()
	local var41 = reactModule.useMemo(function() --[[ line: 135 ]]
		-- upvalues: var40 (ref)
		return {
			BackgroundColor3 = var40.ChatWindowBackgroundColor3,
			BackgroundTransparency = var40.ChatWindowBackgroundTransparency
		}
	end, { var40 })
	local var42 = not isTimedOut
	local var43 = useChatInputBarSettingsModule()
	local var44 = reactModule.useMemo(function() --[[ line: 146 ]]
		-- upvalues: p4 (ref), var43 (ref)
		return if p4.isSpatialUIEnabled and var43 and var43.SpatialPanelTextSize then var43.SpatialPanelTextSize elseif var43 then var43.TextSize else nil
	end, { var43, p4.isSpatialUIEnabled })
	local var45 = useInExperienceLocalization()
	local var46 = chatUIPrimitivesModule.Hooks.useLastInputGroup()
	local var47 = var46 == inputTypeConstants.Touch
	local var48 = var46 == inputTypeConstants.Gamepad
	local var49 = if var43 and var43.KeyboardKeyCode then var43.KeyboardKeyCode else Enum.KeyCode.Slash
	local var50 = reactModule.useMemo(function() --[[ line: 168 ]]
		-- upvalues: getConversationInputPlaceholderModule (copy), var48 (ref), var47 (ref), var49 (ref), var45 (ref), userInputService (copy)
		return getConversationInputPlaceholderModule({ isGamepad = var48, isTouch = var47 }, var49, var45, userInputService)
	end, { var48, var47, var49, var45 })
	local var51 = var45("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
	local var52 = useLocalization({ timeoutDisabled = "Feature.Chat.Label.ChatDisabled" })
	local var53 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var54 = reactModule.useRef(var53.emit)
	var54.current = var53.emit
	local var55 = useInterpolatedClientSettingsModule(p4.chatWindowSettings or var41)
	local var56 = useChatInputBarOnFocusModule()
	local var57 = getFriendsChatNavigationStoreModule(false)
	local var58 = reactModule.useCallback(function() --[[ line: 196 ]]
		-- upvalues: var57 (ref), var56 (ref)
		var57.setInputBarFocused(true)
		var56.onFocusGained()
	end, { var56.onFocusGained, var57 })
	local var59 = reactModule.useCallback(function() --[[ line: 200 ]]
		-- upvalues: var57 (ref), var56 (ref)
		var57.setInputBarFocused(false)
		var56.onFocusLost()
	end, { var56.onFocusLost, var57 })
	local var60 = chatUIPrimitivesModule.Hooks.useFocusInputBar()
	local ref = var60.ref
	useConsumeFocusInputBarRequestModule(var60.focus)
	reactModule.useEffect(function() --[[ line: 216 ]]
		-- upvalues: var59 (ref)
		return function() --[[ line: 217 ]]
			-- upvalues: var59 (copy)
			var59()
		end
	end, { var59 })
	reactModule.useEffect(function() --[[ line: 222 ]]
		-- upvalues: interventionTreatmentShownSignal (copy), constants (copy), ref (ref)
		local var66 = interventionTreatmentShownSignal:connect(function(p5) --[[ line: 223 ]]
			-- upvalues: constants (copy), ref (copy)
			if p5 == constants.TreatmentType.PartyChatNudgeDialog or p5 == constants.TreatmentType.PartyChatTimeoutDialog then
				local current = ref.current
				
				if current then
					current:ReleaseFocus()
				end
			end
		end)
		
		return function() --[[ line: 234 ]]
			-- upvalues: var66 (ref)
			var66:disconnect()
		end
	end, {})
	local var61 = reactModule.useCallback(function(p6) --[[ line: 240 ]]
		-- upvalues: isTimedOut (ref), conversationId (ref), playersService (copy), var37 (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p4 (ref), var38 (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var54 (ref), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
		if isTimedOut then
			return
		end
		task.spawn(function() --[[ line: 247 ]]
			-- upvalues: p6 (ref), conversationId (copy), playersService (copy), var37 (copy), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p4 (copy), var38 (copy), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var54 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
			local var67 = if typeof(p6) == "string" then p6 else ""
			
			if var67 == "" then return end
			local conversationId_1 = conversationId or ""
			local localPlayer = playersService.LocalPlayer
			
			if var37 and conversationId ~= nil then
				local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId, false)
				
				if conversation == nil then
					name:warning(`Unable to find friend placeholder {conversationId}`)
					
					return
				end
				local var70 = createConversationFromFriendPlaceholderModule(conversation, if localPlayer then localPlayer.UserId else 0)
				
				if var70 == nil then
					name:warning(`Unable to create conversation for friend placeholder {conversationId}`)
					
					return
				end
				local var71, var72 = var70:await()
				
				if not var71 or var72 == nil then
					name:warning(`Failed to create conversation for friend placeholder {conversationId}`)
					
					return
				end
				conversationId_1 = var72.id
				
				if p4.onFriendPlaceholderConversationCreated ~= nil then
					p4.onFriendPlaceholderConversationCreated(conversationId_1)
				end
			elseif var38 then
				local var73 = getConversationMessageStoreModule(false)
				local var74 = getConversationMessageListStoreModule(false)
				local text = "sending-friends-message-" .. httpService:GenerateGUID(false)
				var73.upsertMessages({
					[text] = {
						type = "user",
						status = "Pending",
						id = text,
						content = var67,
						created_at = tostring(os.time()),
						sender_user_id = if localPlayer then localPlayer.UserId else nil,
						conversationId = conversationId_1
					}
				})
				var74.prependMessages(conversationId_1, { text })
				local repeated = string.rep("#", utf8.len(var67) or #var67)
				local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId_1, false)
				local var78 = serializeParticipantIdsForTelemetryModule(if conversation then conversation.participants else nil, if localPlayer then localPlayer.UserId else 0)
				appChatNetworkingModule.http.SendChatTextMessage(nil, conversationId_1, var67):andThen(function(p8) --[[ line: 316 ]]
					-- upvalues: var54 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), var78 (ref), isSendResponseAccepted (copy), var73 (ref), text (ref), repeated (ref), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), conversationId_1 (write), expChatConversationListAdapterModule (copy), localPlayer (ref), var74 (ref)
					var54.current(chatConversationTelemetryEventsModule.ConversationMessageSent, getConversationMessageSentInfoModule(p8, var78))
					
					if isSendResponseAccepted(p8) then
						local messages = p8.responseBody.messages or {}
						signalsExperimentalModule.batch(function() --[[ line: 333 ]]
							-- upvalues: ingestNewerMessagesModule (copy), conversationId_1 (copy), messages (ref), var73 (copy), text (copy), repeated (copy), expChatConversationListAdapterModule (copy), localPlayer (copy), var74 (copy)
							if #ingestNewerMessagesModule(conversationId_1, messages) == 0 then
								var73.updateMessage(text, { status = "Failed", content = repeated })
								
								return
							end
							expChatConversationListAdapterModule.updateConversationPreviewFromMessages(conversationId_1, messages, {
								hasUnreadMessages = false,
								localUserId = if localPlayer then localPlayer.UserId else 0
							})
							var74.removeMessage(conversationId_1, text)
							var73.removeMessage(text)
						end)
						
						return
					end
					var73.updateMessage(text, { status = "Failed", content = repeated })
				end):catch(function(p7) --[[ line: 358 ]]
					-- upvalues: name (copy), conversationId_1 (write), var54 (copy), chatConversationTelemetryEventsModule (copy), sendMessageErrorModule (copy), var78 (ref), var73 (ref), text (ref), repeated (ref)
					name:warning(`Failed to send message to {conversationId_1}: {tostring(p7)}`)
					var54.current(chatConversationTelemetryEventsModule.ConversationMessageSent, {
						messageSentResult = sendMessageErrorModule.OtherFailure,
						recipientIds = var78
					})
					var73.updateMessage(text, { status = "Failed", content = repeated })
				end)
				
				return
			else
			end
		end)
	end, {
		conversationId,
		var38,
		var37,
		isTimedOut,
		p4.onFriendPlaceholderConversationCreated
	})
	local var44_1 = var44 or var36.Typography.CaptionMedium.FontSize
	local var63 = if isTimedOut then reactModule.createElement(foundationModule.View, {
		tag = "auto-y",
		Size = UDim2.fromScale(1, 0),
		padding = {
			top = UDim.new(0, var44_1 / 2),
			bottom = UDim.new(0, var44_1 / 2),
			left = UDim.new(0, var36.Padding.Large),
			right = UDim.new(0, var36.Padding.XSmall)
		}
	}, {
		TimeoutContent = reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			GroupTransparency = p4.transparencyValue or 0,
			Size = UDim2.new(1, 0, 0, math.max(var36.Typography.CaptionMedium.LineHeight, var44_1))
		}, {
			DisabledInput = reactModule.createElement(chatInputBoxDisabledModule, {
				bodyText = var52.timeoutDisabled,
				contentSize = var44_1,
				endTimestamp = var39.timeoutEndTimestamp,
				font = Enum.Font.BuilderSans,
				onActivated = reactModule.useCallback(function() --[[ line: 383 ]]
					-- upvalues: chatInputBoxDisabledPressedSignal (copy), var39 (ref)
					chatInputBoxDisabledPressedSignal:fire({
						endTimestamp = var39.timeoutEndTimestamp,
						decisionEventId = var39.decisionEventId,
						duration = var39.duration
					})
				end, {
					var39.timeoutEndTimestamp,
					var39.decisionEventId,
					var39.duration
				}),
				contentVerticalAlignment = Enum.VerticalAlignment.Center
			})
		})
	}) else nil
	local createElement = reactModule.createElement
	local var64 = "Frame"
	local t_1 = {
		Name = "friendsChatInput",
		LayoutOrder = p4.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var55.BackgroundColor3 or var40.ChatWindowBackgroundColor3
	}
	local backgroundTransparency = var55.BackgroundTransparency
	local transparencyValue = p4.transparencyValue
	t_1.BackgroundTransparency = if type(transparencyValue) == "number" then backgroundTransparency + transparencyValue * (1 - backgroundTransparency) elseif transparencyValue ~= nil then backgroundTransparency else transparencyValue:map(function(p9) --[[ line: 92 ]]
		-- upvalues: backgroundTransparency (ref)
		return backgroundTransparency + p9 * (1 - backgroundTransparency)
	end)
	t_1.Active = true
	t_1.BorderSizePixel = 0
	t_1.ClipsDescendants = true
	t_1.Size = UDim2.fromScale(1, 0)
	t_1[reactModule.Event.MouseEnter] = p4.onHovered
	t_1[reactModule.Event.MouseLeave] = p4.onUnhovered
	
	return createElement(var64, t_1, {
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
			onSend = var61,
			canLocalUserChat = var42 or false,
			disabledOverlay = var63,
			textSize = var44,
			textBoxRef = ref,
			placeholderText = var50,
			disabledChatPlaceholderText = var51,
			autocomplete = t,
			transparencyValue = p4.transparencyValue,
			onFocusGained = var58,
			onFocusLost = var59
		})
	})
end