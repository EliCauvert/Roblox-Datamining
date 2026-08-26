local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local roduxModule = require(parent.Rodux)
local llamaModule = require(parent.llama)
local list = llamaModule.List
local dictionary = llamaModule.Dictionary
local set = llamaModule.Set
local none = llamaModule.None
local isWhiteSpaceOnlyModule = require(expChat.isWhiteSpaceOnly)
local sanitizeForRichTextModule = require(expChat.sanitizeForRichText)
local generateRichSystemMessageTextFormatModule = require(expChat.generateRichSystemMessageTextFormat)
local configModule = require(expChat.Config)
local _ = require(expChat.TextChatMessageChatActionType)
local actions = expChat.Actions
local incomingMessageReceivedModule = require(actions.IncomingMessageReceived)
local universeChatSystemMessageAddedModule = require(actions.UniverseChatSystemMessageAdded)
local incomingBubbleChatMessageReceivedModule = require(actions.IncomingBubbleChatMessageReceived)
local outgoingMessageSentModule = require(actions.OutgoingMessageSent)
local userMuted = expChatSharedModule.Actions.UserMuted
local userUnmuted = expChatSharedModule.Actions.UserUnmuted
local playerRemoved = expChatSharedModule.Actions.PlayerRemoved
local chatPrivacySettingsReceivedModule = require(actions.ChatPrivacySettingsReceived)
local chatPrivacySettingsFetchFailedModule = require(actions.ChatPrivacySettingsFetchFailed)
local configurationObjectsLoadedModule = require(actions.ConfigurationObjectsLoaded)
local bubbleChatSettingsChangedModule = require(actions.BubbleChatSettingsChanged)
local chatWindowMessagesCleared = expChatSharedModule.Actions.ChatWindowMessagesCleared
local chatTranslationGlobalToggledModule = require(actions.ChatTranslationGlobalToggled)
local chatTranslationMessageToggledModule = require(expChat.Actions.ChatTranslationMessageToggled)
local legacyBubbleCreatedModule = require(expChat.Actions.LegacyBubbleCreated)
local legacyBubbleTextUpdatedModule = require(expChat.Actions.LegacyBubbleTextUpdated)
local hiddenMessageReceivedModule = require(expChat.Actions.HiddenMessageReceived)
local hiddenMessagesClearedModule = require(expChat.Actions.HiddenMessagesCleared)
local getFFlagExpChatTelemetryEventTriggerModule = require(expChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local fFlagExpChatEnableFOMOUpsellModule = require(expChat.Flags.FFlagExpChatEnableFOMOUpsell)
local fFlagExpChatClearHiddenMessagesPostAgeCheckModule = require(expChat.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local fIntExpChatRandomCharChangeLowerBoundModule = require(expChat.Flags.FIntExpChatRandomCharChangeLowerBound)
local fIntExpChatRandomCharChangeUpperBoundModule = require(expChat.Flags.FIntExpChatRandomCharChangeUpperBound)
local fFlagEnableInExpChatRewriteModule = require(expChat.Flags.FFlagEnableInExpChatRewrite)
local fFlagEnableInExpChatSummaryOnLuaModule = require(expChat.Flags.FFlagEnableInExpChatSummaryOnLua)
local fFlagExpChatFixLocalUserVerifiedBadgeModule = require(expChat.Flags.FFlagExpChatFixLocalUserVerifiedBadge)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagExpChatProtectedChatInternalAPIs = sharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagChatLineReportingGlobalMuteEnabled = sharedFlagsModule.FFlagChatLineReportingGlobalMuteEnabled
local fFlagExpChatDictation = sharedFlagsModule.FFlagExpChatDictation
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local computeNameColor = require(parent.ChatUIPrimitives).Utils.computeNameColor
local getFFlagExpChatExcludeFOMORendersModule = require(expChat.Flags.getFFlagExpChatExcludeFOMORenders)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatDisableUniverseBubbleChat = expChatSharedModule.Flags.FFlagExpChatDisableUniverseBubbleChat
local getFFlagExpChatSyntheticSystemMessageRichText = expChatSharedModule.Flags.GetFFlagExpChatSyntheticSystemMessageRichText
local getTextAndTranslationModule = require(expChat.getTextAndTranslation)
local channelTabsConfigurationEnabledModule = require(actions.ChannelTabsConfigurationEnabled)
local textChatService = game:GetService("TextChatService")

function getChatTranslationEnabled()
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function()
		-- upvalues: textChatService (copy)
		return textChatService.ChatTranslationEnabled
	end)
	
	return ok and status
end

local t = {
	canLocalUserChat = false,
	isBubbleChatEnabled = false,
	channelTabsConfigurationEnabled = false,
	messageLimit = 50,
	_mutedUserIds = {},
	windowMessagesInOrder = {},
	windowMessagesInOrderByTabId = {},
	byMessageId = {},
	bubbleMessagesInOrderBySenderId = {},
	mockUserIdToPartOrModel = {},
	partOrModelToMockUserId = {},
	messagesBySenderId = {}
}

local function resolveChannelNameForMapOrder(p1, p2, p3)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), none (ref)
	return if getFFlagTextChatEnableUniverseChatTabs() then p3 or (if p2.textChannel then if p2.textChannel.Name == "RBXSystem" or not p1.channelTabsConfigurationEnabled then "RBXGeneral" else p2.textChannel.Name else none) elseif p2.textChannel then if p2.textChannel.Name == "RBXSystem" then "RBXGeneral" else p2.textChannel.Name else none
