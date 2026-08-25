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

local function resolveChannelNameForMapOrder(p0, p1, p2)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), none (ref)
	return if getFFlagTextChatEnableUniverseChatTabs() then p2 or (if p1.textChannel then if p1.textChannel.Name == "RBXSystem" or not p0.channelTabsConfigurationEnabled then "RBXGeneral" else p1.textChannel.Name else none) elseif p1.textChannel then if p1.textChannel.Name == "RBXSystem" then "RBXGeneral" else p1.textChannel.Name else none
end

local function mapByMessageIdInOrderHelper(p3, p4, p5)
	-- upvalues: isWhiteSpaceOnlyModule (ref), resolveChannelNameForMapOrder (ref), httpService (ref), dictionary (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagExpChatDictation (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagChatLineReportingGlobalMuteEnabled (ref), fFlagExpChatPresetChatEnabled (ref), list (ref), fFlagExpChatEnableFOMOUpsellModule (ref), getFFlagExpChatExcludeFOMORendersModule (ref)
	if isWhiteSpaceOnlyModule(p4.text) and p4.status ~= Enum.TextChatMessageStatus.Floodchecked and p4.status ~= Enum.TextChatMessageStatus.MessageTooLong then
		return p3
	end
	local partOrModel = p4.partOrModel
	local userId = p4.userId
	local messageId = p4.messageId
	local var42 = resolveChannelNameForMapOrder(p3, p4, p5)
	local windowMessagesInOrder = p3.windowMessagesInOrder
	local var43 = p3.windowMessagesInOrderByTabId[var42] or {}
	local byMessageId = p3.byMessageId
	local bubbleMessagesInOrderBySenderId = p3.bubbleMessagesInOrderBySenderId
	local mockUserIdToPartOrModel = p3.mockUserIdToPartOrModel
	local partOrModelToMockUserId = p3.partOrModelToMockUserId
	local messagesBySenderId = p3.messagesBySenderId
	
	if not userId and partOrModel then
		userId = partOrModelToMockUserId[partOrModel]
		
		if not userId then
			userId = httpService:GenerateGUID(false)
			mockUserIdToPartOrModel = dictionary.join(mockUserIdToPartOrModel, { [userId] = partOrModel })
			partOrModelToMockUserId = dictionary.join(partOrModelToMockUserId, { [partOrModel] = userId })
		end
	end
	local var47
	local wasRewritten = nil
	local originalText = nil
	
	if fFlagEnableInExpChatRewriteModule then
		wasRewritten = p4.wasRewritten
		originalText = p4.originalText
	end
	if byMessageId[messageId] then
		local t = {
			userId = userId,
			prefixText = p4.prefixText,
			text = p4.text,
			translation = p4.translation,
			useTranslation = p4.useTranslation,
			textChannel = p4.textChannel,
			messageId = messageId,
			status = p4.status,
			timestamp = p4.timestamp,
			isVisibleInBubbleChat = p4.isVisibleInBubbleChat,
			isVisibleInChatWindow = p4.isVisibleInChatWindow,
			shouldOverrideBubbleChatSettings = p4.shouldOverrideBubbleChatSettings,
			bubbleChatMessageProperties = p4.bubbleChatMessageProperties,
			chatWindowMessageProperties = p4.chatWindowMessageProperties,
			metadata = if fFlagExpChatDictation then p4.metadata else nil,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p4.textChatMessageInstance else nil,
			wasRewritten = wasRewritten,
			originalText = originalText,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p4.chatActionType else nil,
			isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p4.isUniverseChat else nil,
			presetId = if fFlagExpChatPresetChatEnabled then p4.presetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then p4.presetChatVersion else nil
		}
		byMessageId = dictionary.join(byMessageId, { [messageId] = t })
		
		if userId and messagesBySenderId[userId] then
			local var45 = list.findWhere(messagesBySenderId[userId], function(p6, _)
				-- upvalues: messageId (ref)
				return p6.messageId == messageId
			end)
			
			if var45 and var45 > 0 then
				messagesBySenderId = dictionary.join(messagesBySenderId, {
					[userId] = list.set(messagesBySenderId[userId], var45, t)
				})
			end
		end
		if p4.status == Enum.TextChatMessageStatus.Floodchecked or p4.status == Enum.TextChatMessageStatus.MessageTooLong then
			windowMessagesInOrder = list.removeIndex(windowMessagesInOrder, list.count(windowMessagesInOrder))
			var43 = list.removeIndex(var43, list.count(var43))
			byMessageId = dictionary.removeKey(byMessageId, p4.messageId)
			
			if userId then
				local var46 = list.findWhere(messagesBySenderId[userId], function(p7, _)
					-- upvalues: messageId (ref)
					return p7.messageId == messageId
				end)
				
				if var46 and var46 > 0 then
					messagesBySenderId = dictionary.join(messagesBySenderId, {
						[userId] = list.removeIndex(messagesBySenderId[userId], var46)
					})
				end
			end
		end
		return dictionary.join(p3, {
			windowMessagesInOrder = windowMessagesInOrder,
			windowMessagesInOrderByTabId = dictionary.join(p3.windowMessagesInOrderByTabId, { [var42] = var43 }),
			byMessageId = byMessageId,
			messagesBySenderId = messagesBySenderId
		})
	elseif #windowMessagesInOrder == p3.messageLimit and p4.isVisibleInChatWindow then
		var47 = windowMessagesInOrder[1]
		local var48 = if byMessageId[var47] then byMessageId[var47].userId else nil
		windowMessagesInOrder = list.removeIndex(windowMessagesInOrder, 1)
		
		if var48 then
			if messagesBySenderId ~= nil and messagesBySenderId[var48] then
				local var49 = list.findWhere(messagesBySenderId[var48], function(p8, _)
					-- upvalues: var47 (write)
					return p8.messageId == var47
				end)
				
				if var49 and var49 > 0 then
					messagesBySenderId = dictionary.join(messagesBySenderId, {
						[var48] = list.removeIndex(messagesBySenderId[var48], var49)
					})
				end
				if dictionary.count(messagesBySenderId[var48]) == 0 then
					messagesBySenderId = dictionary.removeKey(messagesBySenderId, var48)
					
					if mockUserIdToPartOrModel[var48] then
						local var50 = mockUserIdToPartOrModel[var48]
						
						if partOrModelToMockUserId[var50] then
							partOrModelToMockUserId = dictionary.removeKey(partOrModelToMockUserId, var50)
						end
						mockUserIdToPartOrModel = dictionary.removeKey(mockUserIdToPartOrModel, var48)
					end
				end
			elseif bubbleMessagesInOrderBySenderId ~= nil and bubbleMessagesInOrderBySenderId[var48] then
				bubbleMessagesInOrderBySenderId = dictionary.join(bubbleMessagesInOrderBySenderId, {
					[var48] = list.removeValue(bubbleMessagesInOrderBySenderId[var48], var47)
				})
				
				if dictionary.count(bubbleMessagesInOrderBySenderId[var48]) == 0 then
					bubbleMessagesInOrderBySenderId = dictionary.removeKey(bubbleMessagesInOrderBySenderId, var48)
					
					if mockUserIdToPartOrModel[var48] then
						local var51 = mockUserIdToPartOrModel[var48]
						
						if partOrModelToMockUserId[var51] then
							partOrModelToMockUserId = dictionary.removeKey(partOrModelToMockUserId, var51)
						end
						mockUserIdToPartOrModel = dictionary.removeKey(mockUserIdToPartOrModel, var48)
					end
				end
			end
		end
		if #var43 == p3.messageLimit then
			var47 = var43[1]
			var43 = list.removeIndex(var43, 1)
			byMessageId = dictionary.removeKey(byMessageId, var47)
		end
	end
	if p4.isVisibleInChatWindow then
		windowMessagesInOrder = list.append(windowMessagesInOrder, messageId)
		var43 = list.append(var43, messageId)
	end
	var47 = dictionary.join
	
	return var47(p3, {
		windowMessagesInOrder = windowMessagesInOrder,
		windowMessagesInOrderByTabId = dictionary.join(p3.windowMessagesInOrderByTabId, { [var42] = var43 }),
		byMessageId = dictionary.join(byMessageId, {
			[messageId] = {
				userId = userId,
				prefixText = p4.prefixText,
				text = p4.text,
				translation = p4.translation,
				useTranslation = p4.useTranslation,
				messageId = messageId,
				status = p4.status,
				timestamp = p4.timestamp,
				isVisibleInBubbleChat = p4.isVisibleInBubbleChat,
				isVisibleInChatWindow = p4.isVisibleInChatWindow,
				partOrModel = partOrModel,
				shouldOverrideBubbleChatSettings = p4.shouldOverrideBubbleChatSettings,
				bubbleChatMessageProperties = p4.bubbleChatMessageProperties,
				chatWindowMessageProperties = p4.chatWindowMessageProperties,
				textChannel = p4.textChannel,
				metadata = if fFlagExpChatDictation then p4.metadata else nil,
				textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p4.textChatMessageInstance else nil,
				isHiddenMessage = if fFlagExpChatEnableFOMOUpsellModule or getFFlagExpChatExcludeFOMORendersModule() then p4.isHiddenMessage else nil,
				wasRewritten = wasRewritten,
				originalText = originalText,
				chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p4.chatActionType else nil,
				isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p4.isUniverseChat else nil,
				presetId = if fFlagExpChatPresetChatEnabled then p4.presetId else nil,
				presetChatVersion = if fFlagExpChatPresetChatEnabled then p4.presetChatVersion else nil
			}
		}),
		mockUserIdToPartOrModel = mockUserIdToPartOrModel,
		partOrModelToMockUserId = partOrModelToMockUserId,
		messagesBySenderId = if userId then dictionary.join(messagesBySenderId, {
			[userId] = list.append(messagesBySenderId[userId] or {}, {
				userId = userId,
				prefixText = p4.prefixText,
				text = p4.text,
				translation = p4.translation,
				useTranslation = p4.useTranslation,
				messageId = messageId,
				status = p4.status,
				timestamp = p4.timestamp,
				isVisibleInBubbleChat = p4.isVisibleInBubbleChat,
				isVisibleInChatWindow = p4.isVisibleInChatWindow,
				partOrModel = partOrModel,
				shouldOverrideBubbleChatSettings = p4.shouldOverrideBubbleChatSettings,
				bubbleChatMessageProperties = p4.bubbleChatMessageProperties,
				chatWindowMessageProperties = p4.chatWindowMessageProperties,
				textChannel = p4.textChannel,
				textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p4.textChatMessageInstance else nil,
				wasRewritten = wasRewritten,
				originalText = originalText,
				chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p4.chatActionType else nil,
				isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p4.isUniverseChat else nil,
				presetId = if fFlagExpChatPresetChatEnabled then p4.presetId else nil,
				presetChatVersion = if fFlagExpChatPresetChatEnabled then p4.presetChatVersion else nil
			})
		}) else nil
	})
end

local function mapByMessageIdInOrder(p9, p10)
	-- upvalues: fFlagEnableInExpChatRewriteModule (ref), getTextAndTranslationModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), outgoingMessageSentModule (ref), playersService (ref), fFlagExpChatPresetChatEnabled (ref), set (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatDisableUniverseBubbleChat (ref), getFFlagTextChatEnableUniverseChatTabs (ref), computeNameColor (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagChatLineReportingGlobalMuteEnabled (ref), mapByMessageIdInOrderHelper (ref)
	local var54, var55
	local textChatMessage = p10.textChatMessage
	local _ = nil
	local _ = nil
	
	if fFlagEnableInExpChatRewriteModule then
		local var52, var53 = getTextAndTranslationModule(textChatMessage)
		var54 = var52
		var55 = var53
	else
		var54 = if getFFlagExpChatProtectedChatInternalAPIs() then textChatMessage.TextInternal else textChatMessage.Text
		var55 = if getFFlagExpChatProtectedChatInternalAPIs() then textChatMessage.TranslationInternal else textChatMessage.Translation
	end
	local var57
	local var56 = if textChatMessage.TextSource then tostring(textChatMessage.TextSource.UserId) elseif fFlagExpChatFixLocalUserVerifiedBadgeModule and p10.type == outgoingMessageSentModule.name and playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
	local _ = nil
	
	if var56 == nil then
		var57 = true
	elseif not p9.canLocalUserChat and (not fFlagExpChatPresetChatEnabled or (textChatMessage.PresetId or "") == "") then
		var57 = false
	elseif textChatMessage.Status ~= Enum.TextChatMessageStatus.Success then
		var57 = textChatMessage.Status ~= Enum.TextChatMessageStatus.Sending
	end
	local var58 = var57 and not (if var56 then set.has(p9._mutedUserIds, var56) else false)
	var58 = false
	
	if (if fFlagExpChatUseChatConfigStore then getChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false) else p9.isBubbleChatEnabled) and var58 and (not fFlagEnableInExpChatSummaryOnLuaModule or var56 ~= nil) and (textChatMessage.Status == Enum.TextChatMessageStatus.Success or textChatMessage.Status == Enum.TextChatMessageStatus.Sending) then
		var58 = true
	end
	if fFlagExpChatDisableUniverseBubbleChat and getFFlagTextChatEnableUniverseChatTabs() and p10.isUniverseChat == true then
		var58 = false
	end
	local var59 = if getFFlagExpChatProtectedChatInternalAPIs() then textChatMessage.PrefixTextInternal else textChatMessage.PrefixText
	
	if getFFlagTextChatEnableUniverseChatTabs() and p10.channelNameOverride and #var59 > 0 then
		var59 = `<font color="#{(if textChatMessage.TextSource then computeNameColor(textChatMessage.TextSource.Username) else computeNameColor(playersService.LocalPlayer.Name)):ToHex()}">{var59}</font>`
	end
	return mapByMessageIdInOrderHelper(p9, {
		userId = var56,
		prefixText = var59,
		text = var54,
		translation = var55,
		useTranslation = getChatTranslationEnabled(),
		textChannel = textChatMessage.TextChannel,
		messageId = textChatMessage.MessageId,
		status = textChatMessage.Status,
		timestamp = textChatMessage.Timestamp,
		isVisibleInBubbleChat = var58,
		isVisibleInChatWindow = var58,
		bubbleChatMessageProperties = textChatMessage.BubbleChatMessageProperties,
		chatWindowMessageProperties = textChatMessage.ChatWindowMessageProperties,
		textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then textChatMessage else nil,
		wasRewritten = if fFlagEnableInExpChatRewriteModule then textChatMessage.WasRewritten else nil,
		originalText = if fFlagEnableInExpChatRewriteModule then textChatMessage.OriginalText else nil,
		chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then textChatMessage.ChatActionType else nil,
		isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p10.isUniverseChat else nil,
		presetId = if fFlagExpChatPresetChatEnabled then textChatMessage.PresetId else nil,
		presetChatVersion = if fFlagExpChatPresetChatEnabled then textChatMessage.PresetChatVersion else nil
	}, if getFFlagTextChatEnableUniverseChatTabs() then p10.channelNameOverride else nil)
end

return roduxModule.createReducer(t, {
	[channelTabsConfigurationEnabledModule.name] = function(p11, p12)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), dictionary (ref)
		return if getFFlagTextChatEnableUniverseChatTabs() then dictionary.join(p11, { channelTabsConfigurationEnabled = p12.enabled }) else p11
	end,
	[incomingMessageReceivedModule.name] = mapByMessageIdInOrder,
	[incomingBubbleChatMessageReceivedModule.name] = function(p13, p14)
		-- upvalues: mapByMessageIdInOrderHelper (ref)
		local bubbleChatMessageTable = p14.bubbleChatMessageTable
		
		return mapByMessageIdInOrderHelper(p13, {
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
	[userMuted.name] = function(p15, p16)
		-- upvalues: dictionary (ref), set (ref)
		return dictionary.join(p15, { _mutedUserIds = set.add(p15._mutedUserIds, p16.userId) })
	end,
	[userUnmuted.name] = function(p17, p18)
		-- upvalues: dictionary (ref), set (ref)
		return dictionary.join(p17, {
			_mutedUserIds = set.subtract(p17._mutedUserIds, p18.userId)
		})
	end,
	[playerRemoved.name] = function(p19, p20)
		-- upvalues: dictionary (ref), set (ref)
		local var60 = dictionary.filter(p19.messagesBySenderId, function(_, p21)
			-- upvalues: p20 (ref)
			return p21 ~= p20.userId
		end)
		
		return if #dictionary.filter(p19.bubbleMessagesInOrderBySenderId, function(_, p22)
			-- upvalues: p20 (ref)
			return p22 ~= p20.userId
		end) == 0 and #var60 == 0 and not set.has(p19._mutedUserIds, p20.userId) then p19 else dictionary.join(p19, {
			messagesBySenderId = var60,
			_mutedUserIds = set.subtract(p19._mutedUserIds, p20.userId)
		})
	end,
	[chatPrivacySettingsReceivedModule.name] = function(p23, p24)
		-- upvalues: dictionary (ref)
		return dictionary.join(p23, { canLocalUserChat = p24.canUserChat })
	end,
	[chatPrivacySettingsFetchFailedModule.name] = function(p25, _)
		-- upvalues: dictionary (ref)
		return dictionary.join(p25, { canLocalUserChat = false })
	end,
	[configurationObjectsLoadedModule.name] = function(p26, p27)
		-- upvalues: dictionary (ref)
		return dictionary.join(p26, {
			isBubbleChatEnabled = if p27.bubbleChatSettings.Enabled then p27.bubbleChatSettings.Enabled else false
		})
	end,
	[bubbleChatSettingsChangedModule.name] = function(p28, p29)
		-- upvalues: dictionary (ref)
		return if p29.property == "Enabled" then dictionary.join(p28, {
			byMessageId = dictionary.map(p28.byMessageId, function(p30)
				-- upvalues: dictionary (copy), p29 (ref)
				return if p30.shouldOverrideBubbleChatSettings then p30 else dictionary.join(p30, {
					isVisibleInBubbleChat = p29.value and p30.isVisibleInChatWindow
				})
			end),
			isBubbleChatEnabled = p29.value
		}) else p28
	end,
	[chatWindowMessagesCleared.name] = function(p31, _)
		-- upvalues: dictionary (ref)
		return dictionary.join(p31, {
			windowMessagesInOrder = {},
			windowMessagesInOrderByTabId = {},
			byMessageId = dictionary.map(p31.byMessageId, function(p32)
				-- upvalues: dictionary (copy)
				return dictionary.join(p32, { isVisibleInChatWindow = false })
			end)
		})
	end,
	[chatTranslationGlobalToggledModule.name] = function(p33, p34)
		-- upvalues: getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPresetChatEnabled (ref), dictionary (ref)
		local useTranslation = p34.useTranslation
		local byMessageId = p33.byMessageId
		local t = {}
		
		for i, v in pairs(byMessageId) do
			local var62 = byMessageId[i]
			
			if var62 ~= nil then
				t[i] = {
					prefixText = var62.prefixText,
					text = var62.text,
					translation = var62.translation,
					useTranslation = useTranslation,
					messageId = var62.messageId,
					status = var62.status,
					timestamp = var62.timestamp,
					isVisibleInBubbleChat = var62.isVisibleInBubbleChat,
					isVisibleInChatWindow = var62.isVisibleInChatWindow,
					partOrModel = var62.partOrModel,
					shouldOverrideBubbleChatSettings = var62.shouldOverrideBubbleChatSettings,
					bubbleChatMessageProperties = var62.bubbleChatMessageProperties,
					chatWindowMessageProperties = var62.chatWindowMessageProperties,
					userId = var62.userId,
					textChannel = var62.textChannel,
					textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then var62.textChatMessageInstance else nil,
					wasRewritten = if fFlagEnableInExpChatRewriteModule then var62.wasRewritten else nil,
					originalText = if fFlagEnableInExpChatRewriteModule then var62.originalText else nil,
					chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then var62.chatActionType else nil,
					presetId = if fFlagExpChatPresetChatEnabled then var62.presetId else nil,
					presetChatVersion = if fFlagExpChatPresetChatEnabled then var62.presetChatVersion else nil
				}
			end
		end
		return dictionary.join(p33, { byMessageId = dictionary.join(byMessageId, t) })
	end,
	[chatTranslationMessageToggledModule.name] = function(p35, p36)
		-- upvalues: dictionary (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPresetChatEnabled (ref)
		local useTranslation = p36.useTranslation
		local messageId = p36.messageId
		local byMessageId = p35.byMessageId
		local var63 = byMessageId[messageId]
		
		return if var63 == nil then nil else dictionary.join(p35, {
			byMessageId = dictionary.join(byMessageId, {
				[messageId] = {
					prefixText = var63.prefixText,
					text = var63.text,
					translation = var63.translation,
					useTranslation = useTranslation,
					messageId = var63.messageId,
					status = var63.status,
					timestamp = var63.timestamp,
					isVisibleInBubbleChat = var63.isVisibleInBubbleChat,
					isVisibleInChatWindow = var63.isVisibleInChatWindow,
					partOrModel = var63.partOrModel,
					shouldOverrideBubbleChatSettings = var63.shouldOverrideBubbleChatSettings,
					bubbleChatMessageProperties = var63.bubbleChatMessageProperties,
					chatWindowMessageProperties = var63.chatWindowMessageProperties,
					userId = var63.userId,
					textChannel = var63.textChannel,
					textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then var63.textChatMessageInstance else nil,
					wasRewritten = if fFlagEnableInExpChatRewriteModule then var63.wasRewritten else nil,
					originalText = if fFlagEnableInExpChatRewriteModule then var63.originalText else nil,
					chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then var63.chatActionType else nil,
					presetId = if fFlagExpChatPresetChatEnabled then var63.presetId else nil,
					presetChatVersion = if fFlagExpChatPresetChatEnabled then var63.presetChatVersion else nil
				}
			})
		})
	end,
	[legacyBubbleCreatedModule.name] = function(p37, p38)
		-- upvalues: mapByMessageIdInOrderHelper (ref)
		local messageData = p38.messageData
		
		return mapByMessageIdInOrderHelper(p37, {
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
	[legacyBubbleTextUpdatedModule.name] = function(p39, p40)
		-- upvalues: dictionary (ref), list (ref)
		local byMessageId = p39.byMessageId
		local messagesBySenderId = p39.messagesBySenderId
		local messageId = p40.messageId
		local newText = p40.newText
		
		if byMessageId[messageId] then
			local var64 = byMessageId[messageId]
			var64.text = newText
			byMessageId = dictionary.join(byMessageId, { [messageId] = var64 })
			local userId = var64.userId
			
			if userId and messagesBySenderId[userId] then
				local var65 = list.findWhere(messagesBySenderId[userId], function(p41, _)
					-- upvalues: messageId (ref)
					return p41.messageId == messageId
				end)
				
				if var65 and var65 > 0 then
					messagesBySenderId = dictionary.join(messagesBySenderId, {
						[userId] = list.set(messagesBySenderId[userId], var65, var64)
					})
				end
			end
		end
		return dictionary.join(p39, {
			byMessageId = byMessageId,
			messagesBySenderId = messagesBySenderId
		})
	end,
	[hiddenMessageReceivedModule.name] = function(p42, p43)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), fIntExpChatRandomCharChangeLowerBoundModule (ref), fIntExpChatRandomCharChangeUpperBoundModule (ref), configModule (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), mapByMessageIdInOrderHelper (ref)
		local userMessageIntent = p43.userMessageIntent
		local var66 = string.len(if getFFlagExpChatProtectedChatInternalAPIs() then userMessageIntent.TextInternal else userMessageIntent.Text)
		
		return mapByMessageIdInOrderHelper(p42, {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = configModule.LOCK_EMOJI .. " :",
			text = string.rep(configModule.DOT_TEXT, var66 + math.random(math.max(fIntExpChatRandomCharChangeLowerBoundModule, -(var66 - 1)), fIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = userMessageIntent.TextChannel,
			messageId = userMessageIntent.MessageId,
			status = userMessageIntent.Status,
			timestamp = userMessageIntent.Timestamp,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then userMessageIntent else nil
		})
	end,
	[universeChatSystemMessageAddedModule.name] = function(p44, p45)
		-- upvalues: httpService (ref), sanitizeForRichTextModule (ref), getFFlagExpChatSyntheticSystemMessageRichText (ref), generateRichSystemMessageTextFormatModule (ref), fFlagExpChatDictation (ref), mapByMessageIdInOrderHelper (ref), getFFlagTextChatEnableUniverseChatTabs (ref)
		local var67 = sanitizeForRichTextModule(p45.text)
		
		return mapByMessageIdInOrderHelper(p44, {
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
			text = if getFFlagExpChatSyntheticSystemMessageRichText() then generateRichSystemMessageTextFormatModule(var67, if fFlagExpChatDictation then p45.isError else nil, p45.postProcessMessage) else var67,
			messageId = httpService:GenerateGUID(false),
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			metadata = p45.metadata
		}, if getFFlagTextChatEnableUniverseChatTabs() then p45.channelNameOverride else nil)
	end,
	[hiddenMessagesClearedModule.name] = function(p46, _)
		-- upvalues: fFlagExpChatClearHiddenMessagesPostAgeCheckModule (ref), dictionary (ref), list (ref)
		if fFlagExpChatClearHiddenMessagesPostAgeCheckModule then
			local var68 = dictionary.map(p46.byMessageId, function(p47)
				-- upvalues: dictionary (copy)
				return if p47.isHiddenMessage then dictionary.join(p47, { isVisibleInChatWindow = false }) else p47
			end)
			
			return dictionary.join(p46, {
				windowMessagesInOrder = list.filter(p46.windowMessagesInOrder, function(p48)
					-- upvalues: var68 (ref)
					local var69 = var68[p48]
					
					return var69 and not var69.isHiddenMessage
				end),
				windowMessagesInOrderByTabId = dictionary.map(p46.windowMessagesInOrderByTabId, function(p49)
					-- upvalues: list (copy), var68 (ref)
					return list.filter(p49, function(p50)
						-- upvalues: var68 (copy)
						local var70 = var68[p50]
						
						return var70 and not var70.isHiddenMessage
					end)
				end),
				byMessageId = var68
			})
		end
		return p46
	end
})