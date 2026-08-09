local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local localizationService = game:GetService("LocalizationService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local signalsReactModule = require(parent.SignalsReact)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local expChatSharedModule = require(parent.ExpChatShared)
local localization = require(parent.InExperienceLocales).Localization
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local createConversationFromFriendPlaceholderModule = require(parent.AppChat.createConversationFromFriendPlaceholder)
local getConversationMessageStoreModule = require(parent.AppChat.GetConversationMessageStore)
local getConversationMessageListStoreModule = require(parent.AppChat.GetConversationMessageListStore)
local ingestNewerMessagesModule = require(parent.AppChat.ingestNewerMessages)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local configModule = require(expChat.Config)
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local name = expChatSharedModule.Logger:new(script.Name)
local t = {
	BackgroundColor3 = configModule.ChatWindowBackgroundColor3,
	BackgroundTransparency = configModule.ChatWindowBackgroundTransparency
}

local function _(p0, p1) --[[ line: 86 | named "resolveFade" ]]
	return if type(p1) == "number" then p0 + p1 * (1 - p0) elseif p1 == nil then p0 else p1:map(function(p2) --[[ line: 90 ]]
		-- upvalues: p0 (ref)
		return p0 + p2 * (1 - p0)
	end)
end

local function isSendResponseAccepted(p3) --[[ line: 97 ]]
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

return function(p4) --[[ line: 117 | named "FriendsChatInputBarHost" ]]
	-- upvalues: expChatConversationListAdapterModule (ref), fFlagExpChatUseMessagesStore (ref), signalsReactModule (ref), getMessagesStoreModule (ref), useSelector (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), reactModule (ref), localization (ref), localizationService (ref), useInterpolatedClientSettingsModule (ref), t (ref), getTransparencyStoreModule (ref), playersService (ref), name (ref), createConversationFromFriendPlaceholderModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), httpService (ref), appChatNetworkingModule (ref), isSendResponseAccepted (ref), signalsExperimentalModule (ref), ingestNewerMessagesModule (ref), configModule (ref), chatInputBarView (ref)
	local conversationId = p4.conversationId
	local var25 = expChatConversationListAdapterModule.isFriendsConversation(conversationId)
	local var26 = conversationId ~= nil and (conversationId ~= "" and not var25)
	local var27 = if fFlagExpChatUseMessagesStore then signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat) else useSelector(function(p5) --[[ line: 128 ]]
		return p5.CanLocalUserChat
	end)
	local var28 = if fFlagExpChatUseChatConfigStore then signalsReactModule.useSignalState(getChatConfigurationStoreModule(false).getChatInputBarSettings) else useSelector(function(p6) --[[ line: 137 ]]
		return p6.ChatLayout.ChatInputBarSettings
	end)
	local var29 = reactModule.useMemo(function() --[[ line: 142 ]]
		-- upvalues: p4 (ref), var28 (write)
		return if p4.isSpatialUIEnabled and var28 and var28.SpatialPanelTextSize then var28.SpatialPanelTextSize elseif var28 then var28.TextSize else nil
	end, { var28, p4.isSpatialUIEnabled })
	local var30 = reactModule.useMemo(function() --[[ line: 152 ]]
		-- upvalues: localization (copy), localizationService (copy)
		local var37 = localization.new(localizationService.RobloxLocaleId)
		
		return {
			placeholder = var37:Format("CoreScripts.TextChat.InputBar.Hint.Touch"),
			disabled = var37:Format("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
		}
	end, {})
	local var31 = useInterpolatedClientSettingsModule(p4.chatWindowSettings or t)
	local var32 = reactModule.useCallback(function() --[[ line: 165 ]]
		-- upvalues: getTransparencyStoreModule (copy)
		getTransparencyStoreModule(false).setTextboxFocus()
	end, {})
	local var33 = reactModule.useCallback(function() --[[ line: 168 ]]
		-- upvalues: getTransparencyStoreModule (copy)
		getTransparencyStoreModule(false).clearTextboxFocus()
	end, {})
	reactModule.useEffect(function() --[[ line: 176 ]]
		-- upvalues: getTransparencyStoreModule (copy)
		return function() --[[ line: 177 ]]
			-- upvalues: getTransparencyStoreModule (copy)
			getTransparencyStoreModule(false).clearTextboxFocus()
		end
	end, {})
	local var34 = reactModule.useCallback(function(p7) --[[ line: 183 ]]
		-- upvalues: conversationId (ref), playersService (copy), var25 (ref), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p4 (ref), var26 (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), appChatNetworkingModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy)
		task.spawn(function() --[[ line: 187 ]]
			-- upvalues: p7 (ref), conversationId (copy), playersService (copy), var25 (copy), expChatConversationListAdapterModule (copy), name (copy), createConversationFromFriendPlaceholderModule (copy), p4 (copy), var26 (copy), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), httpService (copy), appChatNetworkingModule (copy), isSendResponseAccepted (copy), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy)
			local var38 = if typeof(p7) == "string" then p7 else ""
			
			if var38 == "" then return end
			local var39 = conversationId
			local localPlayer = playersService.LocalPlayer
			
			if var25 and conversationId ~= nil then
				local conversation = expChatConversationListAdapterModule.getConversationStore().getConversation(conversationId, false)
				
				if conversation == nil then
					name:warning(`Unable to find friend placeholder {conversationId}`)
					
					return
				end
				local var41 = createConversationFromFriendPlaceholderModule(conversation, if localPlayer then localPlayer.UserId else 0)
				
				if var41 == nil then
					name:warning(`Unable to create conversation for friend placeholder {conversationId}`)
					
					return
				end
				local var42, var43 = var41:await()
				
				if not var42 or var43 == nil then
					name:warning(`Failed to create conversation for friend placeholder {conversationId}`)
					
					return
				end
				var39 = var43.id
				
				if p4.onFriendPlaceholderConversationCreated ~= nil then
					p4.onFriendPlaceholderConversationCreated(var39)
				end
			elseif var26 then
				local var44 = getConversationMessageStoreModule(false)
				local var45 = getConversationMessageListStoreModule(false)
				local text = "sending-friends-message-" .. httpService:GenerateGUID(false)
				var44.upsertMessages({
					[text] = {
						type = "user",
						status = "Pending",
						id = text,
						content = var38,
						created_at = tostring(os.time()),
						sender_user_id = if localPlayer then localPlayer.UserId else nil,
						conversationId = var39
					}
				})
				var45.prependMessages(var39, { text })
				local repeated = string.rep("#", utf8.len(var38) or #var38)
				appChatNetworkingModule.http.SendChatTextMessage(nil, var39, var38):andThen(function(p9) --[[ line: 247 ]]
					-- upvalues: isSendResponseAccepted (copy), var44 (ref), text (ref), repeated (ref), signalsExperimentalModule (copy), ingestNewerMessagesModule (copy), var39 (write), expChatConversationListAdapterModule (copy), localPlayer (ref), var45 (ref)
					if isSendResponseAccepted(p9) then
						local messages = p9.responseBody.messages or {}
						signalsExperimentalModule.batch(function() --[[ line: 257 ]]
							-- upvalues: ingestNewerMessagesModule (copy), var39 (copy), messages (ref), var44 (copy), text (copy), repeated (copy), expChatConversationListAdapterModule (copy), localPlayer (copy), var45 (copy)
							if #ingestNewerMessagesModule(var39, messages) == 0 then
								var44.updateMessage(text, { status = "Failed", content = repeated })
								
								return
							end
							expChatConversationListAdapterModule.updateConversationPreviewFromMessages(var39, messages, {
								hasUnreadMessages = false,
								localUserId = if localPlayer then localPlayer.UserId else 0
							})
							var45.removeMessage(var39, text)
							var44.removeMessage(text)
						end)
						
						return
					end
					var44.updateMessage(text, { status = "Failed", content = repeated })
				end):catch(function(p8) --[[ line: 282 ]]
					-- upvalues: name (copy), var39 (write), var44 (ref), text (ref), repeated (ref)
					name:warning(`Failed to send message to {var39}: {tostring(p8)}`)
					var44.updateMessage(text, { status = "Failed", content = repeated })
				end)
				
				return
			else
			end
		end)
	end, {
		conversationId,
		var26,
		var25,
		p4.onFriendPlaceholderConversationCreated
	})
	local createElement = reactModule.createElement
	local var35 = "Frame"
	local t_1 = {
		LayoutOrder = p4.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var31.BackgroundColor3 or configModule.ChatWindowBackgroundColor3
	}
	local backgroundTransparency = var31.BackgroundTransparency
	local transparencyValue = p4.transparencyValue
	t_1.BackgroundTransparency = if type(transparencyValue) == "number" then backgroundTransparency + transparencyValue * (1 - backgroundTransparency) elseif transparencyValue ~= nil then backgroundTransparency else transparencyValue:map(function(p10) --[[ line: 90 ]]
		-- upvalues: backgroundTransparency (ref)
		return backgroundTransparency + p10 * (1 - backgroundTransparency)
	end)
	t_1.Active = true
	t_1.BorderSizePixel = 0
	t_1.Size = UDim2.fromScale(1, 0)
	t_1[reactModule.Event.MouseEnter] = p4.onHovered
	t_1[reactModule.Event.MouseLeave] = p4.onUnhovered
	
	return createElement(var35, t_1, {
		padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 8),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		inputBar = reactModule.createElement(chatInputBarView, {
			showSideChip = false,
			retainFocusOnSend = true,
			onSend = var34,
			canLocalUserChat = var27 or false,
			textSize = var29,
			placeholderText = var30.placeholder,
			disabledChatPlaceholderText = var30.disabled,
			transparencyValue = p4.transparencyValue,
			onFocusGained = var32,
			onFocusLost = var33
		})
	})
end