end

local function mapByMessageIdInOrderHelper(p1, p2, p3)
	-- upvalues: isWhiteSpaceOnlyModule (ref), resolveChannelNameForMapOrder (ref), httpService (ref), dictionary (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagExpChatDictation (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagChatLineReportingGlobalMuteEnabled (ref), fFlagExpChatPresetChatEnabled (ref), list (ref), fFlagExpChatEnableFOMOUpsellModule (ref), getFFlagExpChatExcludeFOMORendersModule (ref)
	if isWhiteSpaceOnlyModule(p2.text) and p2.status ~= Enum.TextChatMessageStatus.Floodchecked and p2.status ~= Enum.TextChatMessageStatus.MessageTooLong then
		return p1
	end
	local partOrModel = p2.partOrModel
	local userId = p2.userId
	local messageId = p2.messageId
	local var1 = resolveChannelNameForMapOrder(p1, p2, p3)
	local windowMessagesInOrder = p1.windowMessagesInOrder
	local var2 = p1.windowMessagesInOrderByTabId[var1] or {}
	local byMessageId = p1.byMessageId
	local bubbleMessagesInOrderBySenderId = p1.bubbleMessagesInOrderBySenderId
	local mockUserIdToPartOrModel = p1.mockUserIdToPartOrModel
	local partOrModelToMockUserId = p1.partOrModelToMockUserId
	local messagesBySenderId = p1.messagesBySenderId
	
	if not userId and partOrModel then
		userId = partOrModelToMockUserId[partOrModel]
		
		if not userId then
			userId = httpService:GenerateGUID(false)
			mockUserIdToPartOrModel = dictionary.join(mockUserIdToPartOrModel, { [userId] = partOrModel })
			partOrModelToMockUserId = dictionary.join(partOrModelToMockUserId, { [partOrModel] = userId })
		end
	end
	local var3
	local wasRewritten = nil
	local originalText = nil
	
	if fFlagEnableInExpChatRewriteModule then
		wasRewritten = p2.wasRewritten
		originalText = p2.originalText
	end
	if byMessageId[messageId] then
		local t = {
			userId = userId,
			prefixText = p2.prefixText,
			text = p2.text,
			translation = p2.translation,
			useTranslation = p2.useTranslation,
			textChannel = p2.textChannel,
			messageId = messageId,
			status = p2.status,
			timestamp = p2.timestamp,
			isVisibleInBubbleChat = p2.isVisibleInBubbleChat,
			isVisibleInChatWindow = p2.isVisibleInChatWindow,
			shouldOverrideBubbleChatSettings = p2.shouldOverrideBubbleChatSettings,
			bubbleChatMessageProperties = p2.bubbleChatMessageProperties,
			chatWindowMessageProperties = p2.chatWindowMessageProperties,
			metadata = if fFlagExpChatDictation then p2.metadata else nil,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p2.textChatMessageInstance else nil,
			wasRewritten = wasRewritten,
			originalText = originalText,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p2.chatActionType else nil,
			isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p2.isUniverseChat else nil,
			presetId = if fFlagExpChatPresetChatEnabled then p2.presetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then p2.presetChatVersion else nil
		}
		byMessageId = dictionary.join(byMessageId, { [messageId] = t })
		
		if userId and messagesBySenderId[userId] then
			local var4 = list.findWhere(messagesBySenderId[userId], function(p4, _)
				-- upvalues: messageId (ref)
				return p4.messageId == messageId
			end)
			
			if var4 and var4 > 0 then
				messagesBySenderId = dictionary.join(messagesBySenderId, {
					[userId] = list.set(messagesBySenderId[userId], var4, t)
				})
			end
		end
		if p2.status == Enum.TextChatMessageStatus.Floodchecked or p2.status == Enum.TextChatMessageStatus.MessageTooLong then
			windowMessagesInOrder = list.removeIndex(windowMessagesInOrder, list.count(windowMessagesInOrder))
			var2 = list.removeIndex(var2, list.count(var2))
			byMessageId = dictionary.removeKey(byMessageId, p2.messageId)
			
			if userId then
				local var5 = list.findWhere(messagesBySenderId[userId], function(p4, _)
					-- upvalues: messageId (ref)
					return p4.messageId == messageId
				end)
				
				if var5 and var5 > 0 then
					messagesBySenderId = dictionary.join(messagesBySenderId, {
						[userId] = list.removeIndex(messagesBySenderId[userId], var5)
					})
				end
			end
		end
		return dictionary.join(p1, {
			windowMessagesInOrder = windowMessagesInOrder,
			windowMessagesInOrderByTabId = dictionary.join(p1.windowMessagesInOrderByTabId, { [var1] = var2 }),
			byMessageId = byMessageId,
			messagesBySenderId = messagesBySenderId
		})
	elseif #windowMessagesInOrder == p1.messageLimit and p2.isVisibleInChatWindow then
		var3 = windowMessagesInOrder[1]
		local var6 = if byMessageId[var3] then byMessageId[var3].userId else nil
		windowMessagesInOrder = list.removeIndex(windowMessagesInOrder, 1)
		
		if var6 then
			if messagesBySenderId ~= nil and messagesBySenderId[var6] then
				local var7 = list.findWhere(messagesBySenderId[var6], function(p4, _)
					-- upvalues: var3 (write)
					return p4.messageId == var3
				end)
				
				if var7 and var7 > 0 then
					messagesBySenderId = dictionary.join(messagesBySenderId, {
						[var6] = list.removeIndex(messagesBySenderId[var6], var7)
					})
				end
				if dictionary.count(messagesBySenderId[var6]) == 0 then
					messagesBySenderId = dictionary.removeKey(messagesBySenderId, var6)
					
					if mockUserIdToPartOrModel[var6] then
						local var8 = mockUserIdToPartOrModel[var6]
						
						if partOrModelToMockUserId[var8] then
							partOrModelToMockUserId = dictionary.removeKey(partOrModelToMockUserId, var8)
						end
						mockUserIdToPartOrModel = dictionary.removeKey(mockUserIdToPartOrModel, var6)
					end
				end
			elseif bubbleMessagesInOrderBySenderId ~= nil and bubbleMessagesInOrderBySenderId[var6] then
				bubbleMessagesInOrderBySenderId = dictionary.join(bubbleMessagesInOrderBySenderId, {
					[var6] = list.removeValue(bubbleMessagesInOrderBySenderId[var6], var3)
				})
				
				if dictionary.count(bubbleMessagesInOrderBySenderId[var6]) == 0 then
					bubbleMessagesInOrderBySenderId = dictionary.removeKey(bubbleMessagesInOrderBySenderId, var6)
					
					if mockUserIdToPartOrModel[var6] then
						local var9 = mockUserIdToPartOrModel[var6]
						
						if partOrModelToMockUserId[var9] then
							partOrModelToMockUserId = dictionary.removeKey(partOrModelToMockUserId, var9)
						end
						mockUserIdToPartOrModel = dictionary.removeKey(mockUserIdToPartOrModel, var6)
					end
				end
			end
		end
		if #var2 == p1.messageLimit then
			var3 = var2[1]
			var2 = list.removeIndex(var2, 1)
			byMessageId = dictionary.removeKey(byMessageId, var3)
		end
	end
	if p2.isVisibleInChatWindow then
		windowMessagesInOrder = list.append(windowMessagesInOrder, messageId)
		var2 = list.append(var2, messageId)
	end
	var3 = dictionary.join
	
	return var3(p1, {
		windowMessagesInOrder = windowMessagesInOrder,
		windowMessagesInOrderByTabId = dictionary.join(p1.windowMessagesInOrderByTabId, { [var1] = var2 }),
		byMessageId = dictionary.join(byMessageId, {
			[messageId] = {
				userId = userId,
				prefixText = p2.prefixText,
				text = p2.text,
				translation = p2.translation,
				useTranslation = p2.useTranslation,
				messageId = messageId,
				status = p2.status,
				timestamp = p2.timestamp,
				isVisibleInBubbleChat = p2.isVisibleInBubbleChat,
				isVisibleInChatWindow = p2.isVisibleInChatWindow,
				partOrModel = partOrModel,
				shouldOverrideBubbleChatSettings = p2.shouldOverrideBubbleChatSettings,
				bubbleChatMessageProperties = p2.bubbleChatMessageProperties,
				chatWindowMessageProperties = p2.chatWindowMessageProperties,
				textChannel = p2.textChannel,
				metadata = if fFlagExpChatDictation then p2.metadata else nil,
				textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p2.textChatMessageInstance else nil,
				isHiddenMessage = if fFlagExpChatEnableFOMOUpsellModule or getFFlagExpChatExcludeFOMORendersModule() then p2.isHiddenMessage else nil,
				wasRewritten = wasRewritten,
				originalText = originalText,
				chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p2.chatActionType else nil,
				isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p2.isUniverseChat else nil,
				presetId = if fFlagExpChatPresetChatEnabled then p2.presetId else nil,
				presetChatVersion = if fFlagExpChatPresetChatEnabled then p2.presetChatVersion else nil
			}
		}),
		mockUserIdToPartOrModel = mockUserIdToPartOrModel,
		partOrModelToMockUserId = partOrModelToMockUserId,
		messagesBySenderId = if userId then dictionary.join(messagesBySenderId, {
			[userId] = list.append(messagesBySenderId[userId] or {}, {
				userId = userId,
				prefixText = p2.prefixText,
				text = p2.text,
				translation = p2.translation,
				useTranslation = p2.useTranslation,
				messageId = messageId,
				status = p2.status,
				timestamp = p2.timestamp,
				isVisibleInBubbleChat = p2.isVisibleInBubbleChat,
				isVisibleInChatWindow = p2.isVisibleInChatWindow,
				partOrModel = partOrModel,
				shouldOverrideBubbleChatSettings = p2.shouldOverrideBubbleChatSettings,
				bubbleChatMessageProperties = p2.bubbleChatMessageProperties,
				chatWindowMessageProperties = p2.chatWindowMessageProperties,
				textChannel = p2.textChannel,
				textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p2.textChatMessageInstance else nil,
				wasRewritten = wasRewritten,
				originalText = originalText,
				chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p2.chatActionType else nil,
				isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p2.isUniverseChat else nil,
				presetId = if fFlagExpChatPresetChatEnabled then p2.presetId else nil,
				presetChatVersion = if fFlagExpChatPresetChatEnabled then p2.presetChatVersion else nil
			})
		}) else nil
	})
end

local function mapByMessageIdInOrder(p1, p2)
	-- upvalues: fFlagEnableInExpChatRewriteModule (ref), getTextAndTranslationModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), outgoingMessageSentModule (ref), playersService (ref), fFlagExpChatPresetChatEnabled (ref), set (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatDisableUniverseBubbleChat (ref), getFFlagTextChatEnableUniverseChatTabs (ref), computeNameColor (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagChatLineReportingGlobalMuteEnabled (ref), mapByMessageIdInOrderHelper (ref)
	local var1, var2
	local textChatMessage = p2.textChatMessage
	local _ = nil
	local _ = nil
	
	if fFlagEnableInExpChatRewriteModule then
		local var3, var4 = getTextAndTranslationModule(textChatMessage)
		var1 = var3
		var2 = var4
	else
		var1 = if getFFlagExpChatProtectedChatInternalAPIs() then textChatMessage.TextInternal else textChatMessage.Text
		var2 = if getFFlagExpChatProtectedChatInternalAPIs() then textChatMessage.TranslationInternal else textChatMessage.Translation
	end
	local var5
	local var6 = if textChatMessage.TextSource then tostring(textChatMessage.TextSource.UserId) elseif fFlagExpChatFixLocalUserVerifiedBadgeModule and p2.type == outgoingMessageSentModule.name and playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
	local _ = nil
	
	if var6 == nil then
		var5 = true
	elseif not p1.canLocalUserChat and (not fFlagExpChatPresetChatEnabled or (textChatMessage.PresetId or "") == "") then
		var5 = false
	elseif textChatMessage.Status ~= Enum.TextChatMessageStatus.Success then
		var5 = textChatMessage.Status ~= Enum.TextChatMessageStatus.Sending
	end
	local var7 = var5 and not (if var6 then set.has(p1._mutedUserIds, var6) else false)
	var7 = false
	
	if (if fFlagExpChatUseChatConfigStore then getChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false) else p1.isBubbleChatEnabled) and var7 and (not fFlagEnableInExpChatSummaryOnLuaModule or var6 ~= nil) and (textChatMessage.Status == Enum.TextChatMessageStatus.Success or textChatMessage.Status == Enum.TextChatMessageStatus.Sending) then
		var7 = true
	end
	if fFlagExpChatDisableUniverseBubbleChat and getFFlagTextChatEnableUniverseChatTabs() and p2.isUniverseChat == true then
		var7 = false
	end
	local var8 = if getFFlagExpChatProtectedChatInternalAPIs() then textChatMessage.PrefixTextInternal else textChatMessage.PrefixText
	
	if getFFlagTextChatEnableUniverseChatTabs() and p2.channelNameOverride and #var8 > 0 then
		var8 = `<font color="#{(if textChatMessage.TextSource then computeNameColor(textChatMessage.TextSource.Username) else computeNameColor(playersService.LocalPlayer.Name)):ToHex()}">{var8}</font>`
	end
	return mapByMessageIdInOrderHelper(p1, {
		userId = var6,
		prefixText = var8,
		text = var1,
		translation = var2,
		useTranslation = getChatTranslationEnabled(),
		textChannel = textChatMessage.TextChannel,
		messageId = textChatMessage.MessageId,
		status = textChatMessage.Status,
		timestamp = textChatMessage.Timestamp,
		isVisibleInBubbleChat = var7,
		isVisibleInChatWindow = var7,
		bubbleChatMessageProperties = textChatMessage.BubbleChatMessageProperties,
		chatWindowMessageProperties = textChatMessage.ChatWindowMessageProperties,
		textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then textChatMessage else nil,
		wasRewritten = if fFlagEnableInExpChatRewriteModule then textChatMessage.WasRewritten else nil,
		originalText = if fFlagEnableInExpChatRewriteModule then textChatMessage.OriginalText else nil,
		chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then textChatMessage.ChatActionType else nil,
		isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p2.isUniverseChat else nil,
		presetId = if fFlagExpChatPresetChatEnabled then textChatMessage.PresetId else nil,
		presetChatVersion = if fFlagExpChatPresetChatEnabled then textChatMessage.PresetChatVersion else nil
	}, if getFFlagTextChatEnableUniverseChatTabs() then p2.channelNameOverride else nil)
end

return roduxModule.createReducer(t, {
	[channelTabsConfigurationEnabledModule.name] = function(p1, p2)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), dictionary (ref)
		return if getFFlagTextChatEnableUniverseChatTabs() then dictionary.join(p1, { channelTabsConfigurationEnabled = p2.enabled }) else p1
	end,
	[incomingMessageReceivedModule.name] = mapByMessageIdInOrder,
	[incomingBubbleChatMessageReceivedModule.name] = function(p1, p2)
		-- upvalues: mapByMessageIdInOrderHelper (ref)
		local bubbleChatMessageTable = p2.bubbleChatMessageTable
		
		return mapByMessageIdInOrderHelper(p1, {
			prefixText = "",
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			userId = bubbleChatMessageTable.bubbleChatMessageUserId,
			text = bubbleChatMessageTable.message,
			translation = bubbleChatMessageTable.translation,
			useTranslation = getChatTranslationEnabled(),
			messageId = bubbleChatMessageTable.bubbleChatMessageId,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = bubbleChatMessageTable.timestamp,
			partOrModel = bubbleChatMessageTable.partOrModel,
			bubbleChatMessageProperties = bubbleChatMessageTable.bubbleChatMessageProperties
		})
	end,
	[outgoingMessageSentModule.name] = mapByMessageIdInOrder,
	[userMuted.name] = function(p1, p2)
		-- upvalues: dictionary (ref), set (ref)
		return dictionary.join(p1, { _mutedUserIds = set.add(p1._mutedUserIds, p2.userId) })
	end,
	[userUnmuted.name] = function(p1, p2)
		-- upvalues: dictionary (ref), set (ref)
		return dictionary.join(p1, {
			_mutedUserIds = set.subtract(p1._mutedUserIds, p2.userId)
		})
	end,
	[playerRemoved.name] = function(p1, p2)
		-- upvalues: dictionary (ref), set (ref)
		local var1 = dictionary.filter(p1.messagesBySenderId, function(_, p3)
			-- upvalues: p2 (ref)
			return p3 ~= p2.userId
		end)
		
		return if #dictionary.filter(p1.bubbleMessagesInOrderBySenderId, function(_, p3)
			-- upvalues: p2 (ref)
			return p3 ~= p2.userId
		end) == 0 and #var1 == 0 and not set.has(p1._mutedUserIds, p2.userId) then p1 else dictionary.join(p1, {
			messagesBySenderId = var1,
			_mutedUserIds = set.subtract(p1._mutedUserIds, p2.userId)
		})
	end,
	[chatPrivacySettingsReceivedModule.name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { canLocalUserChat = p2.canUserChat })
	end,
	[chatPrivacySettingsFetchFailedModule.name] = function(p1, _)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { canLocalUserChat = false })
	end,
	[configurationObjectsLoadedModule.name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			isBubbleChatEnabled = if p2.bubbleChatSettings.Enabled then p2.bubbleChatSettings.Enabled else false
		})
	end,
	[bubbleChatSettingsChangedModule.name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return if p2.property == "Enabled" then dictionary.join(p1, {
			byMessageId = dictionary.map(p1.byMessageId, function(p3)
				-- upvalues: dictionary (copy), p2 (ref)
				return if p3.shouldOverrideBubbleChatSettings then p3 else dictionary.join(p3, {
					isVisibleInBubbleChat = p2.value and p3.isVisibleInChatWindow
				})
			end),
			isBubbleChatEnabled = p2.value
		}) else p1
	end,
	[chatWindowMessagesCleared.name] = function(p1, _)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			windowMessagesInOrder = {},
			windowMessagesInOrderByTabId = {},
			byMessageId = dictionary.map(p1.byMessageId, function(p2)
				-- upvalues: dictionary (copy)
				return dictionary.join(p2, { isVisibleInChatWindow = false })
			end)
		})
	end,
	[chatTranslationGlobalToggledModule.name] = function(p1, p2)
		-- upvalues: getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPresetChatEnabled (ref), dictionary (ref)
		local useTranslation = p2.useTranslation
		local byMessageId = p1.byMessageId
		local t = {}
		
		for i, v in pairs(byMessageId) do
			local var1 = byMessageId[i]
			
			if var1 ~= nil then
				t[i] = {
					prefixText = var1.prefixText,
					text = var1.text,
					translation = var1.translation,
					useTranslation = useTranslation,
					messageId = var1.messageId,
					status = var1.status,
					timestamp = var1.timestamp,
					isVisibleInBubbleChat = var1.isVisibleInBubbleChat,
					isVisibleInChatWindow = var1.isVisibleInChatWindow,
					partOrModel = var1.partOrModel,
					shouldOverrideBubbleChatSettings = var1.shouldOverrideBubbleChatSettings,
					bubbleChatMessageProperties = var1.bubbleChatMessageProperties,
					chatWindowMessageProperties = var1.chatWindowMessageProperties,
					userId = var1.userId,
					textChannel = var1.textChannel,
					textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then var1.textChatMessageInstance else nil,
					wasRewritten = if fFlagEnableInExpChatRewriteModule then var1.wasRewritten else nil,
					originalText = if fFlagEnableInExpChatRewriteModule then var1.originalText else nil,
					chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then var1.chatActionType else nil,
					presetId = if fFlagExpChatPresetChatEnabled then var1.presetId else nil,
					presetChatVersion = if fFlagExpChatPresetChatEnabled then var1.presetChatVersion else nil
				}
			end
		end
		return dictionary.join(p1, { byMessageId = dictionary.join(byMessageId, t) })
	end,
	[chatTranslationMessageToggledModule.name] = function(p3, p4)
		-- upvalues: dictionary (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPresetChatEnabled (ref)
		local useTranslation = p4.useTranslation
		local messageId = p4.messageId
		local byMessageId = p3.byMessageId
		local var2 = byMessageId[messageId]
		
		return if var2 == nil then nil else dictionary.join(p3, {
			byMessageId = dictionary.join(byMessageId, {
				[messageId] = {
					prefixText = var2.prefixText,
					text = var2.text,
					translation = var2.translation,
					useTranslation = useTranslation,
					messageId = var2.messageId,
					status = var2.status,
					timestamp = var2.timestamp,
					isVisibleInBubbleChat = var2.isVisibleInBubbleChat,
					isVisibleInChatWindow = var2.isVisibleInChatWindow,
					partOrModel = var2.partOrModel,
					shouldOverrideBubbleChatSettings = var2.shouldOverrideBubbleChatSettings,
					bubbleChatMessageProperties = var2.bubbleChatMessageProperties,
					chatWindowMessageProperties = var2.chatWindowMessageProperties,
					userId = var2.userId,
					textChannel = var2.textChannel,
					textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then var2.textChatMessageInstance else nil,
					wasRewritten = if fFlagEnableInExpChatRewriteModule then var2.wasRewritten else nil,
					originalText = if fFlagEnableInExpChatRewriteModule then var2.originalText else nil,
					chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then var2.chatActionType else nil,
					presetId = if fFlagExpChatPresetChatEnabled then var2.presetId else nil,
					presetChatVersion = if fFlagExpChatPresetChatEnabled then var2.presetChatVersion else nil
				}
			})
		})
	end,
	[legacyBubbleCreatedModule.name] = function(p3, p4)
		-- upvalues: mapByMessageIdInOrderHelper (ref)
		local messageData = p4.messageData
		
		return mapByMessageIdInOrderHelper(p3, {
			prefixText = "",
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			userId = messageData.userId,
			text = messageData.text,
			messageId = messageData.id,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = if messageData.timestamp then DateTime.fromUnixTimestampMillis(messageData.timestamp) else DateTime.now(),
			partOrModel = messageData.adornee
		})
	end,
	[legacyBubbleTextUpdatedModule.name] = function(p3, p4)
		-- upvalues: dictionary (ref), list (ref)
		local byMessageId = p3.byMessageId
		local messagesBySenderId = p3.messagesBySenderId
		local messageId = p4.messageId
		local newText = p4.newText
		
		if byMessageId[messageId] then
			local var2 = byMessageId[messageId]
			var2.text = newText
			byMessageId = dictionary.join(byMessageId, { [messageId] = var2 })
			local userId = var2.userId
			
			if userId and messagesBySenderId[userId] then
				local var3 = list.findWhere(messagesBySenderId[userId], function(p5, _)
					-- upvalues: messageId (ref)
					return p5.messageId == messageId
				end)
				
				if var3 and var3 > 0 then
					messagesBySenderId = dictionary.join(messagesBySenderId, {
						[userId] = list.set(messagesBySenderId[userId], var3, var2)
					})
				end
			end
		end
		return dictionary.join(p3, {
			byMessageId = byMessageId,
			messagesBySenderId = messagesBySenderId
		})
	end,
	[hiddenMessageReceivedModule.name] = function(p3, p4)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), fIntExpChatRandomCharChangeLowerBoundModule (ref), fIntExpChatRandomCharChangeUpperBoundModule (ref), configModule (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), mapByMessageIdInOrderHelper (ref)
		local userMessageIntent = p4.userMessageIntent
		local var2 = string.len(if getFFlagExpChatProtectedChatInternalAPIs() then userMessageIntent.TextInternal else userMessageIntent.Text)
		
		return mapByMessageIdInOrderHelper(p3, {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = configModule.LOCK_EMOJI .. " :",
			text = string.rep(configModule.DOT_TEXT, var2 + math.random(math.max(fIntExpChatRandomCharChangeLowerBoundModule, -(var2 - 1)), fIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = userMessageIntent.TextChannel,
			messageId = userMessageIntent.MessageId,
			status = userMessageIntent.Status,
			timestamp = userMessageIntent.Timestamp,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then userMessageIntent else nil
		})
	end,
	[universeChatSystemMessageAddedModule.name] = function(p3, p4)
		-- upvalues: httpService (ref), sanitizeForRichTextModule (ref), getFFlagExpChatSyntheticSystemMessageRichText (ref), generateRichSystemMessageTextFormatModule (ref), fFlagExpChatDictation (ref), mapByMessageIdInOrderHelper (ref), getFFlagTextChatEnableUniverseChatTabs (ref)
		local var2 = sanitizeForRichTextModule(p4.text)
		
		return mapByMessageIdInOrderHelper(p3, {
			userId = nil,
			prefixText = "",
			translation = nil,
			useTranslation = false,
			isVisibleInChatWindow = true,
			isVisibleInBubbleChat = false,
			textChannel = nil,
			bubbleChatMessageProperties = nil,
			chatWindowMessageProperties = nil,
			textChatMessageInstance = nil,
			partOrModel = nil,
			text = if getFFlagExpChatSyntheticSystemMessageRichText() then generateRichSystemMessageTextFormatModule(var2, if fFlagExpChatDictation then p4.isError else nil, p4.postProcessMessage) else var2,
			messageId = httpService:GenerateGUID(false),
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			metadata = p4.metadata
		}, if getFFlagTextChatEnableUniverseChatTabs() then p4.channelNameOverride else nil)
	end,
	[hiddenMessagesClearedModule.name] = function(p3, _)
		-- upvalues: fFlagExpChatClearHiddenMessagesPostAgeCheckModule (ref), dictionary (ref), list (ref)
		if fFlagExpChatClearHiddenMessagesPostAgeCheckModule then
			local var2 = dictionary.map(p3.byMessageId, function(p4)
				-- upvalues: dictionary (copy)
				return if p4.isHiddenMessage then dictionary.join(p4, { isVisibleInChatWindow = false }) else p4
			end)
			
			return dictionary.join(p3, {
				windowMessagesInOrder = list.filter(p3.windowMessagesInOrder, function(p4)
					-- upvalues: var2 (ref)
					local var3 = var2[p4]
					
					return var3 and not var3.isHiddenMessage
				end),
				windowMessagesInOrderByTabId = dictionary.map(p3.windowMessagesInOrderByTabId, function(p4)
					-- upvalues: list (copy), var2 (ref)
					return list.filter(p4, function(p5)
						-- upvalues: var2 (copy)
						local var3 = var2[p5]
						
						return var3 and not var3.isHiddenMessage
					end)
				end),
				byMessageId = var2
			})
		end
		return p3
	end
})