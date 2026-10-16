local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ShouldRenderTextChannelInDefaultWindowFunction = ExpChatSharedModule.shouldRenderTextChannelInDefaultWindow
local GetTextChannelDisplayModeFunction = ExpChatSharedModule.getTextChannelDisplayMode
local RoduxModule = require(Parent.Rodux)
local LlamaModule = require(Parent.llama)
local List = LlamaModule.List
local Dictionary = LlamaModule.Dictionary
local Set = LlamaModule.Set
local None = LlamaModule.None
local IsWhiteSpaceOnlyModule = require(ExpChat.isWhiteSpaceOnly)
local SanitizeForRichTextModule = require(ExpChat.sanitizeForRichText)
local GenerateRichSystemMessageTextFormatModule = require(ExpChat.generateRichSystemMessageTextFormat)
local ConfigModule = require(ExpChat.Config)
local _ = require(ExpChat.TextChatMessageChatActionType)
local Actions = ExpChat.Actions
local IncomingMessageReceivedModule = require(Actions.IncomingMessageReceived)
local UniverseChatSystemMessageAddedModule = require(Actions.UniverseChatSystemMessageAdded)
local IncomingBubbleChatMessageReceivedModule = require(Actions.IncomingBubbleChatMessageReceived)
local OutgoingMessageSentModule = require(Actions.OutgoingMessageSent)
local UserMuted = ExpChatSharedModule.Actions.UserMuted
local UserUnmuted = ExpChatSharedModule.Actions.UserUnmuted
local PlayerRemoved = ExpChatSharedModule.Actions.PlayerRemoved
local ChatPrivacySettingsReceivedModule = require(Actions.ChatPrivacySettingsReceived)
local ChatPrivacySettingsFetchFailedModule = require(Actions.ChatPrivacySettingsFetchFailed)
local ConfigurationObjectsLoadedModule = require(Actions.ConfigurationObjectsLoaded)
local BubbleChatSettingsChangedModule = require(Actions.BubbleChatSettingsChanged)
local ChatWindowMessagesCleared = ExpChatSharedModule.Actions.ChatWindowMessagesCleared
local ChatTranslationGlobalToggledModule = require(Actions.ChatTranslationGlobalToggled)
local ChatTranslationMessageToggledModule = require(ExpChat.Actions.ChatTranslationMessageToggled)
local LegacyBubbleCreatedModule = require(ExpChat.Actions.LegacyBubbleCreated)
local LegacyBubbleTextUpdatedModule = require(ExpChat.Actions.LegacyBubbleTextUpdated)
local HiddenMessageReceivedModule = require(ExpChat.Actions.HiddenMessageReceived)
local HiddenMessagesClearedModule = require(ExpChat.Actions.HiddenMessagesCleared)
local GetFFlagExpChatTelemetryEventTriggerModule = require(ExpChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local FFlagExpChatEnableFOMOUpsellModule = require(ExpChat.Flags.FFlagExpChatEnableFOMOUpsell)
local FFlagExpChatClearHiddenMessagesPostAgeCheckModule = require(ExpChat.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local FIntExpChatRandomCharChangeLowerBoundModule = require(ExpChat.Flags.FIntExpChatRandomCharChangeLowerBound)
local FIntExpChatRandomCharChangeUpperBoundModule = require(ExpChat.Flags.FIntExpChatRandomCharChangeUpperBound)
local FFlagEnableInExpChatRewriteModule = require(ExpChat.Flags.FFlagEnableInExpChatRewrite)
local FFlagEnableInExpChatSummaryOnLuaModule = require(ExpChat.Flags.FFlagEnableInExpChatSummaryOnLua)
local FFlagExpChatFixLocalUserVerifiedBadgeModule = require(ExpChat.Flags.FFlagExpChatFixLocalUserVerifiedBadge)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagExpChatProtectedChatInternalAPIsFunction = SharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagExpChatDictation = SharedFlagsModule.FFlagExpChatDictation
local GetChatConfigurationStoreModule = require(ExpChat.Stores.GetChatConfigurationStore)
local ComputeNameColorFunction = require(Parent.ChatUIPrimitives).Utils.computeNameColor
local GetFFlagExpChatExcludeFOMORendersModule = require(ExpChat.Flags.getFFlagExpChatExcludeFOMORenders)
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatDisableUniverseBubbleChat = ExpChatSharedModule.Flags.FFlagExpChatDisableUniverseBubbleChat
local IsGlobalBubbleChatEnabledModule = require(ExpChat.isGlobalBubbleChatEnabled)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local GetFFlagExpChatSyntheticSystemMessageRichTextFunction = ExpChatSharedModule.Flags.GetFFlagExpChatSyntheticSystemMessageRichText
local GetTextAndTranslationModule = require(ExpChat.getTextAndTranslation)
local ChannelTabsConfigurationEnabledModule = require(Actions.ChannelTabsConfigurationEnabled)
local TextChatService = game:GetService("TextChatService")

function getChatTranslationEnabled() --[[ Line: 70 ]]
	-- upvalues: TextChatService (copy)
	local Success, Result = pcall(function() --[[ Line: 71 ]]
		-- upvalues: TextChatService (upval)
		return TextChatService.ChatTranslationEnabled
	end)
	
	return Success and Result
end

local function resolveChannelNameForMapOrder(p1, p2, p3) --[[ Line: 133 ]]
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), None (copy)
	return if GetFFlagTextChatEnableUniverseChatTabsFunction() then if p3 then p3 elseif p2.textChannel then if p2.textChannel.Name == "RBXSystem" or not p1.channelTabsConfigurationEnabled then "RBXGeneral" else p2.textChannel.Name else None elseif p2.textChannel then if p2.textChannel.Name == "RBXSystem" then "RBXGeneral" else p2.textChannel.Name else None
end

local function mapByMessageIdInOrderHelper(p1, p2, ChannelNameOverride) --[[ Line: 159 ]]
	-- upvalues: IsWhiteSpaceOnlyModule (copy), resolveChannelNameForMapOrder (copy), HttpService (copy), Dictionary (copy), FFlagEnableInExpChatRewriteModule (copy), FFlagExpChatDictation (copy), GetFFlagExpChatTelemetryEventTriggerModule (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagExpChatPresetChatEnabled (copy), List (copy), FFlagExpChatEnableFOMOUpsellModule (copy), GetFFlagExpChatExcludeFOMORendersModule (copy)
	if IsWhiteSpaceOnlyModule(p2.text) and p2.status ~= Enum.TextChatMessageStatus.Floodchecked and p2.status ~= Enum.TextChatMessageStatus.MessageTooLong then
		return p1
	end
	local PartOrModel = p2.partOrModel
	local UserId = p2.userId
	local MessageId = p2.messageId
	local ResolveChannelNameForMapOrderResult = resolveChannelNameForMapOrder(p1, p2, ChannelNameOverride)
	local WindowMessagesInOrder = p1.windowMessagesInOrder
	local WindowMessagesInOrderByTabIdEntry = p1.windowMessagesInOrderByTabId[ResolveChannelNameForMapOrderResult] or {}
	local ByMessageId = p1.byMessageId
	local BubbleMessagesInOrderBySenderId = p1.bubbleMessagesInOrderBySenderId
	local MockUserIdToPartOrModel = p1.mockUserIdToPartOrModel
	local PartOrModelToMockUserId = p1.partOrModelToMockUserId
	local MessagesBySenderId = p1.messagesBySenderId
	
	if not UserId and PartOrModel then
		UserId = PartOrModelToMockUserId[PartOrModel]
		
		if not UserId then
			UserId = HttpService:GenerateGUID(false)
			MockUserIdToPartOrModel = Dictionary.join(MockUserIdToPartOrModel, { [UserId] = PartOrModel })
			PartOrModelToMockUserId = Dictionary.join(PartOrModelToMockUserId, { [PartOrModel] = UserId })
		end
	end
	local WasRewritten = nil
	local OriginalText = nil
	
	if FFlagEnableInExpChatRewriteModule then
		WasRewritten = p2.wasRewritten
		OriginalText = p2.originalText
	end
	if ByMessageId[MessageId] then
		local config = {
			userId = UserId,
			prefixText = p2.prefixText,
			text = p2.text,
			translation = p2.translation,
			useTranslation = p2.useTranslation,
			textChannel = p2.textChannel,
			messageId = MessageId,
			status = p2.status,
			timestamp = p2.timestamp,
			isVisibleInBubbleChat = p2.isVisibleInBubbleChat,
			isVisibleInChatWindow = p2.isVisibleInChatWindow,
			shouldOverrideBubbleChatSettings = p2.shouldOverrideBubbleChatSettings,
			bubbleChatMessageProperties = p2.bubbleChatMessageProperties,
			chatWindowMessageProperties = p2.chatWindowMessageProperties,
			metadata = if FFlagExpChatDictation then p2.metadata else nil,
			textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then p2.textChatMessageInstance else nil,
			wasRewritten = WasRewritten,
			originalText = OriginalText,
			chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then p2.chatActionType else nil,
			isUniverseChat = p2.isUniverseChat,
			presetId = if FFlagExpChatPresetChatEnabled then p2.presetId else nil,
			presetChatVersion = if FFlagExpChatPresetChatEnabled then p2.presetChatVersion else nil
		}
		ByMessageId = Dictionary.join(ByMessageId, { [MessageId] = config })
		
		if UserId and MessagesBySenderId[UserId] then
			local Where: number = List.findWhere(MessagesBySenderId[UserId], function(p3, _): boolean --[[ Line: 238 ]]
				-- upvalues: MessageId (copy)
				return p3.messageId == MessageId
			end)
			
			if Where and Where > 0 then
				MessagesBySenderId = Dictionary.join(MessagesBySenderId, {
					[UserId] = List.set(MessagesBySenderId[UserId], Where, config)
				})
			end
		end
		if p2.status == Enum.TextChatMessageStatus.Floodchecked or p2.status == Enum.TextChatMessageStatus.MessageTooLong then
			WindowMessagesInOrder = List.removeIndex(WindowMessagesInOrder, List.count(WindowMessagesInOrder))
			WindowMessagesInOrderByTabIdEntry = List.removeIndex(WindowMessagesInOrderByTabIdEntry, List.count(WindowMessagesInOrderByTabIdEntry))
			ByMessageId = Dictionary.removeKey(ByMessageId, p2.messageId)
			
			if UserId then
				local Where: number = List.findWhere(MessagesBySenderId[UserId], function(p3, _): boolean --[[ Line: 258 ]]
					-- upvalues: MessageId (copy)
					return p3.messageId == MessageId
				end)
				
				if Where and Where > 0 then
					MessagesBySenderId = Dictionary.join(MessagesBySenderId, {
						[UserId] = List.removeIndex(MessagesBySenderId[UserId], Where)
					})
				end
			end
		end
		return Dictionary.join(p1, {
			windowMessagesInOrder = WindowMessagesInOrder,
			windowMessagesInOrderByTabId = Dictionary.join(p1.windowMessagesInOrderByTabId, {
				[ResolveChannelNameForMapOrderResult] = WindowMessagesInOrderByTabIdEntry
			}),
			byMessageId = ByMessageId,
			messagesBySenderId = MessagesBySenderId
		})
	else
		if #WindowMessagesInOrder == p1.messageLimit and p2.isVisibleInChatWindow then
			local WindowMessagesInOrderEntry = WindowMessagesInOrder[1]
			local UserId1 = if ByMessageId[WindowMessagesInOrderEntry] then ByMessageId[WindowMessagesInOrderEntry].userId else nil
			WindowMessagesInOrder = List.removeIndex(WindowMessagesInOrder, 1)
			
			if UserId1 then
				if MessagesBySenderId == nil or not MessagesBySenderId[UserId1] then
					if BubbleMessagesInOrderBySenderId ~= nil and BubbleMessagesInOrderBySenderId[UserId1] then
						local JoinResult = Dictionary.join(BubbleMessagesInOrderBySenderId, {
							[UserId1] = List.removeValue(BubbleMessagesInOrderBySenderId[UserId1], WindowMessagesInOrderEntry)
						})
						
						if Dictionary.count(JoinResult[UserId1]) == 0 then
							local _ = Dictionary.removeKey(JoinResult, UserId1)
							
							if MockUserIdToPartOrModel[UserId1] then
								local MockUserIdToPartOrModelEntry = MockUserIdToPartOrModel[UserId1]
								
								if PartOrModelToMockUserId[MockUserIdToPartOrModelEntry] then
									PartOrModelToMockUserId = Dictionary.removeKey(PartOrModelToMockUserId, MockUserIdToPartOrModelEntry)
								end
								MockUserIdToPartOrModel = Dictionary.removeKey(MockUserIdToPartOrModel, UserId1)
							end
						end
					end
				else
					local Where: number = List.findWhere(MessagesBySenderId[UserId1], function(p3, _): boolean --[[ Line: 286 ]]
						-- upvalues: WindowMessagesInOrderEntry (ref)
						return p3.messageId == WindowMessagesInOrderEntry
					end)
					
					if Where and Where > 0 then
						MessagesBySenderId = Dictionary.join(MessagesBySenderId, {
							[UserId1] = List.removeIndex(MessagesBySenderId[UserId1], Where)
						})
					end
					if Dictionary.count(MessagesBySenderId[UserId1]) == 0 then
						MessagesBySenderId = Dictionary.removeKey(MessagesBySenderId, UserId1)
						
						if MockUserIdToPartOrModel[UserId1] then
							local MockUserIdToPartOrModelEntry = MockUserIdToPartOrModel[UserId1]
							
							if PartOrModelToMockUserId[MockUserIdToPartOrModelEntry] then
								PartOrModelToMockUserId = Dictionary.removeKey(PartOrModelToMockUserId, MockUserIdToPartOrModelEntry)
							end
							MockUserIdToPartOrModel = Dictionary.removeKey(MockUserIdToPartOrModel, UserId1)
						end
					end
				end
			end
			if #WindowMessagesInOrderByTabIdEntry == p1.messageLimit then
				WindowMessagesInOrderEntry = WindowMessagesInOrderByTabIdEntry[1]
				WindowMessagesInOrderByTabIdEntry = List.removeIndex(WindowMessagesInOrderByTabIdEntry, 1)
				ByMessageId = Dictionary.removeKey(ByMessageId, WindowMessagesInOrderEntry)
			end
		end
		if p2.isVisibleInChatWindow then
			WindowMessagesInOrder = List.append(WindowMessagesInOrder, MessageId)
			WindowMessagesInOrderByTabIdEntry = List.append(WindowMessagesInOrderByTabIdEntry, MessageId)
		end
		return Dictionary.join(p1, {
			windowMessagesInOrder = WindowMessagesInOrder,
			windowMessagesInOrderByTabId = Dictionary.join(p1.windowMessagesInOrderByTabId, {
				[ResolveChannelNameForMapOrderResult] = WindowMessagesInOrderByTabIdEntry
			}),
			byMessageId = Dictionary.join(ByMessageId, {
				[MessageId] = {
					userId = UserId,
					prefixText = p2.prefixText,
					text = p2.text,
					translation = p2.translation,
					useTranslation = p2.useTranslation,
					messageId = MessageId,
					status = p2.status,
					timestamp = p2.timestamp,
					isVisibleInBubbleChat = p2.isVisibleInBubbleChat,
					isVisibleInChatWindow = p2.isVisibleInChatWindow,
					partOrModel = PartOrModel,
					shouldOverrideBubbleChatSettings = p2.shouldOverrideBubbleChatSettings,
					bubbleChatMessageProperties = p2.bubbleChatMessageProperties,
					chatWindowMessageProperties = p2.chatWindowMessageProperties,
					textChannel = p2.textChannel,
					metadata = if FFlagExpChatDictation then p2.metadata else nil,
					textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then p2.textChatMessageInstance else nil,
					isHiddenMessage = if FFlagExpChatEnableFOMOUpsellModule or GetFFlagExpChatExcludeFOMORendersModule() then p2.isHiddenMessage else nil,
					wasRewritten = WasRewritten,
					originalText = OriginalText,
					chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then p2.chatActionType else nil,
					isUniverseChat = p2.isUniverseChat,
					presetId = if FFlagExpChatPresetChatEnabled then p2.presetId else nil,
					presetChatVersion = if FFlagExpChatPresetChatEnabled then p2.presetChatVersion else nil
				}
			}),
			mockUserIdToPartOrModel = MockUserIdToPartOrModel,
			partOrModelToMockUserId = PartOrModelToMockUserId,
			messagesBySenderId = if UserId then Dictionary.join(MessagesBySenderId, {
				[UserId] = List.append(MessagesBySenderId[UserId] or {}, {
					userId = UserId,
					prefixText = p2.prefixText,
					text = p2.text,
					translation = p2.translation,
					useTranslation = p2.useTranslation,
					messageId = MessageId,
					status = p2.status,
					timestamp = p2.timestamp,
					isVisibleInBubbleChat = p2.isVisibleInBubbleChat,
					isVisibleInChatWindow = p2.isVisibleInChatWindow,
					partOrModel = PartOrModel,
					shouldOverrideBubbleChatSettings = p2.shouldOverrideBubbleChatSettings,
					bubbleChatMessageProperties = p2.bubbleChatMessageProperties,
					chatWindowMessageProperties = p2.chatWindowMessageProperties,
					textChannel = p2.textChannel,
					textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then p2.textChatMessageInstance else nil,
					wasRewritten = WasRewritten,
					originalText = OriginalText,
					chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then p2.chatActionType else nil,
					isUniverseChat = p2.isUniverseChat,
					presetId = if FFlagExpChatPresetChatEnabled then p2.presetId else nil,
					presetChatVersion = if FFlagExpChatPresetChatEnabled then p2.presetChatVersion else nil
				})
			}) else nil
		})
	end
end

local function mapByMessageIdInOrder(p1, p2) --[[ Line: 521 ]]
	-- upvalues: FFlagEnableInExpChatRewriteModule (copy), GetTextAndTranslationModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), FFlagExpChatFixLocalUserVerifiedBadgeModule (copy), OutgoingMessageSentModule (copy), Players (copy), FFlagExpChatPresetChatEnabled (copy), Set (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagExpChatDisableUniverseBubbleChat (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatGlobalTabDefaultModule (copy), IsGlobalBubbleChatEnabledModule (copy), ShouldRenderTextChannelInDefaultWindowFunction (copy), GetTextChannelDisplayModeFunction (copy), ComputeNameColorFunction (copy), GetFFlagExpChatTelemetryEventTriggerModule (copy), mapByMessageIdInOrderHelper (copy)
	local TextChatMessage = p2.textChatMessage
	local TextAndTranslationModule = nil
	local TextAndTranslationModule2 = nil
	
	if FFlagEnableInExpChatRewriteModule then
		TextAndTranslationModule, TextAndTranslationModule2 = GetTextAndTranslationModule(TextChatMessage)
	else
		TextAndTranslationModule = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text
		TextAndTranslationModule2 = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TranslationInternal else TextChatMessage.Translation
	end
	local Text = if TextChatMessage.TextSource then tostring(TextChatMessage.TextSource.UserId) elseif FFlagExpChatFixLocalUserVerifiedBadgeModule and p2.type == OutgoingMessageSentModule.name and Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else nil
	local HasResult = if Text then Set.has(p1._mutedUserIds, Text) else false
	local NoHasResult: boolean = (Text == nil or ((p1.canLocalUserChat or FFlagExpChatPresetChatEnabled and (TextChatMessage.PresetId or "") ~= "") and (TextChatMessage.Status == Enum.TextChatMessageStatus.Success or TextChatMessage.Status == Enum.TextChatMessageStatus.Sending) or false)) and not HasResult
	local Flag = false
	
	if (if FFlagExpChatUseChatConfigStore then GetChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false) else p1.isBubbleChatEnabled) and NoHasResult and (not FFlagEnableInExpChatSummaryOnLuaModule or Text ~= nil) and (TextChatMessage.Status == Enum.TextChatMessageStatus.Success or TextChatMessage.Status == Enum.TextChatMessageStatus.Sending) then
		Flag = true
	end
	if FFlagExpChatDisableUniverseBubbleChat and GetFFlagTextChatEnableUniverseChatTabsFunction() and p2.isUniverseChat == true and (not FFlagExpChatGlobalTabDefaultModule or not IsGlobalBubbleChatEnabledModule()) then
		Flag = false
	end
	if not p2.isUniverseChat and p2.channelNameOverride == nil and not ShouldRenderTextChannelInDefaultWindowFunction(TextChatMessage.TextChannel, GetTextChannelDisplayModeFunction()) then
		NoHasResult = false
	end
	local PrefixTextInternal = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.PrefixTextInternal else TextChatMessage.PrefixText
	
	if GetFFlagTextChatEnableUniverseChatTabsFunction() and p2.channelNameOverride and #PrefixTextInternal > 0 then
		PrefixTextInternal = `<font color="#{(if TextChatMessage.TextSource then ComputeNameColorFunction(TextChatMessage.TextSource.Username) else ComputeNameColorFunction(Players.LocalPlayer.Name)):ToHex()}">{PrefixTextInternal}</font>`
	end
	return mapByMessageIdInOrderHelper(p1, {
		userId = Text,
		prefixText = PrefixTextInternal,
		text = TextAndTranslationModule,
		translation = TextAndTranslationModule2,
		useTranslation = getChatTranslationEnabled(),
		textChannel = TextChatMessage.TextChannel,
		messageId = TextChatMessage.MessageId,
		status = TextChatMessage.Status,
		timestamp = TextChatMessage.Timestamp,
		isVisibleInBubbleChat = Flag,
		isVisibleInChatWindow = NoHasResult,
		bubbleChatMessageProperties = TextChatMessage.BubbleChatMessageProperties,
		chatWindowMessageProperties = TextChatMessage.ChatWindowMessageProperties,
		textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then TextChatMessage else nil,
		wasRewritten = if FFlagEnableInExpChatRewriteModule then TextChatMessage.WasRewritten else nil,
		originalText = if FFlagEnableInExpChatRewriteModule then TextChatMessage.OriginalText else nil,
		chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then TextChatMessage.ChatActionType else nil,
		isUniverseChat = p2.isUniverseChat,
		presetId = if FFlagExpChatPresetChatEnabled then TextChatMessage.PresetId else nil,
		presetChatVersion = if FFlagExpChatPresetChatEnabled then TextChatMessage.PresetChatVersion else nil
	}, if GetFFlagTextChatEnableUniverseChatTabsFunction() then p2.channelNameOverride else nil)
end

return RoduxModule.createReducer({
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
}, {
	[ChannelTabsConfigurationEnabledModule.name] = function(p1, p2) --[[ Line: 746 ]]
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), Dictionary (copy)
		return if GetFFlagTextChatEnableUniverseChatTabsFunction() then Dictionary.join(p1, { channelTabsConfigurationEnabled = p2.enabled }) else p1
	end,
	[IncomingMessageReceivedModule.name] = mapByMessageIdInOrder,
	[IncomingBubbleChatMessageReceivedModule.name] = function(p1, p2) --[[ Line: 498 ]]
		-- upvalues: mapByMessageIdInOrderHelper (copy)
		local BubbleChatMessageTable = p2.bubbleChatMessageTable
		
		return mapByMessageIdInOrderHelper(p1, {
			prefixText = "",
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			userId = BubbleChatMessageTable.bubbleChatMessageUserId,
			text = BubbleChatMessageTable.message,
			translation = BubbleChatMessageTable.translation,
			useTranslation = getChatTranslationEnabled(),
			messageId = BubbleChatMessageTable.bubbleChatMessageId,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = BubbleChatMessageTable.timestamp,
			partOrModel = BubbleChatMessageTable.partOrModel,
			bubbleChatMessageProperties = BubbleChatMessageTable.bubbleChatMessageProperties
		})
	end,
	[OutgoingMessageSentModule.name] = mapByMessageIdInOrder,
	[UserMuted.name] = function(p1, p2) --[[ Line: 758 ]]
		-- upvalues: Dictionary (copy), Set (copy)
		return Dictionary.join(p1, { _mutedUserIds = Set.add(p1._mutedUserIds, p2.userId) })
	end,
	[UserUnmuted.name] = function(p1, p2) --[[ Line: 763 ]]
		-- upvalues: Dictionary (copy), Set (copy)
		return Dictionary.join(p1, {
			_mutedUserIds = Set.subtract(p1._mutedUserIds, p2.userId)
		})
	end,
	[PlayerRemoved.name] = function(p1, p2) --[[ Line: 768 ]]
		-- upvalues: Dictionary (copy), Set (copy)
		local FilterResult = Dictionary.filter(p1.messagesBySenderId, function(_, UserId): boolean --[[ Line: 775 ]]
			-- upvalues: p2 (copy)
			return UserId ~= p2.userId
		end)
		local Inverted = not Set.has(p1._mutedUserIds, p2.userId)
		
		return if #Dictionary.filter(p1.bubbleMessagesInOrderBySenderId, function(_, UserId): boolean --[[ Line: 771 ]]
			-- upvalues: p2 (copy)
			return UserId ~= p2.userId
		end) == 0 and #FilterResult == 0 and Inverted then p1 else Dictionary.join(p1, {
			messagesBySenderId = FilterResult,
			_mutedUserIds = Set.subtract(p1._mutedUserIds, p2.userId)
		})
	end,
	[ChatPrivacySettingsReceivedModule.name] = function(p1, p2) --[[ Line: 788 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { canLocalUserChat = p2.canUserChat })
	end,
	[ChatPrivacySettingsFetchFailedModule.name] = function(p1, _) --[[ Line: 791 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { canLocalUserChat = false })
	end,
	[ConfigurationObjectsLoadedModule.name] = function(p1, p2) --[[ Line: 794 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			isBubbleChatEnabled = if p2.bubbleChatSettings.Enabled then p2.bubbleChatSettings.Enabled else false
		})
	end,
	[BubbleChatSettingsChangedModule.name] = function(p1, p2) --[[ Line: 801 ]]
		-- upvalues: Dictionary (copy)
		return if p2.property == "Enabled" then Dictionary.join(p1, {
			byMessageId = Dictionary.map(p1.byMessageId, function(p3) --[[ Line: 806 ]]
				-- upvalues: Dictionary (upval), p2 (copy)
				return if p3.shouldOverrideBubbleChatSettings then p3 else Dictionary.join(p3, {
					isVisibleInBubbleChat = p2.value and p3.isVisibleInChatWindow
				})
			end),
			isBubbleChatEnabled = p2.value
		}) else p1
	end,
	[ChatWindowMessagesCleared.name] = function(p1, _) --[[ Line: 821 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			windowMessagesInOrder = {},
			windowMessagesInOrderByTabId = {},
			byMessageId = Dictionary.map(p1.byMessageId, function(p2) --[[ Line: 822 ]]
				-- upvalues: Dictionary (upval)
				return Dictionary.join(p2, { isVisibleInChatWindow = false })
			end)
		})
	end,
	[ChatTranslationGlobalToggledModule.name] = function(p1, p2) --[[ Line: 412 ]]
		-- upvalues: GetFFlagExpChatTelemetryEventTriggerModule (copy), FFlagEnableInExpChatRewriteModule (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagExpChatPresetChatEnabled (copy), Dictionary (copy)
		local UseTranslation = p2.useTranslation
		local ByMessageId = p1.byMessageId
		local t = {}
		
		for i, _ in pairs(ByMessageId) do
			local ByMessageIdEntry = ByMessageId[i]
			
			if ByMessageIdEntry ~= nil then
				t[i] = {
					prefixText = ByMessageIdEntry.prefixText,
					text = ByMessageIdEntry.text,
					translation = ByMessageIdEntry.translation,
					useTranslation = UseTranslation,
					messageId = ByMessageIdEntry.messageId,
					status = ByMessageIdEntry.status,
					timestamp = ByMessageIdEntry.timestamp,
					isVisibleInBubbleChat = ByMessageIdEntry.isVisibleInBubbleChat,
					isVisibleInChatWindow = ByMessageIdEntry.isVisibleInChatWindow,
					partOrModel = ByMessageIdEntry.partOrModel,
					shouldOverrideBubbleChatSettings = ByMessageIdEntry.shouldOverrideBubbleChatSettings,
					bubbleChatMessageProperties = ByMessageIdEntry.bubbleChatMessageProperties,
					chatWindowMessageProperties = ByMessageIdEntry.chatWindowMessageProperties,
					userId = ByMessageIdEntry.userId,
					textChannel = ByMessageIdEntry.textChannel,
					textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then ByMessageIdEntry.textChatMessageInstance else nil,
					wasRewritten = if FFlagEnableInExpChatRewriteModule then ByMessageIdEntry.wasRewritten else nil,
					originalText = if FFlagEnableInExpChatRewriteModule then ByMessageIdEntry.originalText else nil,
					chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then ByMessageIdEntry.chatActionType else nil,
					presetId = if FFlagExpChatPresetChatEnabled then ByMessageIdEntry.presetId else nil,
					presetChatVersion = if FFlagExpChatPresetChatEnabled then ByMessageIdEntry.presetChatVersion else nil
				}
			end
		end
		return Dictionary.join(p1, { byMessageId = Dictionary.join(ByMessageId, t) })
	end,
	[ChatTranslationMessageToggledModule.name] = function(p3, p4) --[[ Line: 454 ]]
		-- upvalues: Dictionary (copy), GetFFlagExpChatTelemetryEventTriggerModule (copy), FFlagEnableInExpChatRewriteModule (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagExpChatPresetChatEnabled (copy)
		local UseTranslation = p4.useTranslation
		local MessageId = p4.messageId
		local ByMessageId = p3.byMessageId
		local ByMessageIdEntry = ByMessageId[MessageId]
		
		return if ByMessageIdEntry == nil then nil else Dictionary.join(p3, {
			byMessageId = Dictionary.join(ByMessageId, {
				[MessageId] = {
					prefixText = ByMessageIdEntry.prefixText,
					text = ByMessageIdEntry.text,
					translation = ByMessageIdEntry.translation,
					useTranslation = UseTranslation,
					messageId = ByMessageIdEntry.messageId,
					status = ByMessageIdEntry.status,
					timestamp = ByMessageIdEntry.timestamp,
					isVisibleInBubbleChat = ByMessageIdEntry.isVisibleInBubbleChat,
					isVisibleInChatWindow = ByMessageIdEntry.isVisibleInChatWindow,
					partOrModel = ByMessageIdEntry.partOrModel,
					shouldOverrideBubbleChatSettings = ByMessageIdEntry.shouldOverrideBubbleChatSettings,
					bubbleChatMessageProperties = ByMessageIdEntry.bubbleChatMessageProperties,
					chatWindowMessageProperties = ByMessageIdEntry.chatWindowMessageProperties,
					userId = ByMessageIdEntry.userId,
					textChannel = ByMessageIdEntry.textChannel,
					textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then ByMessageIdEntry.textChatMessageInstance else nil,
					wasRewritten = if FFlagEnableInExpChatRewriteModule then ByMessageIdEntry.wasRewritten else nil,
					originalText = if FFlagEnableInExpChatRewriteModule then ByMessageIdEntry.originalText else nil,
					chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then ByMessageIdEntry.chatActionType else nil,
					presetId = if FFlagExpChatPresetChatEnabled then ByMessageIdEntry.presetId else nil,
					presetChatVersion = if FFlagExpChatPresetChatEnabled then ByMessageIdEntry.presetChatVersion else nil
				}
			})
		})
	end,
	[LegacyBubbleCreatedModule.name] = function(p3, p4) --[[ Line: 651 ]]
		-- upvalues: mapByMessageIdInOrderHelper (copy)
		local MessageData = p4.messageData
		
		return mapByMessageIdInOrderHelper(p3, {
			prefixText = "",
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			userId = MessageData.userId,
			text = MessageData.text,
			messageId = MessageData.id,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = if MessageData.timestamp then DateTime.fromUnixTimestampMillis(MessageData.timestamp) else DateTime.now(),
			partOrModel = MessageData.adornee
		})
	end,
	[LegacyBubbleTextUpdatedModule.name] = function(p3, p4) --[[ Line: 836 ]]
		-- upvalues: Dictionary (copy), List (copy)
		local ByMessageId = p3.byMessageId
		local MessagesBySenderId = p3.messagesBySenderId
		local MessageId = p4.messageId
		local NewText = p4.newText
		
		if ByMessageId[MessageId] then
			local ByMessageIdEntry = ByMessageId[MessageId]
			ByMessageIdEntry.text = NewText
			ByMessageId = Dictionary.join(ByMessageId, { [MessageId] = ByMessageIdEntry })
			local UserId = ByMessageIdEntry.userId
			
			if UserId and MessagesBySenderId[UserId] then
				local Where: number = List.findWhere(MessagesBySenderId[UserId], function(p5, _): boolean --[[ Line: 850 ]]
					-- upvalues: MessageId (copy)
					return p5.messageId == MessageId
				end)
				
				if Where and Where > 0 then
					MessagesBySenderId = Dictionary.join(MessagesBySenderId, {
						[UserId] = List.set(MessagesBySenderId[UserId], Where, ByMessageIdEntry)
					})
				end
			end
		end
		return Dictionary.join(p3, {
			byMessageId = ByMessageId,
			messagesBySenderId = MessagesBySenderId
		})
	end,
	[HiddenMessageReceivedModule.name] = function(p3, p4) --[[ Line: 675 ]]
		-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), FIntExpChatRandomCharChangeLowerBoundModule (copy), FIntExpChatRandomCharChangeUpperBoundModule (copy), ConfigModule (copy), GetFFlagExpChatTelemetryEventTriggerModule (copy), mapByMessageIdInOrderHelper (copy)
		local UserMessageIntent = p4.userMessageIntent
		local Length = string.len(if GetFFlagExpChatProtectedChatInternalAPIsFunction() then UserMessageIntent.TextInternal else UserMessageIntent.Text)
		
		return mapByMessageIdInOrderHelper(p3, {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = ConfigModule.LOCK_EMOJI .. " :",
			text = string.rep(ConfigModule.DOT_TEXT, Length + math.random(math.max(FIntExpChatRandomCharChangeLowerBoundModule, -(Length - 1)), FIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = UserMessageIntent.TextChannel,
			messageId = UserMessageIntent.MessageId,
			status = UserMessageIntent.Status,
			timestamp = UserMessageIntent.Timestamp,
			textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then UserMessageIntent else nil
		})
	end,
	[UniverseChatSystemMessageAddedModule.name] = function(p3, p4) --[[ Line: 709 ]]
		-- upvalues: HttpService (copy), SanitizeForRichTextModule (copy), GetFFlagExpChatSyntheticSystemMessageRichTextFunction (copy), GenerateRichSystemMessageTextFormatModule (copy), FFlagExpChatDictation (copy), mapByMessageIdInOrderHelper (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy)
		local Guid = HttpService:GenerateGUID(false)
		local SanitizeForRichTextModuleResult = SanitizeForRichTextModule(p4.text)
		
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
			text = if GetFFlagExpChatSyntheticSystemMessageRichTextFunction() then GenerateRichSystemMessageTextFormatModule(SanitizeForRichTextModuleResult, if FFlagExpChatDictation then p4.isError else nil, p4.postProcessMessage) else SanitizeForRichTextModuleResult,
			messageId = Guid,
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			metadata = p4.metadata
		}, if GetFFlagTextChatEnableUniverseChatTabsFunction() then p4.channelNameOverride else nil)
	end,
	[HiddenMessagesClearedModule.name] = function(p3, _) --[[ Line: 868 ]]
		-- upvalues: FFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy), Dictionary (copy), List (copy)
		if FFlagExpChatClearHiddenMessagesPostAgeCheckModule then
			local MapResult = Dictionary.map(p3.byMessageId, function(p4) --[[ Line: 873 ]]
				-- upvalues: Dictionary (upval)
				return if p4.isHiddenMessage then Dictionary.join(p4, { isVisibleInChatWindow = false }) else p4
			end)
			
			return Dictionary.join(p3, {
				windowMessagesInOrder = List.filter(p3.windowMessagesInOrder, function(p4): boolean --[[ Line: 883 ]]
					-- upvalues: MapResult (copy)
					local MapResultEntry = MapResult[p4]
					
					return MapResultEntry and not MapResultEntry.isHiddenMessage
				end),
				windowMessagesInOrderByTabId = Dictionary.map(p3.windowMessagesInOrderByTabId, function(p4) --[[ Line: 890 ]]
					-- upvalues: List (upval), MapResult (copy)
					return List.filter(p4, function(p5): boolean --[[ Line: 891 ]]
						-- upvalues: MapResult (upval)
						local MapResultEntry = MapResult[p5]
						
						return MapResultEntry and not MapResultEntry.isHiddenMessage
					end)
				end),
				byMessageId = MapResult
			})
		else
			return p3
		end
	end
})