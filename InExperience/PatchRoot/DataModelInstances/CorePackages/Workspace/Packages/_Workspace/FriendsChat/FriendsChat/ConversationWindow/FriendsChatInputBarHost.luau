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
local fFlagAppChatUniversalFeatureRestriction = require(parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
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

local function isSendResponseAccepted(p1)
	if p1 == nil or p1.responseBody == nil then
		return false
	elseif p1.responseCode ~= nil and p1.responseCode ~= 200 then
		return false
	elseif p1.StatusCode ~= nil and p1.StatusCode ~= 200 then
		return false
	end
	local messages = p1.responseBody.messages
	
	if messages == nil or #messages == 0 then
		return false
	end
	local status = messages[1].status
	
	return if status ~= nil then if status ~= "" then status == "success" else true else true
end

return function(p1)
	-- upvalues: foundationModule (ref), expChatConversationListAdapterModule (ref), useChatTimeoutDetailsFromHydrationModule (ref), signalsReactModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useChatInputBarSettingsModule (ref), useInExperienceLocalization (ref), chatUIPrimitivesModule (ref), inputTypeConstants (ref), getConversationInputPlaceholderModule (ref), userInputService (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useInterpolatedClientSettingsModule (ref), useChatInputBarOnFocusModule (ref), getFriendsChatNavigationStoreModule (ref), useConsumeFocusInputBarRequestModule (ref), interventionTreatmentShownSignal (ref), constants (ref), httpService (ref), fFlagFriendsChatMessageSendPerfTrackingModule (ref), expChatPerfTracker (ref), friendsChatTabNameModule (ref), playersService (ref), name (ref), createConversationFromFriendPlaceholderModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), serializeParticipantIdsForTelemetryModule (ref), appChatNetworkingModule (ref), chatConversationTelemetryEventsModule (ref), getConversationMessageSentInfoModule (ref), isSendResponseAccepted (ref), signalsExperimentalModule (ref), ingestNewerMessagesModule (ref), sendMessageErrorModule (ref), fFlagAppChatUniversalFeatureRestriction (ref), parent (ref), chatInputBoxDisabledPressedSignal (ref), chatInputBoxDisabledModule (ref), resolveFadeModule (ref), layoutConstantsModule (ref), chatInputBarView (ref), t (ref), fFlagFriendsChatEnforceInputCharacterLimitModule (ref), messageCharacterLimitModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local conversationId = p1.conversationId
	local var2 = expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var3 = conversationId ~= nil and (conversationId ~= "" and not var2)
	local var4 = signalsReactModule.useSignalState(useChatTimeoutDetailsFromHydrationModule({
		conversationId = if var3 then conversationId else nil,
		conversationModerationType = p1.conversationModerationType
	}))
	local isTimedOut = var4.isTimedOut
	local var5 = useChatWindowSettingsModule()
	local var6 = reactModule.useMemo(function()
		-- upvalues: var5 (ref)
		return {
			BackgroundColor3 = var5.ChatWindowBackgroundColor3,
			BackgroundTransparency = var5.ChatWindowBackgroundTransparency
		}
	end, { var5 })
	local var7 = not isTimedOut
	local var8 = useChatInputBarSettingsModule()
	local var9 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var8 (ref)
		return if p1.isSpatialUIEnabled and var8 and var8.SpatialPanelTextSize then var8.SpatialPanelTextSize elseif var8 then var8.TextSize else nil
	end, { var8, p1.isSpatialUIEnabled })
	local var10 = useInExperienceLocalization()
	local var11 = chatUIPrimitivesModule.Hooks.useLastInputGroup()
	local var12 = var11 == inputTypeConstants.Touch
	local var13 = var11 == inputTypeConstants.Gamepad
	local var14 = if var8 and var8.KeyboardKeyCode then var8.KeyboardKeyCode else Enum.KeyCode.Slash
	local var15 = reactModule.useMemo(function()
		-- upvalues: getConversationInputPlaceholderModule (copy), var13 (ref), var12 (ref), var14 (ref), var10 (ref), userInputService (copy)
		return getConversationInputPlaceholderModule({ isGamepad = var13, isTouch = var12 }, var14, var10, userInputService)
	end, { var13, var12, var14, var10 })
	local var16 = var10("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
	local var17 = useLocalization({ timeoutDisabled = "Feature.Chat.Label.ChatDisabled" })
	local var18 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var19 = reactModule.useRef(var18.emit)
	var19.current = var18.emit
	local var20 = useInterpolatedClientSettingsModule(p1.chatWindowSettings or var6)
	local var21 = useChatInputBarOnFocusModule()
	local var22 = getFriendsChatNavigationStoreModule(false)
	local var23 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var21 (ref)
		var22.setInputBarFocused(true)
		var21.onFocusGained()
	end, { var21.onFocusGained, var22 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var21 (ref)
		var22.setInputBarFocused(false)
		var21.onFocusLost()
	end, { var21.onFocusLost, var22 })
	local var25 = chatUIPrimitivesModule.Hooks.useFocusInputBar()
	local ref = var25.ref
	useConsumeFocusInputBarRequestModule(var25.focus)
	local var26 = reactModule.useCallback(function()
		-- upvalues: ref (ref)
		local current = ref.current
		
		if current then
			current:ReleaseFocus()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var24 (ref)
		return function()
			-- upvalues: var24 (copy)
			var24()
		end
	end, { var24 })
	reactModule.useEffect(function()
		-- upvalues: interventionTreatmentShownSignal (copy), constants (copy), ref (ref)
		local var27 = interventionTreatmentShownSignal:connect(function(p2)
			-- upvalues: constants (copy), ref (copy)
			if p2 == constants.TreatmentType.PartyChatNudgeDialog or p2 == constants.TreatmentType.PartyChatTimeoutDialog then
				local current = ref.current
				
				if current then
					current:ReleaseFocus()
				end
			end
		end)
		
		return function()
			-- upvalues: var27 (ref)
			var27:disconnect()
		end
	end, {})
	local var27 = var9 or var1.Typography.CaptionMedium.FontSize
	
	return reactModule.createElement("Frame", {
		Name = "friendsChatInput",
		LayoutOrder = p1.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var20.BackgroundColor3 or var5.ChatWindowBackgroundColor3,
		BackgroundTransparency = resolveFadeModule(var20.BackgroundTransparency, p1.transparencyValue),
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
			onSend = reactModule.useCallback(function(p2)
				-- upvalues: isTimedOut (ref), httpService (copy), fFlagFriendsChatMessageSendPerfTrackingModule (copy), expChatPerfTracker (copy), friendsChatTabNameModule (copy), conversationId (ref), playersService (copy), var2 (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (ref), var3 (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var19 (ref), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
				if isTimedOut then return end
				local var28 = if typeof(p2) == "string" then p2 else ""
				
				if var28 == "" then
					return
				end
				local text = "sending-friends-message-" .. httpService:GenerateGUID(false)
				local var29 = if fFlagFriendsChatMessageSendPerfTrackingModule then expChatPerfTracker.start(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = text }, { tabName = friendsChatTabNameModule }) else false
				task.spawn(function()
					-- upvalues: conversationId (copy), playersService (copy), var2 (copy), var29 (write), expChatPerfTracker (copy), text (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p1 (copy), var3 (copy), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), var28 (ref), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var19 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
					local var30
					local conversationId_1 = conversationId or ""
					local localPlayer = playersService.LocalPlayer
					
					if var2 and conversationId ~= nil then
						if var29 then
							expChatPerfTracker.cancel(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = text })
						end
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId, false)
						
						if conversation == nil then
							name:warning(`Unable to find friend placeholder {conversationId}`)
							
							return
						end
						local var31 = createConversationFromFriendPlaceholderModule(conversation, if localPlayer then localPlayer.UserId else 0)
						
						if var31 == nil then
							name:warning(`Unable to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						var30, var76 = var31:await()
						
						if not var30 or var76 == nil then
							name:warning(`Failed to create conversation for friend placeholder {conversationId}`)
							
							return
						end
						conversationId_1 = var76.id
						
						if p1.onFriendPlaceholderConversationCreated ~= nil then
							p1.onFriendPlaceholderConversationCreated(conversationId_1)
						end
					elseif var3 then
						local var32 = getConversationMessageStoreModule(false)
						local var33 = getConversationMessageListStoreModule(false)
						var32.upsertMessages({
							[text] = {
								type = "user",
								status = "Pending",
								id = text,
								content = var28,
								created_at = tostring(os.time()),
								sender_user_id = if localPlayer then localPlayer.UserId else nil,
								conversationId = conversationId_1
							}
						})
						var33.prependMessages(conversationId_1, { text })
						var30 = string.rep("#", utf8.len(var28) or #var28)
						local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId_1, false)
						local var34 = serializeParticipantIdsForTelemetryModule(if conversation then conversation.participants else nil, if localPlayer then localPlayer.UserId else 0)
						appChatNetworkingModule.http.SendChatTextMessage(nil, conversationId_1, var28):andThen(function(p3)
							-- upvalues: var19 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), var34 (ref), isSendResponseAccepted (copy), var32 (ref), text (copy), var30 (ref), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), conversationId_1 (write), expChatConversationListAdapterModule (copy), localPlayer (ref), var33 (ref)
							var19.current(chatConversationTelemetryEventsModule.ConversationMessageSent, getConversationMessageSentInfoModule(p3, var34))
							
							if isSendResponseAccepted(p3) then
								local messages = p3.responseBody.messages or {}
								signalsExperimentalModule.batch(function()
									-- upvalues: ingestNewerMessagesModule (copy), conversationId_1 (copy), messages (ref), var32 (copy), text (copy), var30 (copy), expChatConversationListAdapterModule (copy), localPlayer (copy), var33 (copy)
									if #ingestNewerMessagesModule(conversationId_1, messages) == 0 then
										var32.updateMessage(text, { status = "Failed", content = var30 })
										
										return
									end
									expChatConversationListAdapterModule.updateConversationPreviewFromMessages(conversationId_1, messages, {
										hasUnreadMessages = false,
										localUserId = if localPlayer then localPlayer.UserId else 0
									})
									var33.removeMessage(conversationId_1, text)
									var32.removeMessage(text)
								end)
								
								return
							end
							var32.updateMessage(text, { status = "Failed", content = var30 })
						end):catch(function(p3)
							-- upvalues: name (copy), conversationId_1 (write), var19 (copy), chatConversationTelemetryEventsModule (copy), sendMessageErrorModule (copy), var34 (ref), var32 (ref), text (copy), var30 (ref)
							name:warning(`Failed to send message to {conversationId_1}: {tostring(p3)}`)
							var19.current(chatConversationTelemetryEventsModule.ConversationMessageSent, {
								messageSentResult = sendMessageErrorModule.OtherFailure,
								recipientIds = var34
							})
							var32.updateMessage(text, { status = "Failed", content = var30 })
						end)
						
						return
					elseif var29 then
						expChatPerfTracker.cancel(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = text })
					end
				end)
			end, {
				conversationId,
				var3,
				var2,
				isTimedOut,
				p1.onFriendPlaceholderConversationCreated
			}),
			canLocalUserChat = var7 or false,
			disabledOverlay = if isTimedOut then reactModule.createElement(foundationModule.View, {
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				padding = {
					top = UDim.new(0, var27 / 2),
					bottom = UDim.new(0, var27 / 2),
					left = UDim.new(0, var1.Padding.Large),
					right = UDim.new(0, var1.Padding.XSmall)
				}
			}, {
				TimeoutContent = reactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					ZIndex = 5,
					GroupTransparency = p1.transparencyValue or 0,
					Size = UDim2.new(1, 0, 0, math.max(var1.Typography.CaptionMedium.LineHeight, var27))
				}, {
					DisabledInput = reactModule.createElement(chatInputBoxDisabledModule, {
						bodyText = var17.timeoutDisabled,
						contentSize = var27,
						endTimestamp = var4.timeoutEndTimestamp,
						font = Enum.Font.BuilderSans,
						onActivated = reactModule.useCallback(function()
							-- upvalues: fFlagAppChatUniversalFeatureRestriction (copy), parent (copy), var26 (ref), chatInputBoxDisabledPressedSignal (copy), var4 (ref)
							if fFlagAppChatUniversalFeatureRestriction then
								require(parent.UniversalFeatureRestrictions.showFeatureRestriction)(require(parent.UniversalFeatureRestrictions.AbuseVector).PartyChat, {
									onShown = var26,
									onAppeal = function() end
								})
								
								return
							end
							chatInputBoxDisabledPressedSignal:fire({
								endTimestamp = var4.timeoutEndTimestamp,
								decisionEventId = var4.decisionEventId,
								duration = var4.duration
							})
						end, {
							var26,
							var4.timeoutEndTimestamp,
							var4.decisionEventId,
							var4.duration
						}),
						contentVerticalAlignment = Enum.VerticalAlignment.Center
					})
				})
			}) else nil,
			textSize = var9,
			textBoxRef = ref,
			placeholderText = var15,
			disabledChatPlaceholderText = var16,
			autocomplete = t,
			transparencyValue = p1.transparencyValue,
			onFocusGained = var23,
			onFocusLost = var24,
			maximumCharacterLimit = if fFlagFriendsChatEnforceInputCharacterLimitModule then messageCharacterLimitModule else nil
		})
	})
end