local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local localizationService = game:GetService("LocalizationService")
local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local signalsReactModule = require(parent.SignalsReact)
local expChatSharedModule = require(parent.ExpChatShared)
local localization = require(parent.InExperienceLocales).Localization
local useLocalization = require(parent.Localization).Hooks.useLocalization
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
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
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local getConversationMessageSentInfoModule = require(script.Parent.Parent.Telemetry.ChatConversation.getConversationMessageSentInfo)
local serializeParticipantIdsForTelemetryModule = require(script.Parent.Parent.Telemetry.App.serializeParticipantIdsForTelemetry)
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView
local useChatInputBarSettingsModule = require(parent.ExpChatIntegration.useChatInputBarSettings)
local useChatInputBarOnFocusModule = require(parent.ExpChatIntegration.useChatInputBarOnFocus)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local name = expChatSharedModule.Logger:new(script.Name)

local function _(p0, p1) --[[ line: 84 | named "resolveFade" ]]
	return if type(p1) == "number" then p0 + p1 * (1 - p0) elseif p1 == nil then p0 else p1:map(function(p2) --[[ line: 88 ]]
		-- upvalues: p0 (ref)
		return p0 + p2 * (1 - p0)
	end)
end

local function isSendResponseAccepted(p3) --[[ line: 95 ]]
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

