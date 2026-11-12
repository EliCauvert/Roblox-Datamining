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
local ShouldRenderTextChannelInDefaultWindowFunction = ExpChatSharedModule.shouldRenderTextChannelInDefaultWindow
local GetTextChannelDisplayModeFunction = ExpChatSharedModule.getTextChannelDisplayMode
local GetTextAndTranslationModule = require(ExpChat.getTextAndTranslation)
local GetServerTimeNowMillisModule = require(ExpChat.BubbleChat.Helpers.getServerTimeNowMillis)
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
local CreateProxyFunction = SignalsExperimentalModule.createProxy
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
local IsGlobalBubbleChatEnabledModule = require(ExpChat.isGlobalBubbleChatEnabled)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local GetFFlagExpChatSyntheticSystemMessageRichTextFunction = ExpChatSharedModule.Flags.GetFFlagExpChatSyntheticSystemMessageRichText
local FFlagExpChatMessagesStoreKeepInByMessageIdModule = require(ExpChat.Flags.FFlagExpChatMessagesStoreKeepInByMessageId)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local GetFFlagExpChatProtectedChatInternalAPIsFunction = SharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local FFlagExpChatDictation = SharedFlagsModule.FFlagExpChatDictation
local FFlagExpChatMessagesStoreBatchModule = require(ExpChat.Flags.FFlagExpChatMessagesStoreBatch)
local FFlagExpChatMessagesStoreUseProxyModule = require(ExpChat.Flags.FFlagExpChatMessagesStoreUseProxy)
local FFlagExpChatMessagesStoreMemoryCleanupModule = require(ExpChat.Flags.FFlagExpChatMessagesStoreMemoryCleanup)
local FFlagExpChatEvictFloodcheckedFromWindowOrderModule = require(ExpChat.Flags.FFlagExpChatEvictFloodcheckedFromWindowOrder)
local FFlagExpChatFixLocalUserVerifiedBadgeModule = require(ExpChat.Flags.FFlagExpChatFixLocalUserVerifiedBadge)
local IsBorderlessBubbleChatEnabledModule = require(ExpChat.isBorderlessBubbleChatEnabled)
local ExpChatPresetChatEmojiEffectExperimentation = require(Parent.SocialExperiments).ExpChatPresetChatEmojiEffectExperimentation
local LogPresetChatEmojiEffectExposureModule = require(ExpChat.PresetChat.logPresetChatEmojiEffectExposure)
local FFlagExpChatRenderHistoricalMessagesModule = require(ExpChat.Flags.FFlagExpChatRenderHistoricalMessages)
local FFlagExpChatMessageHistoryExperiment = SharedFlagsModule.FFlagExpChatMessageHistoryExperiment
local ExpChatMessageHistoryExperimentation = require(Parent.SocialExperiments).ExpChatMessageHistoryExperimentation

function getChatTranslationEnabled()
	-- upvalues: TextChatService (copy)
	return TextChatService.ChatTranslationEnabled
end

