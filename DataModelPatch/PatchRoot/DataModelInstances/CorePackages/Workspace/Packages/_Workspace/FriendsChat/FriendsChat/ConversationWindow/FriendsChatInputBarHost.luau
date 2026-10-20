local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")
local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local Localization = require(Parent.InExperienceLocales).Localization
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CreateConversationFromFriendPlaceholderModule = require(Parent.AppChat.createConversationFromFriendPlaceholder)
local GetConversationMessageStoreModule = require(Parent.AppChat.GetConversationMessageStore)
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local IngestNewerMessagesModule = require(Parent.AppChat.ingestNewerMessages)
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local LayoutConstantsModule = require(FriendsChat.LayoutConstants)
local ChatInputBarView = require(Parent.ChatUIPrimitives).ChatInputBarView
local UseChatInputBarSettingsModule = require(Parent.ExpChatIntegration.useChatInputBarSettings)
local UseChatInputBarOnFocusModule = require(Parent.ExpChatIntegration.useChatInputBarOnFocus)
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local UseInterpolatedClientSettingsModule = require(Parent.ExpChatIntegration.useInterpolatedClientSettings)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)

local function _(p1: number, p2)
	return if type(p2) == "number" then p1 + p2 * (1 - p1) elseif p2 == nil then p1 else p2:map(function(p3): number
		-- upvalues: p1 (copy)
		return p1 + p3 * (1 - p1)
	end)
end

local function isSendResponseAccepted(p1): boolean
	if p1 == nil or p1.responseBody == nil then
		return false
	elseif p1.responseCode ~= nil and p1.responseCode ~= 200 then
		return false
	elseif p1.StatusCode ~= nil and p1.StatusCode ~= 200 then
		return false
	else
		local Messages = p1.responseBody.messages
		
		if Messages == nil or #Messages == 0 then
			return false
		else
			local Status = Messages[1].status
			
			return Status == nil or (Status == "" or Status == "success")
		end
	end
end