return function(p4) --[[ line: 115 | named "FriendsChatInputBarHost" ]]
	-- upvalues: foundationModule (ref), expChatConversationListAdapterModule (ref), useChatTimeoutDetailsFromHydrationModule (ref), signalsReactModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useChatInputBarSettingsModule (ref), localization (ref), localizationService (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useInterpolatedClientSettingsModule (ref), useChatInputBarOnFocusModule (ref), interventionTreatmentShownSignal (ref), constants (ref), playersService (ref), name (ref), createConversationFromFriendPlaceholderModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), httpService (ref), serializeParticipantIdsForTelemetryModule (ref), appChatNetworkingModule (ref), chatConversationTelemetryEventsModule (ref), getConversationMessageSentInfoModule (ref), isSendResponseAccepted (ref), signalsExperimentalModule (ref), ingestNewerMessagesModule (ref), sendMessageErrorModule (ref), chatInputBoxDisabledPressedSignal (ref), chatInputBoxDisabledModule (ref), layoutConstantsModule (ref), chatInputBarView (ref)
	local var32 = foundationModule.Hooks.useTokens()
	local conversationId = p4.conversationId
	local var33 = expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var34 = conversationId ~= nil and (conversationId ~= "" and not var33)
	local var35 = signalsReactModule.useSignalState(useChatTimeoutDetailsFromHydrationModule({
		conversationId = if var34 then conversationId else nil,
		conversationModerationType = p4.conversationModerationType
	}))
	local isTimedOut = var35.isTimedOut
	local var36 = useChatWindowSettingsModule()
	local var37 = reactModule.useMemo(function() --[[ line: 131 ]]
		-- upvalues: var36 (ref)
		return {
			BackgroundColor3 = var36.ChatWindowBackgroundColor3,
			BackgroundTransparency = var36.ChatWindowBackgroundTransparency
		}
	end, { var36 })
	local var38 = not isTimedOut
	local var39 = useChatInputBarSettingsModule()
	local var40 = reactModule.useMemo(function() --[[ line: 142 ]]
		-- upvalues: p4 (ref), var39 (ref)
		return if p4.isSpatialUIEnabled and var39 and var39.SpatialPanelTextSize then var39.SpatialPanelTextSize elseif var39 then var39.TextSize else nil
	end, { var39, p4.isSpatialUIEnabled })
	local var41 = reactModule.useMemo(function() --[[ line: 152 ]]
		-- upvalues: localization (copy), localizationService (copy)
		local var53 = localization.new(localizationService.RobloxLocaleId)
		
		return {
			placeholder = var53:Format("CoreScripts.TextChat.InputBar.Hint.Touch"),
			disabled = var53:Format("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
		}
	end, {})
	local var42 = useLocalization({ timeoutDisabled = "Feature.Chat.Label.ChatDisabled" })
	local var43 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var44 = reactModule.useRef(var43.emit)
	var44.current = var43.emit
	local var45 = useInterpolatedClientSettingsModule(p4.chatWindowSettings or var37)
	local var46 = useChatInputBarOnFocusModule()
	local onFocusGained = var46.onFocusGained
	local onFocusLost = var46.onFocusLost
	local var47 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 182 ]]
		-- upvalues: onFocusLost (ref)
		return function() --[[ line: 183 ]]
			-- upvalues: onFocusLost (copy)
			onFocusLost()
		end
	end, { onFocusLost })
	reactModule.useEffect(function() --[[ line: 188 ]]
		-- upvalues: interventionTreatmentShownSignal (copy), constants (copy), var47 (ref)
		local var54 = interventionTreatmentShownSignal:connect(function(p5) --[[ line: 189 ]]
			-- upvalues: constants (copy), var47 (copy)
			if p5 == constants.TreatmentType.PartyChatNudgeDialog or p5 == constants.TreatmentType.PartyChatTimeoutDialog then
				local current = var47.current
				
				if current then
					current:ReleaseFocus()
				end
			end
		end)
		
		return function() --[[ line: 200 ]]
			-- upvalues: var54 (ref)
			var54:disconnect()
		end
	end, {})
	local var48 = reactModule.useCallback(function(p6) --[[ line: 206 ]]
		-- upvalues: isTimedOut (ref), conversationId (ref), playersService (copy), var33 (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p4 (ref), var34 (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var44 (ref), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
		if isTimedOut then
			return
		end
		task.spawn(function() --[[ line: 213 ]]
			-- upvalues: p6 (ref), conversationId (copy), playersService (copy), var33 (copy), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p4 (copy), var34 (copy), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), serializeParticipantIdsForTelemetryModule (copy), appChatNetworkingModule (copy), var44 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), sendMessageErrorModule (copy)
			local var55 = if typeof(p6) == "string" then p6 else ""
			
			if var55 == "" then return end
			local conversationId_1 = conversationId or ""
			local localPlayer = playersService.LocalPlayer
			
			if var33 and conversationId ~= nil then
				local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId, false)
				
				if conversation == nil then
					name:warning(`Unable to find friend placeholder {conversationId}`)
					
					return
				end
				local var58 = createConversationFromFriendPlaceholderModule(conversation, if localPlayer then localPlayer.UserId else 0)
				
				if var58 == nil then
					name:warning(`Unable to create conversation for friend placeholder {conversationId}`)
					
					return
				end
				local var59, var60 = var58:await()
				
				if not var59 or var60 == nil then
					name:warning(`Failed to create conversation for friend placeholder {conversationId}`)
					
					return
				end
				conversationId_1 = var60.id
				
				if p4.onFriendPlaceholderConversationCreated ~= nil then
					p4.onFriendPlaceholderConversationCreated(conversationId_1)
				end
			elseif var34 then
				local var61 = getConversationMessageStoreModule(false)
				local var62 = getConversationMessageListStoreModule(false)
				local text = "sending-friends-message-" .. httpService:GenerateGUID(false)
				var61.upsertMessages({
					[text] = {
						type = "user",
						status = "Pending",
						id = text,
						content = var55,
						created_at = tostring(os.time()),
						sender_user_id = if localPlayer then localPlayer.UserId else nil,
						conversationId = conversationId_1
					}
				})
				var62.prependMessages(conversationId_1, { text })
				local repeated = string.rep("#", utf8.len(var55) or #var55)
				local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId_1, false)
				local var66 = serializeParticipantIdsForTelemetryModule(if conversation then conversation.participants else nil, if localPlayer then localPlayer.UserId else 0)
				appChatNetworkingModule.http.SendChatTextMessage(nil, conversationId_1, var55):andThen(function(p8) --[[ line: 282 ]]
					-- upvalues: var44 (copy), chatConversationTelemetryEventsModule (copy), getConversationMessageSentInfoModule (copy), var66 (ref), isSendResponseAccepted (copy), var61 (ref), text (ref), repeated (ref), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), conversationId_1 (write), expChatConversationListAdapterModule (copy), localPlayer (ref), var62 (ref)
					var44.current(chatConversationTelemetryEventsModule.ConversationMessageSent, getConversationMessageSentInfoModule(p8, var66))
					
					if isSendResponseAccepted(p8) then
						local messages = p8.responseBody.messages or {}
						signalsExperimentalModule.batch(function() --[[ line: 299 ]]
							-- upvalues: ingestNewerMessagesModule (copy), conversationId_1 (copy), messages (ref), var61 (copy), text (copy), repeated (copy), expChatConversationListAdapterModule (copy), localPlayer (copy), var62 (copy)
							if #ingestNewerMessagesModule(conversationId_1, messages) == 0 then
								var61.updateMessage(text, { status = "Failed", content = repeated })
								
								return
							end
							expChatConversationListAdapterModule.updateConversationPreviewFromMessages(conversationId_1, messages, {
								hasUnreadMessages = false,
								localUserId = if localPlayer then localPlayer.UserId else 0
							})
							var62.removeMessage(conversationId_1, text)
							var61.removeMessage(text)
						end)
						
						return
					end
					var61.updateMessage(text, { status = "Failed", content = repeated })
				end):catch(function(p7) --[[ line: 324 ]]
					-- upvalues: name (copy), conversationId_1 (write), var44 (copy), chatConversationTelemetryEventsModule (copy), sendMessageErrorModule (copy), var66 (ref), var61 (ref), text (ref), repeated (ref)
					name:warning(`Failed to send message to {conversationId_1}: {tostring(p7)}`)
					var44.current(chatConversationTelemetryEventsModule.ConversationMessageSent, {
						messageSentResult = sendMessageErrorModule.OtherFailure,
						recipientIds = var66
					})
					var61.updateMessage(text, { status = "Failed", content = repeated })
				end)
				
				return
			else
			end
		end)
	end, {
		conversationId,
		var34,
		var33,
		isTimedOut,
		p4.onFriendPlaceholderConversationCreated
	})
	local var40_1 = var40 or var32.Typography.CaptionMedium.FontSize
	local var50 = if isTimedOut then reactModule.createElement(foundationModule.View, {
		tag = "auto-y",
		Size = UDim2.fromScale(1, 0),
		padding = {
			top = UDim.new(0, var40_1 / 2),
			bottom = UDim.new(0, var40_1 / 2),
			left = UDim.new(0, var32.Padding.Large),
			right = UDim.new(0, var32.Padding.XSmall)
		}
	}, {
		TimeoutContent = reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			GroupTransparency = p4.transparencyValue or 0,
			Size = UDim2.new(1, 0, 0, math.max(var32.Typography.CaptionMedium.LineHeight, var40_1))
		}, {
			DisabledInput = reactModule.createElement(chatInputBoxDisabledModule, {
				bodyText = var42.timeoutDisabled,
				contentSize = var40_1,
				endTimestamp = var35.timeoutEndTimestamp,
				font = Enum.Font.BuilderSans,
				onActivated = reactModule.useCallback(function() --[[ line: 349 ]]
					-- upvalues: chatInputBoxDisabledPressedSignal (copy), var35 (ref)
					chatInputBoxDisabledPressedSignal:fire({
						endTimestamp = var35.timeoutEndTimestamp,
						decisionEventId = var35.decisionEventId,
						duration = var35.duration
					})
				end, {
					var35.timeoutEndTimestamp,
					var35.decisionEventId,
					var35.duration
				}),
				contentVerticalAlignment = Enum.VerticalAlignment.Center
			})
		})
	}) else nil
	local createElement = reactModule.createElement
	local var51 = "Frame"
	local t = {
		Name = "friendsChatInput",
		LayoutOrder = p4.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var45.BackgroundColor3 or var36.ChatWindowBackgroundColor3
	}
	local backgroundTransparency = var45.BackgroundTransparency
	local transparencyValue = p4.transparencyValue
	t.BackgroundTransparency = if type(transparencyValue) == "number" then backgroundTransparency + transparencyValue * (1 - backgroundTransparency) elseif transparencyValue ~= nil then backgroundTransparency else transparencyValue:map(function(p9) --[[ line: 88 ]]
		-- upvalues: backgroundTransparency (ref)
		return backgroundTransparency + p9 * (1 - backgroundTransparency)
	end)
	t.Active = true
	t.BorderSizePixel = 0
	t.ClipsDescendants = true
	t.Size = UDim2.fromScale(1, 0)
	t[reactModule.Event.MouseEnter] = p4.onHovered
	t[reactModule.Event.MouseLeave] = p4.onUnhovered
	
	return createElement(var51, t, {
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
			onSend = var48,
			canLocalUserChat = var38 or false,
			disabledOverlay = var50,
			textSize = var40,
			textBoxRef = var47,
			placeholderText = var41.placeholder,
			disabledChatPlaceholderText = var41.disabled,
			transparencyValue = p4.transparencyValue,
			onFocusGained = onFocusGained,
			onFocusLost = onFocusLost
		})
	})
end