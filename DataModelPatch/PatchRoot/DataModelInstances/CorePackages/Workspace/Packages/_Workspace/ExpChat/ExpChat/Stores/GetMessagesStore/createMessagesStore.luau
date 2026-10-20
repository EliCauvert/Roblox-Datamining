local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local SharedFlagsModule = require(Parent.SharedFlags)
local IsWhiteSpaceOnlyModule = require(ExpChat.isWhiteSpaceOnly)
local GetChatConfigurationStoreModule = require(ExpChat.Stores.GetChatConfigurationStore)
local ComputeNameColorFunction = require(Parent.ChatUIPrimitives).Utils.computeNameColor
local _ = require(ExpChat.TextChatMessageChatActionType)
local ExpChatSharedModule = require(ExpChat.Parent.ExpChatShared)
local GetTextAndTranslationModule = require(ExpChat.getTextAndTranslation)
local ConfigModule = require(ExpChat.Config)
local SanitizeForRichTextModule = require(ExpChat.sanitizeForRichText)
local GenerateRichSystemMessageTextFormatModule = require(ExpChat.generateRichSystemMessageTextFormat)
local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LlamaModule = require(Parent.llama)
local List = LlamaModule.List
local Dictionary = LlamaModule.Dictionary
local Set = LlamaModule.Set
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagEnableInExpChatRewriteModule = require(ExpChat.Flags.FFlagEnableInExpChatRewrite)
local FFlagEnableInExpChatSummaryOnLuaModule = require(ExpChat.Flags.FFlagEnableInExpChatSummaryOnLua)
local FIntExpChatRandomCharChangeLowerBoundModule = require(ExpChat.Flags.FIntExpChatRandomCharChangeLowerBound)
local FIntExpChatRandomCharChangeUpperBoundModule = require(ExpChat.Flags.FIntExpChatRandomCharChangeUpperBound)
local GetFFlagExpChatTelemetryEventTriggerModule = require(ExpChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local FFlagExpChatClearHiddenMessagesPostAgeCheckModule = require(ExpChat.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatDisableUniverseBubbleChat = ExpChatSharedModule.Flags.FFlagExpChatDisableUniverseBubbleChat
local GetFFlagExpChatSyntheticSystemMessageRichTextFunction = ExpChatSharedModule.Flags.GetFFlagExpChatSyntheticSystemMessageRichText
local FFlagChatLineReportingGlobalMuteEnabled = SharedFlagsModule.FFlagChatLineReportingGlobalMuteEnabled
local FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule = require(ExpChat.Flags.FFlagExpChatEnablePostProcessRichSystemMessageTextFormat)
local FFlagExpChatMessagesStoreKeepInByMessageIdModule = require(ExpChat.Flags.FFlagExpChatMessagesStoreKeepInByMessageId)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local GetFFlagExpChatProtectedChatInternalAPIsFunction = SharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local FFlagExpChatDictation = SharedFlagsModule.FFlagExpChatDictation
local FFlagExpChatMessagesStoreBatchModule = require(ExpChat.Flags.FFlagExpChatMessagesStoreBatch)
local FFlagExpChatMessagesStoreMemoryCleanupModule = require(ExpChat.Flags.FFlagExpChatMessagesStoreMemoryCleanup)
local FFlagExpChatEvictFloodcheckedFromWindowOrderModule = require(ExpChat.Flags.FFlagExpChatEvictFloodcheckedFromWindowOrder)

function getChatTranslationEnabled()
	-- upvalues: TextChatService (copy)
	return TextChatService.ChatTranslationEnabled
end

return function(Callback)
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatMessagesStoreBatchModule (copy), SignalsExperimentalModule (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), List (copy), Dictionary (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (copy), HttpService (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), FFlagExpChatEnableV2ChatWindowModule (copy), Set (copy), SanitizeForRichTextModule (copy), GetFFlagExpChatSyntheticSystemMessageRichTextFunction (copy), GenerateRichSystemMessageTextFormatModule (copy), FFlagExpChatDictation (copy), FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (copy), ComputeNameColorFunction (copy), Players (copy), FFlagEnableInExpChatRewriteModule (copy), GetTextAndTranslationModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), IsWhiteSpaceOnlyModule (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), ExpChatSharedModule (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagExpChatDisableUniverseBubbleChat (copy), GetFFlagExpChatTelemetryEventTriggerModule (copy), FFlagChatLineReportingGlobalMuteEnabled (copy), FIntExpChatRandomCharChangeLowerBoundModule (copy), FIntExpChatRandomCharChangeUpperBoundModule (copy), ConfigModule (copy), FFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy)
	local config = {
		canLocalUserChat = false,
		isBubbleChatEnabled = false,
		messageLimit = 50,
		nextMessageComponentPointer = 1,
		mutedUserIds = {},
		windowMessagesInOrder = {},
		windowMessagesInOrderByTabId = {},
		byMessageId = {},
		mockUserIdToPartOrModel = {},
		partOrModelToMockUserId = {},
		messagesBySenderId = {},
		messageComponentRingBuffer = {}
	}
	local Signal, Signal2 = CreateSignalFunction(config.byMessageId)
	local Signal1, Signal2_1 = CreateSignalFunction(config.messagesBySenderId)
	local Signal3, Signal2_2 = CreateSignalFunction(config.windowMessagesInOrder)
	local Signal4, Signal2_3 = CreateSignalFunction(config.windowMessagesInOrderByTabId)
	local Signal5, Signal2_4 = CreateSignalFunction(config.mutedUserIds)
	local Signal6 = if Callback == nil then Signal5 else CreateComputedFunction(function(p1)
		-- upvalues: Signal5 (copy), Callback (copy)
		local Copy = table.clone((Signal5(p1)))
		
		for i in Callback(p1) do
			Copy[i] = true
		end
		return Copy
	end)
	local Signal7, Signal2_5 = CreateSignalFunction(config.canLocalUserChat)
	local Signal8, _ = CreateSignalFunction(config.isBubbleChatEnabled)
	local Signal9, Signal2_6 = CreateSignalFunction(config.mockUserIdToPartOrModel)
	local Signal10, Signal2_7 = CreateSignalFunction(config.partOrModelToMockUserId)
	local Signal11, Signal2_8 = CreateSignalFunction(false)
	local Signal12, Signal2_9 = CreateSignalFunction(config.messageComponentRingBuffer)
	local Signal13, Signal2_10 = CreateSignalFunction(config.nextMessageComponentPointer)
	local t = {}
	local Total = 0
	local t1 = {}
	local Signal14, Signal2_11 = CreateSignalFunction(nil)
	local Callback1 = nil
	local t2 = {}
	
	local function resolveChannelNameForMapOrder(p2, ChannelNameOverride)
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy)
		return if GetFFlagTextChatEnableUniverseChatTabsFunction() then if ChannelNameOverride then ChannelNameOverride elseif p2.textChannel then if p2.textChannel.Name == "RBXSystem" or not Signal11(false) then "RBXGeneral" else p2.textChannel.Name else nil elseif p2.textChannel then if p2.textChannel.Name == "RBXSystem" then "RBXGeneral" else p2.textChannel.Name else nil
	end
	
	local function _(Callback: () -> ())
		-- upvalues: FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(Callback)
			
			return
		else
			Callback()
		end
	end
	
	local _ = function(p2)
		-- upvalues: Signal (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), Signal2_1 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal3 (copy), Signal4 (copy), config (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local function v84()
			-- upvalues: Signal (upval), p2 (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), Signal2_1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal3 (upval), Signal4 (upval), config (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Callback1 (upval)
			local v1 = Signal(false)
			
			if v1 and v1[p2.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (p2.status == Enum.TextChatMessageStatus.Floodchecked or p2.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p3)
						-- upvalues: List (upval), p2 (upval)
						return List.filter(p3, function(MessageId): boolean
							-- upvalues: p2 (upval)
							return MessageId ~= p2.messageId
						end)
					end)
					local v2 = resolveChannelNameForMapOrder(p2, p2.channelNameOverride)
					
					if v2 then
						Signal2_3(function(p3)
							-- upvalues: v2 (copy), List (upval), p2 (upval), Dictionary (upval)
							local v3 = p3[v2]
							
							return if v3 then Dictionary.join(p3, {
								[v2] = List.filter(v3, function(MessageId): boolean
									-- upvalues: p2 (upval)
									return MessageId ~= p2.messageId
								end)
							}) else p3
						end)
					end
					Signal2(function(p3)
						-- upvalues: Dictionary (upval), p2 (upval)
						return Dictionary.removeKey(p3, p2.messageId)
					end)
					
					if p2.userId then
						Signal2_1(function(p3)
							-- upvalues: p2 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
							local v3 = p3[p2.userId]
							
							if v3 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v3, function(MessageId): boolean
									-- upvalues: p2 (upval)
									return MessageId ~= p2.messageId
								end) else List.filter(v3, function(p4): boolean
									-- upvalues: p2 (upval)
									return p4.messageId ~= p2.messageId
								end)
								
								return if #FilterResult == 0 then Dictionary.removeKey(p3, p2.userId) else Dictionary.join(p3, { [p2.userId] = FilterResult })
							else
								return p3
							end
						end)
					end
					return
				else
					Signal2(function(p3)
						-- upvalues: Dictionary (upval), p2 (upval)
						return Dictionary.join(p3, { [p2.messageId] = p2 })
					end)
					
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and p2.userId then
						Signal2_1(function(p3)
							-- upvalues: p2 (upval), List (upval), Dictionary (upval)
							local v3 = p3[p2.userId] or {}
							local v4 = nil
							
							for i, value in ipairs(v3) do
								if value.messageId == p2.messageId then
									v4 = i
									break
								end
							end
							return if v4 then Dictionary.join(p3, { [p2.userId] = List.set(v3, v4, p2) }) else p3
						end)
					end
					return
				end
			else
				local UserId = p2.userId
				local PartOrModel = p2.partOrModel
				
				if not UserId and PartOrModel then
					UserId = Signal10(false)[PartOrModel]
					
					if not UserId then
						UserId = HttpService:GenerateGUID(false)
						Signal2_6(function(p3)
							-- upvalues: Dictionary (upval), UserId (ref), PartOrModel (copy)
							return Dictionary.join(p3, { [UserId] = PartOrModel })
						end)
						Signal2_7(function(p3)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId (ref)
							return Dictionary.join(p3, { [PartOrModel] = UserId })
						end)
					end
				end
				local JoinResult = if UserId == p2.userId then p2 else Dictionary.join(p2, { userId = UserId })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v3 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v3 then
						local MessageId = v3[1]
						local v4 = v1 and v1[MessageId]
						
						if v4 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								Signal2(function(p3)
									-- upvalues: Dictionary (upval), MessageId (copy)
									return Dictionary.removeKey(p3, MessageId)
								end)
							end
							if v4.userId then
								Signal2_1(function(p3)
									-- upvalues: v4 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId (copy), Signal9 (upval), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									local v5 = p3[v4.userId]
									
									if not v5 then
										return p3
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v5, function(p4): boolean
										-- upvalues: MessageId (upval)
										return p4 ~= MessageId
									end) else List.filter(v5, function(p4): boolean
										-- upvalues: MessageId (upval)
										return p4.messageId ~= MessageId
									end)
									
									if #FilterResult ~= 0 then
										return Dictionary.join(p3, { [v4.userId] = FilterResult })
									end
									local v6 = Signal9(false)
									
									if v6[v4.userId] then
										local v7 = v6[v4.userId]
										Signal2_7(function(p4)
											-- upvalues: Dictionary (upval), v7 (copy)
											return Dictionary.removeKey(p4, v7)
										end)
										Signal2_6(function(p4)
											-- upvalues: Dictionary (upval), v4 (upval)
											return Dictionary.removeKey(p4, v4.userId)
										end)
									end
									return Dictionary.removeKey(p3, v4.userId)
								end)
							end
							Signal2_2(function(p3)
								-- upvalues: List (upval)
								return List.removeIndex(p3, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId] = nil
							end
						end
					end
					if ChannelNameOverride and config.messageLimit <= #T then
						local Entry = T[1]
						
						if Entry then
							Signal2_3(function(p3)
								-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
								return Dictionary.join(p3, {
									[ChannelNameOverride] = List.removeIndex(p3[ChannelNameOverride] or {}, 1)
								})
							end)
							
							if v1 and v1[Entry] then
								Signal2(function(p3)
									-- upvalues: Dictionary (upval), Entry (copy)
									return Dictionary.removeKey(p3, Entry)
								end)
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				Signal2(function(p3)
					-- upvalues: Dictionary (upval), JoinResult (copy)
					return Dictionary.join(p3, { [JoinResult.messageId] = JoinResult })
				end)
				
				if JoinResult.userId then
					Signal2_1(function(p3)
						-- upvalues: JoinResult (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
						local MessageIds = p3[JoinResult.userId] or {}
						local Flag = false
						repeat
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								for _, messageId in ipairs(MessageIds) do
									if messageId == JoinResult.messageId then
										Flag = true
										break
									end
								end
								break
							end
							for _, messageId1 in ipairs(MessageIds) do
								if messageId1.messageId == JoinResult.messageId then
									Flag = true
								else
									continue
								end
							end
							break
						until true
						return if Flag then p3 else Dictionary.join(p3, {
							[JoinResult.userId] = List.append(MessageIds, if FFlagExpChatMessagesStoreMemoryCleanupModule then JoinResult.messageId else JoinResult)
						})
					end)
				end
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p3)
						-- upvalues: List (upval), JoinResult (copy)
						return List.append(p3, JoinResult.messageId)
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p3)
							-- upvalues: ChannelNameOverride (ref), List (upval), JoinResult (copy), Dictionary (upval)
							return Dictionary.join(p3, {
								[ChannelNameOverride] = List.append(p3[ChannelNameOverride] or {}, JoinResult.messageId)
							})
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							Callback1(JoinResult.messageId)
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v84)
			
			return
		else
			v84()
		end
	end
	
	local t3 = {}
	
	local function getUserMessageCache(p3)
		-- upvalues: t3 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), CreateComputedFunction (upval), Signal1 (copy), Signal (copy), Signal6 (copy), Set (upval)
		local Text = tostring(p3)
		
		if not t3[Text] then
			t3[Text] = {}
			
			if not FFlagExpChatMessagesStoreMemoryCleanupModule then
				t3[Text].messages = CreateComputedFunction(function(p4)
					-- upvalues: Signal1 (upval), Text (copy)
					return Signal1(p4)[Text] or {}
				end)
			end
			if FFlagExpChatMessagesStoreMemoryCleanupModule then
				t3[Text].bubbleMessages = CreateComputedFunction(function(p4)
					-- upvalues: Signal1 (upval), Text (copy), Signal (upval), Signal6 (upval), Set (upval)
					local SignalResultEntry = Signal1(p4)[Text] or {}
					local SignalResult = Signal(p4)
					local SignalResult1 = Signal6(p4)
					local List = {}
					
					for _, value in ipairs(SignalResultEntry) do
						local SignalResultEntry1 = SignalResult[value]
						
						if SignalResultEntry1 then
							local HasResult = SignalResultEntry1.userId and Set.has(SignalResult1, SignalResultEntry1.userId) or false
							
							if SignalResultEntry1.isVisibleInBubbleChat and not HasResult then
								table.insert(List, SignalResultEntry1)
							end
						end
					end
					return List
				end)
			else
				t3[Text].bubbleMessages = CreateComputedFunction(function(p5)
					-- upvalues: t3 (upval), Text (copy), Signal6 (upval), Set (upval)
					local MessagesResult = t3[Text].messages(p5)
					local SignalResult = Signal6(p5)
					local List = {}
					
					for _, value in ipairs(MessagesResult) do
						local HasResult = value.userId and Set.has(SignalResult, value.userId) or false
						
						if value.isVisibleInBubbleChat and not HasResult then
							table.insert(List, value)
						end
					end
					return List
				end)
			end
			if not FFlagExpChatMessagesStoreMemoryCleanupModule then
				t3[Text].lastMessage = CreateComputedFunction(function(p5)
					-- upvalues: t3 (upval), Text (copy)
					local MessagesResult = t3[Text].messages(p5)
					
					return if #MessagesResult > 0 then MessagesResult[#MessagesResult] else nil
				end)
			end
		end
		return t3[Text]
	end
	
	local function getUserMessages(p4)
		-- upvalues: getUserMessageCache (copy)
		return getUserMessageCache(p4).messages
	end
	
	local function getUserLastMessage(p4)
		-- upvalues: getUserMessageCache (copy)
		return getUserMessageCache(p4).lastMessage
	end
	
	local _ = function()
		-- upvalues: CreateComputedFunction (upval), Signal (copy)
		return CreateComputedFunction(function(p4)
			-- upvalues: Signal (upval)
			local List = {}
			local Iterator = pairs
			local SignalResult = Signal(p4) or {}
			for _, value in Iterator(SignalResult) do
				table.insert(List, value)
			end
			return List
		end)
	end
	
	local function addSystemMessage(p4, ChannelNameOverride, Metadata, p5, p6)
		-- upvalues: SanitizeForRichTextModule (upval), GetFFlagExpChatSyntheticSystemMessageRichTextFunction (upval), GenerateRichSystemMessageTextFormatModule (upval), FFlagExpChatDictation (upval), FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (upval), HttpService (upval), Signal (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), Signal2_1 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (copy), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal3 (copy), Signal4 (copy), config (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local SanitizeForRichTextModuleResult = SanitizeForRichTextModule(p4)
		local config1 = {
			userId = nil,
			prefixText = "",
			translation = nil,
			useTranslation = false,
			isVisibleInChatWindow = true,
			isVisibleInBubbleChat = false,
			shouldOverrideBubbleChatSettings = false,
			textChannel = nil,
			bubbleChatMessageProperties = nil,
			chatWindowMessageProperties = nil,
			textChatMessageInstance = nil,
			partOrModel = nil,
			text = if GetFFlagExpChatSyntheticSystemMessageRichTextFunction() then GenerateRichSystemMessageTextFormatModule(SanitizeForRichTextModuleResult, if FFlagExpChatDictation then p6 else nil, if FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then p5 else nil) else SanitizeForRichTextModuleResult,
			messageId = HttpService:GenerateGUID(false),
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			channelNameOverride = ChannelNameOverride,
			metadata = Metadata
		}
		
		local function v126()
			-- upvalues: Signal (upval), config1 (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), Signal2_1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal3 (upval), Signal4 (upval), config (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Callback1 (upval)
			local v1 = Signal(false)
			
			if v1 and v1[config1.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p7)
						-- upvalues: List (upval), config1 (upval)
						return List.filter(p7, function(MessageId): boolean
							-- upvalues: config1 (upval)
							return MessageId ~= config1.messageId
						end)
					end)
					local v2 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
					
					if v2 then
						Signal2_3(function(p7)
							-- upvalues: v2 (copy), List (upval), config1 (upval), Dictionary (upval)
							local v3 = p7[v2]
							
							return if v3 then Dictionary.join(p7, {
								[v2] = List.filter(v3, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end)
							}) else p7
						end)
					end
					Signal2(function(p7)
						-- upvalues: Dictionary (upval), config1 (upval)
						return Dictionary.removeKey(p7, config1.messageId)
					end)
					
					if config1.userId then
						Signal2_1(function(p7)
							-- upvalues: config1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
							local v3 = p7[config1.userId]
							
							if v3 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v3, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end) else List.filter(v3, function(p8): boolean
									-- upvalues: config1 (upval)
									return p8.messageId ~= config1.messageId
								end)
								
								return if #FilterResult == 0 then Dictionary.removeKey(p7, config1.userId) else Dictionary.join(p7, { [config1.userId] = FilterResult })
							else
								return p7
							end
						end)
					end
					return
				else
					Signal2(function(p7)
						-- upvalues: Dictionary (upval), config1 (upval)
						return Dictionary.join(p7, { [config1.messageId] = config1 })
					end)
					
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
						Signal2_1(function(p7)
							-- upvalues: config1 (upval), List (upval), Dictionary (upval)
							local v3 = p7[config1.userId] or {}
							local v4 = nil
							
							for i, value in ipairs(v3) do
								if value.messageId == config1.messageId then
									v4 = i
									break
								end
							end
							return if v4 then Dictionary.join(p7, { [config1.userId] = List.set(v3, v4, config1) }) else p7
						end)
					end
					return
				end
			else
				local UserId = config1.userId
				local PartOrModel = config1.partOrModel
				
				if not UserId and PartOrModel then
					UserId = Signal10(false)[PartOrModel]
					
					if not UserId then
						UserId = HttpService:GenerateGUID(false)
						Signal2_6(function(p7)
							-- upvalues: Dictionary (upval), UserId (ref), PartOrModel (copy)
							return Dictionary.join(p7, { [UserId] = PartOrModel })
						end)
						Signal2_7(function(p7)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId (ref)
							return Dictionary.join(p7, { [PartOrModel] = UserId })
						end)
					end
				end
				local JoinResult = if UserId == config1.userId then config1 else Dictionary.join(config1, { userId = UserId })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v3 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v3 then
						local MessageId = v3[1]
						local v4 = v1 and v1[MessageId]
						
						if v4 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								Signal2(function(p7)
									-- upvalues: Dictionary (upval), MessageId (copy)
									return Dictionary.removeKey(p7, MessageId)
								end)
							end
							if v4.userId then
								Signal2_1(function(p7)
									-- upvalues: v4 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId (copy), Signal9 (upval), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									local v5 = p7[v4.userId]
									
									if not v5 then
										return p7
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v5, function(p8): boolean
										-- upvalues: MessageId (upval)
										return p8 ~= MessageId
									end) else List.filter(v5, function(p8): boolean
										-- upvalues: MessageId (upval)
										return p8.messageId ~= MessageId
									end)
									
									if #FilterResult ~= 0 then
										return Dictionary.join(p7, { [v4.userId] = FilterResult })
									end
									local v6 = Signal9(false)
									
									if v6[v4.userId] then
										local v7 = v6[v4.userId]
										Signal2_7(function(p8)
											-- upvalues: Dictionary (upval), v7 (copy)
											return Dictionary.removeKey(p8, v7)
										end)
										Signal2_6(function(p8)
											-- upvalues: Dictionary (upval), v4 (upval)
											return Dictionary.removeKey(p8, v4.userId)
										end)
									end
									return Dictionary.removeKey(p7, v4.userId)
								end)
							end
							Signal2_2(function(p7)
								-- upvalues: List (upval)
								return List.removeIndex(p7, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId] = nil
							end
						end
					end
					if ChannelNameOverride and config.messageLimit <= #T then
						local Entry = T[1]
						
						if Entry then
							Signal2_3(function(p7)
								-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
								return Dictionary.join(p7, {
									[ChannelNameOverride] = List.removeIndex(p7[ChannelNameOverride] or {}, 1)
								})
							end)
							
							if v1 and v1[Entry] then
								Signal2(function(p7)
									-- upvalues: Dictionary (upval), Entry (copy)
									return Dictionary.removeKey(p7, Entry)
								end)
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				Signal2(function(p7)
					-- upvalues: Dictionary (upval), JoinResult (copy)
					return Dictionary.join(p7, { [JoinResult.messageId] = JoinResult })
				end)
				
				if JoinResult.userId then
					Signal2_1(function(p7)
						-- upvalues: JoinResult (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
						local MessageIds = p7[JoinResult.userId] or {}
						local Flag = false
						if FFlagExpChatMessagesStoreMemoryCleanupModule then
							for _, messageId in ipairs(MessageIds) do
								if messageId == JoinResult.messageId then
									Flag = true
									break
								end
							end
						end
						for _, messageId1 in ipairs(MessageIds) do
							if messageId1.messageId == JoinResult.messageId then
								Flag = true
							end
						end
					end)
				end
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p8)
						-- upvalues: List (upval), JoinResult (copy)
						return List.append(p8, JoinResult.messageId)
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p8)
							-- upvalues: ChannelNameOverride (ref), List (upval), JoinResult (copy), Dictionary (upval)
							return Dictionary.join(p8, {
								[ChannelNameOverride] = List.append(p8[ChannelNameOverride] or {}, JoinResult.messageId)
							})
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							Callback1(JoinResult.messageId)
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v126)
			
			return
		else
			v126()
		end
	end
	
	local function formatPrefixForUniverseChatTabs(PrefixTextInternal, p7, TextChatMessage)
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), ComputeNameColorFunction (upval), Players (upval)
		return if GetFFlagTextChatEnableUniverseChatTabsFunction() and p7 and #PrefixTextInternal ~= 0 then `<font color="#{(if TextChatMessage.TextSource then ComputeNameColorFunction(TextChatMessage.TextSource.Username) else ComputeNameColorFunction(if Players.LocalPlayer then Players.LocalPlayer.Name else "")):ToHex()}">{PrefixTextInternal}</font>` else PrefixTextInternal
	end
	
	local function handleIncomingOrOutgoingMessage(TextChatMessage, _, p7, Enabled)
		-- upvalues: FFlagEnableInExpChatRewriteModule (upval), GetTextAndTranslationModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), IsWhiteSpaceOnlyModule (upval), Signal (copy), Signal7 (copy), FFlagExpChatPresetChatEnabled (upval), Signal6 (copy), Set (upval), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), ExpChatSharedModule (upval), Signal8 (copy), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatDisableUniverseBubbleChat (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), formatPrefixForUniverseChatTabs (copy), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagChatLineReportingGlobalMuteEnabled (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), Signal2_1 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), Signal11 (copy), Signal3 (copy), Signal4 (copy), config (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local TextAndTranslationModule = nil
		local TextAndTranslationModule2 = nil
		if FFlagEnableInExpChatRewriteModule then
			TextAndTranslationModule, TextAndTranslationModule2 = GetTextAndTranslationModule(TextChatMessage)
		else
			TextAndTranslationModule = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text
			TextAndTranslationModule2 = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TranslationInternal else TextChatMessage.Translation
		end
		if IsWhiteSpaceOnlyModule(TextAndTranslationModule) and TextChatMessage.Status ~= Enum.TextChatMessageStatus.Floodchecked and TextChatMessage.Status ~= Enum.TextChatMessageStatus.MessageTooLong then return end
		local Text = if TextChatMessage.TextSource then tostring(TextChatMessage.TextSource.UserId) else nil
		
		if not Signal(false) then return end
		local SignalResult = Signal7(false)
		local HasResult = if Text and Signal6(false) then Set.has(Signal6(false), Text) else false
		local NoHasResult: boolean = (Text == nil or (if SignalResult or FFlagExpChatPresetChatEnabled and (TextChatMessage.PresetId or "") ~= "" then TextChatMessage.Status == Enum.TextChatMessageStatus.Success or TextChatMessage.Status == Enum.TextChatMessageStatus.Sending else false)) and not HasResult
		local Flag = false
		local IsBubbleChatEnabled = nil
		
		if FFlagExpChatUseChatConfigStore then
			IsBubbleChatEnabled = GetChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false)
		else
			local Store = ExpChatSharedModule.context and ExpChatSharedModule.context.store
			IsBubbleChatEnabled = if Store then Store:getState().Messages.isBubbleChatEnabled else Signal8(false)
		end
		if IsBubbleChatEnabled and NoHasResult and (not FFlagEnableInExpChatSummaryOnLuaModule or Text ~= nil) and (TextChatMessage.Status == Enum.TextChatMessageStatus.Success or TextChatMessage.Status == Enum.TextChatMessageStatus.Sending) then
			Flag = true
		end
		if FFlagExpChatDisableUniverseBubbleChat and GetFFlagTextChatEnableUniverseChatTabsFunction() and Enabled == true then
			Flag = false
		end
		if TextChatMessage.Status ~= Enum.TextChatMessageStatus.Success and TextChatMessage.Status ~= Enum.TextChatMessageStatus.Sending then
			NoHasResult = false
			Flag = false
		end
		local config1 = {
			shouldOverrideBubbleChatSettings = false,
			userId = Text,
			prefixText = formatPrefixForUniverseChatTabs(if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.PrefixTextInternal else TextChatMessage.PrefixText, p7, TextChatMessage),
			text = TextAndTranslationModule,
			translation = TextAndTranslationModule2,
			useTranslation = getChatTranslationEnabled() and TextAndTranslationModule2 ~= nil,
			messageId = TextChatMessage.MessageId,
			status = TextChatMessage.Status,
			timestamp = TextChatMessage.Timestamp,
			isVisibleInBubbleChat = Flag,
			isVisibleInChatWindow = NoHasResult,
			textChannel = TextChatMessage.TextChannel,
			bubbleChatMessageProperties = TextChatMessage.BubbleChatMessageProperties,
			chatWindowMessageProperties = TextChatMessage.ChatWindowMessageProperties,
			textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then TextChatMessage else nil,
			partOrModel = TextChatMessage.TextSource and TextChatMessage.TextSource.Parent or nil,
			wasRewritten = if FFlagEnableInExpChatRewriteModule then TextChatMessage.WasRewritten else nil,
			originalText = if FFlagEnableInExpChatRewriteModule then TextChatMessage.OriginalText else nil,
			channelNameOverride = if GetFFlagTextChatEnableUniverseChatTabsFunction() and p7 then p7 else nil,
			chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then TextChatMessage.ChatActionType else nil,
			isUniverseChat = if FFlagChatLineReportingGlobalMuteEnabled then Enabled else nil,
			presetId = if FFlagExpChatPresetChatEnabled then TextChatMessage.PresetId else nil,
			presetChatVersion = if FFlagExpChatPresetChatEnabled then TextChatMessage.PresetChatVersion else nil
		}
		local SignalResult1 = Signal(false)
		local HasSignalResultEntry: boolean = SignalResult1 and SignalResult1[config1.messageId] ~= nil
		
		if config1.isVisibleInChatWindow or config1.isVisibleInBubbleChat or HasSignalResultEntry then
			local function v139()
				-- upvalues: Signal (upval), config1 (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), Signal2_1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal3 (upval), Signal4 (upval), config (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Callback1 (upval)
				local v5 = Signal(false)
				
				if v5 and v5[config1.messageId] then
					if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
						Signal2_2(function(p8)
							-- upvalues: List (upval), config1 (upval)
							return List.filter(p8, function(MessageId): boolean
								-- upvalues: config1 (upval)
								return MessageId ~= config1.messageId
							end)
						end)
						local v6 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
						
						if v6 then
							Signal2_3(function(p8)
								-- upvalues: v6 (copy), List (upval), config1 (upval), Dictionary (upval)
								local v7 = p8[v6]
								
								return if v7 then Dictionary.join(p8, {
									[v6] = List.filter(v7, function(MessageId): boolean
										-- upvalues: config1 (upval)
										return MessageId ~= config1.messageId
									end)
								}) else p8
							end)
						end
						Signal2(function(p8)
							-- upvalues: Dictionary (upval), config1 (upval)
							return Dictionary.removeKey(p8, config1.messageId)
						end)
						
						if config1.userId then
							Signal2_1(function(p8)
								-- upvalues: config1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
								local v7 = p8[config1.userId]
								
								if v7 then
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v7, function(MessageId): boolean
										-- upvalues: config1 (upval)
										return MessageId ~= config1.messageId
									end) else List.filter(v7, function(p9): boolean
										-- upvalues: config1 (upval)
										return p9.messageId ~= config1.messageId
									end)
									
									return if #FilterResult == 0 then Dictionary.removeKey(p8, config1.userId) else Dictionary.join(p8, { [config1.userId] = FilterResult })
								else
									return p8
								end
							end)
						end
						return
					else
						Signal2(function(p8)
							-- upvalues: Dictionary (upval), config1 (upval)
							return Dictionary.join(p8, { [config1.messageId] = config1 })
						end)
						
						if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
							Signal2_1(function(p8)
								-- upvalues: config1 (upval), List (upval), Dictionary (upval)
								local v7 = p8[config1.userId] or {}
								local v8 = nil
								
								for i, value in ipairs(v7) do
									if value.messageId == config1.messageId then
										v8 = i
										break
									end
								end
								return if v8 then Dictionary.join(p8, { [config1.userId] = List.set(v7, v8, config1) }) else p8
							end)
						end
						return
					end
				else
					local UserId = config1.userId
					local PartOrModel = config1.partOrModel
					
					if not UserId and PartOrModel then
						UserId = Signal10(false)[PartOrModel]
						
						if not UserId then
							UserId = HttpService:GenerateGUID(false)
							Signal2_6(function(p8)
								-- upvalues: Dictionary (upval), UserId (ref), PartOrModel (copy)
								return Dictionary.join(p8, { [UserId] = PartOrModel })
							end)
							Signal2_7(function(p8)
								-- upvalues: Dictionary (upval), PartOrModel (copy), UserId (ref)
								return Dictionary.join(p8, { [PartOrModel] = UserId })
							end)
						end
					end
					local JoinResult = if UserId == config1.userId then config1 else Dictionary.join(config1, { userId = UserId })
					local ChannelNameOverride = nil
					
					if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
						ChannelNameOverride = JoinResult.channelNameOverride
					elseif JoinResult.textChannel then
						ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
					end
					if JoinResult.isVisibleInChatWindow then
						local v7 = Signal3(false)
						local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
						
						if config.messageLimit <= #v7 then
							local MessageId = v7[1]
							local v8 = v5 and v5[MessageId]
							
							if v8 then
								if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
									Signal2(function(p8)
										-- upvalues: Dictionary (upval), MessageId (copy)
										return Dictionary.removeKey(p8, MessageId)
									end)
								end
								if v8.userId then
									Signal2_1(function(p8)
										-- upvalues: v8 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId (copy), Signal9 (upval), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
										local v9 = p8[v8.userId]
										
										if not v9 then
											return p8
										end
										local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v9, function(p9): boolean
											-- upvalues: MessageId (upval)
											return p9 ~= MessageId
										end) else List.filter(v9, function(p9): boolean
											-- upvalues: MessageId (upval)
											return p9.messageId ~= MessageId
										end)
										
										if #FilterResult ~= 0 then
											return Dictionary.join(p8, { [v8.userId] = FilterResult })
										end
										local v10 = Signal9(false)
										
										if v10[v8.userId] then
											local v11 = v10[v8.userId]
											Signal2_7(function(p9)
												-- upvalues: Dictionary (upval), v11 (copy)
												return Dictionary.removeKey(p9, v11)
											end)
											Signal2_6(function(p9)
												-- upvalues: Dictionary (upval), v8 (upval)
												return Dictionary.removeKey(p9, v8.userId)
											end)
										end
										return Dictionary.removeKey(p8, v8.userId)
									end)
								end
								Signal2_2(function(p8)
									-- upvalues: List (upval)
									return List.removeIndex(p8, 1)
								end)
								
								if FFlagExpChatMessagesStoreMemoryCleanupModule then
									t2[MessageId] = nil
								end
							end
						end
						if ChannelNameOverride and config.messageLimit <= #T then
							local Entry = T[1]
							
							if Entry then
								Signal2_3(function(p8)
									-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
									return Dictionary.join(p8, {
										[ChannelNameOverride] = List.removeIndex(p8[ChannelNameOverride] or {}, 1)
									})
								end)
								
								if v5 and v5[Entry] then
									Signal2(function(p8)
										-- upvalues: Dictionary (upval), Entry (copy)
										return Dictionary.removeKey(p8, Entry)
									end)
								end
								if FFlagExpChatMessagesStoreMemoryCleanupModule then
									t2[Entry] = nil
								end
							end
						end
					end
					Signal2(function(p8)
						-- upvalues: Dictionary (upval), JoinResult (copy)
						return Dictionary.join(p8, { [JoinResult.messageId] = JoinResult })
					end)
					
					if JoinResult.userId then
						Signal2_1(function(p8)
							-- upvalues: JoinResult (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
							local MessageIds = p8[JoinResult.userId] or {}
							local Flag = false
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								for _, messageId in ipairs(MessageIds) do
									if messageId == JoinResult.messageId then
										Flag = true
										break
									end
								end
							end
							for _, messageId1 in ipairs(MessageIds) do
								if messageId1.messageId == JoinResult.messageId then
									Flag = true
								end
							end
						end)
					end
					if JoinResult.isVisibleInChatWindow then
						Signal2_2(function(p9)
							-- upvalues: List (upval), JoinResult (copy)
							return List.append(p9, JoinResult.messageId)
						end)
						
						if ChannelNameOverride then
							Signal2_3(function(p9)
								-- upvalues: ChannelNameOverride (ref), List (upval), JoinResult (copy), Dictionary (upval)
								return Dictionary.join(p9, {
									[ChannelNameOverride] = List.append(p9[ChannelNameOverride] or {}, JoinResult.messageId)
								})
							end)
						end
						if FFlagExpChatEnableV2ChatWindowModule then
							local ChannelNameOverride1 = Signal14(false)
							
							if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
								Callback1(JoinResult.messageId)
							end
						end
					end
				end
			end
			
			if FFlagExpChatMessagesStoreBatchModule then
				SignalsExperimentalModule.batch(v139)
				
				return
			end
			v139()
		end
	end
	
	local function handleIncomingBubbleChatMessage(p8)
		-- upvalues: Signal (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), Signal2_1 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal3 (copy), Signal4 (copy), config (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local config1 = {
			prefixText = "",
			textChannel = nil,
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			chatWindowMessageProperties = nil,
			userId = p8.bubbleChatMessageUserId,
			text = p8.message,
			translation = p8.translation,
			useTranslation = getChatTranslationEnabled(),
			messageId = p8.bubbleChatMessageId,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = p8.timestamp,
			partOrModel = p8.partOrModel,
			bubbleChatMessageProperties = p8.bubbleChatMessageProperties
		}
		
		local function v141()
			-- upvalues: Signal (upval), config1 (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), Signal2_1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal3 (upval), Signal4 (upval), config (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Callback1 (upval)
			local v9 = Signal(false)
			
			if v9 and v9[config1.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p9)
						-- upvalues: List (upval), config1 (upval)
						return List.filter(p9, function(MessageId): boolean
							-- upvalues: config1 (upval)
							return MessageId ~= config1.messageId
						end)
					end)
					local v10 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
					
					if v10 then
						Signal2_3(function(p9)
							-- upvalues: v10 (copy), List (upval), config1 (upval), Dictionary (upval)
							local v11 = p9[v10]
							
							return if v11 then Dictionary.join(p9, {
								[v10] = List.filter(v11, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end)
							}) else p9
						end)
					end
					Signal2(function(p9)
						-- upvalues: Dictionary (upval), config1 (upval)
						return Dictionary.removeKey(p9, config1.messageId)
					end)
					
					if config1.userId then
						Signal2_1(function(p9)
							-- upvalues: config1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
							local v11 = p9[config1.userId]
							
							if v11 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v11, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end) else List.filter(v11, function(p10): boolean
									-- upvalues: config1 (upval)
									return p10.messageId ~= config1.messageId
								end)
								
								return if #FilterResult == 0 then Dictionary.removeKey(p9, config1.userId) else Dictionary.join(p9, { [config1.userId] = FilterResult })
							else
								return p9
							end
						end)
					end
					return
				else
					Signal2(function(p9)
						-- upvalues: Dictionary (upval), config1 (upval)
						return Dictionary.join(p9, { [config1.messageId] = config1 })
					end)
					
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
						Signal2_1(function(p9)
							-- upvalues: config1 (upval), List (upval), Dictionary (upval)
							local v11 = p9[config1.userId] or {}
							local v12 = nil
							
							for i, value in ipairs(v11) do
								if value.messageId == config1.messageId then
									v12 = i
									break
								end
							end
							return if v12 then Dictionary.join(p9, { [config1.userId] = List.set(v11, v12, config1) }) else p9
						end)
					end
					return
				end
			else
				local UserId = config1.userId
				local PartOrModel = config1.partOrModel
				
				if not UserId and PartOrModel then
					UserId = Signal10(false)[PartOrModel]
					
					if not UserId then
						UserId = HttpService:GenerateGUID(false)
						Signal2_6(function(p9)
							-- upvalues: Dictionary (upval), UserId (ref), PartOrModel (copy)
							return Dictionary.join(p9, { [UserId] = PartOrModel })
						end)
						Signal2_7(function(p9)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId (ref)
							return Dictionary.join(p9, { [PartOrModel] = UserId })
						end)
					end
				end
				local JoinResult = if UserId == config1.userId then config1 else Dictionary.join(config1, { userId = UserId })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v11 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v11 then
						local MessageId = v11[1]
						local v12 = v9 and v9[MessageId]
						
						if v12 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								Signal2(function(p9)
									-- upvalues: Dictionary (upval), MessageId (copy)
									return Dictionary.removeKey(p9, MessageId)
								end)
							end
							if v12.userId then
								Signal2_1(function(p9)
									-- upvalues: v12 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId (copy), Signal9 (upval), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									local v13 = p9[v12.userId]
									
									if not v13 then
										return p9
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v13, function(p10): boolean
										-- upvalues: MessageId (upval)
										return p10 ~= MessageId
									end) else List.filter(v13, function(p10): boolean
										-- upvalues: MessageId (upval)
										return p10.messageId ~= MessageId
									end)
									
									if #FilterResult ~= 0 then
										return Dictionary.join(p9, { [v12.userId] = FilterResult })
									end
									local v14 = Signal9(false)
									
									if v14[v12.userId] then
										local v15 = v14[v12.userId]
										Signal2_7(function(p10)
											-- upvalues: Dictionary (upval), v15 (copy)
											return Dictionary.removeKey(p10, v15)
										end)
										Signal2_6(function(p10)
											-- upvalues: Dictionary (upval), v12 (upval)
											return Dictionary.removeKey(p10, v12.userId)
										end)
									end
									return Dictionary.removeKey(p9, v12.userId)
								end)
							end
							Signal2_2(function(p9)
								-- upvalues: List (upval)
								return List.removeIndex(p9, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId] = nil
							end
						end
					end
					if ChannelNameOverride and config.messageLimit <= #T then
						local Entry = T[1]
						
						if Entry then
							Signal2_3(function(p9)
								-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
								return Dictionary.join(p9, {
									[ChannelNameOverride] = List.removeIndex(p9[ChannelNameOverride] or {}, 1)
								})
							end)
							
							if v9 and v9[Entry] then
								Signal2(function(p9)
									-- upvalues: Dictionary (upval), Entry (copy)
									return Dictionary.removeKey(p9, Entry)
								end)
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				Signal2(function(p9)
					-- upvalues: Dictionary (upval), JoinResult (copy)
					return Dictionary.join(p9, { [JoinResult.messageId] = JoinResult })
				end)
				
				if JoinResult.userId then
					Signal2_1(function(p9)
						-- upvalues: JoinResult (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
						local MessageIds = p9[JoinResult.userId] or {}
						local Flag = false
						if FFlagExpChatMessagesStoreMemoryCleanupModule then
							for _, messageId in ipairs(MessageIds) do
								if messageId == JoinResult.messageId then
									Flag = true
									break
								end
							end
						end
						for _, messageId1 in ipairs(MessageIds) do
							if messageId1.messageId == JoinResult.messageId then
								Flag = true
							end
						end
					end)
				end
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p10)
						-- upvalues: List (upval), JoinResult (copy)
						return List.append(p10, JoinResult.messageId)
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p10)
							-- upvalues: ChannelNameOverride (ref), List (upval), JoinResult (copy), Dictionary (upval)
							return Dictionary.join(p10, {
								[ChannelNameOverride] = List.append(p10[ChannelNameOverride] or {}, JoinResult.messageId)
							})
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							Callback1(JoinResult.messageId)
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v141)
			
			return
		else
			v141()
		end
	end
	
	local function handleHiddenMessageReceived(TextChatMessage)
		-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), FIntExpChatRandomCharChangeLowerBoundModule (upval), FIntExpChatRandomCharChangeUpperBoundModule (upval), ConfigModule (upval), GetFFlagExpChatTelemetryEventTriggerModule (upval), Signal (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), Signal2_1 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal3 (copy), Signal4 (copy), config (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local Length = string.len(if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text)
		local config1 = {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = ConfigModule.LOCK_EMOJI .. " :",
			text = string.rep(ConfigModule.DOT_TEXT, Length + math.random(math.max(FIntExpChatRandomCharChangeLowerBoundModule, -(Length - 1)), FIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = TextChatMessage.TextChannel,
			messageId = TextChatMessage.MessageId,
			status = TextChatMessage.Status,
			timestamp = TextChatMessage.Timestamp,
			textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then TextChatMessage else nil
		}
		
		local function v144()
			-- upvalues: Signal (upval), config1 (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), Signal2_1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal3 (upval), Signal4 (upval), config (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Callback1 (upval)
			local v13 = Signal(false)
			
			if v13 and v13[config1.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p9)
						-- upvalues: List (upval), config1 (upval)
						return List.filter(p9, function(MessageId): boolean
							-- upvalues: config1 (upval)
							return MessageId ~= config1.messageId
						end)
					end)
					local v14 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
					
					if v14 then
						Signal2_3(function(p9)
							-- upvalues: v14 (copy), List (upval), config1 (upval), Dictionary (upval)
							local v15 = p9[v14]
							
							return if v15 then Dictionary.join(p9, {
								[v14] = List.filter(v15, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end)
							}) else p9
						end)
					end
					Signal2(function(p9)
						-- upvalues: Dictionary (upval), config1 (upval)
						return Dictionary.removeKey(p9, config1.messageId)
					end)
					
					if config1.userId then
						Signal2_1(function(p9)
							-- upvalues: config1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
							local v15 = p9[config1.userId]
							
							if v15 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v15, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end) else List.filter(v15, function(p10): boolean
									-- upvalues: config1 (upval)
									return p10.messageId ~= config1.messageId
								end)
								
								return if #FilterResult == 0 then Dictionary.removeKey(p9, config1.userId) else Dictionary.join(p9, { [config1.userId] = FilterResult })
							else
								return p9
							end
						end)
					end
					return
				else
					Signal2(function(p9)
						-- upvalues: Dictionary (upval), config1 (upval)
						return Dictionary.join(p9, { [config1.messageId] = config1 })
					end)
					
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
						Signal2_1(function(p9)
							-- upvalues: config1 (upval), List (upval), Dictionary (upval)
							local v15 = p9[config1.userId] or {}
							local v16 = nil
							
							for i, value in ipairs(v15) do
								if value.messageId == config1.messageId then
									v16 = i
									break
								end
							end
							return if v16 then Dictionary.join(p9, { [config1.userId] = List.set(v15, v16, config1) }) else p9
						end)
					end
					return
				end
			else
				local UserId = config1.userId
				local PartOrModel = config1.partOrModel
				
				if not UserId and PartOrModel then
					UserId = Signal10(false)[PartOrModel]
					
					if not UserId then
						UserId = HttpService:GenerateGUID(false)
						Signal2_6(function(p9)
							-- upvalues: Dictionary (upval), UserId (ref), PartOrModel (copy)
							return Dictionary.join(p9, { [UserId] = PartOrModel })
						end)
						Signal2_7(function(p9)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId (ref)
							return Dictionary.join(p9, { [PartOrModel] = UserId })
						end)
					end
				end
				local JoinResult = if UserId == config1.userId then config1 else Dictionary.join(config1, { userId = UserId })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v15 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v15 then
						local MessageId = v15[1]
						local v16 = v13 and v13[MessageId]
						
						if v16 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								Signal2(function(p9)
									-- upvalues: Dictionary (upval), MessageId (copy)
									return Dictionary.removeKey(p9, MessageId)
								end)
							end
							if v16.userId then
								Signal2_1(function(p9)
									-- upvalues: v16 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId (copy), Signal9 (upval), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									local v17 = p9[v16.userId]
									
									if not v17 then
										return p9
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v17, function(p10): boolean
										-- upvalues: MessageId (upval)
										return p10 ~= MessageId
									end) else List.filter(v17, function(p10): boolean
										-- upvalues: MessageId (upval)
										return p10.messageId ~= MessageId
									end)
									
									if #FilterResult ~= 0 then
										return Dictionary.join(p9, { [v16.userId] = FilterResult })
									end
									local v18 = Signal9(false)
									
									if v18[v16.userId] then
										local v19 = v18[v16.userId]
										Signal2_7(function(p10)
											-- upvalues: Dictionary (upval), v19 (copy)
											return Dictionary.removeKey(p10, v19)
										end)
										Signal2_6(function(p10)
											-- upvalues: Dictionary (upval), v16 (upval)
											return Dictionary.removeKey(p10, v16.userId)
										end)
									end
									return Dictionary.removeKey(p9, v16.userId)
								end)
							end
							Signal2_2(function(p9)
								-- upvalues: List (upval)
								return List.removeIndex(p9, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId] = nil
							end
						end
					end
					if ChannelNameOverride and config.messageLimit <= #T then
						local Entry = T[1]
						
						if Entry then
							Signal2_3(function(p9)
								-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
								return Dictionary.join(p9, {
									[ChannelNameOverride] = List.removeIndex(p9[ChannelNameOverride] or {}, 1)
								})
							end)
							
							if v13 and v13[Entry] then
								Signal2(function(p9)
									-- upvalues: Dictionary (upval), Entry (copy)
									return Dictionary.removeKey(p9, Entry)
								end)
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				Signal2(function(p9)
					-- upvalues: Dictionary (upval), JoinResult (copy)
					return Dictionary.join(p9, { [JoinResult.messageId] = JoinResult })
				end)
				
				if JoinResult.userId then
					Signal2_1(function(p9)
						-- upvalues: JoinResult (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
						local MessageIds = p9[JoinResult.userId] or {}
						local Flag = false
						if FFlagExpChatMessagesStoreMemoryCleanupModule then
							for _, messageId in ipairs(MessageIds) do
								if messageId == JoinResult.messageId then
									Flag = true
									break
								end
							end
						end
						for _, messageId1 in ipairs(MessageIds) do
							if messageId1.messageId == JoinResult.messageId then
								Flag = true
							end
						end
					end)
				end
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p10)
						-- upvalues: List (upval), JoinResult (copy)
						return List.append(p10, JoinResult.messageId)
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p10)
							-- upvalues: ChannelNameOverride (ref), List (upval), JoinResult (copy), Dictionary (upval)
							return Dictionary.join(p10, {
								[ChannelNameOverride] = List.append(p10[ChannelNameOverride] or {}, JoinResult.messageId)
							})
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							Callback1(JoinResult.messageId)
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v144)
			
			return
		else
			v144()
		end
	end
	
	local function handleLegacyBubbleCreated(p9)
		-- upvalues: Signal (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), Signal2_1 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal3 (copy), Signal4 (copy), config (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local Timestamp = p9.timestamp
		local config1 = {
			prefixText = "",
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			translation = nil,
			useTranslation = false,
			textChannel = nil,
			bubbleChatMessageProperties = nil,
			chatWindowMessageProperties = nil,
			userId = p9.userId,
			text = p9.text,
			messageId = p9.id,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = if Timestamp then DateTime.fromUnixTimestampMillis(Timestamp) else DateTime.now(),
			partOrModel = p9.adornee
		}
		
		local function v160()
			-- upvalues: Signal (upval), config1 (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), Signal2_1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal3 (upval), Signal4 (upval), config (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Callback1 (upval)
			local v17 = Signal(false)
			
			if v17 and v17[config1.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p10)
						-- upvalues: List (upval), config1 (upval)
						return List.filter(p10, function(MessageId): boolean
							-- upvalues: config1 (upval)
							return MessageId ~= config1.messageId
						end)
					end)
					local v18 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
					
					if v18 then
						Signal2_3(function(p10)
							-- upvalues: v18 (copy), List (upval), config1 (upval), Dictionary (upval)
							local v19 = p10[v18]
							
							return if v19 then Dictionary.join(p10, {
								[v18] = List.filter(v19, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end)
							}) else p10
						end)
					end
					Signal2(function(p10)
						-- upvalues: Dictionary (upval), config1 (upval)
						return Dictionary.removeKey(p10, config1.messageId)
					end)
					
					if config1.userId then
						Signal2_1(function(p10)
							-- upvalues: config1 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
							local v19 = p10[config1.userId]
							
							if v19 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v19, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end) else List.filter(v19, function(p11): boolean
									-- upvalues: config1 (upval)
									return p11.messageId ~= config1.messageId
								end)
								
								return if #FilterResult == 0 then Dictionary.removeKey(p10, config1.userId) else Dictionary.join(p10, { [config1.userId] = FilterResult })
							else
								return p10
							end
						end)
					end
					return
				else
					Signal2(function(p10)
						-- upvalues: Dictionary (upval), config1 (upval)
						return Dictionary.join(p10, { [config1.messageId] = config1 })
					end)
					
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
						Signal2_1(function(p10)
							-- upvalues: config1 (upval), List (upval), Dictionary (upval)
							local v19 = p10[config1.userId] or {}
							local v20 = nil
							
							for i, value in ipairs(v19) do
								if value.messageId == config1.messageId then
									v20 = i
									break
								end
							end
							return if v20 then Dictionary.join(p10, { [config1.userId] = List.set(v19, v20, config1) }) else p10
						end)
					end
					return
				end
			else
				local UserId = config1.userId
				local PartOrModel = config1.partOrModel
				
				if not UserId and PartOrModel then
					UserId = Signal10(false)[PartOrModel]
					
					if not UserId then
						UserId = HttpService:GenerateGUID(false)
						Signal2_6(function(p10)
							-- upvalues: Dictionary (upval), UserId (ref), PartOrModel (copy)
							return Dictionary.join(p10, { [UserId] = PartOrModel })
						end)
						Signal2_7(function(p10)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId (ref)
							return Dictionary.join(p10, { [PartOrModel] = UserId })
						end)
					end
				end
				local JoinResult = if UserId == config1.userId then config1 else Dictionary.join(config1, { userId = UserId })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v19 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v19 then
						local MessageId = v19[1]
						local v20 = v17 and v17[MessageId]
						
						if v20 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								Signal2(function(p10)
									-- upvalues: Dictionary (upval), MessageId (copy)
									return Dictionary.removeKey(p10, MessageId)
								end)
							end
							if v20.userId then
								Signal2_1(function(p10)
									-- upvalues: v20 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId (copy), Signal9 (upval), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									local v21 = p10[v20.userId]
									
									if not v21 then
										return p10
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(v21, function(p11): boolean
										-- upvalues: MessageId (upval)
										return p11 ~= MessageId
									end) else List.filter(v21, function(p11): boolean
										-- upvalues: MessageId (upval)
										return p11.messageId ~= MessageId
									end)
									
									if #FilterResult ~= 0 then
										return Dictionary.join(p10, { [v20.userId] = FilterResult })
									end
									local v22 = Signal9(false)
									
									if v22[v20.userId] then
										local v23 = v22[v20.userId]
										Signal2_7(function(p11)
											-- upvalues: Dictionary (upval), v23 (copy)
											return Dictionary.removeKey(p11, v23)
										end)
										Signal2_6(function(p11)
											-- upvalues: Dictionary (upval), v20 (upval)
											return Dictionary.removeKey(p11, v20.userId)
										end)
									end
									return Dictionary.removeKey(p10, v20.userId)
								end)
							end
							Signal2_2(function(p10)
								-- upvalues: List (upval)
								return List.removeIndex(p10, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId] = nil
							end
						end
					end
					if ChannelNameOverride and config.messageLimit <= #T then
						local Entry = T[1]
						
						if Entry then
							Signal2_3(function(p10)
								-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
								return Dictionary.join(p10, {
									[ChannelNameOverride] = List.removeIndex(p10[ChannelNameOverride] or {}, 1)
								})
							end)
							
							if v17 and v17[Entry] then
								Signal2(function(p10)
									-- upvalues: Dictionary (upval), Entry (copy)
									return Dictionary.removeKey(p10, Entry)
								end)
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				Signal2(function(p10)
					-- upvalues: Dictionary (upval), JoinResult (copy)
					return Dictionary.join(p10, { [JoinResult.messageId] = JoinResult })
				end)
				
				if JoinResult.userId then
					Signal2_1(function(p10)
						-- upvalues: JoinResult (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), Dictionary (upval)
						local MessageIds = p10[JoinResult.userId] or {}
						local Flag = false
						if FFlagExpChatMessagesStoreMemoryCleanupModule then
							for _, messageId in ipairs(MessageIds) do
								if messageId == JoinResult.messageId then
									Flag = true
									break
								end
							end
						end
						for _, messageId1 in ipairs(MessageIds) do
							if messageId1.messageId == JoinResult.messageId then
								Flag = true
							end
						end
					end)
				end
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p11)
						-- upvalues: List (upval), JoinResult (copy)
						return List.append(p11, JoinResult.messageId)
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p11)
							-- upvalues: ChannelNameOverride (ref), List (upval), JoinResult (copy), Dictionary (upval)
							return Dictionary.join(p11, {
								[ChannelNameOverride] = List.append(p11[ChannelNameOverride] or {}, JoinResult.messageId)
							})
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							Callback1(JoinResult.messageId)
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v160)
			
			return
		else
			v160()
		end
	end
	
	Callback1 = function(MessageId)
		-- upvalues: Signal12 (copy), Signal13 (copy), Signal2_10 (copy), t (copy), FFlagEnableInExpChatRewriteModule (upval), Total (ref), t1 (copy)
		local SignalResult = Signal12(false)
		
		if #SignalResult == 0 then return end
		local SignalResult1: number = Signal13(false)
		local SignalResultEntry = SignalResult[SignalResult1]
		
		if not SignalResultEntry then
			Signal2_10(1)
			
			return
		end
		local Entry = t[SignalResultEntry]
		
		if Entry then
			Entry.setter(MessageId)
		end
		Total += if FFlagEnableInExpChatRewriteModule then 10 else 1
		local Entry1 = t1[SignalResultEntry]
		
		if Entry1 then
			Entry1.setter(Total)
		end
		Signal2_10(SignalResult1 % #SignalResult + 1)
	end
	
	return {
		getByMessageId = Signal,
		getMessages = if FFlagExpChatMessagesStoreMemoryCleanupModule then nil else CreateComputedFunction(function(p10)
			-- upvalues: Signal (copy)
			local List = {}
			local Iterator = pairs
			local SignalResult = Signal(p10) or {}
			for _, value in Iterator(SignalResult) do
				table.insert(List, value)
			end
			return List
		end),
		getMessagesBySenderId = Signal1,
		getWindowMessagesInOrder = Signal3,
		getWindowMessagesInOrderByTabId = Signal4,
		getMutedUserIds = Signal6,
		getCanLocalUserChat = Signal7,
		getIsBubbleChatEnabled = Signal8,
		getMockUserIdToPartOrModel = Signal9,
		getPartOrModelToMockUserId = Signal10,
		getMessage = function(Key)
			-- upvalues: t2 (copy), CreateComputedFunction (upval), Signal (copy)
			if not t2[Key] then
				t2[Key] = CreateComputedFunction(function(p11)
					-- upvalues: Signal (upval), Key (copy)
					local SignalResult = Signal(p11)
					
					return if SignalResult and SignalResult[Key] then SignalResult[Key] else nil
				end)
			end
			return t2[Key]
		end,
		getUserMessages = if FFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserMessages,
		getUserBubbleMessages = function(p11)
			-- upvalues: getUserMessageCache (copy)
			return getUserMessageCache(p11).bubbleMessages
		end,
		getUserLastMessage = if FFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserLastMessage,
		registerMessageComponent = function(Key)
			-- upvalues: t (copy), CreateSignalFunction (upval), t1 (copy), Signal2_9 (copy), List (upval)
			if not t[Key] then
				local Signal, Signal2 = CreateSignalFunction(nil)
				t[Key] = { getter = Signal, setter = Signal2 }
				local Signal1, Signal2_1 = CreateSignalFunction(0)
				t1[Key] = { getter = Signal1, setter = Signal2_1 }
				Signal2_9(function(p11)
					-- upvalues: List (upval), Key (copy)
					return List.append(p11, Key)
				end)
			end
			return t[Key].getter
		end,
		unregisterMessageComponent = function(Key)
			-- upvalues: Signal12 (copy), t (copy), t1 (copy), Signal2_9 (copy), List (upval), Signal13 (copy), Signal2_10 (copy), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
			local SignalResult = Signal12(false)
			local v21 = nil
			
			for i, value in ipairs(SignalResult) do
				if value == Key then
					v21 = i
					break
				end
			end
			if t[Key] then
				t[Key] = nil
			end
			if t1[Key] then
				t1[Key] = nil
			end
			if v21 then
				local function doUnregister()
					-- upvalues: Signal2_9 (upval), List (upval), Key (copy), Signal12 (upval), Signal13 (upval), Signal2_10 (upval), v21 (ref)
					Signal2_9(function(p11)
						-- upvalues: List (upval), Key (upval)
						return List.filter(p11, function(Key1): boolean
							-- upvalues: Key (upval)
							return Key1 ~= Key
						end)
					end)
					local SignalResult = Signal12(false)
					local SignalResult1: number = Signal13(false)
					
					if #SignalResult == 0 then
						Signal2_10(1)
						
						return
					end
					if v21 < SignalResult1 then
						Signal2_10(SignalResult1 - 1)
						
						return
					end
					if #SignalResult < SignalResult1 then
						Signal2_10(1)
					end
				end
				
				if FFlagExpChatMessagesStoreBatchModule then
					SignalsExperimentalModule.batch(doUnregister)
				else
					doUnregister()
				end
			end
		end,
		repopulateMessageComponents = function()
			-- upvalues: Signal14 (copy), Signal4 (copy), Signal3 (copy), Signal2_10 (copy), Total (ref), Callback1 (ref), Signal12 (copy), Signal13 (copy), t (copy), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
			local function doRepopulate()
				-- upvalues: Signal14 (upval), Signal4 (upval), Signal3 (upval), Signal2_10 (upval), Total (upval), Callback1 (upval), Signal12 (upval), Signal13 (upval), t (upval)
				local SignalResult = Signal14(false)
				local SignalResultEntry = if SignalResult then Signal4(false)[SignalResult] or {} else Signal3(false)
				Signal2_10(1)
				Total = 0
				
				for _, value in ipairs(SignalResultEntry) do
					Callback1(value)
				end
				local SignalResult1 = Signal12(false)
				
				if #SignalResultEntry < #SignalResult1 then
					for i = Signal13(false), #SignalResult1 do
						local Entry = t[SignalResult1[i]]
						
						if Entry then
							Entry.setter(nil)
						end
					end
				end
			end
			
			if FFlagExpChatMessagesStoreBatchModule then
				SignalsExperimentalModule.batch(doRepopulate)
				
				return
			else
				doRepopulate()
			end
		end,
		getMessageComponentSignal = function(p11)
			-- upvalues: t (copy)
			local Entry = t[p11]
			
			return if Entry then Entry.getter else nil
		end,
		getLayoutOrderSignal = function(p11)
			-- upvalues: t1 (copy)
			local Entry = t1[p11]
			
			return if Entry then Entry.getter else nil
		end,
		updateNextMessageComponent = Callback1,
		getMessageComponentRingBuffer = Signal12,
		getNextMessageComponentPointer = Signal13,
		setActiveChannelFilter = Signal2_11,
		getActiveChannelFilter = Signal14,
		setCanLocalUserChat = Signal2_5,
		muteUser = function(p11)
			-- upvalues: Signal2_4 (copy), Set (upval)
			Signal2_4(function(p12)
				-- upvalues: Set (upval), p11 (copy)
				return if p12 then Set.add(p12, p11) else {}
			end)
		end,
		unmuteUser = function(p11)
			-- upvalues: Signal2_4 (copy), Set (upval)
			Signal2_4(function(p12)
				-- upvalues: Set (upval), p11 (copy)
				return if p12 then Set.subtract(p12, p11) else {}
			end)
		end,
		handlePlayerRemoved = function(p11)
			-- upvalues: Signal2_1 (copy), Dictionary (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), t3 (copy), Signal2_4 (copy), Set (upval), Signal1 (copy), Signal9 (copy), Signal2_7 (copy), Signal2_6 (copy), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
			local Text = tostring(p11)
			
			local function doHandlePlayerRemoved()
				-- upvalues: Signal2_1 (upval), Dictionary (upval), Text (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), t3 (upval), Signal2_4 (upval), Set (upval), Signal1 (upval), Signal9 (upval), Signal2_7 (upval), Signal2_6 (upval)
				Signal2_1(function(p12)
					-- upvalues: Dictionary (upval), Text (upval)
					return Dictionary.removeKey(p12, Text)
				end)
				
				if FFlagExpChatMessagesStoreMemoryCleanupModule then
					t3[Text] = nil
				end
				Signal2_4(function(p12)
					-- upvalues: Set (upval), Text (upval), Signal1 (upval), Signal9 (upval), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
					if not p12 then
						return {}
					end
					local Inverted = not Set.has(p12, Text)
					
					if #(Signal1(false)[Text] or {}) == 0 and Inverted then
						return p12
					end
					local SignalResult = Signal9(false)
					
					if SignalResult[Text] then
						local SignalResultEntry = SignalResult[Text]
						Signal2_7(function(p13)
							-- upvalues: Dictionary (upval), SignalResultEntry (copy)
							return Dictionary.removeKey(p13, SignalResultEntry)
						end)
						Signal2_6(function(p13)
							-- upvalues: Dictionary (upval), Text (upval)
							return Dictionary.removeKey(p13, Text)
						end)
					end
					return Set.subtract(p12, Text)
				end)
			end
			
			if FFlagExpChatMessagesStoreBatchModule then
				SignalsExperimentalModule.batch(doHandlePlayerRemoved)
				
				return
			else
				doHandlePlayerRemoved()
			end
		end,
		clearWindowMessages = function()
			-- upvalues: Signal2 (copy), Dictionary (upval), Signal2_2 (copy), Signal2_3 (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal2_10 (copy), Total (ref), Signal12 (copy), t (copy), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
			local function doClearWindowMessages()
				-- upvalues: Signal2 (upval), Dictionary (upval), Signal2_2 (upval), Signal2_3 (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal2_10 (upval), Total (upval), Signal12 (upval), t (upval)
				Signal2(function(p11)
					-- upvalues: Dictionary (upval)
					return if p11 then Dictionary.map(p11, function(p12)
						-- upvalues: Dictionary (upval)
						return Dictionary.join(p12, { isVisibleInChatWindow = false })
					end) else {}
				end)
				Signal2_2(function(_)
					return {}
				end)
				Signal2_3(function(_)
					return {}
				end)
				
				if FFlagExpChatEnableV2ChatWindowModule then
					Signal2_10(1)
					Total = 0
					
					for _, value in ipairs((Signal12(false))) do
						local Entry = t[value]
						
						if Entry then
							Entry.setter(nil)
						end
					end
				end
			end
			
			if FFlagExpChatMessagesStoreBatchModule then
				SignalsExperimentalModule.batch(doClearWindowMessages)
				
				return
			else
				doClearWindowMessages()
			end
		end,
		toggleGlobalTranslation = function(UseTranslation)
			-- upvalues: Signal2 (copy), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagEnableInExpChatRewriteModule (upval), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatPresetChatEnabled (upval), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
			local function doToggleGlobalTranslation()
				-- upvalues: Signal2 (upval), UseTranslation (copy), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagEnableInExpChatRewriteModule (upval), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatPresetChatEnabled (upval)
				Signal2(function(List)
					-- upvalues: UseTranslation (upval), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagEnableInExpChatRewriteModule (upval), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatPresetChatEnabled (upval)
					if not List then
						return {}
					end
					local t = {}
					
					for i, _ in pairs(List) do
						local Entry = List[i]
						
						if Entry ~= nil then
							t[i] = {
								prefixText = Entry.prefixText,
								text = Entry.text,
								translation = Entry.translation,
								useTranslation = UseTranslation,
								messageId = Entry.messageId,
								status = Entry.status,
								timestamp = Entry.timestamp,
								isVisibleInBubbleChat = Entry.isVisibleInBubbleChat,
								isVisibleInChatWindow = Entry.isVisibleInChatWindow,
								partOrModel = Entry.partOrModel,
								shouldOverrideBubbleChatSettings = Entry.shouldOverrideBubbleChatSettings,
								bubbleChatMessageProperties = Entry.bubbleChatMessageProperties,
								chatWindowMessageProperties = Entry.chatWindowMessageProperties,
								textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then Entry.textChatMessageInstance else nil,
								userId = Entry.userId,
								textChannel = Entry.textChannel,
								wasRewritten = if FFlagEnableInExpChatRewriteModule then Entry.wasRewritten else nil,
								originalText = if FFlagEnableInExpChatRewriteModule then Entry.originalText else nil,
								chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then Entry.chatActionType else nil,
								presetId = if FFlagExpChatPresetChatEnabled then Entry.presetId else nil,
								presetChatVersion = if FFlagExpChatPresetChatEnabled then Entry.presetChatVersion else nil
							}
						end
					end
					return t
				end)
			end
			
			if FFlagExpChatMessagesStoreBatchModule then
				SignalsExperimentalModule.batch(doToggleGlobalTranslation)
				
				return
			else
				Signal2(function(List)
					-- upvalues: UseTranslation (copy), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagEnableInExpChatRewriteModule (upval), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatPresetChatEnabled (upval)
					if not List then
						return {}
					end
					local t = {}
					
					for i, _ in pairs(List) do
						local Entry = List[i]
						
						if Entry ~= nil then
							t[i] = {
								prefixText = Entry.prefixText,
								text = Entry.text,
								translation = Entry.translation,
								useTranslation = UseTranslation,
								messageId = Entry.messageId,
								status = Entry.status,
								timestamp = Entry.timestamp,
								isVisibleInBubbleChat = Entry.isVisibleInBubbleChat,
								isVisibleInChatWindow = Entry.isVisibleInChatWindow,
								partOrModel = Entry.partOrModel,
								shouldOverrideBubbleChatSettings = Entry.shouldOverrideBubbleChatSettings,
								bubbleChatMessageProperties = Entry.bubbleChatMessageProperties,
								chatWindowMessageProperties = Entry.chatWindowMessageProperties,
								textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then Entry.textChatMessageInstance else nil,
								userId = Entry.userId,
								textChannel = Entry.textChannel,
								wasRewritten = if FFlagEnableInExpChatRewriteModule then Entry.wasRewritten else nil,
								originalText = if FFlagEnableInExpChatRewriteModule then Entry.originalText else nil,
								chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then Entry.chatActionType else nil,
								presetId = if FFlagExpChatPresetChatEnabled then Entry.presetId else nil,
								presetChatVersion = if FFlagExpChatPresetChatEnabled then Entry.presetChatVersion else nil
							}
						end
					end
					return t
				end)
			end
		end,
		toggleMessageTranslation = function(UseTranslation, p11)
			-- upvalues: Signal2 (copy), Dictionary (upval), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagEnableInExpChatRewriteModule (upval), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatPresetChatEnabled (upval)
			Signal2(function(p12)
				-- upvalues: p11 (copy), Dictionary (upval), UseTranslation (copy), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagEnableInExpChatRewriteModule (upval), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatPresetChatEnabled (upval)
				if p12 then
					local v22 = p12[p11]
					
					return if v22 == nil then p12 else Dictionary.join(p12, {
						[p11] = {
							prefixText = v22.prefixText,
							text = v22.text,
							translation = v22.translation,
							useTranslation = UseTranslation,
							messageId = v22.messageId,
							status = v22.status,
							timestamp = v22.timestamp,
							isVisibleInBubbleChat = v22.isVisibleInBubbleChat,
							isVisibleInChatWindow = v22.isVisibleInChatWindow,
							partOrModel = v22.partOrModel,
							shouldOverrideBubbleChatSettings = v22.shouldOverrideBubbleChatSettings,
							bubbleChatMessageProperties = v22.bubbleChatMessageProperties,
							chatWindowMessageProperties = v22.chatWindowMessageProperties,
							textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then v22.textChatMessageInstance else nil,
							userId = v22.userId,
							textChannel = v22.textChannel,
							wasRewritten = if FFlagEnableInExpChatRewriteModule then v22.wasRewritten else nil,
							originalText = if FFlagEnableInExpChatRewriteModule then v22.originalText else nil,
							chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then v22.chatActionType else nil,
							presetId = if FFlagExpChatPresetChatEnabled then v22.presetId else nil,
							presetChatVersion = if FFlagExpChatPresetChatEnabled then v22.presetChatVersion else nil
						}
					})
				else
					return {}
				end
			end)
		end,
		handleIncomingOrOutgoingMessage = handleIncomingOrOutgoingMessage,
		handleIncomingBubbleChatMessage = handleIncomingBubbleChatMessage,
		handleLegacyBubbleCreated = handleLegacyBubbleCreated,
		handleLegacyBubbleTextUpdated = function(p11, Text)
			-- upvalues: Signal2 (copy), Dictionary (upval)
			Signal2(function(p12)
				-- upvalues: p11 (copy), Dictionary (upval), Text (copy)
				return if p12 then if p12[p11] then Dictionary.join(p12, { [p11] = Dictionary.join(p12[p11], { text = Text }) }) else p12 else {}
			end)
		end,
		handleHiddenMessageReceived = handleHiddenMessageReceived,
		handleHiddenMessagesCleared = function()
			-- upvalues: FFlagExpChatClearHiddenMessagesPostAgeCheckModule (upval), Signal2 (copy), Dictionary (upval), Signal2_2 (copy), List (upval), Signal (copy), Signal2_3 (copy)
			if FFlagExpChatClearHiddenMessagesPostAgeCheckModule then
				Signal2(function(p11)
					-- upvalues: Dictionary (upval)
					return Dictionary.map(p11, function(p12)
						-- upvalues: Dictionary (upval)
						return if p12.isHiddenMessage then Dictionary.join(p12, { isVisibleInChatWindow = false }) else p12
					end)
				end)
				Signal2_2(function(p11)
					-- upvalues: List (upval), Signal (upval)
					return List.filter(p11, function(p12): boolean
						-- upvalues: Signal (upval)
						local SignalResultEntry = Signal(false)[p12]
						
						return SignalResultEntry and not SignalResultEntry.isHiddenMessage
					end)
				end)
				Signal2_3(function(p11)
					-- upvalues: Dictionary (upval), List (upval), Signal (upval)
					return Dictionary.map(p11, function(p12)
						-- upvalues: List (upval), Signal (upval)
						return List.filter(p12, function(p13): boolean
							-- upvalues: Signal (upval)
							local SignalResultEntry = Signal(false)[p13]
							
							return SignalResultEntry and not SignalResultEntry.isHiddenMessage
						end)
					end)
				end)
				
				return
			end
		end,
		addSystemMessage = addSystemMessage,
		getChannelTabsConfigurationEnabled = Signal11,
		setChannelTabsConfigurationEnabled = Signal2_8
	}
end