return function(Callback)
	-- upvalues: CreateSignalFunction (copy), FFlagExpChatMessagesStoreUseProxyModule (copy), CreateProxyFunction (copy), CreateComputedFunction (copy), Dictionary (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatMessagesStoreBatchModule (copy), SignalsExperimentalModule (copy), FFlagExpChatRenderHistoricalMessagesModule (copy), List (copy), ExpChatMessageHistoryExperimentation (copy), IsBorderlessBubbleChatEnabledModule (copy), GetServerTimeNowMillisModule (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (copy), HttpService (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), FFlagExpChatMessageHistoryExperiment (copy), FFlagExpChatEnableV2ChatWindowModule (copy), Set (copy), SanitizeForRichTextModule (copy), GetFFlagExpChatSyntheticSystemMessageRichTextFunction (copy), GenerateRichSystemMessageTextFormatModule (copy), FFlagExpChatDictation (copy), ComputeNameColorFunction (copy), Players (copy), FFlagEnableInExpChatRewriteModule (copy), GetTextAndTranslationModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), IsWhiteSpaceOnlyModule (copy), FFlagExpChatFixLocalUserVerifiedBadgeModule (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), ExpChatSharedModule (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagExpChatDisableUniverseBubbleChat (copy), FFlagExpChatGlobalTabDefaultModule (copy), IsGlobalBubbleChatEnabledModule (copy), ShouldRenderTextChannelInDefaultWindowFunction (copy), GetTextChannelDisplayModeFunction (copy), GetFFlagExpChatTelemetryEventTriggerModule (copy), ExpChatPresetChatEmojiEffectExperimentation (copy), LogPresetChatEmojiEffectExposureModule (copy), FIntExpChatRandomCharChangeLowerBoundModule (copy), FIntExpChatRandomCharChangeUpperBoundModule (copy), ConfigModule (copy), FFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy)
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
	local Proxy = if FFlagExpChatMessagesStoreUseProxyModule then CreateProxyFunction({}) else nil
	local Signal1, Signal2_1 = CreateSignalFunction(config.messagesBySenderId)
	local Proxy1 = if FFlagExpChatMessagesStoreUseProxyModule then CreateProxyFunction({}) else nil
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
	local Total1 = 0
	local t1 = {}
	local Signal14, Signal2_11 = CreateSignalFunction(nil)
	local Callback2 = nil
	local Callback1 = nil
	local Flag = false
	local Flag1 = false
	local t2 = {}
	
	local function _()
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy)
		return if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
	end
	
	local _ = function(p2)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy)
		return if FFlagExpChatMessagesStoreUseProxyModule then Proxy(p2) else Signal(p2)
	end
	
	local function writeByMessageId(MessageId, JoinResult)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal2 (copy), Dictionary (upval)
		if FFlagExpChatMessagesStoreUseProxyModule then
			Proxy[MessageId] = JoinResult
			
			return
		end
		if JoinResult == nil then
			Signal2(function(p2)
				-- upvalues: Dictionary (upval), MessageId (copy)
				return Dictionary.removeKey(p2, MessageId)
			end)
			
			return
		else
			Signal2(function(p2)
				-- upvalues: Dictionary (upval), MessageId (copy), JoinResult (copy)
				return Dictionary.join(p2, { [MessageId] = JoinResult })
			end)
		end
	end
	
	local _ = function(Key, Callback)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal2 (copy), Dictionary (upval)
		if FFlagExpChatMessagesStoreUseProxyModule then
			local ProxyEntry = Proxy[Key]
			
			if ProxyEntry then
				local CallbackResult = Callback(ProxyEntry)
				
				if CallbackResult then
					Proxy[Key] = CallbackResult
					
					return
				end
			end
		else
			Signal2(function(p2)
				-- upvalues: Key (copy), Callback (copy), Dictionary (upval)
				if p2 and p2[Key] then
					local v1 = Callback(p2[Key])
					
					return if v1 then Dictionary.join(p2, { [Key] = v1 }) else p2
				else
					return p2 or {}
				end
			end)
		end
	end
	
	local function forEachByMessageId(Callback)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal2 (copy)
		if not FFlagExpChatMessagesStoreUseProxyModule then
			Signal2(function(List)
				-- upvalues: Callback (copy)
				if not List then
					return {}
				end
				local t = {}
				
				for i, value in List do
					t[i] = Callback(i, value) or value
				end
				return t
			end)
			
			return
		end
		for i in Proxy do
			local ProxyEntry = Proxy[i]
			
			if ProxyEntry then
				local CallbackResult = Callback(i, ProxyEntry)
				
				if CallbackResult then
					Proxy[i] = CallbackResult
				end
			end
		end
	end
	
	local _ = function(p2)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (copy), Signal1 (copy)
		return if FFlagExpChatMessagesStoreUseProxyModule then Proxy1(p2) else Signal1(p2)
	end
	
	local _ = function(Key, p2)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (copy), Signal2_1 (copy), Dictionary (upval)
		if FFlagExpChatMessagesStoreUseProxyModule then
			Proxy1[Key] = p2
			
			return
		end
		if p2 == nil then
			Signal2_1(function(p3)
				-- upvalues: Dictionary (upval), Key (copy)
				return Dictionary.removeKey(p3, Key)
			end)
			
			return
		else
			Signal2_1(function(p3)
				-- upvalues: Dictionary (upval), Key (copy), p2 (copy)
				return Dictionary.join(p3, { [Key] = p2 })
			end)
		end
	end
	
	local _ = function(Key, Callback)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (copy), Signal2_1 (copy), Dictionary (upval)
		if FFlagExpChatMessagesStoreUseProxyModule then
			Proxy1[Key] = Callback(Proxy1[Key])
			
			return
		else
			Signal2_1(function(p2)
				-- upvalues: Callback (copy), Key (copy), Dictionary (upval)
				local v1 = Callback(p2[Key])
				
				return if v1 == nil then Dictionary.removeKey(p2, Key) else Dictionary.join(p2, { [Key] = v1 })
			end)
		end
	end
	
	local function resolveChannelNameForMapOrder(p2, ChannelNameOverride)
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy)
		return if GetFFlagTextChatEnableUniverseChatTabsFunction() then if ChannelNameOverride then ChannelNameOverride elseif p2.textChannel then if p2.textChannel.Name == "RBXSystem" or not Signal11(false) then "RBXGeneral" else p2.textChannel.Name else nil elseif p2.textChannel then if p2.textChannel.Name == "RBXSystem" then "RBXGeneral" else p2.textChannel.Name else nil
	end
	
	local _ = function(Callback: () -> ())
		-- upvalues: FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(Callback)
			
			return
		else
			Callback()
		end
	end
	
	local function batchWrites(Callback: () -> ())
		-- upvalues: Flag (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval), Flag1 (ref), Callback1 (ref)
		if not Flag then
			Flag = true
			Flag1 = false
			
			if FFlagExpChatMessagesStoreBatchModule then
				SignalsExperimentalModule.batch(Callback)
			else
				Callback()
			end
			Flag = false
			
			if Flag1 then
				Flag1 = false
				Callback1()
			end
			return
		elseif FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(Callback)
			
			return
		else
			Callback()
		end
	end
	
	local _ = function(p2): boolean
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy)
		local Proxy1 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
		local ProxyEntry = Proxy1 and Proxy1[p2]
		
		return ProxyEntry ~= nil and ProxyEntry.isHistorical == true
	end
	
	local function countHistoricalPrefix(List, Callback): number
		local Count = 0
		
		for _, value in ipairs(List) do
			local CallbackResult = Callback(value)
			
			if not CallbackResult or not CallbackResult.isHistorical then break end
			Count += 1
		end
		return Count
	end
	
	local function insertWindowMessageIdInOrder(p2, MessageId, IsHistorical)
		-- upvalues: FFlagExpChatRenderHistoricalMessagesModule (upval), List (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), countHistoricalPrefix (copy)
		if FFlagExpChatRenderHistoricalMessagesModule and IsHistorical then
			local Proxy1 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
			local CountHistoricalPrefixResult: number = countHistoricalPrefix(p2, function(p3)
				-- upvalues: Proxy1 (copy)
				return Proxy1[p3]
			end)
			
			return if CountHistoricalPrefixResult == #p2 then List.append(p2, MessageId) else List.insert(p2, CountHistoricalPrefixResult + 1, MessageId)
		else
			return List.append(p2, MessageId)
		end
	end
	
	local function capHistoricalPrefix(p2, JoinResult)
		-- upvalues: ExpChatMessageHistoryExperimentation (upval), Signal7 (copy), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), countHistoricalPrefix (copy), List (upval)
		if not JoinResult.isHistorical then
			return p2
		end
		local HistoryArm = ExpChatMessageHistoryExperimentation.getHistoryArm(Signal7(false))
		local Proxy1 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
		local CountHistoricalPrefixResult = countHistoricalPrefix(p2, function(MessageId)
			-- upvalues: JoinResult (copy), Proxy1 (copy)
			return if MessageId == JoinResult.messageId then JoinResult else Proxy1 and Proxy1[MessageId]
		end)
		local MaxAgeSeconds = if HistoryArm then HistoryArm.maxAgeSeconds else 0
		local Largest = math.max(1, CountHistoricalPrefixResult - (if HistoryArm then HistoryArm.maxCount else 0) + 1)
		
		if MaxAgeSeconds > 0 then
			local Elapsed = workspace:GetServerTimeNow() - MaxAgeSeconds
			
			for i = Largest, CountHistoricalPrefixResult do
				local MessageId = p2[i]
				local JoinResult1 = if MessageId == JoinResult.messageId then JoinResult else Proxy1 and Proxy1[MessageId]
				
				if JoinResult1 and Elapsed <= JoinResult1.timestamp.UnixTimestamp then break end
				Largest = i + 1
			end
		end
		return if Largest == 1 then p2 elseif #p2 < Largest then {} else List.slice(p2, Largest)
	end
	
	local _ = function(p3)
		-- upvalues: Signal3 (copy), config (copy), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy)
		local SignalResult = Signal3(false)
		local IsVisibleInChatWindow = false
		
		if p3.isHistorical == true then
			IsVisibleInChatWindow = p3.isVisibleInChatWindow
			
			if IsVisibleInChatWindow then
				IsVisibleInChatWindow = false
				
				if config.messageLimit <= #SignalResult then
					local SignalResultEntry = SignalResult[1]
					local Proxy1 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
					local ProxyEntry = Proxy1 and Proxy1[SignalResultEntry]
					IsVisibleInChatWindow = not (ProxyEntry ~= nil and ProxyEntry.isHistorical == true)
				end
			end
		end
		return IsVisibleInChatWindow
	end
	
	local _ = function(p3, p4)
		-- upvalues: Flag1 (ref), Callback2 (ref), Flag (ref), Callback1 (ref)
		if not p4 and not Flag1 then
			Callback2(p3)
			
			return
		end
		if Flag then
			Flag1 = true
			
			return
		else
			Callback1()
		end
	end
	
	local function keepHistoricalFlag(p3)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), Dictionary (upval)
		local MessageId = p3.messageId
		local Proxy1 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
		local ProxyEntry = Proxy1 and Proxy1[MessageId]
		local IsIsHistorical: boolean = ProxyEntry ~= nil and ProxyEntry.isHistorical == true
		
		return if IsIsHistorical then Dictionary.join(p3, { isHistorical = true }) else p3
	end
	
	local _ = function(p3)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), IsBorderlessBubbleChatEnabledModule (upval), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (copy), Signal2_1 (copy), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (copy), keepHistoricalFlag (copy), Signal3 (copy), config (copy), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal4 (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), insertWindowMessageIdInOrder (copy), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Flag1 (ref), Callback2 (ref), Flag (ref), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local function v146()
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (upval), Signal (upval), IsBorderlessBubbleChatEnabledModule (upval), p3 (copy), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (upval), Signal2_1 (upval), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (upval), keepHistoricalFlag (upval), Signal3 (upval), config (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal4 (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), insertWindowMessageIdInOrder (upval), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Flag1 (upval), Callback2 (upval), Flag (upval), Callback1 (upval)
			local v1 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
			
			if IsBorderlessBubbleChatEnabledModule() then
				local v2 = v1 and v1[p3.messageId]
				p3.bubbleChatReceivedAtMillis = v2 and v2.bubbleChatReceivedAtMillis or GetServerTimeNowMillisModule()
			end
			if v1 and v1[p3.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (p3.status == Enum.TextChatMessageStatus.Floodchecked or p3.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p4)
						-- upvalues: List (upval), p3 (upval)
						return List.filter(p4, function(MessageId): boolean
							-- upvalues: p3 (upval)
							return MessageId ~= p3.messageId
						end)
					end)
					local v3 = resolveChannelNameForMapOrder(p3, p3.channelNameOverride)
					
					if v3 then
						Signal2_3(function(p4)
							-- upvalues: v3 (copy), List (upval), p3 (upval), Dictionary (upval)
							local v4 = p4[v3]
							
							return if v4 then Dictionary.join(p4, {
								[v3] = List.filter(v4, function(MessageId): boolean
									-- upvalues: p3 (upval)
									return MessageId ~= p3.messageId
								end)
							}) else p4
						end)
					end
					local MessageId = p3.messageId
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy[MessageId] = nil
					else
						Signal2(function(p4)
							-- upvalues: Dictionary (upval), MessageId (copy)
							return Dictionary.removeKey(p4, MessageId)
						end)
					end
					if p3.userId then
						local UserId = p3.userId
						
						local function v153(p4)
							-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), p3 (upval)
							if p4 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p4, function(MessageId): boolean
									-- upvalues: p3 (upval)
									return MessageId ~= p3.messageId
								end) else List.filter(p4, function(p5): boolean
									-- upvalues: p3 (upval)
									return p5.messageId ~= p3.messageId
								end)
								
								return if #FilterResult == 0 then nil else FilterResult
							else
								return nil
							end
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId] = v153(Proxy1[UserId])
							
							return
						end
						Signal2_1(function(p4)
							-- upvalues: v153 (copy), UserId (copy), Dictionary (upval)
							local v4 = v153(p4[UserId])
							
							return if v4 == nil then Dictionary.removeKey(p4, UserId) else Dictionary.join(p4, { [UserId] = v4 })
						end)
					end
					return
				else
					if FFlagExpChatRenderHistoricalMessagesModule then
						writeByMessageId(p3.messageId, keepHistoricalFlag(p3))
					else
						writeByMessageId(p3.messageId, p3)
					end
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and p3.userId then
						local UserId1 = p3.userId
						
						local function v155(List)
							-- upvalues: p3 (upval), List (upval)
							if not List then
								return nil
							end
							local v4 = nil
							
							for i, value in ipairs(List) do
								if value.messageId == p3.messageId then
									v4 = i
									break
								end
							end
							return if v4 then List.set(List, v4, p3) else List
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId1] = v155(Proxy1[UserId1])
							
							return
						end
						Signal2_1(function(p4)
							-- upvalues: v155 (copy), UserId1 (copy), Dictionary (upval)
							local v5 = v155(p4[UserId1])
							
							return if v5 == nil then Dictionary.removeKey(p4, UserId1) else Dictionary.join(p4, { [UserId1] = v5 })
						end)
					end
					return
				end
			else
				if FFlagExpChatRenderHistoricalMessagesModule then
					local v4 = Signal3(false)
					local IsVisibleInChatWindow = false
					
					if p3.isHistorical == true then
						IsVisibleInChatWindow = p3.isVisibleInChatWindow
						
						if IsVisibleInChatWindow then
							IsVisibleInChatWindow = false
							
							if config.messageLimit <= #v4 then
								local v5 = v4[1]
								local v6 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
								local v7 = v6 and v6[v5]
								IsVisibleInChatWindow = not (v7 ~= nil and v7.isHistorical == true)
							end
						end
					end
					if IsVisibleInChatWindow then return end
				end
				local UserId2 = p3.userId
				local PartOrModel = p3.partOrModel
				
				if not UserId2 and PartOrModel then
					UserId2 = Signal10(false)[PartOrModel]
					
					if not UserId2 then
						UserId2 = HttpService:GenerateGUID(false)
						Signal2_6(function(p4)
							-- upvalues: Dictionary (upval), UserId2 (ref), PartOrModel (copy)
							return Dictionary.join(p4, { [UserId2] = PartOrModel })
						end)
						Signal2_7(function(p4)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId2 (ref)
							return Dictionary.join(p4, { [PartOrModel] = UserId2 })
						end)
					end
				end
				local JoinResult = if UserId2 == p3.userId then p3 else Dictionary.join(p3, { userId = UserId2 })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v8 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v8 then
						local MessageId1 = v8[1]
						local v9 = v1 and v1[MessageId1]
						
						if v9 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[MessageId1] = nil
								else
									Signal2(function(p4)
										-- upvalues: Dictionary (upval), MessageId1 (copy)
										return Dictionary.removeKey(p4, MessageId1)
									end)
								end
							end
							if v9.userId then
								local UserId3 = v9.userId
								
								local function v171(p4)
									-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId1 (copy), Signal9 (upval), v9 (copy), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									if not p4 then
										return nil
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p4, function(p5): boolean
										-- upvalues: MessageId1 (upval)
										return p5 ~= MessageId1
									end) else List.filter(p4, function(p5): boolean
										-- upvalues: MessageId1 (upval)
										return p5.messageId ~= MessageId1
									end)
									
									if #FilterResult ~= 0 then
										return FilterResult
									end
									local v10 = Signal9(false)
									
									if v10[v9.userId] then
										local v11 = v10[v9.userId]
										Signal2_7(function(p5)
											-- upvalues: Dictionary (upval), v11 (copy)
											return Dictionary.removeKey(p5, v11)
										end)
										Signal2_6(function(p5)
											-- upvalues: Dictionary (upval), v9 (upval)
											return Dictionary.removeKey(p5, v9.userId)
										end)
									end
									return nil
								end
								
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy1[UserId3] = v171(Proxy1[UserId3])
								else
									Signal2_1(function(p4)
										-- upvalues: v171 (copy), UserId3 (copy), Dictionary (upval)
										local v10 = v171(p4[UserId3])
										
										return if v10 == nil then Dictionary.removeKey(p4, UserId3) else Dictionary.join(p4, { [UserId3] = v10 })
									end)
								end
							end
							Signal2_2(function(p4)
								-- upvalues: List (upval)
								return List.removeIndex(p4, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId1] = nil
							end
						end
					end
					if ChannelNameOverride and config.messageLimit <= #T then
						local Entry = T[1]
						
						if Entry then
							Signal2_3(function(p4)
								-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
								return Dictionary.join(p4, {
									[ChannelNameOverride] = List.removeIndex(p4[ChannelNameOverride] or {}, 1)
								})
							end)
							
							if v1 and v1[Entry] then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[Entry] = nil
								else
									Signal2(function(p4)
										-- upvalues: Dictionary (upval), Entry (copy)
										return Dictionary.removeKey(p4, Entry)
									end)
								end
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				writeByMessageId(JoinResult.messageId, JoinResult)
				
				if JoinResult.userId then
					local UserId4 = JoinResult.userId
					
					local function v173(p4)
						-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), JoinResult (copy), List (upval)
						local P51 = p4 or {}
						local Flag = false
						repeat
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								for _, value in ipairs(P51) do
									if value == JoinResult.messageId then
										Flag = true
										break
									end
								end
								break
							end
							for _, value1 in ipairs(P51) do
								if value1.messageId == JoinResult.messageId then
									Flag = true
								else
									continue
								end
							end
							break
						until true
						return if Flag then P51 else List.append(P51, if FFlagExpChatMessagesStoreMemoryCleanupModule then JoinResult.messageId else JoinResult)
					end
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy1[UserId4] = v173(Proxy1[UserId4])
					else
						Signal2_1(function(p4)
							-- upvalues: v173 (copy), UserId4 (copy), Dictionary (upval)
							local v10 = v173(p4[UserId4])
							
							return if v10 == nil then Dictionary.removeKey(p4, UserId4) else Dictionary.join(p4, { [UserId4] = v10 })
						end)
					end
				end
				local v10 = false
				
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p4)
						-- upvalues: insertWindowMessageIdInOrder (upval), JoinResult (copy), v10 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval)
						local v11 = insertWindowMessageIdInOrder(p4, JoinResult.messageId, JoinResult.isHistorical)
						v10 = v10 or v11[#v11] ~= JoinResult.messageId
						
						if FFlagExpChatMessageHistoryExperiment then
							local v12 = capHistoricalPrefix(v11, JoinResult)
							v10 = v10 or #v12 < #v11
							
							return v12
						else
							return v11
						end
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p4)
							-- upvalues: ChannelNameOverride (ref), insertWindowMessageIdInOrder (upval), JoinResult (copy), v10 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), Dictionary (upval)
							local v11 = insertWindowMessageIdInOrder(p4[ChannelNameOverride] or {}, JoinResult.messageId, JoinResult.isHistorical)
							v10 = v10 or v11[#v11] ~= JoinResult.messageId
							
							if FFlagExpChatMessageHistoryExperiment then
								v11 = capHistoricalPrefix(v11, JoinResult)
							end
							return Dictionary.join(p4, { [ChannelNameOverride] = v11 })
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							local MessageId2 = JoinResult.messageId
							
							if not v10 and not Flag1 then
								Callback2(MessageId2)
							elseif Flag then
								Flag1 = true
							else
								Callback1()
							end
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v146)
			
			return
		else
			v146()
		end
	end
	
	local t3 = {}
	
	local function getUserMessageCache(p4)
		-- upvalues: t3 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), CreateComputedFunction (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (copy), Signal1 (copy), Proxy (copy), Signal (copy), Signal6 (copy), Set (upval)
		local Text = tostring(p4)
		
		if not t3[Text] then
			t3[Text] = {}
			
			if not FFlagExpChatMessagesStoreMemoryCleanupModule then
				t3[Text].messages = CreateComputedFunction(function(p5)
					-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (upval), Signal1 (upval), Text (copy)
					return (if FFlagExpChatMessagesStoreUseProxyModule then Proxy1(p5) else Signal1(p5))[Text] or {}
				end)
			end
			if FFlagExpChatMessagesStoreMemoryCleanupModule then
				t3[Text].bubbleMessages = CreateComputedFunction(function(p5)
					-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (upval), Signal1 (upval), Text (copy), Proxy (upval), Signal (upval), Signal6 (upval), Set (upval)
					local ProxyResultEntry = (if FFlagExpChatMessagesStoreUseProxyModule then Proxy1(p5) else Signal1(p5))[Text] or {}
					local ProxyResult = if FFlagExpChatMessagesStoreUseProxyModule then Proxy(p5) else Signal(p5)
					local SignalResult = Signal6(p5)
					local List = {}
					
					for _, value in ipairs(ProxyResultEntry) do
						local ProxyResultEntry1 = ProxyResult[value]
						
						if ProxyResultEntry1 then
							local HasResult = ProxyResultEntry1.userId and Set.has(SignalResult, ProxyResultEntry1.userId) or false
							
							if ProxyResultEntry1.isVisibleInBubbleChat and not HasResult then
								table.insert(List, ProxyResultEntry1)
							end
						end
					end
					return List
				end)
			else
				t3[Text].bubbleMessages = CreateComputedFunction(function(p6)
					-- upvalues: t3 (upval), Text (copy), Signal6 (upval), Set (upval)
					local MessagesResult = t3[Text].messages(p6)
					local SignalResult = Signal6(p6)
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
				t3[Text].lastMessage = CreateComputedFunction(function(p6)
					-- upvalues: t3 (upval), Text (copy)
					local MessagesResult = t3[Text].messages(p6)
					
					return if #MessagesResult > 0 then MessagesResult[#MessagesResult] else nil
				end)
			end
		end
		return t3[Text]
	end
	
	local function getUserMessages(p5)
		-- upvalues: getUserMessageCache (copy)
		return getUserMessageCache(p5).messages
	end
	
	local function getUserLastMessage(p5)
		-- upvalues: getUserMessageCache (copy)
		return getUserMessageCache(p5).lastMessage
	end
	
	local _ = function()
		-- upvalues: CreateComputedFunction (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy)
		return CreateComputedFunction(function(p5)
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (upval), Signal (upval)
			local ProxyResult = if FFlagExpChatMessagesStoreUseProxyModule then Proxy(p5) else Signal(p5)
			
			if not ProxyResult then
				return {}
			end
			local List = {}
			
			for _, value in ProxyResult do
				table.insert(List, value)
			end
			return List
		end)
	end
	
	local function addSystemMessage(p5, p6, Metadata, p7, p8, TextChannel)
		-- upvalues: SanitizeForRichTextModule (upval), GetFFlagExpChatSyntheticSystemMessageRichTextFunction (upval), GenerateRichSystemMessageTextFormatModule (upval), FFlagExpChatDictation (upval), HttpService (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), IsBorderlessBubbleChatEnabledModule (upval), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (copy), Signal2_1 (copy), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (copy), keepHistoricalFlag (copy), Signal3 (copy), config (copy), Signal10 (copy), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal4 (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), insertWindowMessageIdInOrder (copy), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Flag1 (ref), Callback2 (ref), Flag (ref), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local SanitizeForRichTextModuleResult = SanitizeForRichTextModule(p5)
		local config1 = {
			userId = nil,
			prefixText = "",
			translation = nil,
			useTranslation = false,
			isVisibleInChatWindow = true,
			isVisibleInBubbleChat = false,
			shouldOverrideBubbleChatSettings = false,
			bubbleChatMessageProperties = nil,
			chatWindowMessageProperties = nil,
			textChatMessageInstance = nil,
			partOrModel = nil,
			text = if GetFFlagExpChatSyntheticSystemMessageRichTextFunction() then GenerateRichSystemMessageTextFormatModule(SanitizeForRichTextModuleResult, if FFlagExpChatDictation then p8 else nil, p7) else SanitizeForRichTextModuleResult,
			messageId = HttpService:GenerateGUID(false),
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			textChannel = TextChannel,
			channelNameOverride = if TextChannel == nil then p6 else nil,
			metadata = Metadata
		}
		
		local function v204()
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (upval), Signal (upval), IsBorderlessBubbleChatEnabledModule (upval), config1 (copy), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (upval), Signal2_1 (upval), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (upval), keepHistoricalFlag (upval), Signal3 (upval), config (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal4 (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), insertWindowMessageIdInOrder (upval), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Flag1 (upval), Callback2 (upval), Flag (upval), Callback1 (upval)
			local v1 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
			
			if IsBorderlessBubbleChatEnabledModule() then
				local v2 = v1 and v1[config1.messageId]
				config1.bubbleChatReceivedAtMillis = v2 and v2.bubbleChatReceivedAtMillis or GetServerTimeNowMillisModule()
			end
			if v1 and v1[config1.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p9)
						-- upvalues: List (upval), config1 (upval)
						return List.filter(p9, function(MessageId): boolean
							-- upvalues: config1 (upval)
							return MessageId ~= config1.messageId
						end)
					end)
					local v3 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
					
					if v3 then
						Signal2_3(function(p9)
							-- upvalues: v3 (copy), List (upval), config1 (upval), Dictionary (upval)
							local v4 = p9[v3]
							
							return if v4 then Dictionary.join(p9, {
								[v3] = List.filter(v4, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end)
							}) else p9
						end)
					end
					local MessageId = config1.messageId
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy[MessageId] = nil
					else
						Signal2(function(p9)
							-- upvalues: Dictionary (upval), MessageId (copy)
							return Dictionary.removeKey(p9, MessageId)
						end)
					end
					if config1.userId then
						local UserId = config1.userId
						
						local function v153(p9)
							-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), config1 (upval)
							if p9 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p9, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end) else List.filter(p9, function(p10): boolean
									-- upvalues: config1 (upval)
									return p10.messageId ~= config1.messageId
								end)
								
								return if #FilterResult == 0 then nil else FilterResult
							else
								return nil
							end
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId] = v153(Proxy1[UserId])
							
							return
						end
						Signal2_1(function(p9)
							-- upvalues: v153 (copy), UserId (copy), Dictionary (upval)
							local v4 = v153(p9[UserId])
							
							return if v4 == nil then Dictionary.removeKey(p9, UserId) else Dictionary.join(p9, { [UserId] = v4 })
						end)
					end
					return
				else
					if FFlagExpChatRenderHistoricalMessagesModule then
						writeByMessageId(config1.messageId, keepHistoricalFlag(config1))
					else
						writeByMessageId(config1.messageId, config1)
					end
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
						local UserId1 = config1.userId
						
						local function v155(List)
							-- upvalues: config1 (upval), List (upval)
							if not List then
								return nil
							end
							local v4 = nil
							
							for i, value in ipairs(List) do
								if value.messageId == config1.messageId then
									v4 = i
									break
								end
							end
							return if v4 then List.set(List, v4, config1) else List
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId1] = v155(Proxy1[UserId1])
							
							return
						end
						Signal2_1(function(p9)
							-- upvalues: v155 (copy), UserId1 (copy), Dictionary (upval)
							local v5 = v155(p9[UserId1])
							
							return if v5 == nil then Dictionary.removeKey(p9, UserId1) else Dictionary.join(p9, { [UserId1] = v5 })
						end)
					end
					return
				end
			else
				if FFlagExpChatRenderHistoricalMessagesModule then
					local v4 = Signal3(false)
					local IsVisibleInChatWindow = false
					
					if config1.isHistorical == true then
						IsVisibleInChatWindow = config1.isVisibleInChatWindow
						
						if IsVisibleInChatWindow then
							IsVisibleInChatWindow = false
							
							if config.messageLimit <= #v4 then
								local v5 = v4[1]
								local v6 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
								local v7 = v6 and v6[v5]
								IsVisibleInChatWindow = not (v7 ~= nil and v7.isHistorical == true)
							end
						end
					end
					if IsVisibleInChatWindow then return end
				end
				local UserId2 = config1.userId
				local PartOrModel = config1.partOrModel
				
				if not UserId2 and PartOrModel then
					UserId2 = Signal10(false)[PartOrModel]
					
					if not UserId2 then
						UserId2 = HttpService:GenerateGUID(false)
						Signal2_6(function(p9)
							-- upvalues: Dictionary (upval), UserId2 (ref), PartOrModel (copy)
							return Dictionary.join(p9, { [UserId2] = PartOrModel })
						end)
						Signal2_7(function(p9)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId2 (ref)
							return Dictionary.join(p9, { [PartOrModel] = UserId2 })
						end)
					end
				end
				local JoinResult = if UserId2 == config1.userId then config1 else Dictionary.join(config1, { userId = UserId2 })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v8 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v8 then
						local MessageId1 = v8[1]
						local v9 = v1 and v1[MessageId1]
						
						if v9 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[MessageId1] = nil
								else
									Signal2(function(p9)
										-- upvalues: Dictionary (upval), MessageId1 (copy)
										return Dictionary.removeKey(p9, MessageId1)
									end)
								end
							end
							if v9.userId then
								local UserId3 = v9.userId
								
								local function v171(p9)
									-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId1 (copy), Signal9 (upval), v9 (copy), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									if not p9 then
										return nil
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p9, function(p10): boolean
										-- upvalues: MessageId1 (upval)
										return p10 ~= MessageId1
									end) else List.filter(p9, function(p10): boolean
										-- upvalues: MessageId1 (upval)
										return p10.messageId ~= MessageId1
									end)
									
									if #FilterResult ~= 0 then
										return FilterResult
									end
									local v10 = Signal9(false)
									
									if v10[v9.userId] then
										local v11 = v10[v9.userId]
										Signal2_7(function(p10)
											-- upvalues: Dictionary (upval), v11 (copy)
											return Dictionary.removeKey(p10, v11)
										end)
										Signal2_6(function(p10)
											-- upvalues: Dictionary (upval), v9 (upval)
											return Dictionary.removeKey(p10, v9.userId)
										end)
									end
									return nil
								end
								
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy1[UserId3] = v171(Proxy1[UserId3])
								else
									Signal2_1(function(p9)
										-- upvalues: v171 (copy), UserId3 (copy), Dictionary (upval)
										local v10 = v171(p9[UserId3])
										
										return if v10 == nil then Dictionary.removeKey(p9, UserId3) else Dictionary.join(p9, { [UserId3] = v10 })
									end)
								end
							end
							Signal2_2(function(p9)
								-- upvalues: List (upval)
								return List.removeIndex(p9, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId1] = nil
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
							
							if v1 and v1[Entry] then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[Entry] = nil
								else
									Signal2(function(p9)
										-- upvalues: Dictionary (upval), Entry (copy)
										return Dictionary.removeKey(p9, Entry)
									end)
								end
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				writeByMessageId(JoinResult.messageId, JoinResult)
				
				if JoinResult.userId then
					local UserId4 = JoinResult.userId
					
					local function v173(p9)
						-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), JoinResult (copy), List (upval)
						local P51 = p9 or {}
						local Flag = false
						if FFlagExpChatMessagesStoreMemoryCleanupModule then
							for _, value in ipairs(P51) do
								if value == JoinResult.messageId then
									Flag = true
									break
								end
							end
						end
						for _, value1 in ipairs(P51) do
							if value1.messageId == JoinResult.messageId then
								Flag = true
							end
						end
					end
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy1[UserId4] = v173(Proxy1[UserId4])
					else
						Signal2_1(function(p10)
							-- upvalues: v173 (copy), UserId4 (copy), Dictionary (upval)
							local v10 = v173(p10[UserId4])
							
							return if v10 == nil then Dictionary.removeKey(p10, UserId4) else Dictionary.join(p10, { [UserId4] = v10 })
						end)
					end
				end
				local v10 = false
				
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p10)
						-- upvalues: insertWindowMessageIdInOrder (upval), JoinResult (copy), v10 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval)
						local v11 = insertWindowMessageIdInOrder(p10, JoinResult.messageId, JoinResult.isHistorical)
						v10 = v10 or v11[#v11] ~= JoinResult.messageId
						
						if FFlagExpChatMessageHistoryExperiment then
							local v12 = capHistoricalPrefix(v11, JoinResult)
							v10 = v10 or #v12 < #v11
							
							return v12
						else
							return v11
						end
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p10)
							-- upvalues: ChannelNameOverride (ref), insertWindowMessageIdInOrder (upval), JoinResult (copy), v10 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), Dictionary (upval)
							local v11 = insertWindowMessageIdInOrder(p10[ChannelNameOverride] or {}, JoinResult.messageId, JoinResult.isHistorical)
							v10 = v10 or v11[#v11] ~= JoinResult.messageId
							
							if FFlagExpChatMessageHistoryExperiment then
								v11 = capHistoricalPrefix(v11, JoinResult)
							end
							return Dictionary.join(p10, { [ChannelNameOverride] = v11 })
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							local MessageId2 = JoinResult.messageId
							
							if not v10 and not Flag1 then
								Callback2(MessageId2)
							elseif Flag then
								Flag1 = true
							else
								Callback1()
							end
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v204)
			
			return
		else
			v204()
		end
	end
	
	local function formatPrefixForUniverseChatTabs(PrefixTextInternal, p9, TextChatMessage)
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), ComputeNameColorFunction (upval), Players (upval)
		return if GetFFlagTextChatEnableUniverseChatTabsFunction() and p9 and #PrefixTextInternal ~= 0 then `<font color="#{(if TextChatMessage.TextSource then ComputeNameColorFunction(TextChatMessage.TextSource.Username) else ComputeNameColorFunction(if Players.LocalPlayer then Players.LocalPlayer.Name else "")):ToHex()}">{PrefixTextInternal}</font>` else PrefixTextInternal
	end
	
	local function handleIncomingOrOutgoingMessage(TextChatMessage, p9, p10, Enabled, IsHistorical)
		-- upvalues: FFlagEnableInExpChatRewriteModule (upval), GetTextAndTranslationModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), IsWhiteSpaceOnlyModule (upval), FFlagExpChatFixLocalUserVerifiedBadgeModule (upval), Players (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), Signal7 (copy), FFlagExpChatPresetChatEnabled (upval), Signal6 (copy), Set (upval), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), ExpChatSharedModule (upval), Signal8 (copy), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatDisableUniverseBubbleChat (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatGlobalTabDefaultModule (upval), IsGlobalBubbleChatEnabledModule (upval), ShouldRenderTextChannelInDefaultWindowFunction (upval), GetTextChannelDisplayModeFunction (upval), formatPrefixForUniverseChatTabs (copy), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagExpChatMessageHistoryExperiment (upval), ExpChatMessageHistoryExperimentation (upval), IsBorderlessBubbleChatEnabledModule (upval), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (copy), Signal2_1 (copy), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (copy), keepHistoricalFlag (copy), Signal3 (copy), config (copy), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), Signal11 (copy), Signal4 (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), insertWindowMessageIdInOrder (copy), capHistoricalPrefix (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Flag1 (ref), Callback2 (ref), Flag (ref), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval), ExpChatPresetChatEmojiEffectExperimentation (upval), LogPresetChatEmojiEffectExposureModule (upval)
		local TextAndTranslationModule = nil
		local TextAndTranslationModule2 = nil
		if FFlagEnableInExpChatRewriteModule then
			TextAndTranslationModule, TextAndTranslationModule2 = GetTextAndTranslationModule(TextChatMessage)
		else
			TextAndTranslationModule = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text
			TextAndTranslationModule2 = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TranslationInternal else TextChatMessage.Translation
		end
		if IsWhiteSpaceOnlyModule(TextAndTranslationModule) and TextChatMessage.Status ~= Enum.TextChatMessageStatus.Floodchecked and TextChatMessage.Status ~= Enum.TextChatMessageStatus.MessageTooLong then return end
		local Text = if TextChatMessage.TextSource then tostring(TextChatMessage.TextSource.UserId) elseif FFlagExpChatFixLocalUserVerifiedBadgeModule and p9 and Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else nil
		
		if not (if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)) then return end
		local SignalResult = Signal7(false)
		local HasResult = if Text and Signal6(false) then Set.has(Signal6(false), Text) else false
		local NoHasResult: boolean = (Text == nil or (if SignalResult or FFlagExpChatPresetChatEnabled and (TextChatMessage.PresetId or "") ~= "" then TextChatMessage.Status == Enum.TextChatMessageStatus.Success or TextChatMessage.Status == Enum.TextChatMessageStatus.Sending else false)) and not HasResult
		local Flag2 = false
		local IsBubbleChatEnabled = nil
		
		if FFlagExpChatUseChatConfigStore then
			IsBubbleChatEnabled = GetChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false)
		else
			local Store = ExpChatSharedModule.context and ExpChatSharedModule.context.store
			IsBubbleChatEnabled = if Store then Store:getState().Messages.isBubbleChatEnabled else Signal8(false)
		end
		if IsBubbleChatEnabled and NoHasResult and (not FFlagEnableInExpChatSummaryOnLuaModule or Text ~= nil) and (TextChatMessage.Status == Enum.TextChatMessageStatus.Success or TextChatMessage.Status == Enum.TextChatMessageStatus.Sending) then
			Flag2 = true
		end
		if FFlagExpChatDisableUniverseBubbleChat and GetFFlagTextChatEnableUniverseChatTabsFunction() and Enabled == true and (not FFlagExpChatGlobalTabDefaultModule or not IsGlobalBubbleChatEnabledModule()) then
			Flag2 = false
		end
		if TextChatMessage.Status ~= Enum.TextChatMessageStatus.Success and TextChatMessage.Status ~= Enum.TextChatMessageStatus.Sending then
			NoHasResult = false
			Flag2 = false
		end
		if IsHistorical then
			Flag2 = false
		end
		if not Enabled and p10 == nil and not ShouldRenderTextChannelInDefaultWindowFunction(TextChatMessage.TextChannel, GetTextChannelDisplayModeFunction()) then
			NoHasResult = false
		end
		local config1 = {
			shouldOverrideBubbleChatSettings = false,
			userId = Text,
			prefixText = formatPrefixForUniverseChatTabs(if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.PrefixTextInternal else TextChatMessage.PrefixText, p10, TextChatMessage),
			text = TextAndTranslationModule,
			translation = TextAndTranslationModule2,
			useTranslation = getChatTranslationEnabled() and TextAndTranslationModule2 ~= nil,
			messageId = TextChatMessage.MessageId,
			status = TextChatMessage.Status,
			timestamp = TextChatMessage.Timestamp,
			isVisibleInBubbleChat = Flag2,
			isVisibleInChatWindow = NoHasResult,
			textChannel = TextChatMessage.TextChannel,
			bubbleChatMessageProperties = TextChatMessage.BubbleChatMessageProperties,
			chatWindowMessageProperties = TextChatMessage.ChatWindowMessageProperties,
			textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then TextChatMessage else nil,
			partOrModel = TextChatMessage.TextSource and TextChatMessage.TextSource.Parent or nil,
			wasRewritten = if FFlagEnableInExpChatRewriteModule then TextChatMessage.WasRewritten else nil,
			originalText = if FFlagEnableInExpChatRewriteModule then TextChatMessage.OriginalText else nil,
			isHistorical = IsHistorical,
			channelNameOverride = if GetFFlagTextChatEnableUniverseChatTabsFunction() and p10 then p10 else nil,
			chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then TextChatMessage.ChatActionType else nil,
			isUniverseChat = Enabled,
			presetId = if FFlagExpChatPresetChatEnabled then TextChatMessage.PresetId else nil,
			presetChatVersion = if FFlagExpChatPresetChatEnabled then TextChatMessage.PresetChatVersion else nil
		}
		local Proxy2 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
		local HasProxyEntry: boolean = Proxy2 and Proxy2[config1.messageId] ~= nil
		
		if IsHistorical and HasProxyEntry then return end
		if FFlagExpChatMessageHistoryExperiment and IsHistorical then
			ExpChatMessageHistoryExperimentation.logExposure(Signal7(false))
		end
		if config1.isVisibleInChatWindow or (config1.isVisibleInBubbleChat or HasProxyEntry) then
			local function v207()
				-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (upval), Signal (upval), IsBorderlessBubbleChatEnabledModule (upval), config1 (copy), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (upval), Signal2_1 (upval), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (upval), keepHistoricalFlag (upval), Signal3 (upval), config (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal4 (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), insertWindowMessageIdInOrder (upval), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Flag1 (upval), Callback2 (upval), Flag (upval), Callback1 (upval)
				local v10 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
				
				if IsBorderlessBubbleChatEnabledModule() then
					local v11 = v10 and v10[config1.messageId]
					config1.bubbleChatReceivedAtMillis = v11 and v11.bubbleChatReceivedAtMillis or GetServerTimeNowMillisModule()
				end
				if v10 and v10[config1.messageId] then
					if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
						Signal2_2(function(p11)
							-- upvalues: List (upval), config1 (upval)
							return List.filter(p11, function(MessageId): boolean
								-- upvalues: config1 (upval)
								return MessageId ~= config1.messageId
							end)
						end)
						local v12 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
						
						if v12 then
							Signal2_3(function(p11)
								-- upvalues: v12 (copy), List (upval), config1 (upval), Dictionary (upval)
								local v13 = p11[v12]
								
								return if v13 then Dictionary.join(p11, {
									[v12] = List.filter(v13, function(MessageId): boolean
										-- upvalues: config1 (upval)
										return MessageId ~= config1.messageId
									end)
								}) else p11
							end)
						end
						local MessageId = config1.messageId
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy[MessageId] = nil
						else
							Signal2(function(p11)
								-- upvalues: Dictionary (upval), MessageId (copy)
								return Dictionary.removeKey(p11, MessageId)
							end)
						end
						if config1.userId then
							local UserId = config1.userId
							
							local function v153(p11)
								-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), config1 (upval)
								if p11 then
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p11, function(MessageId): boolean
										-- upvalues: config1 (upval)
										return MessageId ~= config1.messageId
									end) else List.filter(p11, function(p12): boolean
										-- upvalues: config1 (upval)
										return p12.messageId ~= config1.messageId
									end)
									
									return if #FilterResult == 0 then nil else FilterResult
								else
									return nil
								end
							end
							
							if FFlagExpChatMessagesStoreUseProxyModule then
								Proxy1[UserId] = v153(Proxy1[UserId])
								
								return
							end
							Signal2_1(function(p11)
								-- upvalues: v153 (copy), UserId (copy), Dictionary (upval)
								local v13 = v153(p11[UserId])
								
								return if v13 == nil then Dictionary.removeKey(p11, UserId) else Dictionary.join(p11, { [UserId] = v13 })
							end)
						end
						return
					else
						if FFlagExpChatRenderHistoricalMessagesModule then
							writeByMessageId(config1.messageId, keepHistoricalFlag(config1))
						else
							writeByMessageId(config1.messageId, config1)
						end
						if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
							local UserId1 = config1.userId
							
							local function v155(List)
								-- upvalues: config1 (upval), List (upval)
								if not List then
									return nil
								end
								local v13 = nil
								
								for i, value in ipairs(List) do
									if value.messageId == config1.messageId then
										v13 = i
										break
									end
								end
								return if v13 then List.set(List, v13, config1) else List
							end
							
							if FFlagExpChatMessagesStoreUseProxyModule then
								Proxy1[UserId1] = v155(Proxy1[UserId1])
								
								return
							end
							Signal2_1(function(p11)
								-- upvalues: v155 (copy), UserId1 (copy), Dictionary (upval)
								local v14 = v155(p11[UserId1])
								
								return if v14 == nil then Dictionary.removeKey(p11, UserId1) else Dictionary.join(p11, { [UserId1] = v14 })
							end)
						end
						return
					end
				else
					if FFlagExpChatRenderHistoricalMessagesModule then
						local v13 = Signal3(false)
						local IsVisibleInChatWindow = false
						
						if config1.isHistorical == true then
							IsVisibleInChatWindow = config1.isVisibleInChatWindow
							
							if IsVisibleInChatWindow then
								IsVisibleInChatWindow = false
								
								if config.messageLimit <= #v13 then
									local v14 = v13[1]
									local v15 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
									local v16 = v15 and v15[v14]
									IsVisibleInChatWindow = not (v16 ~= nil and v16.isHistorical == true)
								end
							end
						end
						if IsVisibleInChatWindow then return end
					end
					local UserId2 = config1.userId
					local PartOrModel = config1.partOrModel
					
					if not UserId2 and PartOrModel then
						UserId2 = Signal10(false)[PartOrModel]
						
						if not UserId2 then
							UserId2 = HttpService:GenerateGUID(false)
							Signal2_6(function(p11)
								-- upvalues: Dictionary (upval), UserId2 (ref), PartOrModel (copy)
								return Dictionary.join(p11, { [UserId2] = PartOrModel })
							end)
							Signal2_7(function(p11)
								-- upvalues: Dictionary (upval), PartOrModel (copy), UserId2 (ref)
								return Dictionary.join(p11, { [PartOrModel] = UserId2 })
							end)
						end
					end
					local JoinResult = if UserId2 == config1.userId then config1 else Dictionary.join(config1, { userId = UserId2 })
					local ChannelNameOverride = nil
					
					if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
						ChannelNameOverride = JoinResult.channelNameOverride
					elseif JoinResult.textChannel then
						ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
					end
					if JoinResult.isVisibleInChatWindow then
						local v17 = Signal3(false)
						local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
						
						if config.messageLimit <= #v17 then
							local MessageId1 = v17[1]
							local v18 = v10 and v10[MessageId1]
							
							if v18 then
								if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
									if FFlagExpChatMessagesStoreUseProxyModule then
										Proxy[MessageId1] = nil
									else
										Signal2(function(p11)
											-- upvalues: Dictionary (upval), MessageId1 (copy)
											return Dictionary.removeKey(p11, MessageId1)
										end)
									end
								end
								if v18.userId then
									local UserId3 = v18.userId
									
									local function v171(p11)
										-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId1 (copy), Signal9 (upval), v18 (copy), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
										if not p11 then
											return nil
										end
										local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p11, function(p12): boolean
											-- upvalues: MessageId1 (upval)
											return p12 ~= MessageId1
										end) else List.filter(p11, function(p12): boolean
											-- upvalues: MessageId1 (upval)
											return p12.messageId ~= MessageId1
										end)
										
										if #FilterResult ~= 0 then
											return FilterResult
										end
										local v19 = Signal9(false)
										
										if v19[v18.userId] then
											local v20 = v19[v18.userId]
											Signal2_7(function(p12)
												-- upvalues: Dictionary (upval), v20 (copy)
												return Dictionary.removeKey(p12, v20)
											end)
											Signal2_6(function(p12)
												-- upvalues: Dictionary (upval), v18 (upval)
												return Dictionary.removeKey(p12, v18.userId)
											end)
										end
										return nil
									end
									
									if FFlagExpChatMessagesStoreUseProxyModule then
										Proxy1[UserId3] = v171(Proxy1[UserId3])
									else
										Signal2_1(function(p11)
											-- upvalues: v171 (copy), UserId3 (copy), Dictionary (upval)
											local v19 = v171(p11[UserId3])
											
											return if v19 == nil then Dictionary.removeKey(p11, UserId3) else Dictionary.join(p11, { [UserId3] = v19 })
										end)
									end
								end
								Signal2_2(function(p11)
									-- upvalues: List (upval)
									return List.removeIndex(p11, 1)
								end)
								
								if FFlagExpChatMessagesStoreMemoryCleanupModule then
									t2[MessageId1] = nil
								end
							end
						end
						if ChannelNameOverride and config.messageLimit <= #T then
							local Entry = T[1]
							
							if Entry then
								Signal2_3(function(p11)
									-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
									return Dictionary.join(p11, {
										[ChannelNameOverride] = List.removeIndex(p11[ChannelNameOverride] or {}, 1)
									})
								end)
								
								if v10 and v10[Entry] then
									if FFlagExpChatMessagesStoreUseProxyModule then
										Proxy[Entry] = nil
									else
										Signal2(function(p11)
											-- upvalues: Dictionary (upval), Entry (copy)
											return Dictionary.removeKey(p11, Entry)
										end)
									end
								end
								if FFlagExpChatMessagesStoreMemoryCleanupModule then
									t2[Entry] = nil
								end
							end
						end
					end
					writeByMessageId(JoinResult.messageId, JoinResult)
					
					if JoinResult.userId then
						local UserId4 = JoinResult.userId
						
						local function v173(p11)
							-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), JoinResult (copy), List (upval)
							local P51 = p11 or {}
							local Flag = false
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								for _, value in ipairs(P51) do
									if value == JoinResult.messageId then
										Flag = true
										break
									end
								end
							end
							for _, value1 in ipairs(P51) do
								if value1.messageId == JoinResult.messageId then
									Flag = true
								end
							end
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId4] = v173(Proxy1[UserId4])
						else
							Signal2_1(function(p12)
								-- upvalues: v173 (copy), UserId4 (copy), Dictionary (upval)
								local v19 = v173(p12[UserId4])
								
								return if v19 == nil then Dictionary.removeKey(p12, UserId4) else Dictionary.join(p12, { [UserId4] = v19 })
							end)
						end
					end
					local v19 = false
					
					if JoinResult.isVisibleInChatWindow then
						Signal2_2(function(p12)
							-- upvalues: insertWindowMessageIdInOrder (upval), JoinResult (copy), v19 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval)
							local v20 = insertWindowMessageIdInOrder(p12, JoinResult.messageId, JoinResult.isHistorical)
							v19 = v19 or v20[#v20] ~= JoinResult.messageId
							
							if FFlagExpChatMessageHistoryExperiment then
								local v21 = capHistoricalPrefix(v20, JoinResult)
								v19 = v19 or #v21 < #v20
								
								return v21
							else
								return v20
							end
						end)
						
						if ChannelNameOverride then
							Signal2_3(function(p12)
								-- upvalues: ChannelNameOverride (ref), insertWindowMessageIdInOrder (upval), JoinResult (copy), v19 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), Dictionary (upval)
								local v20 = insertWindowMessageIdInOrder(p12[ChannelNameOverride] or {}, JoinResult.messageId, JoinResult.isHistorical)
								v19 = v19 or v20[#v20] ~= JoinResult.messageId
								
								if FFlagExpChatMessageHistoryExperiment then
									v20 = capHistoricalPrefix(v20, JoinResult)
								end
								return Dictionary.join(p12, { [ChannelNameOverride] = v20 })
							end)
						end
						if FFlagExpChatEnableV2ChatWindowModule then
							local ChannelNameOverride1 = Signal14(false)
							
							if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
								local MessageId2 = JoinResult.messageId
								
								if not v19 and not Flag1 then
									Callback2(MessageId2)
								elseif Flag then
									Flag1 = true
								else
									Callback1()
								end
							end
						end
					end
				end
			end
			
			if FFlagExpChatMessagesStoreBatchModule then
				SignalsExperimentalModule.batch(v207)
			else
				v207()
			end
		end
		if ExpChatPresetChatEmojiEffectExperimentation.isExperimentEnabled then
			LogPresetChatEmojiEffectExposureModule(config1)
		end
	end
	
	local function handleIncomingBubbleChatMessage(p11)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), IsBorderlessBubbleChatEnabledModule (upval), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (copy), Signal2_1 (copy), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (copy), keepHistoricalFlag (copy), Signal3 (copy), config (copy), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal4 (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), insertWindowMessageIdInOrder (copy), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Flag1 (ref), Callback2 (ref), Flag (ref), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval), ExpChatPresetChatEmojiEffectExperimentation (upval), LogPresetChatEmojiEffectExposureModule (upval)
		local config1 = {
			prefixText = "",
			textChannel = nil,
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			chatWindowMessageProperties = nil,
			userId = p11.bubbleChatMessageUserId,
			text = p11.message,
			translation = p11.translation,
			useTranslation = getChatTranslationEnabled(),
			messageId = p11.bubbleChatMessageId,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = p11.timestamp,
			partOrModel = p11.partOrModel,
			bubbleChatMessageProperties = p11.bubbleChatMessageProperties
		}
		
		local function v219()
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (upval), Signal (upval), IsBorderlessBubbleChatEnabledModule (upval), config1 (copy), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (upval), Signal2_1 (upval), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (upval), keepHistoricalFlag (upval), Signal3 (upval), config (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal4 (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), insertWindowMessageIdInOrder (upval), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Flag1 (upval), Callback2 (upval), Flag (upval), Callback1 (upval)
			local v19 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
			
			if IsBorderlessBubbleChatEnabledModule() then
				local v20 = v19 and v19[config1.messageId]
				config1.bubbleChatReceivedAtMillis = v20 and v20.bubbleChatReceivedAtMillis or GetServerTimeNowMillisModule()
			end
			if v19 and v19[config1.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p12)
						-- upvalues: List (upval), config1 (upval)
						return List.filter(p12, function(MessageId): boolean
							-- upvalues: config1 (upval)
							return MessageId ~= config1.messageId
						end)
					end)
					local v21 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
					
					if v21 then
						Signal2_3(function(p12)
							-- upvalues: v21 (copy), List (upval), config1 (upval), Dictionary (upval)
							local v22 = p12[v21]
							
							return if v22 then Dictionary.join(p12, {
								[v21] = List.filter(v22, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end)
							}) else p12
						end)
					end
					local MessageId = config1.messageId
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy[MessageId] = nil
					else
						Signal2(function(p12)
							-- upvalues: Dictionary (upval), MessageId (copy)
							return Dictionary.removeKey(p12, MessageId)
						end)
					end
					if config1.userId then
						local UserId = config1.userId
						
						local function v153(p12)
							-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), config1 (upval)
							if p12 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p12, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end) else List.filter(p12, function(p13): boolean
									-- upvalues: config1 (upval)
									return p13.messageId ~= config1.messageId
								end)
								
								return if #FilterResult == 0 then nil else FilterResult
							else
								return nil
							end
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId] = v153(Proxy1[UserId])
							
							return
						end
						Signal2_1(function(p12)
							-- upvalues: v153 (copy), UserId (copy), Dictionary (upval)
							local v22 = v153(p12[UserId])
							
							return if v22 == nil then Dictionary.removeKey(p12, UserId) else Dictionary.join(p12, { [UserId] = v22 })
						end)
					end
					return
				else
					if FFlagExpChatRenderHistoricalMessagesModule then
						writeByMessageId(config1.messageId, keepHistoricalFlag(config1))
					else
						writeByMessageId(config1.messageId, config1)
					end
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
						local UserId1 = config1.userId
						
						local function v155(List)
							-- upvalues: config1 (upval), List (upval)
							if not List then
								return nil
							end
							local v22 = nil
							
							for i, value in ipairs(List) do
								if value.messageId == config1.messageId then
									v22 = i
									break
								end
							end
							return if v22 then List.set(List, v22, config1) else List
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId1] = v155(Proxy1[UserId1])
							
							return
						end
						Signal2_1(function(p12)
							-- upvalues: v155 (copy), UserId1 (copy), Dictionary (upval)
							local v23 = v155(p12[UserId1])
							
							return if v23 == nil then Dictionary.removeKey(p12, UserId1) else Dictionary.join(p12, { [UserId1] = v23 })
						end)
					end
					return
				end
			else
				if FFlagExpChatRenderHistoricalMessagesModule then
					local v22 = Signal3(false)
					local IsVisibleInChatWindow = false
					
					if config1.isHistorical == true then
						IsVisibleInChatWindow = config1.isVisibleInChatWindow
						
						if IsVisibleInChatWindow then
							IsVisibleInChatWindow = false
							
							if config.messageLimit <= #v22 then
								local v23 = v22[1]
								local v24 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
								local v25 = v24 and v24[v23]
								IsVisibleInChatWindow = not (v25 ~= nil and v25.isHistorical == true)
							end
						end
					end
					if IsVisibleInChatWindow then return end
				end
				local UserId2 = config1.userId
				local PartOrModel = config1.partOrModel
				
				if not UserId2 and PartOrModel then
					UserId2 = Signal10(false)[PartOrModel]
					
					if not UserId2 then
						UserId2 = HttpService:GenerateGUID(false)
						Signal2_6(function(p12)
							-- upvalues: Dictionary (upval), UserId2 (ref), PartOrModel (copy)
							return Dictionary.join(p12, { [UserId2] = PartOrModel })
						end)
						Signal2_7(function(p12)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId2 (ref)
							return Dictionary.join(p12, { [PartOrModel] = UserId2 })
						end)
					end
				end
				local JoinResult = if UserId2 == config1.userId then config1 else Dictionary.join(config1, { userId = UserId2 })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v26 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v26 then
						local MessageId1 = v26[1]
						local v27 = v19 and v19[MessageId1]
						
						if v27 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[MessageId1] = nil
								else
									Signal2(function(p12)
										-- upvalues: Dictionary (upval), MessageId1 (copy)
										return Dictionary.removeKey(p12, MessageId1)
									end)
								end
							end
							if v27.userId then
								local UserId3 = v27.userId
								
								local function v171(p12)
									-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId1 (copy), Signal9 (upval), v27 (copy), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									if not p12 then
										return nil
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p12, function(p13): boolean
										-- upvalues: MessageId1 (upval)
										return p13 ~= MessageId1
									end) else List.filter(p12, function(p13): boolean
										-- upvalues: MessageId1 (upval)
										return p13.messageId ~= MessageId1
									end)
									
									if #FilterResult ~= 0 then
										return FilterResult
									end
									local v28 = Signal9(false)
									
									if v28[v27.userId] then
										local v29 = v28[v27.userId]
										Signal2_7(function(p13)
											-- upvalues: Dictionary (upval), v29 (copy)
											return Dictionary.removeKey(p13, v29)
										end)
										Signal2_6(function(p13)
											-- upvalues: Dictionary (upval), v27 (upval)
											return Dictionary.removeKey(p13, v27.userId)
										end)
									end
									return nil
								end
								
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy1[UserId3] = v171(Proxy1[UserId3])
								else
									Signal2_1(function(p12)
										-- upvalues: v171 (copy), UserId3 (copy), Dictionary (upval)
										local v28 = v171(p12[UserId3])
										
										return if v28 == nil then Dictionary.removeKey(p12, UserId3) else Dictionary.join(p12, { [UserId3] = v28 })
									end)
								end
							end
							Signal2_2(function(p12)
								-- upvalues: List (upval)
								return List.removeIndex(p12, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId1] = nil
							end
						end
					end
					if ChannelNameOverride and config.messageLimit <= #T then
						local Entry = T[1]
						
						if Entry then
							Signal2_3(function(p12)
								-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
								return Dictionary.join(p12, {
									[ChannelNameOverride] = List.removeIndex(p12[ChannelNameOverride] or {}, 1)
								})
							end)
							
							if v19 and v19[Entry] then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[Entry] = nil
								else
									Signal2(function(p12)
										-- upvalues: Dictionary (upval), Entry (copy)
										return Dictionary.removeKey(p12, Entry)
									end)
								end
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				writeByMessageId(JoinResult.messageId, JoinResult)
				
				if JoinResult.userId then
					local UserId4 = JoinResult.userId
					
					local function v173(p12)
						-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), JoinResult (copy), List (upval)
						local P51 = p12 or {}
						local Flag = false
						if FFlagExpChatMessagesStoreMemoryCleanupModule then
							for _, value in ipairs(P51) do
								if value == JoinResult.messageId then
									Flag = true
									break
								end
							end
						end
						for _, value1 in ipairs(P51) do
							if value1.messageId == JoinResult.messageId then
								Flag = true
							end
						end
					end
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy1[UserId4] = v173(Proxy1[UserId4])
					else
						Signal2_1(function(p13)
							-- upvalues: v173 (copy), UserId4 (copy), Dictionary (upval)
							local v28 = v173(p13[UserId4])
							
							return if v28 == nil then Dictionary.removeKey(p13, UserId4) else Dictionary.join(p13, { [UserId4] = v28 })
						end)
					end
				end
				local v28 = false
				
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p13)
						-- upvalues: insertWindowMessageIdInOrder (upval), JoinResult (copy), v28 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval)
						local v29 = insertWindowMessageIdInOrder(p13, JoinResult.messageId, JoinResult.isHistorical)
						v28 = v28 or v29[#v29] ~= JoinResult.messageId
						
						if FFlagExpChatMessageHistoryExperiment then
							local v30 = capHistoricalPrefix(v29, JoinResult)
							v28 = v28 or #v30 < #v29
							
							return v30
						else
							return v29
						end
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p13)
							-- upvalues: ChannelNameOverride (ref), insertWindowMessageIdInOrder (upval), JoinResult (copy), v28 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), Dictionary (upval)
							local v29 = insertWindowMessageIdInOrder(p13[ChannelNameOverride] or {}, JoinResult.messageId, JoinResult.isHistorical)
							v28 = v28 or v29[#v29] ~= JoinResult.messageId
							
							if FFlagExpChatMessageHistoryExperiment then
								v29 = capHistoricalPrefix(v29, JoinResult)
							end
							return Dictionary.join(p13, { [ChannelNameOverride] = v29 })
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							local MessageId2 = JoinResult.messageId
							
							if not v28 and not Flag1 then
								Callback2(MessageId2)
							elseif Flag then
								Flag1 = true
							else
								Callback1()
							end
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v219)
		else
			v219()
		end
		if ExpChatPresetChatEmojiEffectExperimentation.isExperimentEnabled then
			LogPresetChatEmojiEffectExposureModule(config1)
		end
	end
	
	local function handleHiddenMessageReceived(TextChatMessage)
		-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), FIntExpChatRandomCharChangeLowerBoundModule (upval), FIntExpChatRandomCharChangeUpperBoundModule (upval), ConfigModule (upval), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), IsBorderlessBubbleChatEnabledModule (upval), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (copy), Signal2_1 (copy), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (copy), keepHistoricalFlag (copy), Signal3 (copy), config (copy), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal4 (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), insertWindowMessageIdInOrder (copy), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Flag1 (ref), Callback2 (ref), Flag (ref), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
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
		
		local function v222()
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (upval), Signal (upval), IsBorderlessBubbleChatEnabledModule (upval), config1 (copy), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (upval), Signal2_1 (upval), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (upval), keepHistoricalFlag (upval), Signal3 (upval), config (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal4 (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), insertWindowMessageIdInOrder (upval), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Flag1 (upval), Callback2 (upval), Flag (upval), Callback1 (upval)
			local v28 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
			
			if IsBorderlessBubbleChatEnabledModule() then
				local v29 = v28 and v28[config1.messageId]
				config1.bubbleChatReceivedAtMillis = v29 and v29.bubbleChatReceivedAtMillis or GetServerTimeNowMillisModule()
			end
			if v28 and v28[config1.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p12)
						-- upvalues: List (upval), config1 (upval)
						return List.filter(p12, function(MessageId): boolean
							-- upvalues: config1 (upval)
							return MessageId ~= config1.messageId
						end)
					end)
					local v30 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
					
					if v30 then
						Signal2_3(function(p12)
							-- upvalues: v30 (copy), List (upval), config1 (upval), Dictionary (upval)
							local v31 = p12[v30]
							
							return if v31 then Dictionary.join(p12, {
								[v30] = List.filter(v31, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end)
							}) else p12
						end)
					end
					local MessageId = config1.messageId
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy[MessageId] = nil
					else
						Signal2(function(p12)
							-- upvalues: Dictionary (upval), MessageId (copy)
							return Dictionary.removeKey(p12, MessageId)
						end)
					end
					if config1.userId then
						local UserId = config1.userId
						
						local function v153(p12)
							-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), config1 (upval)
							if p12 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p12, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end) else List.filter(p12, function(p13): boolean
									-- upvalues: config1 (upval)
									return p13.messageId ~= config1.messageId
								end)
								
								return if #FilterResult == 0 then nil else FilterResult
							else
								return nil
							end
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId] = v153(Proxy1[UserId])
							
							return
						end
						Signal2_1(function(p12)
							-- upvalues: v153 (copy), UserId (copy), Dictionary (upval)
							local v31 = v153(p12[UserId])
							
							return if v31 == nil then Dictionary.removeKey(p12, UserId) else Dictionary.join(p12, { [UserId] = v31 })
						end)
					end
					return
				else
					if FFlagExpChatRenderHistoricalMessagesModule then
						writeByMessageId(config1.messageId, keepHistoricalFlag(config1))
					else
						writeByMessageId(config1.messageId, config1)
					end
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
						local UserId1 = config1.userId
						
						local function v155(List)
							-- upvalues: config1 (upval), List (upval)
							if not List then
								return nil
							end
							local v31 = nil
							
							for i, value in ipairs(List) do
								if value.messageId == config1.messageId then
									v31 = i
									break
								end
							end
							return if v31 then List.set(List, v31, config1) else List
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId1] = v155(Proxy1[UserId1])
							
							return
						end
						Signal2_1(function(p12)
							-- upvalues: v155 (copy), UserId1 (copy), Dictionary (upval)
							local v32 = v155(p12[UserId1])
							
							return if v32 == nil then Dictionary.removeKey(p12, UserId1) else Dictionary.join(p12, { [UserId1] = v32 })
						end)
					end
					return
				end
			else
				if FFlagExpChatRenderHistoricalMessagesModule then
					local v31 = Signal3(false)
					local IsVisibleInChatWindow = false
					
					if config1.isHistorical == true then
						IsVisibleInChatWindow = config1.isVisibleInChatWindow
						
						if IsVisibleInChatWindow then
							IsVisibleInChatWindow = false
							
							if config.messageLimit <= #v31 then
								local v32 = v31[1]
								local v33 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
								local v34 = v33 and v33[v32]
								IsVisibleInChatWindow = not (v34 ~= nil and v34.isHistorical == true)
							end
						end
					end
					if IsVisibleInChatWindow then return end
				end
				local UserId2 = config1.userId
				local PartOrModel = config1.partOrModel
				
				if not UserId2 and PartOrModel then
					UserId2 = Signal10(false)[PartOrModel]
					
					if not UserId2 then
						UserId2 = HttpService:GenerateGUID(false)
						Signal2_6(function(p12)
							-- upvalues: Dictionary (upval), UserId2 (ref), PartOrModel (copy)
							return Dictionary.join(p12, { [UserId2] = PartOrModel })
						end)
						Signal2_7(function(p12)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId2 (ref)
							return Dictionary.join(p12, { [PartOrModel] = UserId2 })
						end)
					end
				end
				local JoinResult = if UserId2 == config1.userId then config1 else Dictionary.join(config1, { userId = UserId2 })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v35 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v35 then
						local MessageId1 = v35[1]
						local v36 = v28 and v28[MessageId1]
						
						if v36 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[MessageId1] = nil
								else
									Signal2(function(p12)
										-- upvalues: Dictionary (upval), MessageId1 (copy)
										return Dictionary.removeKey(p12, MessageId1)
									end)
								end
							end
							if v36.userId then
								local UserId3 = v36.userId
								
								local function v171(p12)
									-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId1 (copy), Signal9 (upval), v36 (copy), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									if not p12 then
										return nil
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p12, function(p13): boolean
										-- upvalues: MessageId1 (upval)
										return p13 ~= MessageId1
									end) else List.filter(p12, function(p13): boolean
										-- upvalues: MessageId1 (upval)
										return p13.messageId ~= MessageId1
									end)
									
									if #FilterResult ~= 0 then
										return FilterResult
									end
									local v37 = Signal9(false)
									
									if v37[v36.userId] then
										local v38 = v37[v36.userId]
										Signal2_7(function(p13)
											-- upvalues: Dictionary (upval), v38 (copy)
											return Dictionary.removeKey(p13, v38)
										end)
										Signal2_6(function(p13)
											-- upvalues: Dictionary (upval), v36 (upval)
											return Dictionary.removeKey(p13, v36.userId)
										end)
									end
									return nil
								end
								
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy1[UserId3] = v171(Proxy1[UserId3])
								else
									Signal2_1(function(p12)
										-- upvalues: v171 (copy), UserId3 (copy), Dictionary (upval)
										local v37 = v171(p12[UserId3])
										
										return if v37 == nil then Dictionary.removeKey(p12, UserId3) else Dictionary.join(p12, { [UserId3] = v37 })
									end)
								end
							end
							Signal2_2(function(p12)
								-- upvalues: List (upval)
								return List.removeIndex(p12, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId1] = nil
							end
						end
					end
					if ChannelNameOverride and config.messageLimit <= #T then
						local Entry = T[1]
						
						if Entry then
							Signal2_3(function(p12)
								-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
								return Dictionary.join(p12, {
									[ChannelNameOverride] = List.removeIndex(p12[ChannelNameOverride] or {}, 1)
								})
							end)
							
							if v28 and v28[Entry] then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[Entry] = nil
								else
									Signal2(function(p12)
										-- upvalues: Dictionary (upval), Entry (copy)
										return Dictionary.removeKey(p12, Entry)
									end)
								end
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				writeByMessageId(JoinResult.messageId, JoinResult)
				
				if JoinResult.userId then
					local UserId4 = JoinResult.userId
					
					local function v173(p12)
						-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), JoinResult (copy), List (upval)
						local P51 = p12 or {}
						local Flag = false
						if FFlagExpChatMessagesStoreMemoryCleanupModule then
							for _, value in ipairs(P51) do
								if value == JoinResult.messageId then
									Flag = true
									break
								end
							end
						end
						for _, value1 in ipairs(P51) do
							if value1.messageId == JoinResult.messageId then
								Flag = true
							end
						end
					end
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy1[UserId4] = v173(Proxy1[UserId4])
					else
						Signal2_1(function(p13)
							-- upvalues: v173 (copy), UserId4 (copy), Dictionary (upval)
							local v37 = v173(p13[UserId4])
							
							return if v37 == nil then Dictionary.removeKey(p13, UserId4) else Dictionary.join(p13, { [UserId4] = v37 })
						end)
					end
				end
				local v37 = false
				
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p13)
						-- upvalues: insertWindowMessageIdInOrder (upval), JoinResult (copy), v37 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval)
						local v38 = insertWindowMessageIdInOrder(p13, JoinResult.messageId, JoinResult.isHistorical)
						v37 = v37 or v38[#v38] ~= JoinResult.messageId
						
						if FFlagExpChatMessageHistoryExperiment then
							local v39 = capHistoricalPrefix(v38, JoinResult)
							v37 = v37 or #v39 < #v38
							
							return v39
						else
							return v38
						end
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p13)
							-- upvalues: ChannelNameOverride (ref), insertWindowMessageIdInOrder (upval), JoinResult (copy), v37 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), Dictionary (upval)
							local v38 = insertWindowMessageIdInOrder(p13[ChannelNameOverride] or {}, JoinResult.messageId, JoinResult.isHistorical)
							v37 = v37 or v38[#v38] ~= JoinResult.messageId
							
							if FFlagExpChatMessageHistoryExperiment then
								v38 = capHistoricalPrefix(v38, JoinResult)
							end
							return Dictionary.join(p13, { [ChannelNameOverride] = v38 })
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							local MessageId2 = JoinResult.messageId
							
							if not v37 and not Flag1 then
								Callback2(MessageId2)
							elseif Flag then
								Flag1 = true
							else
								Callback1()
							end
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v222)
			
			return
		else
			v222()
		end
	end
	
	local function rebuildMessageWithTranslation(p12, UseTranslation)
		-- upvalues: IsBorderlessBubbleChatEnabledModule (upval), GetFFlagExpChatTelemetryEventTriggerModule (upval), FFlagEnableInExpChatRewriteModule (upval), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatPresetChatEnabled (upval), FFlagExpChatRenderHistoricalMessagesModule (upval)
		return {
			prefixText = p12.prefixText,
			text = p12.text,
			translation = p12.translation,
			useTranslation = UseTranslation,
			messageId = p12.messageId,
			status = p12.status,
			timestamp = p12.timestamp,
			bubbleChatReceivedAtMillis = if IsBorderlessBubbleChatEnabledModule() then p12.bubbleChatReceivedAtMillis else nil,
			isVisibleInBubbleChat = p12.isVisibleInBubbleChat,
			isVisibleInChatWindow = p12.isVisibleInChatWindow,
			partOrModel = p12.partOrModel,
			shouldOverrideBubbleChatSettings = p12.shouldOverrideBubbleChatSettings,
			bubbleChatMessageProperties = p12.bubbleChatMessageProperties,
			chatWindowMessageProperties = p12.chatWindowMessageProperties,
			textChatMessageInstance = if GetFFlagExpChatTelemetryEventTriggerModule() then p12.textChatMessageInstance else nil,
			userId = p12.userId,
			textChannel = p12.textChannel,
			wasRewritten = if FFlagEnableInExpChatRewriteModule then p12.wasRewritten else nil,
			originalText = if FFlagEnableInExpChatRewriteModule then p12.originalText else nil,
			chatActionType = if FFlagEnableInExpChatSummaryOnLuaModule then p12.chatActionType else nil,
			presetId = if FFlagExpChatPresetChatEnabled then p12.presetId else nil,
			presetChatVersion = if FFlagExpChatPresetChatEnabled then p12.presetChatVersion else nil,
			isHistorical = if FFlagExpChatRenderHistoricalMessagesModule then p12.isHistorical else nil
		}
	end
	
	local function handleLegacyBubbleCreated(p12)
		-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), IsBorderlessBubbleChatEnabledModule (upval), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (copy), List (upval), resolveChannelNameForMapOrder (copy), Signal2_3 (copy), Dictionary (upval), Signal2 (copy), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (copy), Signal2_1 (copy), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (copy), keepHistoricalFlag (copy), Signal3 (copy), config (copy), Signal10 (copy), HttpService (upval), Signal2_6 (copy), Signal2_7 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (copy), Signal4 (copy), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (copy), t2 (copy), insertWindowMessageIdInOrder (copy), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (copy), Flag1 (ref), Callback2 (ref), Flag (ref), Callback1 (ref), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local Timestamp = p12.timestamp
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
			userId = p12.userId,
			text = p12.text,
			messageId = p12.id,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = if Timestamp then DateTime.fromUnixTimestampMillis(Timestamp) else DateTime.now(),
			partOrModel = p12.adornee
		}
		
		local function v238()
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (upval), Signal (upval), IsBorderlessBubbleChatEnabledModule (upval), config1 (copy), GetServerTimeNowMillisModule (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), Signal2_2 (upval), List (upval), resolveChannelNameForMapOrder (upval), Signal2_3 (upval), Dictionary (upval), Signal2 (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), Proxy1 (upval), Signal2_1 (upval), FFlagExpChatRenderHistoricalMessagesModule (upval), writeByMessageId (upval), keepHistoricalFlag (upval), Signal3 (upval), config (upval), Signal10 (upval), HttpService (upval), Signal2_6 (upval), Signal2_7 (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal11 (upval), Signal4 (upval), FFlagExpChatMessagesStoreKeepInByMessageIdModule (upval), Signal9 (upval), t2 (upval), insertWindowMessageIdInOrder (upval), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal14 (upval), Flag1 (upval), Callback2 (upval), Flag (upval), Callback1 (upval)
			local v37 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
			
			if IsBorderlessBubbleChatEnabledModule() then
				local v38 = v37 and v37[config1.messageId]
				config1.bubbleChatReceivedAtMillis = v38 and v38.bubbleChatReceivedAtMillis or GetServerTimeNowMillisModule()
			end
			if v37 and v37[config1.messageId] then
				if FFlagExpChatEvictFloodcheckedFromWindowOrderModule and (config1.status == Enum.TextChatMessageStatus.Floodchecked or config1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					Signal2_2(function(p13)
						-- upvalues: List (upval), config1 (upval)
						return List.filter(p13, function(MessageId): boolean
							-- upvalues: config1 (upval)
							return MessageId ~= config1.messageId
						end)
					end)
					local v39 = resolveChannelNameForMapOrder(config1, config1.channelNameOverride)
					
					if v39 then
						Signal2_3(function(p13)
							-- upvalues: v39 (copy), List (upval), config1 (upval), Dictionary (upval)
							local v40 = p13[v39]
							
							return if v40 then Dictionary.join(p13, {
								[v39] = List.filter(v40, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end)
							}) else p13
						end)
					end
					local MessageId = config1.messageId
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy[MessageId] = nil
					else
						Signal2(function(p13)
							-- upvalues: Dictionary (upval), MessageId (copy)
							return Dictionary.removeKey(p13, MessageId)
						end)
					end
					if config1.userId then
						local UserId = config1.userId
						
						local function v153(p13)
							-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), config1 (upval)
							if p13 then
								local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p13, function(MessageId): boolean
									-- upvalues: config1 (upval)
									return MessageId ~= config1.messageId
								end) else List.filter(p13, function(p14): boolean
									-- upvalues: config1 (upval)
									return p14.messageId ~= config1.messageId
								end)
								
								return if #FilterResult == 0 then nil else FilterResult
							else
								return nil
							end
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId] = v153(Proxy1[UserId])
							
							return
						end
						Signal2_1(function(p13)
							-- upvalues: v153 (copy), UserId (copy), Dictionary (upval)
							local v40 = v153(p13[UserId])
							
							return if v40 == nil then Dictionary.removeKey(p13, UserId) else Dictionary.join(p13, { [UserId] = v40 })
						end)
					end
					return
				else
					if FFlagExpChatRenderHistoricalMessagesModule then
						writeByMessageId(config1.messageId, keepHistoricalFlag(config1))
					else
						writeByMessageId(config1.messageId, config1)
					end
					if not FFlagExpChatMessagesStoreMemoryCleanupModule and config1.userId then
						local UserId1 = config1.userId
						
						local function v155(List)
							-- upvalues: config1 (upval), List (upval)
							if not List then
								return nil
							end
							local v40 = nil
							
							for i, value in ipairs(List) do
								if value.messageId == config1.messageId then
									v40 = i
									break
								end
							end
							return if v40 then List.set(List, v40, config1) else List
						end
						
						if FFlagExpChatMessagesStoreUseProxyModule then
							Proxy1[UserId1] = v155(Proxy1[UserId1])
							
							return
						end
						Signal2_1(function(p13)
							-- upvalues: v155 (copy), UserId1 (copy), Dictionary (upval)
							local v41 = v155(p13[UserId1])
							
							return if v41 == nil then Dictionary.removeKey(p13, UserId1) else Dictionary.join(p13, { [UserId1] = v41 })
						end)
					end
					return
				end
			else
				if FFlagExpChatRenderHistoricalMessagesModule then
					local v40 = Signal3(false)
					local IsVisibleInChatWindow = false
					
					if config1.isHistorical == true then
						IsVisibleInChatWindow = config1.isVisibleInChatWindow
						
						if IsVisibleInChatWindow then
							IsVisibleInChatWindow = false
							
							if config.messageLimit <= #v40 then
								local v41 = v40[1]
								local v42 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
								local v43 = v42 and v42[v41]
								IsVisibleInChatWindow = not (v43 ~= nil and v43.isHistorical == true)
							end
						end
					end
					if IsVisibleInChatWindow then return end
				end
				local UserId2 = config1.userId
				local PartOrModel = config1.partOrModel
				
				if not UserId2 and PartOrModel then
					UserId2 = Signal10(false)[PartOrModel]
					
					if not UserId2 then
						UserId2 = HttpService:GenerateGUID(false)
						Signal2_6(function(p13)
							-- upvalues: Dictionary (upval), UserId2 (ref), PartOrModel (copy)
							return Dictionary.join(p13, { [UserId2] = PartOrModel })
						end)
						Signal2_7(function(p13)
							-- upvalues: Dictionary (upval), PartOrModel (copy), UserId2 (ref)
							return Dictionary.join(p13, { [PartOrModel] = UserId2 })
						end)
					end
				end
				local JoinResult = if UserId2 == config1.userId then config1 else Dictionary.join(config1, { userId = UserId2 })
				local ChannelNameOverride = nil
				
				if GetFFlagTextChatEnableUniverseChatTabsFunction() and JoinResult.channelNameOverride then
					ChannelNameOverride = JoinResult.channelNameOverride
				elseif JoinResult.textChannel then
					ChannelNameOverride = if JoinResult.textChannel.Name == "RBXSystem" or GetFFlagTextChatEnableUniverseChatTabsFunction() and not Signal11(false) then "RBXGeneral" else JoinResult.textChannel.Name
				end
				if JoinResult.isVisibleInChatWindow then
					local v44 = Signal3(false)
					local T = if ChannelNameOverride then Signal4(false)[ChannelNameOverride] or {} else {}
					
					if config.messageLimit <= #v44 then
						local MessageId1 = v44[1]
						local v45 = v37 and v37[MessageId1]
						
						if v45 then
							if not FFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[MessageId1] = nil
								else
									Signal2(function(p13)
										-- upvalues: Dictionary (upval), MessageId1 (copy)
										return Dictionary.removeKey(p13, MessageId1)
									end)
								end
							end
							if v45.userId then
								local UserId3 = v45.userId
								
								local function v171(p13)
									-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), List (upval), MessageId1 (copy), Signal9 (upval), v45 (copy), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
									if not p13 then
										return nil
									end
									local FilterResult = if FFlagExpChatMessagesStoreMemoryCleanupModule then List.filter(p13, function(p14): boolean
										-- upvalues: MessageId1 (upval)
										return p14 ~= MessageId1
									end) else List.filter(p13, function(p14): boolean
										-- upvalues: MessageId1 (upval)
										return p14.messageId ~= MessageId1
									end)
									
									if #FilterResult ~= 0 then
										return FilterResult
									end
									local v46 = Signal9(false)
									
									if v46[v45.userId] then
										local v47 = v46[v45.userId]
										Signal2_7(function(p14)
											-- upvalues: Dictionary (upval), v47 (copy)
											return Dictionary.removeKey(p14, v47)
										end)
										Signal2_6(function(p14)
											-- upvalues: Dictionary (upval), v45 (upval)
											return Dictionary.removeKey(p14, v45.userId)
										end)
									end
									return nil
								end
								
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy1[UserId3] = v171(Proxy1[UserId3])
								else
									Signal2_1(function(p13)
										-- upvalues: v171 (copy), UserId3 (copy), Dictionary (upval)
										local v46 = v171(p13[UserId3])
										
										return if v46 == nil then Dictionary.removeKey(p13, UserId3) else Dictionary.join(p13, { [UserId3] = v46 })
									end)
								end
							end
							Signal2_2(function(p13)
								-- upvalues: List (upval)
								return List.removeIndex(p13, 1)
							end)
							
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[MessageId1] = nil
							end
						end
					end
					if ChannelNameOverride and config.messageLimit <= #T then
						local Entry = T[1]
						
						if Entry then
							Signal2_3(function(p13)
								-- upvalues: ChannelNameOverride (ref), List (upval), Dictionary (upval)
								return Dictionary.join(p13, {
									[ChannelNameOverride] = List.removeIndex(p13[ChannelNameOverride] or {}, 1)
								})
							end)
							
							if v37 and v37[Entry] then
								if FFlagExpChatMessagesStoreUseProxyModule then
									Proxy[Entry] = nil
								else
									Signal2(function(p13)
										-- upvalues: Dictionary (upval), Entry (copy)
										return Dictionary.removeKey(p13, Entry)
									end)
								end
							end
							if FFlagExpChatMessagesStoreMemoryCleanupModule then
								t2[Entry] = nil
							end
						end
					end
				end
				writeByMessageId(JoinResult.messageId, JoinResult)
				
				if JoinResult.userId then
					local UserId4 = JoinResult.userId
					
					local function v173(p13)
						-- upvalues: FFlagExpChatMessagesStoreMemoryCleanupModule (upval), JoinResult (copy), List (upval)
						local P51 = p13 or {}
						local Flag = false
						if FFlagExpChatMessagesStoreMemoryCleanupModule then
							for _, value in ipairs(P51) do
								if value == JoinResult.messageId then
									Flag = true
									break
								end
							end
						end
						for _, value1 in ipairs(P51) do
							if value1.messageId == JoinResult.messageId then
								Flag = true
							end
						end
					end
					
					if FFlagExpChatMessagesStoreUseProxyModule then
						Proxy1[UserId4] = v173(Proxy1[UserId4])
					else
						Signal2_1(function(p14)
							-- upvalues: v173 (copy), UserId4 (copy), Dictionary (upval)
							local v46 = v173(p14[UserId4])
							
							return if v46 == nil then Dictionary.removeKey(p14, UserId4) else Dictionary.join(p14, { [UserId4] = v46 })
						end)
					end
				end
				local v46 = false
				
				if JoinResult.isVisibleInChatWindow then
					Signal2_2(function(p14)
						-- upvalues: insertWindowMessageIdInOrder (upval), JoinResult (copy), v46 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval)
						local v47 = insertWindowMessageIdInOrder(p14, JoinResult.messageId, JoinResult.isHistorical)
						v46 = v46 or v47[#v47] ~= JoinResult.messageId
						
						if FFlagExpChatMessageHistoryExperiment then
							local v48 = capHistoricalPrefix(v47, JoinResult)
							v46 = v46 or #v48 < #v47
							
							return v48
						else
							return v47
						end
					end)
					
					if ChannelNameOverride then
						Signal2_3(function(p14)
							-- upvalues: ChannelNameOverride (ref), insertWindowMessageIdInOrder (upval), JoinResult (copy), v46 (ref), FFlagExpChatMessageHistoryExperiment (upval), capHistoricalPrefix (upval), Dictionary (upval)
							local v47 = insertWindowMessageIdInOrder(p14[ChannelNameOverride] or {}, JoinResult.messageId, JoinResult.isHistorical)
							v46 = v46 or v47[#v47] ~= JoinResult.messageId
							
							if FFlagExpChatMessageHistoryExperiment then
								v47 = capHistoricalPrefix(v47, JoinResult)
							end
							return Dictionary.join(p14, { [ChannelNameOverride] = v47 })
						end)
					end
					if FFlagExpChatEnableV2ChatWindowModule then
						local ChannelNameOverride1 = Signal14(false)
						
						if ChannelNameOverride1 == nil or ChannelNameOverride == ChannelNameOverride1 then
							local MessageId2 = JoinResult.messageId
							
							if not v46 and not Flag1 then
								Callback2(MessageId2)
							elseif Flag then
								Flag1 = true
							else
								Callback1()
							end
						end
					end
				end
			end
		end
		
		if FFlagExpChatMessagesStoreBatchModule then
			SignalsExperimentalModule.batch(v238)
			
			return
		else
			v238()
		end
	end
	
	Callback2 = function(MessageId)
		-- upvalues: Signal12 (copy), Signal13 (copy), Signal2_10 (copy), t (copy), FFlagEnableInExpChatRewriteModule (upval), t1 (copy), FFlagExpChatRenderHistoricalMessagesModule (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), Total1 (ref), Total (ref)
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
		local Amount: number = if FFlagEnableInExpChatRewriteModule then 10 else 1
		local Entry1 = t1[SignalResultEntry]
		repeat
			if FFlagExpChatRenderHistoricalMessagesModule then
				local Proxy1 = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false)
				local ProxyEntry = Proxy1 and Proxy1[MessageId]
				
				if ProxyEntry ~= nil and ProxyEntry.isHistorical == true then
					Total1 += Amount
					
					if not Entry1 then break end
					Entry1.setter(Total1 + -1000000)
					break
				end
			end
			Total += Amount
			
			if not Entry1 then break end
			Entry1.setter(Total)
		until true
		Signal2_10(SignalResult1 % #SignalResult + 1)
	end
	
	Callback1 = function()
		-- upvalues: Signal14 (copy), Signal4 (copy), Signal3 (copy), Signal2_10 (copy), Total (ref), Total1 (ref), Callback2 (ref), Signal12 (copy), Signal13 (copy), t (copy), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
		local function doRepopulate()
			-- upvalues: Signal14 (upval), Signal4 (upval), Signal3 (upval), Signal2_10 (upval), Total (upval), Total1 (upval), Callback2 (upval), Signal12 (upval), Signal13 (upval), t (upval)
			local SignalResult = Signal14(false)
			local SignalResultEntry = if SignalResult then Signal4(false)[SignalResult] or {} else Signal3(false)
			Signal2_10(1)
			Total = 0
			Total1 = 0
			
			for _, value in ipairs(SignalResultEntry) do
				Callback2(value)
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
	end
	
	return {
		getByMessageId = if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal,
		getMessages = if FFlagExpChatMessagesStoreMemoryCleanupModule then nil else CreateComputedFunction(function(p13)
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy)
			local ProxyResult = if FFlagExpChatMessagesStoreUseProxyModule then Proxy(p13) else Signal(p13)
			
			if not ProxyResult then
				return {}
			end
			local List = {}
			
			for _, value in ProxyResult do
				table.insert(List, value)
			end
			return List
		end),
		getMessagesBySenderId = if FFlagExpChatMessagesStoreUseProxyModule then Proxy1 else Signal1,
		getWindowMessagesInOrder = Signal3,
		getWindowMessagesInOrderByTabId = Signal4,
		getHistoricalWindowMessageCount = if FFlagExpChatRenderHistoricalMessagesModule then CreateComputedFunction(function(p14)
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), countHistoricalPrefix (copy), Signal3 (copy)
			local ProxyResult = if FFlagExpChatMessagesStoreUseProxyModule then Proxy(p14) else Signal(p14)
			
			return (countHistoricalPrefix(Signal3(p14), function(p15)
				-- upvalues: ProxyResult (copy)
				return ProxyResult[p15]
			end))
		end) else nil,
		getMutedUserIds = Signal6,
		getCanLocalUserChat = Signal7,
		getIsBubbleChatEnabled = Signal8,
		getMockUserIdToPartOrModel = Signal9,
		getPartOrModelToMockUserId = Signal10,
		getMessage = function(Key)
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), t2 (copy), CreateComputedFunction (upval)
			if FFlagExpChatMessagesStoreUseProxyModule then
				return function(p14)
					-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (upval), Signal (upval), Key (copy)
					return (if FFlagExpChatMessagesStoreUseProxyModule then Proxy(p14) else Signal(p14))[Key]
				end
			end
			if not t2[Key] then
				t2[Key] = CreateComputedFunction(function(p14)
					-- upvalues: Signal (upval), Key (copy)
					local SignalResult = Signal(p14)
					
					return if SignalResult and SignalResult[Key] then SignalResult[Key] else nil
				end)
			end
			return t2[Key]
		end,
		getUserMessages = if FFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserMessages,
		getUserBubbleMessages = function(p14)
			-- upvalues: getUserMessageCache (copy)
			return getUserMessageCache(p14).bubbleMessages
		end,
		getUserLastMessage = if FFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserLastMessage,
		registerMessageComponent = function(Key)
			-- upvalues: t (copy), CreateSignalFunction (upval), t1 (copy), Signal2_9 (copy), List (upval)
			if not t[Key] then
				local Signal, Signal2 = CreateSignalFunction(nil)
				t[Key] = { getter = Signal, setter = Signal2 }
				local Signal1, Signal2_1 = CreateSignalFunction(0)
				t1[Key] = { getter = Signal1, setter = Signal2_1 }
				Signal2_9(function(p14)
					-- upvalues: List (upval), Key (copy)
					return List.append(p14, Key)
				end)
			end
			return t[Key].getter
		end,
		unregisterMessageComponent = function(Key)
			-- upvalues: Signal12 (copy), t (copy), t1 (copy), Signal2_9 (copy), List (upval), Signal13 (copy), Signal2_10 (copy), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
			local SignalResult = Signal12(false)
			local v46 = nil
			
			for i, value in ipairs(SignalResult) do
				if value == Key then
					v46 = i
					break
				end
			end
			if t[Key] then
				t[Key] = nil
			end
			if t1[Key] then
				t1[Key] = nil
			end
			if v46 then
				local function doUnregister()
					-- upvalues: Signal2_9 (upval), List (upval), Key (copy), Signal12 (upval), Signal13 (upval), Signal2_10 (upval), v46 (ref)
					Signal2_9(function(p14)
						-- upvalues: List (upval), Key (upval)
						return List.filter(p14, function(Key1): boolean
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
					if v46 < SignalResult1 then
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
		repopulateMessageComponents = Callback1,
		getMessageComponentSignal = function(p14)
			-- upvalues: t (copy)
			local Entry = t[p14]
			
			return if Entry then Entry.getter else nil
		end,
		getLayoutOrderSignal = function(p14)
			-- upvalues: t1 (copy)
			local Entry = t1[p14]
			
			return if Entry then Entry.getter else nil
		end,
		updateNextMessageComponent = Callback2,
		getMessageComponentRingBuffer = Signal12,
		getNextMessageComponentPointer = Signal13,
		setActiveChannelFilter = Signal2_11,
		getActiveChannelFilter = Signal14,
		setCanLocalUserChat = Signal2_5,
		muteUser = function(p14)
			-- upvalues: Signal2_4 (copy), Set (upval)
			Signal2_4(function(p15)
				-- upvalues: Set (upval), p14 (copy)
				return if p15 then Set.add(p15, p14) else {}
			end)
		end,
		unmuteUser = function(p14)
			-- upvalues: Signal2_4 (copy), Set (upval)
			Signal2_4(function(p15)
				-- upvalues: Set (upval), p14 (copy)
				return if p15 then Set.subtract(p15, p14) else {}
			end)
		end,
		handlePlayerRemoved = function(p14)
			-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (copy), Signal2_1 (copy), Dictionary (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), t3 (copy), Signal2_4 (copy), Set (upval), Signal1 (copy), Signal9 (copy), Signal2_7 (copy), Signal2_6 (copy), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
			local Text = tostring(p14)
			
			local function doHandlePlayerRemoved()
				-- upvalues: Text (copy), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (upval), Signal2_1 (upval), Dictionary (upval), FFlagExpChatMessagesStoreMemoryCleanupModule (upval), t3 (upval), Signal2_4 (upval), Set (upval), Signal1 (upval), Signal9 (upval), Signal2_7 (upval), Signal2_6 (upval)
				if FFlagExpChatMessagesStoreUseProxyModule then
					Proxy1[Text] = nil
				else
					Signal2_1(function(p15)
						-- upvalues: Dictionary (upval), Text (copy)
						return Dictionary.removeKey(p15, Text)
					end)
				end
				if FFlagExpChatMessagesStoreMemoryCleanupModule then
					t3[Text] = nil
				end
				Signal2_4(function(p15)
					-- upvalues: Set (upval), Text (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (upval), Signal1 (upval), Signal9 (upval), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
					if not p15 then
						return {}
					end
					local Inverted = not Set.has(p15, Text)
					
					if #((if FFlagExpChatMessagesStoreUseProxyModule then Proxy1 else Signal1(false))[Text] or {}) == 0 and Inverted then
						return p15
					end
					local SignalResult = Signal9(false)
					
					if SignalResult[Text] then
						local SignalResultEntry = SignalResult[Text]
						Signal2_7(function(p16)
							-- upvalues: Dictionary (upval), SignalResultEntry (copy)
							return Dictionary.removeKey(p16, SignalResultEntry)
						end)
						Signal2_6(function(p16)
							-- upvalues: Dictionary (upval), Text (upval)
							return Dictionary.removeKey(p16, Text)
						end)
					end
					return Set.subtract(p15, Text)
				end)
			end
			
			if FFlagExpChatMessagesStoreBatchModule then
				SignalsExperimentalModule.batch(doHandlePlayerRemoved)
				
				return
			end
			if FFlagExpChatMessagesStoreUseProxyModule then
				Proxy1[Text] = nil
			else
				Signal2_1(function(p15)
					-- upvalues: Dictionary (upval), Text (copy)
					return Dictionary.removeKey(p15, Text)
				end)
			end
			if FFlagExpChatMessagesStoreMemoryCleanupModule then
				t3[Text] = nil
			end
			Signal2_4(function(p15)
				-- upvalues: Set (upval), Text (copy), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy1 (upval), Signal1 (upval), Signal9 (upval), Signal2_7 (upval), Dictionary (upval), Signal2_6 (upval)
				if not p15 then
					return {}
				end
				local Inverted = not Set.has(p15, Text)
				
				if #((if FFlagExpChatMessagesStoreUseProxyModule then Proxy1 else Signal1(false))[Text] or {}) == 0 and Inverted then
					return p15
				end
				local SignalResult = Signal9(false)
				
				if SignalResult[Text] then
					local SignalResultEntry = SignalResult[Text]
					Signal2_7(function(p16)
						-- upvalues: Dictionary (upval), SignalResultEntry (copy)
						return Dictionary.removeKey(p16, SignalResultEntry)
					end)
					Signal2_6(function(p16)
						-- upvalues: Dictionary (upval), Text (upval)
						return Dictionary.removeKey(p16, Text)
					end)
				end
				return Set.subtract(p15, Text)
			end)
		end,
		clearWindowMessages = function()
			-- upvalues: forEachByMessageId (copy), Dictionary (upval), Signal2_2 (copy), Signal2_3 (copy), FFlagExpChatEnableV2ChatWindowModule (upval), Signal2_10 (copy), Total (ref), Total1 (ref), Signal12 (copy), t (copy), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
			local function doClearWindowMessages()
				-- upvalues: forEachByMessageId (upval), Dictionary (upval), Signal2_2 (upval), Signal2_3 (upval), FFlagExpChatEnableV2ChatWindowModule (upval), Signal2_10 (upval), Total (upval), Total1 (upval), Signal12 (upval), t (upval)
				forEachByMessageId(function(_, p14)
					-- upvalues: Dictionary (upval)
					return Dictionary.join(p14, { isVisibleInChatWindow = false })
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
					Total1 = 0
					
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
			-- upvalues: forEachByMessageId (copy), rebuildMessageWithTranslation (copy), FFlagExpChatMessagesStoreBatchModule (upval), SignalsExperimentalModule (upval)
			local function doToggleGlobalTranslation()
				-- upvalues: forEachByMessageId (upval), rebuildMessageWithTranslation (upval), UseTranslation (copy)
				forEachByMessageId(function(_, p14)
					-- upvalues: rebuildMessageWithTranslation (upval), UseTranslation (upval)
					return (rebuildMessageWithTranslation(p14, UseTranslation))
				end)
			end
			
			if FFlagExpChatMessagesStoreBatchModule then
				SignalsExperimentalModule.batch(doToggleGlobalTranslation)
				
				return
			else
				forEachByMessageId(function(_, p14)
					-- upvalues: rebuildMessageWithTranslation (upval), UseTranslation (copy)
					return (rebuildMessageWithTranslation(p14, UseTranslation))
				end)
			end
		end,
		toggleMessageTranslation = function(UseTranslation, Key)
			-- upvalues: rebuildMessageWithTranslation (copy), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal2 (copy), Dictionary (upval)
			local function v233(p14)
				-- upvalues: rebuildMessageWithTranslation (upval), UseTranslation (copy)
				return (rebuildMessageWithTranslation(p14, UseTranslation))
			end
			
			if FFlagExpChatMessagesStoreUseProxyModule then
				local ProxyEntry = Proxy[Key]
				
				if ProxyEntry then
					local RebuildMessageWithTranslationResult = rebuildMessageWithTranslation(ProxyEntry, UseTranslation)
					
					if RebuildMessageWithTranslationResult then
						Proxy[Key] = RebuildMessageWithTranslationResult
						
						return
					end
				end
			else
				Signal2(function(p14)
					-- upvalues: Key (copy), v233 (copy), Dictionary (upval)
					if p14 and p14[Key] then
						local v47 = v233(p14[Key])
						
						return if v47 then Dictionary.join(p14, { [Key] = v47 }) else p14
					else
						return p14 or {}
					end
				end)
			end
		end,
		handleIncomingOrOutgoingMessage = handleIncomingOrOutgoingMessage,
		batchWrites = batchWrites,
		handleIncomingBubbleChatMessage = handleIncomingBubbleChatMessage,
		handleLegacyBubbleCreated = handleLegacyBubbleCreated,
		handleLegacyBubbleTextUpdated = function(Key, Text)
			-- upvalues: Dictionary (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal2 (copy)
			local function v239(p14)
				-- upvalues: Dictionary (upval), Text (copy)
				return Dictionary.join(p14, { text = Text })
			end
			
			if FFlagExpChatMessagesStoreUseProxyModule then
				local ProxyEntry = Proxy[Key]
				
				if ProxyEntry then
					local JoinResult = Dictionary.join(ProxyEntry, { text = Text })
					
					if JoinResult then
						Proxy[Key] = JoinResult
						
						return
					end
				end
			else
				Signal2(function(p14)
					-- upvalues: Key (copy), v239 (copy), Dictionary (upval)
					if p14 and p14[Key] then
						local v47 = v239(p14[Key])
						
						return if v47 then Dictionary.join(p14, { [Key] = v47 }) else p14
					else
						return p14 or {}
					end
				end)
			end
		end,
		handleHiddenMessageReceived = handleHiddenMessageReceived,
		handleHiddenMessagesCleared = function()
			-- upvalues: FFlagExpChatClearHiddenMessagesPostAgeCheckModule (upval), forEachByMessageId (copy), Dictionary (upval), FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (copy), Signal (copy), Signal2_2 (copy), List (upval), Signal2_3 (copy)
			if FFlagExpChatClearHiddenMessagesPostAgeCheckModule then
				forEachByMessageId(function(_, p14)
					-- upvalues: Dictionary (upval)
					return if p14 and p14.isHiddenMessage then Dictionary.join(p14, { isVisibleInChatWindow = false }) else nil
				end)
				
				local function isNotHidden(p14): boolean
					-- upvalues: FFlagExpChatMessagesStoreUseProxyModule (upval), Proxy (upval), Signal (upval)
					local ProxyEntry = (if FFlagExpChatMessagesStoreUseProxyModule then Proxy else Signal(false))[p14]
					
					return ProxyEntry and not ProxyEntry.isHiddenMessage
				end
				
				Signal2_2(function(p14)
					-- upvalues: List (upval), isNotHidden (copy)
					return List.filter(p14, isNotHidden)
				end)
				Signal2_3(function(p14)
					-- upvalues: Dictionary (upval), List (upval), isNotHidden (copy)
					return Dictionary.map(p14, function(p15)
						-- upvalues: List (upval), isNotHidden (upval)
						return List.filter(p15, isNotHidden)
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