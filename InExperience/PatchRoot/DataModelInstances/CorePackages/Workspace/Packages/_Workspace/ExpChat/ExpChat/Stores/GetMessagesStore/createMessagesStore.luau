local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local sharedFlagsModule = require(parent.SharedFlags)
local isWhiteSpaceOnlyModule = require(expChat.isWhiteSpaceOnly)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local computeNameColor = require(parent.ChatUIPrimitives).Utils.computeNameColor
local _ = require(expChat.TextChatMessageChatActionType)
local expChatSharedModule = require(expChat.Parent.ExpChatShared)
local shouldRenderTextChannelInDefaultWindow = expChatSharedModule.shouldRenderTextChannelInDefaultWindow
local getTextChannelDisplayMode = expChatSharedModule.getTextChannelDisplayMode
local getTextAndTranslationModule = require(expChat.getTextAndTranslation)
local getServerTimeNowMillisModule = require(expChat.BubbleChat.Helpers.getServerTimeNowMillis)
local configModule = require(expChat.Config)
local sanitizeForRichTextModule = require(expChat.sanitizeForRichText)
local generateRichSystemMessageTextFormatModule = require(expChat.generateRichSystemMessageTextFormat)
local textChatService = game:GetService("TextChatService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local llamaModule = require(parent.llama)
local list = llamaModule.List
local dictionary = llamaModule.Dictionary
local set = llamaModule.Set
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local createProxy = signalsExperimentalModule.createProxy
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagEnableInExpChatRewriteModule = require(expChat.Flags.FFlagEnableInExpChatRewrite)
local fFlagEnableInExpChatSummaryOnLuaModule = require(expChat.Flags.FFlagEnableInExpChatSummaryOnLua)
local fIntExpChatRandomCharChangeLowerBoundModule = require(expChat.Flags.FIntExpChatRandomCharChangeLowerBound)
local fIntExpChatRandomCharChangeUpperBoundModule = require(expChat.Flags.FIntExpChatRandomCharChangeUpperBound)
local getFFlagExpChatTelemetryEventTriggerModule = require(expChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local fFlagExpChatClearHiddenMessagesPostAgeCheckModule = require(expChat.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatDisableUniverseBubbleChat = expChatSharedModule.Flags.FFlagExpChatDisableUniverseBubbleChat
local isGlobalBubbleChatEnabledModule = require(expChat.isGlobalBubbleChatEnabled)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)
local getFFlagExpChatSyntheticSystemMessageRichText = expChatSharedModule.Flags.GetFFlagExpChatSyntheticSystemMessageRichText
local fFlagExpChatMessagesStoreKeepInByMessageIdModule = require(expChat.Flags.FFlagExpChatMessagesStoreKeepInByMessageId)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getFFlagExpChatProtectedChatInternalAPIs = sharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local fFlagExpChatDictation = sharedFlagsModule.FFlagExpChatDictation
local fFlagExpChatMessagesStoreBatchModule = require(expChat.Flags.FFlagExpChatMessagesStoreBatch)
local fFlagExpChatMessagesStoreUseProxyModule = require(expChat.Flags.FFlagExpChatMessagesStoreUseProxy)
local fFlagExpChatMessagesStoreMemoryCleanupModule = require(expChat.Flags.FFlagExpChatMessagesStoreMemoryCleanup)
local fFlagExpChatEvictFloodcheckedFromWindowOrderModule = require(expChat.Flags.FFlagExpChatEvictFloodcheckedFromWindowOrder)
local fFlagExpChatFixLocalUserVerifiedBadgeModule = require(expChat.Flags.FFlagExpChatFixLocalUserVerifiedBadge)
local isBorderlessBubbleChatEnabledModule = require(expChat.isBorderlessBubbleChatEnabled)
local expChatPresetChatEmojiEffectExperimentation = require(parent.SocialExperiments).ExpChatPresetChatEmojiEffectExperimentation
local logPresetChatEmojiEffectExposureModule = require(expChat.PresetChat.logPresetChatEmojiEffectExposure)
local fFlagExpChatRenderHistoricalMessagesModule = require(expChat.Flags.FFlagExpChatRenderHistoricalMessages)
local fFlagExpChatMessageHistoryExperiment = sharedFlagsModule.FFlagExpChatMessageHistoryExperiment
local expChatMessageHistoryExperimentation = require(parent.SocialExperiments).ExpChatMessageHistoryExperimentation

function getChatTranslationEnabled()
	-- upvalues: textChatService (ref)
	return textChatService.ChatTranslationEnabled
end

return function(p1)
	-- upvalues: createSignal (ref), fFlagExpChatMessagesStoreUseProxyModule (ref), createProxy (ref), createComputed (ref), dictionary (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatMessagesStoreBatchModule (ref), signalsExperimentalModule (ref), fFlagExpChatRenderHistoricalMessagesModule (ref), list (ref), expChatMessageHistoryExperimentation (ref), isBorderlessBubbleChatEnabledModule (ref), getServerTimeNowMillisModule (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (ref), httpService (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (ref), fFlagExpChatMessageHistoryExperiment (ref), fFlagExpChatEnableV2ChatWindowModule (ref), set (ref), sanitizeForRichTextModule (ref), getFFlagExpChatSyntheticSystemMessageRichText (ref), generateRichSystemMessageTextFormatModule (ref), fFlagExpChatDictation (ref), computeNameColor (ref), playersService (ref), fFlagEnableInExpChatRewriteModule (ref), getTextAndTranslationModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), isWhiteSpaceOnlyModule (ref), fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), expChatSharedModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatDisableUniverseBubbleChat (ref), fFlagExpChatGlobalTabDefaultModule (ref), isGlobalBubbleChatEnabledModule (ref), shouldRenderTextChannelInDefaultWindow (ref), getTextChannelDisplayMode (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), expChatPresetChatEmojiEffectExperimentation (ref), logPresetChatEmojiEffectExposureModule (ref), fIntExpChatRandomCharChangeLowerBoundModule (ref), fIntExpChatRandomCharChangeUpperBoundModule (ref), configModule (ref), fFlagExpChatClearHiddenMessagesPostAgeCheckModule (ref)
	local t = {
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
	local var1, var2 = createSignal(t.byMessageId)
	local var3 = if fFlagExpChatMessagesStoreUseProxyModule then createProxy({}) else nil
	local var4, var5 = createSignal(t.messagesBySenderId)
	local var6 = if fFlagExpChatMessagesStoreUseProxyModule then createProxy({}) else nil
	local var7, var8 = createSignal(t.windowMessagesInOrder)
	local var9, var10 = createSignal(t.windowMessagesInOrderByTabId)
	local var11, var12 = createSignal(t.mutedUserIds)
	local var13 = if p1 ~= nil then var11 else createComputed(function(p2)
		-- upvalues: var11 (ref), p1 (ref)
		local cloned = table.clone(var11(p2))
		
		for i in p1(p2) do
			cloned[i] = true
		end
		return cloned
	end)
	local var14, var15 = createSignal(t.canLocalUserChat)
	local var16, _ = createSignal(t.isBubbleChatEnabled)
	local var17, var18 = createSignal(t.mockUserIdToPartOrModel)
	local var19, var20 = createSignal(t.partOrModelToMockUserId)
	local var21, var22 = createSignal(false)
	local var23, var24 = createSignal(t.messageComponentRingBuffer)
	local var25, var26 = createSignal(t.nextMessageComponentPointer)
	local t_1 = {}
	local var27 = 0
	local var28 = 0
	local t_2 = {}
	local var29, var30 = createSignal(nil)
	local updateNextMessageComponent = nil
	local var31 = nil
	local var32 = false
	local var33 = false
	local t_3 = {}
	
	local function _()
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
		return if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
	end
	
	local _ = function(p3)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
		return if fFlagExpChatMessagesStoreUseProxyModule then var3(p3) else var1(p3)
	end
	
	local function writeByMessageId(p3, p4)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var2 (ref), dictionary (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			var3[p3] = p4
			
			return
		elseif p4 == nil then
			var2(function(p5)
				-- upvalues: dictionary (copy), p3 (ref)
				return dictionary.removeKey(p5, p3)
			end)
			
			return
		end
		var2(function(p5)
			-- upvalues: dictionary (copy), p3 (ref), p4 (ref)
			return dictionary.join(p5, { [p3] = p4 })
		end)
	end
	
	local _ = function(p3, p4)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var2 (ref), dictionary (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			local var34 = var3[p3]
			
			if var34 then
				local var35 = p4(var34)
				
				if var35 then
					var3[p3] = var35
					
					return
				end
			end
		else
			var2(function(p5)
				-- upvalues: p3 (ref), p4 (ref), dictionary (copy)
				if not p5 or not p5[p3] then
					return p5 or {}
				end
				local var36 = p4(p5[p3])
				
				return if var36 then dictionary.join(p5, { [p3] = var36 }) else p5
			end)
		end
	end
	
	local function forEachByMessageId(p3)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var2 (ref)
		if not fFlagExpChatMessagesStoreUseProxyModule then
			var2(function(p4)
				-- upvalues: p3 (ref)
				if not p4 then
					return {}
				end
				local t = {}
				
				for i, v in p4 do
					t[i] = p3(i, v) or v
				end
				return t
			end)
			
			return
		end
		for i in var3 do
			local var34 = var3[i]
			
			if var34 then
				local var35 = p3(i, var34)
				
				if var35 then
					var3[i] = var35
				end
			end
		end
	end
	
	local _ = function(p4)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var4 (ref)
		return if fFlagExpChatMessagesStoreUseProxyModule then var6(p4) else var4(p4)
	end
	
	local _ = function(p4, p5)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var5 (ref), dictionary (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			var6[p4] = p5
			
			return
		elseif p5 == nil then
			var5(function(p6)
				-- upvalues: dictionary (copy), p4 (ref)
				return dictionary.removeKey(p6, p4)
			end)
			
			return
		end
		var5(function(p6)
			-- upvalues: dictionary (copy), p4 (ref), p5 (ref)
			return dictionary.join(p6, { [p4] = p5 })
		end)
	end
	
	local _ = function(p4, p5)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var5 (ref), dictionary (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			var6[p4] = p5(var6[p4])
			
			return
		end
		var5(function(p6)
			-- upvalues: p5 (ref), p4 (ref), dictionary (copy)
			local var36 = p5(p6[p4])
			
			return if var36 == nil then dictionary.removeKey(p6, p4) else dictionary.join(p6, { [p4] = var36 })
		end)
	end
	
	local function resolveChannelNameForMapOrder(p4, p5)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref)
		return if getFFlagTextChatEnableUniverseChatTabs() then p5 or (if p4.textChannel then if p4.textChannel.Name == "RBXSystem" or not var21(false) then "RBXGeneral" else p4.textChannel.Name else nil) elseif p4.textChannel then if p4.textChannel.Name == "RBXSystem" then "RBXGeneral" else p4.textChannel.Name else nil
	end
	
	local _ = function(p4)
		-- upvalues: fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(p4)
			
			return
		end
		p4()
	end
	
	local function batchWrites(p4)
		-- upvalues: var32 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy), var33 (write), var31 (write)
		if var32 then
			if fFlagExpChatMessagesStoreBatchModule then
				signalsExperimentalModule.batch(p4)
				
				return
			end
			p4()
			
			return
		else
			var32 = true
			var33 = false
			
			if fFlagExpChatMessagesStoreBatchModule then
				signalsExperimentalModule.batch(p4)
			else
				p4()
			end
			var32 = false
		end
	end
	
	local _ = function(p4)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
		local var36 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
		local var37 = var36 and var36[p4]
		
		return var37 ~= nil and var37.isHistorical == true
	end
	
	local var36 = if fFlagExpChatRenderHistoricalMessagesModule then createComputed(function(p4)
		-- upvalues: var7 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
		local var37 = var7(p4)
		local var38 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p4) else var1(p4)
		local var39 = 0
		
		for i, v in ipairs(var37) do
			local var40 = var38[v]
			
			if not var40 or not var40.isHistorical then break end
			var39 += 1
		end
		return var39
	end) else nil
	
	local function insertWindowMessageIdInOrder(p5, p6, p7)
		-- upvalues: fFlagExpChatRenderHistoricalMessagesModule (copy), list (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
		if not fFlagExpChatRenderHistoricalMessagesModule or not p7 then
			return list.append(p5, p6)
		end
		for i, v in ipairs(p5) do
			local var41 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			local var42 = var41 and var41[v]
			
			if not (var42 ~= nil and var42.isHistorical == true) then
				return list.insert(p5, i, p6)
			end
		end
		return list.append(p5, p6)
	end
	
	local function capHistoricalPrefix(p8, p9)
		-- upvalues: expChatMessageHistoryExperimentation (copy), var14 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), list (copy)
		if not p9.isHistorical then
			return p8
		end
		local historyArm = expChatMessageHistoryExperimentation.getHistoryArm(var14(false))
		local var43 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
		
		local function _(p10)
			-- upvalues: p9 (ref), var43 (ref)
			return if p10 == p9.messageId then p9 else var43 and var43[p10]
		end
		
		local var44 = 0
		
		for i, v in ipairs(p8) do
			local var45 = if v == p9.messageId then p9 else var43 and var43[v]
			
			if not var45 or not var45.isHistorical then break end
			var44 += 1
		end
		local var46 = if historyArm then historyArm.maxAgeSeconds else 0
		local maxValue = math.max(1, var44 - (if historyArm then historyArm.maxCount else 0) + 1)
		
		if var46 > 0 then
			local var47 = workspace:GetServerTimeNow() - var46
			
			for i_1 = maxValue, var44 do
				local var48 = p8[i_1]
				local var49 = if var48 == p9.messageId then p9 else var43 and var43[var48]
				
				if var49 and var47 <= var49.timestamp.UnixTimestamp then break end
				maxValue = i_1 + 1
			end
		end
		return if maxValue == 1 then p8 elseif #p8 < maxValue then {} else list.slice(p8, maxValue)
	end
	
	local _ = function(p10)
		-- upvalues: var7 (ref), t (ref)
		return p10.isHistorical == true and (p10.isVisibleInChatWindow and t.messageLimit <= #var7(false))
	end
	
	local _ = function(p10, p11)
		-- upvalues: var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write)
		if not p11 and not var33 then
			updateNextMessageComponent(p10)
			
			return
		elseif var32 then
			var33 = true
			
			return
		end
		var31()
	end
	
	local function keepHistoricalFlag(p10)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), dictionary (copy)
		local var50 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
		local messageId = var50 and var50[p10.messageId]
		
		return if messageId ~= nil and messageId.isHistorical == true then dictionary.join(p10, { isHistorical = true }) else p10
	end
	
	local _ = function(p10)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var50 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), p10 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var51 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var51 and var51[p10.messageId]
				p10.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var51 and var51[p10.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (p10.status == Enum.TextChatMessageStatus.Floodchecked or p10.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p11)
						-- upvalues: list (copy), p10 (copy)
						return list.filter(p11, function(p12)
							-- upvalues: p10 (copy)
							return p12 ~= p10.messageId
						end)
					end)
					local var52 = resolveChannelNameForMapOrder(p10, p10.channelNameOverride)
					
					if var52 then
						var10(function(p11)
							-- upvalues: var52 (ref), list (copy), p10 (copy), dictionary (copy)
							local var53 = p11[var52]
							
							return if var53 then dictionary.join(p11, {
								[var52] = list.filter(var53, function(p12)
									-- upvalues: p10 (copy)
									return p12 ~= p10.messageId
								end)
							}) else p11
						end)
					end
					local messageId = p10.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p11)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p11, messageId)
						end)
					end
					if p10.userId then
						local userId = p10.userId
						
						local var53 = function(p11)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), p10 (copy)
							if not p11 then
								return nil
							end
							local var54 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p11, function(p12)
								-- upvalues: p10 (copy)
								return p12 ~= p10.messageId
							end) else list.filter(p11, function(p12)
								-- upvalues: p10 (copy)
								return p12.messageId ~= p10.messageId
							end)
							
							return if #var54 == 0 then nil else var54
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var53(var6[userId])
							
							return
						end
						var5(function(p11)
							-- upvalues: var53 (ref), userId (ref), dictionary (copy)
							local var54 = var53(p11[userId])
							
							return if var54 == nil then dictionary.removeKey(p11, userId) else dictionary.join(p11, { [userId] = var54 })
						end)
					end
					return
				elseif fFlagExpChatRenderHistoricalMessagesModule then
					writeByMessageId(p10.messageId, keepHistoricalFlag(p10))
				else
					writeByMessageId(p10.messageId, p10)
				end
				if not fFlagExpChatMessagesStoreMemoryCleanupModule and p10.userId then
					local userId = p10.userId
					
					local var54 = function(p11)
						-- upvalues: p10 (copy), list (copy)
						if not p11 then
							return nil
						end
						local var55 = nil
						
						for i, v in ipairs(p11) do
							if v.messageId == p10.messageId then
								var55 = i
								break
							end
						end
						return if var55 then list.set(p11, var55, p10) else p11
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var54(var6[userId])
						
						return
					end
					var5(function(p12)
						-- upvalues: var54 (ref), userId (ref), dictionary (copy)
						local var56 = var54(p12[userId])
						
						return if var56 == nil then dictionary.removeKey(p12, userId) else dictionary.join(p12, { [userId] = var56 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var55 = p10
				
				if var55.isHistorical == true and (var55.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
			end
			local userId = p10.userId
			local partOrModel = p10.partOrModel
			
			if not userId and partOrModel then
				userId = var19(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var18(function(p11)
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p11, { [userId] = partOrModel })
					end)
					var20(function(p11)
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p11, { [partOrModel] = userId })
					end)
				end
			end
			local var56 = if userId ~= p10.userId then p10 else dictionary.join(p10, { userId = userId })
			local var57 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var56.channelNameOverride then
				var57 = var56.channelNameOverride
			elseif var56.textChannel then
				var57 = if var56.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var56.textChannel.Name
			end
			if var56.isVisibleInChatWindow then
				local var58 = var7(false)
				local var59 = if var57 then var9(false)[var57] or {} else {}
				
				if t.messageLimit <= #var58 then
					local var60 = var58[1]
					local var61 = var51 and var51[var60]
					
					if var61 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var60] = nil
							else
								var2(function(p11)
									-- upvalues: dictionary (copy), var60 (ref)
									return dictionary.removeKey(p11, var60)
								end)
							end
						end
						if var61.userId then
							local userId_1 = var61.userId
							
							local var62 = function(p11)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var60 (ref), var17 (copy), var61 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p11 then
									return nil
								end
								local var63 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p11, function(p12)
									-- upvalues: var60 (copy)
									return p12 ~= var60
								end) else list.filter(p11, function(p12)
									-- upvalues: var60 (copy)
									return p12.messageId ~= var60
								end)
								
								if #var63 ~= 0 then
									return var63
								end
								local var64 = var17(false)
								
								if var64[var61.userId] then
									local userId = var64[var61.userId]
									var20(function(p12)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p12, userId)
									end)
									var18(function(p12)
										-- upvalues: dictionary (copy), var61 (copy)
										return dictionary.removeKey(p12, var61.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var62(var6[userId_1])
							else
								var5(function(p11)
									-- upvalues: var62 (ref), userId_1 (ref), dictionary (copy)
									local var63 = var62(p11[userId_1])
									
									return if var63 == nil then dictionary.removeKey(p11, userId_1) else dictionary.join(p11, { [userId_1] = var63 })
								end)
							end
						end
						var8(function(p11)
							-- upvalues: list (copy)
							return list.removeIndex(p11, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var60] = nil
						end
					end
				end
				if var57 and t.messageLimit <= #var59 then
					local var63 = var59[1]
					
					if var63 then
						var10(function(p11)
							-- upvalues: var57 (write), list (copy), dictionary (copy)
							return dictionary.join(p11, { [var57] = list.removeIndex(p11[var57] or {}, 1) })
						end)
						
						if var51 and var51[var63] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var63] = nil
							else
								var2(function(p11)
									-- upvalues: dictionary (copy), var63 (ref)
									return dictionary.removeKey(p11, var63)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var63] = nil
						end
					end
				end
			end
			writeByMessageId(var56.messageId, var56)
			
			if var56.userId then
				local userId_1 = var56.userId
				
				local var64 = function(p11)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var56 (ref), list (copy)
					p11 = p11 or {}
					local var65 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p11) do
							if v == var56.messageId then
								var65 = true
							end
						end
					else
						for i, v in ipairs(p11) do
							if v.messageId == var56.messageId then
								var65 = true
								break
							end
						end
					end
					return if var65 then p11 else list.append(p11, if fFlagExpChatMessagesStoreMemoryCleanupModule then var56.messageId else var56)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var64(var6[userId_1])
				else
					var5(function(p12)
						-- upvalues: var64 (ref), userId_1 (ref), dictionary (copy)
						local var66 = var64(p12[userId_1])
						
						return if var66 == nil then dictionary.removeKey(p12, userId_1) else dictionary.join(p12, { [userId_1] = var66 })
					end)
				end
			end
			local var66 = false
			
			if var56.isVisibleInChatWindow then
				var8(function(p12)
					-- upvalues: insertWindowMessageIdInOrder (copy), var56 (ref), var66 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var67 = insertWindowMessageIdInOrder(p12, var56.messageId, var56.isHistorical)
					var66 = var66 or var67[#var67] ~= var56.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var68 = capHistoricalPrefix(var67, var56)
						var66 = var66 or #var68 < #var67
						
						return var68
					end
					return var67
				end)
				
				if var57 then
					var10(function(p12)
						-- upvalues: var57 (write), insertWindowMessageIdInOrder (copy), var56 (ref), var66 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var67 = insertWindowMessageIdInOrder(p12[var57] or {}, var56.messageId, var56.isHistorical)
						var66 = var66 or var67[#var67] ~= var56.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var67 = capHistoricalPrefix(var67, var56)
						end
						return dictionary.join(p12, { [var57] = var67 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var67 = var29(false)
					
					if if var67 ~= nil then var57 == var67 else true then
						local messageId = var56.messageId
						
						if not var33 then
							updateNextMessageComponent(messageId)
						elseif var32 then
							var33 = true
						else
							var31()
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var50)
			
			return
		end
		var50()
	end
	
	local t_4 = {}
	
	local function getMessage(p11)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), t_3 (ref), createComputed (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			return function(p12)
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), p11 (ref)
				return (if fFlagExpChatMessagesStoreUseProxyModule then var3(p12) else var1(p12))[p11]
			end
		elseif not t_3[p11] then
			t_3[p11] = createComputed(function(p12)
				-- upvalues: var1 (copy), p11 (ref)
				local var65 = var1(p12)
				
				return if var65 and var65[p11] then var65[p11] else nil
			end)
		end
		return t_3[p11]
	end
	
	local function getUserMessageCache(p11)
		-- upvalues: t_4 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), createComputed (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var4 (ref), var3 (ref), var1 (ref), var13 (ref), set (copy)
		local var65 = tostring(p11)
		
		if not t_4[var65] then
			t_4[var65] = {}
			
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var65].messages = createComputed(function(p12)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var65 (ref)
					return (if fFlagExpChatMessagesStoreUseProxyModule then var6(p12) else var4(p12))[var65] or {}
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var65].bubbleMessages = createComputed(function(p12)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var65 (ref), var3 (copy), var1 (copy), var13 (copy), set (copy)
					local var66 = (if fFlagExpChatMessagesStoreUseProxyModule then var6(p12) else var4(p12))[var65] or {}
					local var67 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p12) else var1(p12)
					local var68 = var13(p12)
					local t = {}
					
					for i, v in ipairs(var66) do
						local var69 = var67[v]
						
						if var69 then
							if var69.isVisibleInBubbleChat and not (var69.userId and set.has(var68, var69.userId) or false) then
								table.insert(t, var69)
							end
						end
					end
					return t
				end)
			else
				t_4[var65].bubbleMessages = createComputed(function(p13)
					-- upvalues: t_4 (copy), var65 (ref), var13 (copy), set (copy)
					local var70 = t_4[var65].messages(p13)
					local var71 = var13(p13)
					local t = {}
					
					for i, v in ipairs(var70) do
						if v.isVisibleInBubbleChat and not (v.userId and set.has(var71, v.userId) or false) then
							table.insert(t, v)
						end
					end
					return t
				end)
			end
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var65].lastMessage = createComputed(function(p13)
					-- upvalues: t_4 (copy), var65 (ref)
					local var70 = t_4[var65].messages(p13)
					
					return if #var70 > 0 then var70[#var70] else nil
				end)
			end
		end
		return t_4[var65]
	end
	
	local function getUserMessages(p12)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p12).messages
	end
	
	local function getUserBubbleMessages(p12)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p12).bubbleMessages
	end
	
	local function getUserLastMessage(p12)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p12).lastMessage
	end
	
	local _ = function()
		-- upvalues: createComputed (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
		return createComputed(function(p12)
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy)
			local var66 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p12) else var1(p12)
			
			if not var66 then
				return {}
			end
			local t = {}
			
			for i, v in var66 do
				table.insert(t, v)
			end
			return t
		end)
	end
	
	local function addSystemMessage(p12, p13, p14, p15, p16, p17)
		-- upvalues: sanitizeForRichTextModule (copy), getFFlagExpChatSyntheticSystemMessageRichText (copy), generateRichSystemMessageTextFormatModule (copy), fFlagExpChatDictation (copy), httpService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var66 = sanitizeForRichTextModule(p12)
		local t_1 = {
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
			text = if getFFlagExpChatSyntheticSystemMessageRichText() then generateRichSystemMessageTextFormatModule(var66, if fFlagExpChatDictation then p16 else nil, p15) else var66,
			messageId = httpService:GenerateGUID(false),
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			textChannel = p17,
			channelNameOverride = if p17 ~= nil then p13 else nil,
			metadata = p14
		}
		
		local var67 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var68 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var68 and var68[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var68 and var68[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p18)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p18, function(p19)
							-- upvalues: t_1 (copy)
							return p19 ~= t_1.messageId
						end)
					end)
					local var69 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var69 then
						var10(function(p18)
							-- upvalues: var69 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var70 = p18[var69]
							
							return if var70 then dictionary.join(p18, {
								[var69] = list.filter(var70, function(p19)
									-- upvalues: t_1 (copy)
									return p19 ~= t_1.messageId
								end)
							}) else p18
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p18)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p18, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var70 = function(p18)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p18 then
								local var71 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p18, function(p19)
									-- upvalues: t_1 (copy)
									return p19 ~= t_1.messageId
								end) else list.filter(p18, function(p19)
									-- upvalues: t_1 (copy)
									return p19.messageId ~= t_1.messageId
								end)
								
								return if #var71 == 0 then nil else var71
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var70(var6[userId])
							
							return
						end
						var5(function(p18)
							-- upvalues: var70 (ref), userId (ref), dictionary (copy)
							local var71 = var70(p18[userId])
							
							return if var71 == nil then dictionary.removeKey(p18, userId) else dictionary.join(p18, { [userId] = var71 })
						end)
					end
					return
				elseif fFlagExpChatRenderHistoricalMessagesModule then
					writeByMessageId(t_1.messageId, keepHistoricalFlag(t_1))
				else
					writeByMessageId(t_1.messageId, t_1)
				end
				if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
					local userId = t_1.userId
					
					local var71 = function(p18)
						-- upvalues: t_1 (copy), list (copy)
						if not p18 then
							return nil
						end
						local var72 = nil
						
						for i, v in ipairs(p18) do
							if v.messageId == t_1.messageId then break end
						end
						return if var72 then list.set(p18, var72, t_1) else p18
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var71(var6[userId])
						
						return
					end
					var5(function(p19)
						-- upvalues: var71 (ref), userId (ref), dictionary (copy)
						local var73 = var71(p19[userId])
						
						return if var73 == nil then dictionary.removeKey(p19, userId) else dictionary.join(p19, { [userId] = var73 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var72 = t_1
				
				if var72.isHistorical == true and (var72.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
			end
			local userId = t_1.userId
			local partOrModel = t_1.partOrModel
			
			if not userId and partOrModel then
				userId = var19(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var18(function(p18)
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p18, { [userId] = partOrModel })
					end)
					var20(function(p18)
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p18, { [partOrModel] = userId })
					end)
				end
			end
			local var73 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var74 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var73.channelNameOverride then
				var74 = var73.channelNameOverride
			elseif var73.textChannel then
				var74 = if var73.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var73.textChannel.Name
			end
			if var73.isVisibleInChatWindow then
				local var75 = var7(false)
				local var76 = if var74 then var9(false)[var74] or {} else {}
				
				if t.messageLimit <= #var75 then
					local var77 = var75[1]
					local var78 = var68 and var68[var77]
					
					if var78 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var77] = nil
							else
								var2(function(p18)
									-- upvalues: dictionary (copy), var77 (ref)
									return dictionary.removeKey(p18, var77)
								end)
							end
						end
						if var78.userId then
							local userId_1 = var78.userId
							
							local var79 = function(p18)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var77 (ref), var17 (copy), var78 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p18 then
									return nil
								end
								local var80 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p18, function(p19)
									-- upvalues: var77 (copy)
									return p19 ~= var77
								end) else list.filter(p18, function(p19)
									-- upvalues: var77 (copy)
									return p19.messageId ~= var77
								end)
								
								if #var80 ~= 0 then
									return var80
								end
								local var81 = var17(false)
								
								if var81[var78.userId] then
									local userId = var81[var78.userId]
									var20(function(p19)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p19, userId)
									end)
									var18(function(p19)
										-- upvalues: dictionary (copy), var78 (copy)
										return dictionary.removeKey(p19, var78.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var79(var6[userId_1])
							else
								var5(function(p18)
									-- upvalues: var79 (ref), userId_1 (ref), dictionary (copy)
									local var80 = var79(p18[userId_1])
									
									return if var80 == nil then dictionary.removeKey(p18, userId_1) else dictionary.join(p18, { [userId_1] = var80 })
								end)
							end
						end
						var8(function(p18)
							-- upvalues: list (copy)
							return list.removeIndex(p18, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var77] = nil
						end
					end
				end
				if var74 and t.messageLimit <= #var76 then
					local var80 = var76[1]
					
					if var80 then
						var10(function(p18)
							-- upvalues: var74 (write), list (copy), dictionary (copy)
							return dictionary.join(p18, { [var74] = list.removeIndex(p18[var74] or {}, 1) })
						end)
						
						if var68 and var68[var80] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var80] = nil
							else
								var2(function(p18)
									-- upvalues: dictionary (copy), var80 (ref)
									return dictionary.removeKey(p18, var80)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var80] = nil
						end
					end
				end
			end
			writeByMessageId(var73.messageId, var73)
			
			if var73.userId then
				local userId_1 = var73.userId
				
				local var81 = function(p18)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var73 (ref), list (copy)
					local p19 = p18 or {}
					local var82 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p19) do
							if v == var73.messageId then
								var82 = true
							end
						end
					else
						for i, v in ipairs(p19) do
							if v.messageId == var73.messageId then
								local var82 = true
								break
							end
						end
					end
					return if var82 then p19 else list.append(p19, if fFlagExpChatMessagesStoreMemoryCleanupModule then var73.messageId else var73)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var81(var6[userId_1])
				else
					var5(function(p20)
						-- upvalues: var81 (ref), userId_1 (ref), dictionary (copy)
						local var83 = var81(p20[userId_1])
						
						return if var83 == nil then dictionary.removeKey(p20, userId_1) else dictionary.join(p20, { [userId_1] = var83 })
					end)
				end
			end
			local var83 = false
			
			if var73.isVisibleInChatWindow then
				var8(function(p20)
					-- upvalues: insertWindowMessageIdInOrder (copy), var73 (ref), var83 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var84 = insertWindowMessageIdInOrder(p20, var73.messageId, var73.isHistorical)
					var83 = var83 or var84[#var84] ~= var73.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var85 = capHistoricalPrefix(var84, var73)
						var83 = var83 or #var85 < #var84
						
						return var85
					end
					return var84
				end)
				
				if var74 then
					var10(function(p20)
						-- upvalues: var74 (write), insertWindowMessageIdInOrder (copy), var73 (ref), var83 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var84 = insertWindowMessageIdInOrder(p20[var74] or {}, var73.messageId, var73.isHistorical)
						var83 = var83 or var84[#var84] ~= var73.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var84 = capHistoricalPrefix(var84, var73)
						end
						return dictionary.join(p20, { [var74] = var84 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var84 = var29(false)
					
					if if var84 ~= nil then var74 == var84 else true then
						local messageId = var73.messageId
						
						if not var33 then
							updateNextMessageComponent(messageId)
						elseif var32 then
							var33 = true
						else
							var31()
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var67)
			
			return
		end
		var67()
	end
	
	local function formatPrefixForUniverseChatTabs(value, p18, p19)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), computeNameColor (copy), playersService (copy)
		return if getFFlagTextChatEnableUniverseChatTabs() and p18 and #value ~= 0 then `<font color="#{(if p110.TextSource then computeNameColor(p110.TextSource.Username) else computeNameColor(if playersService.LocalPlayer then playersService.LocalPlayer.Name else "")):ToHex()}">{value}</font>` else value
	end
	
	local function handleIncomingOrOutgoingMessage(a, b, p18, p19, p20)
		-- upvalues: fFlagEnableInExpChatRewriteModule (copy), getTextAndTranslationModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), isWhiteSpaceOnlyModule (copy), fFlagExpChatFixLocalUserVerifiedBadgeModule (copy), playersService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), var14 (ref), fFlagExpChatPresetChatEnabled (copy), var13 (ref), set (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), expChatSharedModule (copy), var16 (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatDisableUniverseBubbleChat (copy), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatGlobalTabDefaultModule (copy), isGlobalBubbleChatEnabledModule (copy), shouldRenderTextChannelInDefaultWindow (copy), getTextChannelDisplayMode (copy), formatPrefixForUniverseChatTabs (ref), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagExpChatMessageHistoryExperiment (copy), expChatMessageHistoryExperimentation (copy), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), capHistoricalPrefix (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy), expChatPresetChatEmojiEffectExperimentation (copy), logPresetChatEmojiEffectExposureModule (copy)
		local var82, var83
		local _ = nil
		local _ = nil
		
		if fFlagEnableInExpChatRewriteModule then
			local var84, var85 = getTextAndTranslationModule(a)
			var82 = var84
			var83 = var85
		else
			var82 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TextInternal else a.Text
			var83 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TranslationInternal else a.Translation
		end
		if isWhiteSpaceOnlyModule(var82) and a.Status ~= Enum.TextChatMessageStatus.Floodchecked and a.Status ~= Enum.TextChatMessageStatus.MessageTooLong then return end
		local var86 = if a.TextSource then tostring(a.TextSource.UserId) elseif fFlagExpChatFixLocalUserVerifiedBadgeModule and b and playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
		
		if not (if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)) then return end
		local var87
		local _ = nil
		local var88 = var86 == nil or (if var14(false) or fFlagExpChatPresetChatEnabled and (a.PresetId or "") ~= "" then if a.Status ~= Enum.TextChatMessageStatus.Success then a.Status == Enum.TextChatMessageStatus.Sending else true else false)
		var88 = var88 and not (if var86 and var13(false) then set.has(var13(false), var86) else false)
		local var89 = false
		local _ = nil
		
		if fFlagExpChatUseChatConfigStore then
			var87 = getChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false)
		else
			local store = expChatSharedModule.context and expChatSharedModule.context.store
			var87 = if store then store:getState().Messages.isBubbleChatEnabled else var16(false)
		end
		if var87 and var88 and (not fFlagEnableInExpChatSummaryOnLuaModule or var86 ~= nil) and (a.Status == Enum.TextChatMessageStatus.Success or a.Status == Enum.TextChatMessageStatus.Sending) then
			var89 = true
		end
		if fFlagExpChatDisableUniverseBubbleChat and getFFlagTextChatEnableUniverseChatTabs() and p19 == true and (not fFlagExpChatGlobalTabDefaultModule or not isGlobalBubbleChatEnabledModule()) then
			var89 = false
		end
		if a.Status ~= Enum.TextChatMessageStatus.Success and a.Status ~= Enum.TextChatMessageStatus.Sending then
			var88 = false
			var89 = false
		end
		if p20 then
			var89 = false
		end
		if not p19 and p18 == nil and not shouldRenderTextChannelInDefaultWindow(a.TextChannel, getTextChannelDisplayMode()) then
			var88 = false
		end
		local t_1 = {
			shouldOverrideBubbleChatSettings = false,
			userId = var86,
			prefixText = formatPrefixForUniverseChatTabs(if getFFlagExpChatProtectedChatInternalAPIs() then a.PrefixTextInternal else a.PrefixText, p18, a),
			text = var82,
			translation = var83,
			useTranslation = getChatTranslationEnabled() and var83 ~= nil,
			messageId = a.MessageId,
			status = a.Status,
			timestamp = a.Timestamp,
			isVisibleInBubbleChat = var89,
			isVisibleInChatWindow = var88,
			textChannel = a.TextChannel,
			bubbleChatMessageProperties = a.BubbleChatMessageProperties,
			chatWindowMessageProperties = a.ChatWindowMessageProperties,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then a else nil,
			partOrModel = if a.TextSource then a.TextSource.Parent else nil,
			wasRewritten = if fFlagEnableInExpChatRewriteModule then a.WasRewritten else nil,
			originalText = if fFlagEnableInExpChatRewriteModule then a.OriginalText else nil,
			isHistorical = p20,
			channelNameOverride = if getFFlagTextChatEnableUniverseChatTabs() and p18 then p18 else nil,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then a.ChatActionType else nil,
			isUniverseChat = p19,
			presetId = if fFlagExpChatPresetChatEnabled then a.PresetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then a.PresetChatVersion else nil
		}
		local var90 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
		local var91 = var90 and var90[t_1.messageId] ~= nil
		
		if p20 and var91 then return end
		if fFlagExpChatMessageHistoryExperiment and p20 then
			expChatMessageHistoryExperimentation.logExposure(var14(false))
		end
		if t_1.isVisibleInChatWindow or t_1.isVisibleInBubbleChat or var91 then
			local var92 = function()
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
				local var93 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
				
				if isBorderlessBubbleChatEnabledModule() then
					local messageId = var93 and var93[t_1.messageId]
					t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
				end
				if var93 and var93[t_1.messageId] then
					if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
						var8(function(p21)
							-- upvalues: list (copy), t_1 (copy)
							return list.filter(p21, function(p22)
								-- upvalues: t_1 (copy)
								return p22 ~= t_1.messageId
							end)
						end)
						local var94 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
						
						if var94 then
							var10(function(p21)
								-- upvalues: var94 (ref), list (copy), t_1 (copy), dictionary (copy)
								local var95 = p21[var94]
								
								return if var95 then dictionary.join(p21, {
									[var94] = list.filter(var95, function(p22)
										-- upvalues: t_1 (copy)
										return p22 ~= t_1.messageId
									end)
								}) else p21
							end)
						end
						local messageId = t_1.messageId
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var3[messageId] = nil
						else
							var2(function(p21)
								-- upvalues: dictionary (copy), messageId (ref)
								return dictionary.removeKey(p21, messageId)
							end)
						end
						if t_1.userId then
							local userId = t_1.userId
							
							local var95 = function(p21)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
								if p21 then
									local var96 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
										-- upvalues: t_1 (copy)
										return p22 ~= t_1.messageId
									end) else list.filter(p21, function(p22)
										-- upvalues: t_1 (copy)
										return p22.messageId ~= t_1.messageId
									end)
									
									return if #var96 == 0 then nil else var96
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId] = var95(var6[userId])
								
								return
							end
							var5(function(p21)
								-- upvalues: var95 (ref), userId (ref), dictionary (copy)
								local var96 = var95(p21[userId])
								
								return if var96 == nil then dictionary.removeKey(p21, userId) else dictionary.join(p21, { [userId] = var96 })
							end)
						end
						return
					elseif fFlagExpChatRenderHistoricalMessagesModule then
						writeByMessageId(t_1.messageId, keepHistoricalFlag(t_1))
					else
						writeByMessageId(t_1.messageId, t_1)
					end
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
						local userId = t_1.userId
						
						local var96 = function(p21)
							-- upvalues: t_1 (copy), list (copy)
							if not p21 then
								return nil
							end
							local var97 = nil
							
							for i, v in ipairs(p21) do
								if v.messageId == t_1.messageId then break end
							end
							return if var97 then list.set(p21, var97, t_1) else p21
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var96(var6[userId])
							
							return
						end
						var5(function(p22)
							-- upvalues: var96 (ref), userId (ref), dictionary (copy)
							local var98 = var96(p22[userId])
							
							return if var98 == nil then dictionary.removeKey(p22, userId) else dictionary.join(p22, { [userId] = var98 })
						end)
					end
					return
				elseif fFlagExpChatRenderHistoricalMessagesModule then
					local var97 = t_1
					
					if var97.isHistorical == true and (var97.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
				end
				local userId = t_1.userId
				local partOrModel = t_1.partOrModel
				
				if not userId and partOrModel then
					userId = var19(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var18(function(p21)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p21, { [userId] = partOrModel })
						end)
						var20(function(p21)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p21, { [partOrModel] = userId })
						end)
					end
				end
				local var98 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var99 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var98.channelNameOverride then
					var99 = var98.channelNameOverride
				elseif var98.textChannel then
					var99 = if var98.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var98.textChannel.Name
				end
				if var98.isVisibleInChatWindow then
					local var100 = var7(false)
					local var101 = if var99 then var9(false)[var99] or {} else {}
					
					if t.messageLimit <= #var100 then
						local var102 = var100[1]
						local var103 = var93 and var93[var102]
						
						if var103 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var102] = nil
								else
									var2(function(p21)
										-- upvalues: dictionary (copy), var102 (ref)
										return dictionary.removeKey(p21, var102)
									end)
								end
							end
							if var103.userId then
								local userId_1 = var103.userId
								
								local var104 = function(p21)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var102 (ref), var17 (copy), var103 (ref), var20 (copy), dictionary (copy), var18 (copy)
									if not p21 then
										return nil
									end
									local var105 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
										-- upvalues: var102 (copy)
										return p22 ~= var102
									end) else list.filter(p21, function(p22)
										-- upvalues: var102 (copy)
										return p22.messageId ~= var102
									end)
									
									if #var105 ~= 0 then
										return var105
									end
									local var106 = var17(false)
									
									if var106[var103.userId] then
										local userId = var106[var103.userId]
										var20(function(p22)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p22, userId)
										end)
										var18(function(p22)
											-- upvalues: dictionary (copy), var103 (copy)
											return dictionary.removeKey(p22, var103.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var6[userId_1] = var104(var6[userId_1])
								else
									var5(function(p21)
										-- upvalues: var104 (ref), userId_1 (ref), dictionary (copy)
										local var105 = var104(p21[userId_1])
										
										return if var105 == nil then dictionary.removeKey(p21, userId_1) else dictionary.join(p21, { [userId_1] = var105 })
									end)
								end
							end
							var8(function(p21)
								-- upvalues: list (copy)
								return list.removeIndex(p21, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var102] = nil
							end
						end
					end
					if var99 and t.messageLimit <= #var101 then
						local var105 = var101[1]
						
						if var105 then
							var10(function(p21)
								-- upvalues: var99 (write), list (copy), dictionary (copy)
								return dictionary.join(p21, { [var99] = list.removeIndex(p21[var99] or {}, 1) })
							end)
							
							if var93 and var93[var105] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var105] = nil
								else
									var2(function(p21)
										-- upvalues: dictionary (copy), var105 (ref)
										return dictionary.removeKey(p21, var105)
									end)
								end
							end
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var105] = nil
							end
						end
					end
				end
				writeByMessageId(var98.messageId, var98)
				
				if var98.userId then
					local userId_1 = var98.userId
					
					local var106 = function(p21)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var98 (ref), list (copy)
						local p22 = p21 or {}
						local var107 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p22) do
								if v == var98.messageId then
									var107 = true
								end
							end
						else
							for i, v in ipairs(p22) do
								if v.messageId == var98.messageId then
									local var107 = true
									break
								end
							end
						end
						return if var107 then p22 else list.append(p22, if fFlagExpChatMessagesStoreMemoryCleanupModule then var98.messageId else var98)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId_1] = var106(var6[userId_1])
					else
						var5(function(p23)
							-- upvalues: var106 (ref), userId_1 (ref), dictionary (copy)
							local var108 = var106(p23[userId_1])
							
							return if var108 == nil then dictionary.removeKey(p23, userId_1) else dictionary.join(p23, { [userId_1] = var108 })
						end)
					end
				end
				local var108 = false
				
				if var98.isVisibleInChatWindow then
					var8(function(p23)
						-- upvalues: insertWindowMessageIdInOrder (copy), var98 (ref), var108 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
						local var109 = insertWindowMessageIdInOrder(p23, var98.messageId, var98.isHistorical)
						var108 = var108 or var109[#var109] ~= var98.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							local var110 = capHistoricalPrefix(var109, var98)
							var108 = var108 or #var110 < #var109
							
							return var110
						end
						return var109
					end)
					
					if var99 then
						var10(function(p23)
							-- upvalues: var99 (write), insertWindowMessageIdInOrder (copy), var98 (ref), var108 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
							local var109 = insertWindowMessageIdInOrder(p23[var99] or {}, var98.messageId, var98.isHistorical)
							var108 = var108 or var109[#var109] ~= var98.messageId
							
							if fFlagExpChatMessageHistoryExperiment then
								var109 = capHistoricalPrefix(var109, var98)
							end
							return dictionary.join(p23, { [var99] = var109 })
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var109 = var29(false)
						
						if if var109 ~= nil then var99 == var109 else true then
							local messageId = var98.messageId
							
							if not var33 then
								updateNextMessageComponent(messageId)
							elseif var32 then
								var33 = true
							else
								var31()
							end
						end
					end
				end
			end
			
			if fFlagExpChatMessagesStoreBatchModule then
				signalsExperimentalModule.batch(var92)
			else
				var92()
			end
		end
		if expChatPresetChatEmojiEffectExperimentation.isExperimentEnabled then
			logPresetChatEmojiEffectExposureModule(t_1)
		end
	end
	
	local function handleIncomingBubbleChatMessage(a)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy), expChatPresetChatEmojiEffectExperimentation (copy), logPresetChatEmojiEffectExposureModule (copy)
		local t_1 = {
			prefixText = "",
			textChannel = nil,
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			chatWindowMessageProperties = nil,
			userId = a.bubbleChatMessageUserId,
			text = a.message,
			translation = a.translation,
			useTranslation = getChatTranslationEnabled(),
			messageId = a.bubbleChatMessageId,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = a.timestamp,
			partOrModel = a.partOrModel,
			bubbleChatMessageProperties = a.bubbleChatMessageProperties
		}
		
		local var107 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var108 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var108 and var108[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var108 and var108[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p21)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p21, function(p22)
							-- upvalues: t_1 (copy)
							return p22 ~= t_1.messageId
						end)
					end)
					local var109 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var109 then
						var10(function(p21)
							-- upvalues: var109 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var110 = p21[var109]
							
							return if var110 then dictionary.join(p21, {
								[var109] = list.filter(var110, function(p22)
									-- upvalues: t_1 (copy)
									return p22 ~= t_1.messageId
								end)
							}) else p21
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p21)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p21, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var110 = function(p21)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p21 then
								local var111 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
									-- upvalues: t_1 (copy)
									return p22 ~= t_1.messageId
								end) else list.filter(p21, function(p22)
									-- upvalues: t_1 (copy)
									return p22.messageId ~= t_1.messageId
								end)
								
								return if #var111 == 0 then nil else var111
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var110(var6[userId])
							
							return
						end
						var5(function(p21)
							-- upvalues: var110 (ref), userId (ref), dictionary (copy)
							local var111 = var110(p21[userId])
							
							return if var111 == nil then dictionary.removeKey(p21, userId) else dictionary.join(p21, { [userId] = var111 })
						end)
					end
					return
				elseif fFlagExpChatRenderHistoricalMessagesModule then
					writeByMessageId(t_1.messageId, keepHistoricalFlag(t_1))
				else
					writeByMessageId(t_1.messageId, t_1)
				end
				if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
					local userId = t_1.userId
					
					local var111 = function(p21)
						-- upvalues: t_1 (copy), list (copy)
						if not p21 then
							return nil
						end
						local var112 = nil
						
						for i, v in ipairs(p21) do
							if v.messageId == t_1.messageId then break end
						end
						return if var112 then list.set(p21, var112, t_1) else p21
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var111(var6[userId])
						
						return
					end
					var5(function(p22)
						-- upvalues: var111 (ref), userId (ref), dictionary (copy)
						local var113 = var111(p22[userId])
						
						return if var113 == nil then dictionary.removeKey(p22, userId) else dictionary.join(p22, { [userId] = var113 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var112 = t_1
				
				if var112.isHistorical == true and (var112.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
			end
			local userId = t_1.userId
			local partOrModel = t_1.partOrModel
			
			if not userId and partOrModel then
				userId = var19(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var18(function(p21)
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p21, { [userId] = partOrModel })
					end)
					var20(function(p21)
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p21, { [partOrModel] = userId })
					end)
				end
			end
			local var113 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var114 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var113.channelNameOverride then
				var114 = var113.channelNameOverride
			elseif var113.textChannel then
				var114 = if var113.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var113.textChannel.Name
			end
			if var113.isVisibleInChatWindow then
				local var115 = var7(false)
				local var116 = if var114 then var9(false)[var114] or {} else {}
				
				if t.messageLimit <= #var115 then
					local var117 = var115[1]
					local var118 = var108 and var108[var117]
					
					if var118 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var117] = nil
							else
								var2(function(p21)
									-- upvalues: dictionary (copy), var117 (ref)
									return dictionary.removeKey(p21, var117)
								end)
							end
						end
						if var118.userId then
							local userId_1 = var118.userId
							
							local var119 = function(p21)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var117 (ref), var17 (copy), var118 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p21 then
									return nil
								end
								local var120 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
									-- upvalues: var117 (copy)
									return p22 ~= var117
								end) else list.filter(p21, function(p22)
									-- upvalues: var117 (copy)
									return p22.messageId ~= var117
								end)
								
								if #var120 ~= 0 then
									return var120
								end
								local var121 = var17(false)
								
								if var121[var118.userId] then
									local userId = var121[var118.userId]
									var20(function(p22)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p22, userId)
									end)
									var18(function(p22)
										-- upvalues: dictionary (copy), var118 (copy)
										return dictionary.removeKey(p22, var118.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var119(var6[userId_1])
							else
								var5(function(p21)
									-- upvalues: var119 (ref), userId_1 (ref), dictionary (copy)
									local var120 = var119(p21[userId_1])
									
									return if var120 == nil then dictionary.removeKey(p21, userId_1) else dictionary.join(p21, { [userId_1] = var120 })
								end)
							end
						end
						var8(function(p21)
							-- upvalues: list (copy)
							return list.removeIndex(p21, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var117] = nil
						end
					end
				end
				if var114 and t.messageLimit <= #var116 then
					local var120 = var116[1]
					
					if var120 then
						var10(function(p21)
							-- upvalues: var114 (write), list (copy), dictionary (copy)
							return dictionary.join(p21, { [var114] = list.removeIndex(p21[var114] or {}, 1) })
						end)
						
						if var108 and var108[var120] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var120] = nil
							else
								var2(function(p21)
									-- upvalues: dictionary (copy), var120 (ref)
									return dictionary.removeKey(p21, var120)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var120] = nil
						end
					end
				end
			end
			writeByMessageId(var113.messageId, var113)
			
			if var113.userId then
				local userId_1 = var113.userId
				
				local var121 = function(p21)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var113 (ref), list (copy)
					local p22 = p21 or {}
					local var122 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p22) do
							if v == var113.messageId then
								var122 = true
							end
						end
					else
						for i, v in ipairs(p22) do
							if v.messageId == var113.messageId then
								local var122 = true
								break
							end
						end
					end
					return if var122 then p22 else list.append(p22, if fFlagExpChatMessagesStoreMemoryCleanupModule then var113.messageId else var113)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var121(var6[userId_1])
				else
					var5(function(p23)
						-- upvalues: var121 (ref), userId_1 (ref), dictionary (copy)
						local var123 = var121(p23[userId_1])
						
						return if var123 == nil then dictionary.removeKey(p23, userId_1) else dictionary.join(p23, { [userId_1] = var123 })
					end)
				end
			end
			local var123 = false
			
			if var113.isVisibleInChatWindow then
				var8(function(p23)
					-- upvalues: insertWindowMessageIdInOrder (copy), var113 (ref), var123 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var124 = insertWindowMessageIdInOrder(p23, var113.messageId, var113.isHistorical)
					var123 = var123 or var124[#var124] ~= var113.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var125 = capHistoricalPrefix(var124, var113)
						var123 = var123 or #var125 < #var124
						
						return var125
					end
					return var124
				end)
				
				if var114 then
					var10(function(p23)
						-- upvalues: var114 (write), insertWindowMessageIdInOrder (copy), var113 (ref), var123 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var124 = insertWindowMessageIdInOrder(p23[var114] or {}, var113.messageId, var113.isHistorical)
						var123 = var123 or var124[#var124] ~= var113.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var124 = capHistoricalPrefix(var124, var113)
						end
						return dictionary.join(p23, { [var114] = var124 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var124 = var29(false)
					
					if if var124 ~= nil then var114 == var124 else true then
						local messageId = var113.messageId
						
						if not var33 then
							updateNextMessageComponent(messageId)
						elseif var32 then
							var33 = true
						else
							var31()
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var107)
		else
			var107()
		end
		if expChatPresetChatEmojiEffectExperimentation.isExperimentEnabled then
			logPresetChatEmojiEffectExposureModule(t_1)
		end
	end
	
	local function handleHiddenMessageReceived(p21)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), fIntExpChatRandomCharChangeLowerBoundModule (copy), fIntExpChatRandomCharChangeUpperBoundModule (copy), configModule (copy), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var122 = string.len(if getFFlagExpChatProtectedChatInternalAPIs() then p21.TextInternal else p21.Text)
		local t_1 = {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = configModule.LOCK_EMOJI .. " :",
			text = string.rep(configModule.DOT_TEXT, var122 + math.random(math.max(fIntExpChatRandomCharChangeLowerBoundModule, -(var122 - 1)), fIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = p21.TextChannel,
			messageId = p21.MessageId,
			status = p21.Status,
			timestamp = p21.Timestamp,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p21 else nil
		}
		
		local var123 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var124 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var124 and var124[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var124 and var124[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p22)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p22, function(p23)
							-- upvalues: t_1 (copy)
							return p23 ~= t_1.messageId
						end)
					end)
					local var125 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var125 then
						var10(function(p22)
							-- upvalues: var125 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var126 = p22[var125]
							
							return if var126 then dictionary.join(p22, {
								[var125] = list.filter(var126, function(p23)
									-- upvalues: t_1 (copy)
									return p23 ~= t_1.messageId
								end)
							}) else p22
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p22)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p22, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var126 = function(p22)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p22 then
								local var127 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p22, function(p23)
									-- upvalues: t_1 (copy)
									return p23 ~= t_1.messageId
								end) else list.filter(p22, function(p23)
									-- upvalues: t_1 (copy)
									return p23.messageId ~= t_1.messageId
								end)
								
								return if #var127 == 0 then nil else var127
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var126(var6[userId])
							
							return
						end
						var5(function(p22)
							-- upvalues: var126 (ref), userId (ref), dictionary (copy)
							local var127 = var126(p22[userId])
							
							return if var127 == nil then dictionary.removeKey(p22, userId) else dictionary.join(p22, { [userId] = var127 })
						end)
					end
					return
				elseif fFlagExpChatRenderHistoricalMessagesModule then
					writeByMessageId(t_1.messageId, keepHistoricalFlag(t_1))
				else
					writeByMessageId(t_1.messageId, t_1)
				end
				if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
					local userId = t_1.userId
					
					local var127 = function(p22)
						-- upvalues: t_1 (copy), list (copy)
						if not p22 then
							return nil
						end
						local var128 = nil
						
						for i, v in ipairs(p22) do
							if v.messageId == t_1.messageId then break end
						end
						return if var128 then list.set(p22, var128, t_1) else p22
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var127(var6[userId])
						
						return
					end
					var5(function(p23)
						-- upvalues: var127 (ref), userId (ref), dictionary (copy)
						local var129 = var127(p23[userId])
						
						return if var129 == nil then dictionary.removeKey(p23, userId) else dictionary.join(p23, { [userId] = var129 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var128 = t_1
				
				if var128.isHistorical == true and (var128.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
			end
			local userId = t_1.userId
			local partOrModel = t_1.partOrModel
			
			if not userId and partOrModel then
				userId = var19(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var18(function(p22)
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p22, { [userId] = partOrModel })
					end)
					var20(function(p22)
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p22, { [partOrModel] = userId })
					end)
				end
			end
			local var129 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var130 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var129.channelNameOverride then
				var130 = var129.channelNameOverride
			elseif var129.textChannel then
				var130 = if var129.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var129.textChannel.Name
			end
			if var129.isVisibleInChatWindow then
				local var131 = var7(false)
				local var132 = if var130 then var9(false)[var130] or {} else {}
				
				if t.messageLimit <= #var131 then
					local var133 = var131[1]
					local var134 = var124 and var124[var133]
					
					if var134 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var133] = nil
							else
								var2(function(p22)
									-- upvalues: dictionary (copy), var133 (ref)
									return dictionary.removeKey(p22, var133)
								end)
							end
						end
						if var134.userId then
							local userId_1 = var134.userId
							
							local var135 = function(p22)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var133 (ref), var17 (copy), var134 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p22 then
									return nil
								end
								local var136 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p22, function(p23)
									-- upvalues: var133 (copy)
									return p23 ~= var133
								end) else list.filter(p22, function(p23)
									-- upvalues: var133 (copy)
									return p23.messageId ~= var133
								end)
								
								if #var136 ~= 0 then
									return var136
								end
								local var137 = var17(false)
								
								if var137[var134.userId] then
									local userId = var137[var134.userId]
									var20(function(p23)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p23, userId)
									end)
									var18(function(p23)
										-- upvalues: dictionary (copy), var134 (copy)
										return dictionary.removeKey(p23, var134.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var135(var6[userId_1])
							else
								var5(function(p22)
									-- upvalues: var135 (ref), userId_1 (ref), dictionary (copy)
									local var136 = var135(p22[userId_1])
									
									return if var136 == nil then dictionary.removeKey(p22, userId_1) else dictionary.join(p22, { [userId_1] = var136 })
								end)
							end
						end
						var8(function(p22)
							-- upvalues: list (copy)
							return list.removeIndex(p22, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var133] = nil
						end
					end
				end
				if var130 and t.messageLimit <= #var132 then
					local var136 = var132[1]
					
					if var136 then
						var10(function(p22)
							-- upvalues: var130 (write), list (copy), dictionary (copy)
							return dictionary.join(p22, { [var130] = list.removeIndex(p22[var130] or {}, 1) })
						end)
						
						if var124 and var124[var136] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var136] = nil
							else
								var2(function(p22)
									-- upvalues: dictionary (copy), var136 (ref)
									return dictionary.removeKey(p22, var136)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var136] = nil
						end
					end
				end
			end
			writeByMessageId(var129.messageId, var129)
			
			if var129.userId then
				local userId_1 = var129.userId
				
				local var137 = function(p22)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var129 (ref), list (copy)
					local p23 = p22 or {}
					local var138 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p23) do
							if v == var129.messageId then
								var138 = true
							end
						end
					else
						for i, v in ipairs(p23) do
							if v.messageId == var129.messageId then
								local var138 = true
								break
							end
						end
					end
					return if var138 then p23 else list.append(p23, if fFlagExpChatMessagesStoreMemoryCleanupModule then var129.messageId else var129)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var137(var6[userId_1])
				else
					var5(function(p24)
						-- upvalues: var137 (ref), userId_1 (ref), dictionary (copy)
						local var139 = var137(p24[userId_1])
						
						return if var139 == nil then dictionary.removeKey(p24, userId_1) else dictionary.join(p24, { [userId_1] = var139 })
					end)
				end
			end
			local var139 = false
			
			if var129.isVisibleInChatWindow then
				var8(function(p24)
					-- upvalues: insertWindowMessageIdInOrder (copy), var129 (ref), var139 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var140 = insertWindowMessageIdInOrder(p24, var129.messageId, var129.isHistorical)
					var139 = var139 or var140[#var140] ~= var129.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var141 = capHistoricalPrefix(var140, var129)
						var139 = var139 or #var141 < #var140
						
						return var141
					end
					return var140
				end)
				
				if var130 then
					var10(function(p24)
						-- upvalues: var130 (write), insertWindowMessageIdInOrder (copy), var129 (ref), var139 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var140 = insertWindowMessageIdInOrder(p24[var130] or {}, var129.messageId, var129.isHistorical)
						var139 = var139 or var140[#var140] ~= var129.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var140 = capHistoricalPrefix(var140, var129)
						end
						return dictionary.join(p24, { [var130] = var140 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var140 = var29(false)
					
					if if var140 ~= nil then var130 == var140 else true then
						local messageId = var129.messageId
						
						if not var33 then
							updateNextMessageComponent(messageId)
						elseif var32 then
							var33 = true
						else
							var31()
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var123)
			
			return
		end
		var123()
	end
	
	local function handlePlayerRemoved(p22)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var5 (ref), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (ref), var12 (ref), set (copy), var4 (ref), var17 (ref), var20 (ref), var18 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var138 = tostring(p22)
		
		local function doHandlePlayerRemoved()
			-- upvalues: var138 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var5 (copy), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (copy), var12 (copy), set (copy), var4 (copy), var17 (copy), var20 (copy), var18 (copy)
			if fFlagExpChatMessagesStoreUseProxyModule then
				var6[var138] = nil
			else
				var5(function(p23)
					-- upvalues: dictionary (copy), var138 (ref)
					return dictionary.removeKey(p23, var138)
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var138] = nil
			end
			var12(function(p23)
				-- upvalues: set (copy), var138 (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var17 (copy), var20 (copy), dictionary (copy), var18 (copy)
				if not p23 then
					return {}
				elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4(false))[var138] or {}) == 0 and not set.has(p23, var138) then
					return p23
				end
				local var139 = var17(false)
				
				if var139[var138] then
					local var140 = var139[var138]
					var20(function(p24)
						-- upvalues: dictionary (copy), var140 (ref)
						return dictionary.removeKey(p24, var140)
					end)
					var18(function(p24)
						-- upvalues: dictionary (copy), var138 (copy)
						return dictionary.removeKey(p24, var138)
					end)
				end
				return set.subtract(p23, var138)
			end)
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doHandlePlayerRemoved)
			
			return
		elseif fFlagExpChatMessagesStoreUseProxyModule then
			var6[var138] = nil
		else
			var5(function(p23)
				-- upvalues: dictionary (copy), var138 (ref)
				return dictionary.removeKey(p23, var138)
			end)
		end
		if fFlagExpChatMessagesStoreMemoryCleanupModule then
			t_4[var138] = nil
		end
		var12(function(p23)
			-- upvalues: set (copy), var138 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var17 (copy), var20 (copy), dictionary (copy), var18 (copy)
			if not p23 then
				return {}
			elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4(false))[var138] or {}) == 0 and not set.has(p23, var138) then
				return p23
			end
			local var139 = var17(false)
			
			if var139[var138] then
				local var140 = var139[var138]
				var20(function(p24)
					-- upvalues: dictionary (copy), var140 (ref)
					return dictionary.removeKey(p24, var140)
				end)
				var18(function(p24)
					-- upvalues: dictionary (copy), var138 (copy)
					return dictionary.removeKey(p24, var138)
				end)
			end
			return set.subtract(p23, var138)
		end)
	end
	
	local function muteUser(p22)
		-- upvalues: var12 (ref), set (copy)
		var12(function(p23)
			-- upvalues: set (copy), p22 (ref)
			return if p23 then set.add(p23, p22) else {}
		end)
	end
	
	local function unmuteUser(p22)
		-- upvalues: var12 (ref), set (copy)
		var12(function(p23)
			-- upvalues: set (copy), p22 (ref)
			return if p23 then set.subtract(p23, p22) else {}
		end)
	end
	
	local function clearWindowMessages()
		-- upvalues: forEachByMessageId (ref), dictionary (copy), var8 (ref), var10 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var26 (ref), var27 (write), var28 (write), var23 (ref), t_1 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local function doClearWindowMessages()
			-- upvalues: forEachByMessageId (copy), dictionary (copy), var8 (copy), var10 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var26 (copy), var27 (copy), var28 (copy), var23 (copy), t_1 (copy)
			forEachByMessageId(function(_, p22)
				-- upvalues: dictionary (copy)
				return dictionary.join(p22, { isVisibleInChatWindow = false })
			end)
			var8(function(_)
				return {}
			end)
			var10(function(_)
				return {}
			end)
			
			if fFlagExpChatEnableV2ChatWindowModule then
				var26(1)
				var27 = 0
				var28 = 0
				
				for i, v in ipairs(var23(false)) do
					local var138 = t_1[v]
					
					if var138 then
						var138.setter(nil)
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doClearWindowMessages)
			
			return
		end
		doClearWindowMessages()
	end
	
	local function handleHiddenMessagesCleared()
		-- upvalues: fFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy), forEachByMessageId (ref), dictionary (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), var8 (ref), list (copy), var10 (ref)
		if fFlagExpChatClearHiddenMessagesPostAgeCheckModule then
			forEachByMessageId(function(_, p22)
				-- upvalues: dictionary (copy)
				return if p22 and p22.isHiddenMessage then dictionary.join(p22, { isVisibleInChatWindow = false }) else nil
			end)
			
			local function isNotHidden(p22)
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy)
				local var138 = (if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false))[p22]
				
				return var138 and not var138.isHiddenMessage
			end
			
			var8(function(p22)
				-- upvalues: list (copy), isNotHidden (ref)
				return list.filter(p22, isNotHidden)
			end)
			var10(function(p22)
				-- upvalues: dictionary (copy), list (copy), isNotHidden (ref)
				return dictionary.map(p22, function(p23)
					-- upvalues: list (copy), isNotHidden (copy)
					return list.filter(p23, isNotHidden)
				end)
			end)
			
			return
		end
	end
	
	local function rebuildMessageWithTranslation(p22, p23)
		-- upvalues: isBorderlessBubbleChatEnabledModule (copy), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPresetChatEnabled (copy), fFlagExpChatRenderHistoricalMessagesModule (copy)
		return {
			prefixText = p22.prefixText,
			text = p22.text,
			translation = p22.translation,
			useTranslation = p23,
			messageId = p22.messageId,
			status = p22.status,
			timestamp = p22.timestamp,
			bubbleChatReceivedAtMillis = if isBorderlessBubbleChatEnabledModule() then p22.bubbleChatReceivedAtMillis else nil,
			isVisibleInBubbleChat = p22.isVisibleInBubbleChat,
			isVisibleInChatWindow = p22.isVisibleInChatWindow,
			partOrModel = p22.partOrModel,
			shouldOverrideBubbleChatSettings = p22.shouldOverrideBubbleChatSettings,
			bubbleChatMessageProperties = p22.bubbleChatMessageProperties,
			chatWindowMessageProperties = p22.chatWindowMessageProperties,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p22.textChatMessageInstance else nil,
			userId = p22.userId,
			textChannel = p22.textChannel,
			wasRewritten = if fFlagEnableInExpChatRewriteModule then p22.wasRewritten else nil,
			originalText = if fFlagEnableInExpChatRewriteModule then p22.originalText else nil,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p22.chatActionType else nil,
			presetId = if fFlagExpChatPresetChatEnabled then p22.presetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then p22.presetChatVersion else nil,
			isHistorical = if fFlagExpChatRenderHistoricalMessagesModule then p22.isHistorical else nil
		}
	end
	
	local function toggleGlobalTranslation(p22)
		-- upvalues: forEachByMessageId (ref), rebuildMessageWithTranslation (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local function doToggleGlobalTranslation()
			-- upvalues: forEachByMessageId (copy), rebuildMessageWithTranslation (copy), p22 (ref)
			forEachByMessageId(function(_, p23)
				-- upvalues: rebuildMessageWithTranslation (copy), p22 (copy)
				return rebuildMessageWithTranslation(p23, p22)
			end)
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doToggleGlobalTranslation)
			
			return
		end
		forEachByMessageId(function(_, p23)
			-- upvalues: rebuildMessageWithTranslation (copy), p22 (ref)
			return rebuildMessageWithTranslation(p23, p22)
		end)
	end
	
	local function toggleMessageTranslation(p22, p23)
		-- upvalues: rebuildMessageWithTranslation (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var2 (ref), dictionary (copy)
		local var138 = function(p24)
			-- upvalues: rebuildMessageWithTranslation (copy), p22 (ref)
			return rebuildMessageWithTranslation(p24, p22)
		end
		
		if fFlagExpChatMessagesStoreUseProxyModule then
			local var139 = var3[p23]
			
			if var139 then
				local var140 = rebuildMessageWithTranslation(var139, p22)
				
				if var140 then
					var3[p23] = var140
					
					return
				end
			end
		else
			var2(function(p24)
				-- upvalues: p23 (ref), var138 (ref), dictionary (copy)
				if p24 and p24[p23] then
					local var141 = var138(p24[p23])
					
					return if var141 then dictionary.join(p24, { [p23] = var141 }) else p24
				end
				return p24 or {}
			end)
		end
	end
	
	local function handleLegacyBubbleCreated(p22)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local timestamp = p22.timestamp
		local t_1 = {
			prefixText = "",
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			translation = nil,
			useTranslation = false,
			textChannel = nil,
			bubbleChatMessageProperties = nil,
			chatWindowMessageProperties = nil,
			userId = p22.userId,
			text = p22.text,
			messageId = p22.id,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = if timestamp then DateTime.fromUnixTimestampMillis(timestamp) else DateTime.now(),
			partOrModel = p22.adornee
		}
		
		local var138 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var139 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var139 and var139[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var139 and var139[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p23)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p23, function(p24)
							-- upvalues: t_1 (copy)
							return p24 ~= t_1.messageId
						end)
					end)
					local var140 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var140 then
						var10(function(p23)
							-- upvalues: var140 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var141 = p23[var140]
							
							return if var141 then dictionary.join(p23, {
								[var140] = list.filter(var141, function(p24)
									-- upvalues: t_1 (copy)
									return p24 ~= t_1.messageId
								end)
							}) else p23
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p23)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p23, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var141 = function(p23)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p23 then
								local var142 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p23, function(p24)
									-- upvalues: t_1 (copy)
									return p24 ~= t_1.messageId
								end) else list.filter(p23, function(p24)
									-- upvalues: t_1 (copy)
									return p24.messageId ~= t_1.messageId
								end)
								
								return if #var142 == 0 then nil else var142
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var141(var6[userId])
							
							return
						end
						var5(function(p23)
							-- upvalues: var141 (ref), userId (ref), dictionary (copy)
							local var142 = var141(p23[userId])
							
							return if var142 == nil then dictionary.removeKey(p23, userId) else dictionary.join(p23, { [userId] = var142 })
						end)
					end
					return
				elseif fFlagExpChatRenderHistoricalMessagesModule then
					writeByMessageId(t_1.messageId, keepHistoricalFlag(t_1))
				else
					writeByMessageId(t_1.messageId, t_1)
				end
				if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
					local userId = t_1.userId
					
					local var142 = function(p23)
						-- upvalues: t_1 (copy), list (copy)
						if not p23 then
							return nil
						end
						local var143 = nil
						
						for i, v in ipairs(p23) do
							if v.messageId == t_1.messageId then break end
						end
						return if var143 then list.set(p23, var143, t_1) else p23
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var142(var6[userId])
						
						return
					end
					var5(function(p24)
						-- upvalues: var142 (ref), userId (ref), dictionary (copy)
						local var144 = var142(p24[userId])
						
						return if var144 == nil then dictionary.removeKey(p24, userId) else dictionary.join(p24, { [userId] = var144 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var143 = t_1
				
				if var143.isHistorical == true and (var143.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
			end
			local userId = t_1.userId
			local partOrModel = t_1.partOrModel
			
			if not userId and partOrModel then
				userId = var19(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var18(function(p23)
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p23, { [userId] = partOrModel })
					end)
					var20(function(p23)
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p23, { [partOrModel] = userId })
					end)
				end
			end
			local var144 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var145 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var144.channelNameOverride then
				var145 = var144.channelNameOverride
			elseif var144.textChannel then
				var145 = if var144.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var144.textChannel.Name
			end
			if var144.isVisibleInChatWindow then
				local var146 = var7(false)
				local var147 = if var145 then var9(false)[var145] or {} else {}
				
				if t.messageLimit <= #var146 then
					local var148 = var146[1]
					local var149 = var139 and var139[var148]
					
					if var149 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var148] = nil
							else
								var2(function(p23)
									-- upvalues: dictionary (copy), var148 (ref)
									return dictionary.removeKey(p23, var148)
								end)
							end
						end
						if var149.userId then
							local userId_1 = var149.userId
							
							local var150 = function(p23)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var148 (ref), var17 (copy), var149 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p23 then
									return nil
								end
								local var151 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p23, function(p24)
									-- upvalues: var148 (copy)
									return p24 ~= var148
								end) else list.filter(p23, function(p24)
									-- upvalues: var148 (copy)
									return p24.messageId ~= var148
								end)
								
								if #var151 ~= 0 then
									return var151
								end
								local var152 = var17(false)
								
								if var152[var149.userId] then
									local userId = var152[var149.userId]
									var20(function(p24)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p24, userId)
									end)
									var18(function(p24)
										-- upvalues: dictionary (copy), var149 (copy)
										return dictionary.removeKey(p24, var149.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var150(var6[userId_1])
							else
								var5(function(p23)
									-- upvalues: var150 (ref), userId_1 (ref), dictionary (copy)
									local var151 = var150(p23[userId_1])
									
									return if var151 == nil then dictionary.removeKey(p23, userId_1) else dictionary.join(p23, { [userId_1] = var151 })
								end)
							end
						end
						var8(function(p23)
							-- upvalues: list (copy)
							return list.removeIndex(p23, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var148] = nil
						end
					end
				end
				if var145 and t.messageLimit <= #var147 then
					local var151 = var147[1]
					
					if var151 then
						var10(function(p23)
							-- upvalues: var145 (write), list (copy), dictionary (copy)
							return dictionary.join(p23, { [var145] = list.removeIndex(p23[var145] or {}, 1) })
						end)
						
						if var139 and var139[var151] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var151] = nil
							else
								var2(function(p23)
									-- upvalues: dictionary (copy), var151 (ref)
									return dictionary.removeKey(p23, var151)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var151] = nil
						end
					end
				end
			end
			writeByMessageId(var144.messageId, var144)
			
			if var144.userId then
				local userId_1 = var144.userId
				
				local var152 = function(p23)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var144 (ref), list (copy)
					local p24 = p23 or {}
					local var153 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p24) do
							if v == var144.messageId then
								var153 = true
							end
						end
					else
						for i, v in ipairs(p24) do
							if v.messageId == var144.messageId then
								local var153 = true
								break
							end
						end
					end
					return if var153 then p24 else list.append(p24, if fFlagExpChatMessagesStoreMemoryCleanupModule then var144.messageId else var144)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var152(var6[userId_1])
				else
					var5(function(p25)
						-- upvalues: var152 (ref), userId_1 (ref), dictionary (copy)
						local var154 = var152(p25[userId_1])
						
						return if var154 == nil then dictionary.removeKey(p25, userId_1) else dictionary.join(p25, { [userId_1] = var154 })
					end)
				end
			end
			local var154 = false
			
			if var144.isVisibleInChatWindow then
				var8(function(p25)
					-- upvalues: insertWindowMessageIdInOrder (copy), var144 (ref), var154 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var155 = insertWindowMessageIdInOrder(p25, var144.messageId, var144.isHistorical)
					var154 = var154 or var155[#var155] ~= var144.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var156 = capHistoricalPrefix(var155, var144)
						var154 = var154 or #var156 < #var155
						
						return var156
					end
					return var155
				end)
				
				if var145 then
					var10(function(p25)
						-- upvalues: var145 (write), insertWindowMessageIdInOrder (copy), var144 (ref), var154 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var155 = insertWindowMessageIdInOrder(p25[var145] or {}, var144.messageId, var144.isHistorical)
						var154 = var154 or var155[#var155] ~= var144.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var155 = capHistoricalPrefix(var155, var144)
						end
						return dictionary.join(p25, { [var145] = var155 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var155 = var29(false)
					
					if if var155 ~= nil then var145 == var155 else true then
						local messageId = var144.messageId
						
						if not var33 then
							updateNextMessageComponent(messageId)
						elseif var32 then
							var33 = true
						else
							var31()
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var138)
			
			return
		end
		var138()
	end
	
	updateNextMessageComponent = function(p23)
		-- upvalues: var23 (ref), var25 (ref), var26 (ref), t_1 (ref), fFlagEnableInExpChatRewriteModule (copy), t_2 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), var28 (write), var27 (write)
		local var153 = var23(false)
		
		if #var153 == 0 then return end
		local var154 = var25(false)
		local var155 = var153[var154]
		
		if not var155 then
			var26(1)
			
			return
		end
		local var156 = t_1[var155]
		
		if var156 then
			var156.setter(p23)
		end
		local var157 = if fFlagEnableInExpChatRewriteModule then 10 else 1
		local var158 = t_2[var155]
		
		if fFlagExpChatRenderHistoricalMessagesModule then
			local var159 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			local var160 = var159 and var159[p23]
			
			if var160 ~= nil and var160.isHistorical == true then
				var28 += var157
				
				if var158 then
					var158.setter(var28 + -1000000)
				end
			else
				var27 += var157
				
				if var158 then
					var158.setter(var27)
				end
			end
			var26(var154 % #var153 + 1)
		end
	end
	
	return {
		getByMessageId = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1,
		getMessages = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else createComputed(function(p23)
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
			local var153 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p23) else var1(p23)
			
			if not var153 then
				return {}
			end
			local t = {}
			
			for i, v in var153 do
				table.insert(t, v)
			end
			return t
		end),
		getMessagesBySenderId = if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4,
		getWindowMessagesInOrder = var7,
		getWindowMessagesInOrderByTabId = var9,
		getHistoricalWindowMessageCount = var36,
		getMutedUserIds = var13,
		getCanLocalUserChat = var14,
		getIsBubbleChatEnabled = var16,
		getMockUserIdToPartOrModel = var17,
		getPartOrModelToMockUserId = var19,
		getMessage = getMessage,
		getUserMessages = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserMessages,
		getUserBubbleMessages = getUserBubbleMessages,
		getUserLastMessage = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserLastMessage,
		registerMessageComponent = function(p24)
			-- upvalues: t_1 (ref), createSignal (copy), t_2 (ref), var24 (ref), list (copy)
			if not t_1[p24] then
				local var154, var155 = createSignal(nil)
				t_1[p24] = { getter = var154, setter = var155 }
				local var156, var157 = createSignal(0)
				t_2[p24] = { getter = var156, setter = var157 }
				var24(function(p25)
					-- upvalues: list (copy), p24 (ref)
					return list.append(p25, p24)
				end)
			end
			return t_1[p24].getter
		end,
		unregisterMessageComponent = function(p24)
			-- upvalues: var23 (ref), t_1 (ref), t_2 (ref), var24 (ref), list (copy), var25 (ref), var26 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
			local var154 = nil
			
			for i, v in ipairs(var23(false)) do
				if v == p24 then
					var154 = i
					break
				end
			end
			if t_1[p24] then
				t_1[p24] = nil
			end
			if t_2[p24] then
				t_2[p24] = nil
			end
			if var154 then
				local function doUnregister()
					-- upvalues: var24 (copy), list (copy), p24 (ref), var23 (copy), var25 (copy), var26 (copy), var154 (write)
					var24(function(p25)
						-- upvalues: list (copy), p24 (copy)
						return list.filter(p25, function(p26)
							-- upvalues: p24 (copy)
							return p26 ~= p24
						end)
					end)
					local var155 = var23(false)
					local var156 = var25(false)
					
					if #var155 == 0 then
						var26(1)
						
						return
					elseif var154 < var156 then
						var26(var156 - 1)
						
						return
					elseif #var155 < var156 then
						var26(1)
					end
				end
				
				if fFlagExpChatMessagesStoreBatchModule then
					signalsExperimentalModule.batch(doUnregister)
				else
					doUnregister()
				end
			end
		end,
		repopulateMessageComponents = function()
			-- upvalues: var29 (ref), var9 (ref), var7 (ref), var26 (ref), var27 (write), var28 (write), updateNextMessageComponent (write), var23 (ref), var25 (ref), t_1 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
			local function doRepopulate()
				-- upvalues: var29 (copy), var9 (copy), var7 (copy), var26 (copy), var27 (copy), var28 (copy), updateNextMessageComponent (copy), var23 (copy), var25 (copy), t_1 (copy)
				local var155 = var29(false)
				local _ = nil
				local var156 = if var155 then var9(false)[var155] or {} else var7(false)
				var26(1)
				var27 = 0
				var28 = 0
				
				for i, v in ipairs(var156) do
					updateNextMessageComponent(v)
				end
				local var157 = var23(false)
				
				if #var156 < #var157 then
					for i_1 = var25(false), #var157 do
						local var158 = t_1[var157[i_1]]
						
						if var158 then
							var158.setter(nil)
						end
					end
				end
			end
			
			if fFlagExpChatMessagesStoreBatchModule then
				signalsExperimentalModule.batch(doRepopulate)
				
				return
			end
			doRepopulate()
		end,
		getMessageComponentSignal = function(value)
			-- upvalues: t_1 (ref)
			local var159 = t_1[value]
			
			return if var159 then var159.getter else nil
		end,
		getLayoutOrderSignal = function(value)
			-- upvalues: t_2 (ref)
			local var159 = t_2[value]
			
			return if var159 then var159.getter else nil
		end,
		updateNextMessageComponent = updateNextMessageComponent,
		getMessageComponentRingBuffer = var23,
		getNextMessageComponentPointer = var25,
		setActiveChannelFilter = var30,
		getActiveChannelFilter = var29,
		setCanLocalUserChat = var15,
		muteUser = muteUser,
		unmuteUser = unmuteUser,
		handlePlayerRemoved = handlePlayerRemoved,
		clearWindowMessages = clearWindowMessages,
		toggleGlobalTranslation = toggleGlobalTranslation,
		toggleMessageTranslation = toggleMessageTranslation,
		handleIncomingOrOutgoingMessage = handleIncomingOrOutgoingMessage,
		batchWrites = batchWrites,
		handleIncomingBubbleChatMessage = handleIncomingBubbleChatMessage,
		handleLegacyBubbleCreated = handleLegacyBubbleCreated,
		handleLegacyBubbleTextUpdated = function(p25, p26)
			-- upvalues: dictionary (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var2 (ref)
			local var159 = function(p27)
				-- upvalues: dictionary (copy), p26 (ref)
				return dictionary.join(p27, { text = p26 })
			end
			
			if fFlagExpChatMessagesStoreUseProxyModule then
				local var160 = var3[p25]
				
				if var160 then
					local var161 = dictionary.join(var160, { text = p26 })
					
					if var161 then
						var3[p25] = var161
						
						return
					end
				end
			else
				var2(function(p27)
					-- upvalues: p25 (ref), var159 (ref), dictionary (copy)
					if p27 and p27[p25] then
						local var162 = var159(p27[p25])
						
						return if var162 then dictionary.join(p27, { [p25] = var162 }) else p27
					end
					return p27 or {}
				end)
			end
		end,
		handleHiddenMessageReceived = handleHiddenMessageReceived,
		handleHiddenMessagesCleared = handleHiddenMessagesCleared,
		addSystemMessage = addSystemMessage,
		getChannelTabsConfigurationEnabled = var21,
		setChannelTabsConfigurationEnabled = var22
	}
end