return function(Frame)
	-- upvalues: ExpChatConversationListAdapterModule (copy), UseChatWindowSettingsModule (copy), ReactModule (copy), UseChatInputBarSettingsModule (copy), Localization (copy), LocalizationService (copy), UseInterpolatedClientSettingsModule (copy), UseChatInputBarOnFocusModule (copy), Players (copy), NewResult (copy), CreateConversationFromFriendPlaceholderModule (copy), GetConversationMessageStoreModule (copy), GetConversationMessageListStoreModule (copy), HttpService (copy), AppChatNetworkingModule (copy), isSendResponseAccepted (copy), SignalsExperimentalModule (copy), IngestNewerMessagesModule (copy), LayoutConstantsModule (copy), ChatInputBarView (copy)
	local ConversationId = Frame.conversationId
	local IsFriendsConversation = ExpChatConversationListAdapterModule.isFriendsConversation(ConversationId)
	local NoIsFriendsConversation: boolean = ConversationId ~= nil and (ConversationId ~= "" and not IsFriendsConversation)
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local UseChatInputBarSettingsModuleResult = UseChatInputBarSettingsModule()
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), UseChatInputBarSettingsModuleResult (copy)
		return if Frame.isSpatialUIEnabled and UseChatInputBarSettingsModuleResult and UseChatInputBarSettingsModuleResult.SpatialPanelTextSize then UseChatInputBarSettingsModuleResult.SpatialPanelTextSize elseif UseChatInputBarSettingsModuleResult then UseChatInputBarSettingsModuleResult.TextSize else nil
	end, {
		UseChatInputBarSettingsModuleResult,
		Frame.isSpatialUIEnabled
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Localization (upval), LocalizationService (upval)
		local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
		
		return {
			placeholder = NewLocalization:Format("CoreScripts.TextChat.InputBar.Hint.Touch"),
			disabled = NewLocalization:Format("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
		}
	end, {})
	local UseInterpolatedClientSettingsModuleResult = UseInterpolatedClientSettingsModule(Frame.chatWindowSettings or UseMemoResult)
	local UseChatInputBarOnFocusModuleResult = UseChatInputBarOnFocusModule()
	local OnFocusGained = UseChatInputBarOnFocusModuleResult.onFocusGained
	local OnFocusLostFunction = UseChatInputBarOnFocusModuleResult.onFocusLost
	ReactModule.useEffect(function()
		-- upvalues: OnFocusLostFunction (copy)
		return function()
			-- upvalues: OnFocusLostFunction (upval)
			OnFocusLostFunction()
		end
	end, { OnFocusLostFunction })
	local BackgroundTransparency: number = UseInterpolatedClientSettingsModuleResult.BackgroundTransparency
	local TransparencyValue = Frame.transparencyValue
	
	return ReactModule.createElement("Frame", {
		Name = "friendsChatInput",
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = UseInterpolatedClientSettingsModuleResult.BackgroundColor3 or UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
		BackgroundTransparency = if type(TransparencyValue) == "number" then BackgroundTransparency + TransparencyValue * (1 - BackgroundTransparency) elseif TransparencyValue == nil then BackgroundTransparency else TransparencyValue:map(function(p1): number
			-- upvalues: BackgroundTransparency (copy)
			return BackgroundTransparency + p1 * (1 - BackgroundTransparency)
		end),
		Active = true,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 0),
		[ReactModule.Event.MouseEnter] = Frame.onHovered,
		[ReactModule.Event.MouseLeave] = Frame.onUnhovered
	}, {
		bottomCorner = ReactModule.createElement("UICorner", {
			BottomLeftRadius = UDim.new(0, LayoutConstantsModule.PanelBottomCornerRadius),
			BottomRightRadius = UDim.new(0, LayoutConstantsModule.PanelBottomCornerRadius),
			TopLeftRadius = UDim.new(0, 0),
			TopRightRadius = UDim.new(0, 0)
		}),
		padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, LayoutConstantsModule.InputBarTopPadding),
			PaddingBottom = UDim.new(0, LayoutConstantsModule.InputBarBottomPadding + LayoutConstantsModule.PanelBottomCornerRadius),
			PaddingLeft = UDim.new(0, LayoutConstantsModule.InputBarSidePadding),
			PaddingRight = UDim.new(0, LayoutConstantsModule.InputBarSidePadding)
		}),
		inputBar = ReactModule.createElement(ChatInputBarView, {
			canLocalUserChat = true,
			showSideChip = false,
			retainFocusOnSend = true,
			onSend = ReactModule.useCallback(function(p1)
				-- upvalues: ConversationId (copy), Players (upval), IsFriendsConversation (copy), ExpChatConversationListAdapterModule (upval), NewResult (upval), CreateConversationFromFriendPlaceholderModule (upval), Frame (copy), NoIsFriendsConversation (copy), GetConversationMessageStoreModule (upval), GetConversationMessageListStoreModule (upval), HttpService (upval), AppChatNetworkingModule (upval), isSendResponseAccepted (upval), SignalsExperimentalModule (upval), IngestNewerMessagesModule (upval)
				task.spawn(function()
					-- upvalues: p1 (copy), ConversationId (upval), Players (upval), IsFriendsConversation (upval), ExpChatConversationListAdapterModule (upval), NewResult (upval), CreateConversationFromFriendPlaceholderModule (upval), Frame (upval), NoIsFriendsConversation (upval), GetConversationMessageStoreModule (upval), GetConversationMessageListStoreModule (upval), HttpService (upval), AppChatNetworkingModule (upval), isSendResponseAccepted (upval), SignalsExperimentalModule (upval), IngestNewerMessagesModule (upval)
					local Text = if typeof(p1) == "string" then p1 else ""
					
					if Text == "" then return end
					local ConversationId1 = ConversationId or ""
					local LocalPlayer = Players.LocalPlayer
					
					if IsFriendsConversation and ConversationId ~= nil then
						local Conversation = ExpChatConversationListAdapterModule.getConversationStore().getConversation(ConversationId, false)
						
						if Conversation == nil then
							NewResult:warning(`Unable to find friend placeholder {ConversationId}`)
							
							return
						end
						local ConversationFromFriendPlaceholderModule = CreateConversationFromFriendPlaceholderModule(Conversation, if LocalPlayer then LocalPlayer.UserId else 0)
						
						if ConversationFromFriendPlaceholderModule == nil then
							NewResult:warning(`Unable to create conversation for friend placeholder {ConversationId}`)
							
							return
						end
						local v1, v2 = ConversationFromFriendPlaceholderModule:await()
						
						if not v1 or v2 == nil then
							NewResult:warning(`Failed to create conversation for friend placeholder {ConversationId}`)
							
							return
						end
						ConversationId1 = v2.id
						
						if Frame.onFriendPlaceholderConversationCreated ~= nil then
							Frame.onFriendPlaceholderConversationCreated(ConversationId1)
						end
					elseif not NoIsFriendsConversation then return end
					local ConversationMessageStoreModule = GetConversationMessageStoreModule(false)
					local ConversationMessageListStoreModule = GetConversationMessageListStoreModule(false)
					local Text1 = "sending-friends-message-" .. HttpService:GenerateGUID(false)
					ConversationMessageStoreModule.upsertMessages({
						[Text1] = {
							type = "user",
							status = "Pending",
							id = Text1,
							content = Text,
							created_at = tostring(os.time()),
							sender_user_id = if LocalPlayer then LocalPlayer.UserId else nil,
							conversationId = ConversationId1
						}
					})
					ConversationMessageListStoreModule.prependMessages(ConversationId1, { Text1 })
					local Repeated = string.rep("#", utf8.len(Text) or #Text)
					AppChatNetworkingModule.http.SendChatTextMessage(nil, ConversationId1, Text):andThen(function(Result)
						-- upvalues: isSendResponseAccepted (upval), ConversationMessageStoreModule (copy), Text1 (copy), Repeated (copy), SignalsExperimentalModule (upval), IngestNewerMessagesModule (upval), ConversationId1 (ref), ExpChatConversationListAdapterModule (upval), LocalPlayer (copy), ConversationMessageListStoreModule (copy)
						if isSendResponseAccepted(Result) then
							local Messages = Result.responseBody.messages or {}
							SignalsExperimentalModule.batch(function()
								-- upvalues: IngestNewerMessagesModule (upval), ConversationId1 (upval), Messages (copy), ConversationMessageStoreModule (upval), Text1 (upval), Repeated (upval), ExpChatConversationListAdapterModule (upval), LocalPlayer (upval), ConversationMessageListStoreModule (upval)
								if #IngestNewerMessagesModule(ConversationId1, Messages) == 0 then
									ConversationMessageStoreModule.updateMessage(Text1, { status = "Failed", content = Repeated })
									
									return
								else
									ExpChatConversationListAdapterModule.updateConversationPreviewFromMessages(ConversationId1, Messages, {
										hasUnreadMessages = false,
										localUserId = if LocalPlayer then LocalPlayer.UserId else 0
									})
									ConversationMessageListStoreModule.removeMessage(ConversationId1, Text1)
									ConversationMessageStoreModule.removeMessage(Text1)
								end
							end)
							
							return
						else
							ConversationMessageStoreModule.updateMessage(Text1, { status = "Failed", content = Repeated })
						end
					end):catch(function(Err)
						-- upvalues: NewResult (upval), ConversationId1 (ref), ConversationMessageStoreModule (copy), Text1 (copy), Repeated (copy)
						NewResult:warning(`Failed to send message to {ConversationId1}: {tostring(Err)}`)
						ConversationMessageStoreModule.updateMessage(Text1, { status = "Failed", content = Repeated })
					end)
				end)
			end, {
				ConversationId,
				NoIsFriendsConversation,
				IsFriendsConversation,
				Frame.onFriendPlaceholderConversationCreated
			}),
			textSize = UseMemoResult1,
			placeholderText = UseMemoResult2.placeholder,
			disabledChatPlaceholderText = UseMemoResult2.disabled,
			transparencyValue = Frame.transparencyValue,
			onFocusGained = OnFocusGained,
			onFocusLost = OnFocusLostFunction
		})
	})
end