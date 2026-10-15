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
		-- upvalues: var7 (ref), t (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
		local var50 = var7(false)
		local var51 = false
		
		if p10.isHistorical == true then
			var51 = p10.isVisibleInChatWindow
			
			if var51 then
				var51 = false
				
				if t.messageLimit <= #var50 then
					local var52 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
					local var53 = var52 and var52[var50[1]]
					var51 = not (var53 ~= nil and var53.isHistorical == true)
				end
			end
		end
		return var51
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
				local var56 = var7(false)
				local var57 = false
				
				if var55.isHistorical == true then
					var57 = var55.isVisibleInChatWindow
					
					if var57 then
						var57 = false
						
						if t.messageLimit <= #var56 then
							local var58 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
							local var59 = var58 and var58[var56[1]]
							var57 = not (var59 ~= nil and var59.isHistorical == true)
						end
					end
				end
				if var57 then return end
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
			local var60 = if userId ~= p10.userId then p10 else dictionary.join(p10, { userId = userId })
			local var61 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var60.channelNameOverride then
				var61 = var60.channelNameOverride
			elseif var60.textChannel then
				var61 = if var60.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var60.textChannel.Name
			end
			if var60.isVisibleInChatWindow then
				local var62 = var7(false)
				local var63 = if var61 then var9(false)[var61] or {} else {}
				
				if t.messageLimit <= #var62 then
					local var64 = var62[1]
					local var65 = var51 and var51[var64]
					
					if var65 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var64] = nil
							else
								var2(function(p11)
									-- upvalues: dictionary (copy), var64 (ref)
									return dictionary.removeKey(p11, var64)
								end)
							end
						end
						if var65.userId then
							local userId_1 = var65.userId
							
							local var66 = function(p11)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var64 (ref), var17 (copy), var65 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p11 then
									return nil
								end
								local var67 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p11, function(p12)
									-- upvalues: var64 (copy)
									return p12 ~= var64
								end) else list.filter(p11, function(p12)
									-- upvalues: var64 (copy)
									return p12.messageId ~= var64
								end)
								
								if #var67 ~= 0 then
									return var67
								end
								local var68 = var17(false)
								
								if var68[var65.userId] then
									local userId = var68[var65.userId]
									var20(function(p12)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p12, userId)
									end)
									var18(function(p12)
										-- upvalues: dictionary (copy), var65 (copy)
										return dictionary.removeKey(p12, var65.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var66(var6[userId_1])
							else
								var5(function(p11)
									-- upvalues: var66 (ref), userId_1 (ref), dictionary (copy)
									local var67 = var66(p11[userId_1])
									
									return if var67 == nil then dictionary.removeKey(p11, userId_1) else dictionary.join(p11, { [userId_1] = var67 })
								end)
							end
						end
						var8(function(p11)
							-- upvalues: list (copy)
							return list.removeIndex(p11, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var64] = nil
						end
					end
				end
				if var61 and t.messageLimit <= #var63 then
					local var67 = var63[1]
					
					if var67 then
						var10(function(p11)
							-- upvalues: var61 (write), list (copy), dictionary (copy)
							return dictionary.join(p11, { [var61] = list.removeIndex(p11[var61] or {}, 1) })
						end)
						
						if var51 and var51[var67] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var67] = nil
							else
								var2(function(p11)
									-- upvalues: dictionary (copy), var67 (ref)
									return dictionary.removeKey(p11, var67)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var67] = nil
						end
					end
				end
			end
			writeByMessageId(var60.messageId, var60)
			
			if var60.userId then
				local userId_1 = var60.userId
				
				local var68 = function(p11)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var60 (ref), list (copy)
					p11 = p11 or {}
					local var69 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p11) do
							if v == var60.messageId then
								var69 = true
							end
						end
					else
						for i, v in ipairs(p11) do
							if v.messageId == var60.messageId then
								var69 = true
								break
							end
						end
					end
					return if var69 then p11 else list.append(p11, if fFlagExpChatMessagesStoreMemoryCleanupModule then var60.messageId else var60)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var68(var6[userId_1])
				else
					var5(function(p12)
						-- upvalues: var68 (ref), userId_1 (ref), dictionary (copy)
						local var70 = var68(p12[userId_1])
						
						return if var70 == nil then dictionary.removeKey(p12, userId_1) else dictionary.join(p12, { [userId_1] = var70 })
					end)
				end
			end
			local var70 = false
			
			if var60.isVisibleInChatWindow then
				var8(function(p12)
					-- upvalues: insertWindowMessageIdInOrder (copy), var60 (ref), var70 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var71 = insertWindowMessageIdInOrder(p12, var60.messageId, var60.isHistorical)
					var70 = var70 or var71[#var71] ~= var60.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var72 = capHistoricalPrefix(var71, var60)
						var70 = var70 or #var72 < #var71
						
						return var72
					end
					return var71
				end)
				
				if var61 then
					var10(function(p12)
						-- upvalues: var61 (write), insertWindowMessageIdInOrder (copy), var60 (ref), var70 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var71 = insertWindowMessageIdInOrder(p12[var61] or {}, var60.messageId, var60.isHistorical)
						var70 = var70 or var71[#var71] ~= var60.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var71 = capHistoricalPrefix(var71, var60)
						end
						return dictionary.join(p12, { [var61] = var71 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var71 = var29(false)
					
					if if var71 ~= nil then var61 == var71 else true then
						local messageId = var60.messageId
						
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
				local var69 = var1(p12)
				
				return if var69 and var69[p11] then var69[p11] else nil
			end)
		end
		return t_3[p11]
	end
	
	local function getUserMessageCache(p11)
		-- upvalues: t_4 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), createComputed (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var4 (ref), var3 (ref), var1 (ref), var13 (ref), set (copy)
		local var69 = tostring(p11)
		
		if not t_4[var69] then
			t_4[var69] = {}
			
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var69].messages = createComputed(function(p12)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var69 (ref)
					return (if fFlagExpChatMessagesStoreUseProxyModule then var6(p12) else var4(p12))[var69] or {}
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var69].bubbleMessages = createComputed(function(p12)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var69 (ref), var3 (copy), var1 (copy), var13 (copy), set (copy)
					local var70 = (if fFlagExpChatMessagesStoreUseProxyModule then var6(p12) else var4(p12))[var69] or {}
					local var71 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p12) else var1(p12)
					local var72 = var13(p12)
					local t = {}
					
					for i, v in ipairs(var70) do
						local var73 = var71[v]
						
						if var73 then
							if var73.isVisibleInBubbleChat and not (var73.userId and set.has(var72, var73.userId) or false) then
								table.insert(t, var73)
							end
						end
					end
					return t
				end)
			else
				t_4[var69].bubbleMessages = createComputed(function(p13)
					-- upvalues: t_4 (copy), var69 (ref), var13 (copy), set (copy)
					local var74 = t_4[var69].messages(p13)
					local var75 = var13(p13)
					local t = {}
					
					for i, v in ipairs(var74) do
						if v.isVisibleInBubbleChat and not (v.userId and set.has(var75, v.userId) or false) then
							table.insert(t, v)
						end
					end
					return t
				end)
			end
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var69].lastMessage = createComputed(function(p13)
					-- upvalues: t_4 (copy), var69 (ref)
					local var74 = t_4[var69].messages(p13)
					
					return if #var74 > 0 then var74[#var74] else nil
				end)
			end
		end
		return t_4[var69]
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
			local var70 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p12) else var1(p12)
			
			if not var70 then
				return {}
			end
			local t = {}
			
			for i, v in var70 do
				table.insert(t, v)
			end
			return t
		end)
	end
	
	local function addSystemMessage(p12, p13, p14, p15, p16, p17)
		-- upvalues: sanitizeForRichTextModule (copy), getFFlagExpChatSyntheticSystemMessageRichText (copy), generateRichSystemMessageTextFormatModule (copy), fFlagExpChatDictation (copy), httpService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var70 = sanitizeForRichTextModule(p12)
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
			text = if getFFlagExpChatSyntheticSystemMessageRichText() then generateRichSystemMessageTextFormatModule(var70, if fFlagExpChatDictation then p16 else nil, p15) else var70,
			messageId = httpService:GenerateGUID(false),
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			textChannel = p17,
			channelNameOverride = if p17 ~= nil then p13 else nil,
			metadata = p14
		}
		
		local var71 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var72 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var72 and var72[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var72 and var72[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p18)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p18, function(p19)
							-- upvalues: t_1 (copy)
							return p19 ~= t_1.messageId
						end)
					end)
					local var73 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var73 then
						var10(function(p18)
							-- upvalues: var73 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var74 = p18[var73]
							
							return if var74 then dictionary.join(p18, {
								[var73] = list.filter(var74, function(p19)
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
						
						local var74 = function(p18)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p18 then
								local var75 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p18, function(p19)
									-- upvalues: t_1 (copy)
									return p19 ~= t_1.messageId
								end) else list.filter(p18, function(p19)
									-- upvalues: t_1 (copy)
									return p19.messageId ~= t_1.messageId
								end)
								
								return if #var75 == 0 then nil else var75
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var74(var6[userId])
							
							return
						end
						var5(function(p18)
							-- upvalues: var74 (ref), userId (ref), dictionary (copy)
							local var75 = var74(p18[userId])
							
							return if var75 == nil then dictionary.removeKey(p18, userId) else dictionary.join(p18, { [userId] = var75 })
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
					
					local var75 = function(p18)
						-- upvalues: t_1 (copy), list (copy)
						if not p18 then
							return nil
						end
						local var76 = nil
						
						for i, v in ipairs(p18) do
							if v.messageId == t_1.messageId then break end
						end
						return if var76 then list.set(p18, var76, t_1) else p18
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var75(var6[userId])
						
						return
					end
					var5(function(p19)
						-- upvalues: var75 (ref), userId (ref), dictionary (copy)
						local var77 = var75(p19[userId])
						
						return if var77 == nil then dictionary.removeKey(p19, userId) else dictionary.join(p19, { [userId] = var77 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var76 = t_1
				local var77 = var7(false)
				local var78 = false
				
				if var76.isHistorical == true then
					var78 = var76.isVisibleInChatWindow
					
					if var78 then
						var78 = false
						
						if t.messageLimit <= #var77 then
							local var79 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
							local var80 = var79 and var79[var77[1]]
							var78 = not (var80 ~= nil and var80.isHistorical == true)
						end
					end
				end
				if var78 then return end
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
			local var81 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var82 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var81.channelNameOverride then
				var82 = var81.channelNameOverride
			elseif var81.textChannel then
				var82 = if var81.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var81.textChannel.Name
			end
			if var81.isVisibleInChatWindow then
				local var83 = var7(false)
				local var84 = if var82 then var9(false)[var82] or {} else {}
				
				if t.messageLimit <= #var83 then
					local var85 = var83[1]
					local var86 = var72 and var72[var85]
					
					if var86 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var85] = nil
							else
								var2(function(p18)
									-- upvalues: dictionary (copy), var85 (ref)
									return dictionary.removeKey(p18, var85)
								end)
							end
						end
						if var86.userId then
							local userId_1 = var86.userId
							
							local var87 = function(p18)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var85 (ref), var17 (copy), var86 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p18 then
									return nil
								end
								local var88 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p18, function(p19)
									-- upvalues: var85 (copy)
									return p19 ~= var85
								end) else list.filter(p18, function(p19)
									-- upvalues: var85 (copy)
									return p19.messageId ~= var85
								end)
								
								if #var88 ~= 0 then
									return var88
								end
								local var89 = var17(false)
								
								if var89[var86.userId] then
									local userId = var89[var86.userId]
									var20(function(p19)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p19, userId)
									end)
									var18(function(p19)
										-- upvalues: dictionary (copy), var86 (copy)
										return dictionary.removeKey(p19, var86.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var87(var6[userId_1])
							else
								var5(function(p18)
									-- upvalues: var87 (ref), userId_1 (ref), dictionary (copy)
									local var88 = var87(p18[userId_1])
									
									return if var88 == nil then dictionary.removeKey(p18, userId_1) else dictionary.join(p18, { [userId_1] = var88 })
								end)
							end
						end
						var8(function(p18)
							-- upvalues: list (copy)
							return list.removeIndex(p18, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var85] = nil
						end
					end
				end
				if var82 and t.messageLimit <= #var84 then
					local var88 = var84[1]
					
					if var88 then
						var10(function(p18)
							-- upvalues: var82 (write), list (copy), dictionary (copy)
							return dictionary.join(p18, { [var82] = list.removeIndex(p18[var82] or {}, 1) })
						end)
						
						if var72 and var72[var88] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var88] = nil
							else
								var2(function(p18)
									-- upvalues: dictionary (copy), var88 (ref)
									return dictionary.removeKey(p18, var88)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var88] = nil
						end
					end
				end
			end
			writeByMessageId(var81.messageId, var81)
			
			if var81.userId then
				local userId_1 = var81.userId
				
				local var89 = function(p18)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var81 (ref), list (copy)
					local p19 = p18 or {}
					local var90 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p19) do
							if v == var81.messageId then
								var90 = true
							end
						end
					else
						for i, v in ipairs(p19) do
							if v.messageId == var81.messageId then
								local var90 = true
								break
							end
						end
					end
					return if var90 then p19 else list.append(p19, if fFlagExpChatMessagesStoreMemoryCleanupModule then var81.messageId else var81)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var89(var6[userId_1])
				else
					var5(function(p20)
						-- upvalues: var89 (ref), userId_1 (ref), dictionary (copy)
						local var91 = var89(p20[userId_1])
						
						return if var91 == nil then dictionary.removeKey(p20, userId_1) else dictionary.join(p20, { [userId_1] = var91 })
					end)
				end
			end
			local var91 = false
			
			if var81.isVisibleInChatWindow then
				var8(function(p20)
					-- upvalues: insertWindowMessageIdInOrder (copy), var81 (ref), var91 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var92 = insertWindowMessageIdInOrder(p20, var81.messageId, var81.isHistorical)
					var91 = var91 or var92[#var92] ~= var81.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var93 = capHistoricalPrefix(var92, var81)
						var91 = var91 or #var93 < #var92
						
						return var93
					end
					return var92
				end)
				
				if var82 then
					var10(function(p20)
						-- upvalues: var82 (write), insertWindowMessageIdInOrder (copy), var81 (ref), var91 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var92 = insertWindowMessageIdInOrder(p20[var82] or {}, var81.messageId, var81.isHistorical)
						var91 = var91 or var92[#var92] ~= var81.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var92 = capHistoricalPrefix(var92, var81)
						end
						return dictionary.join(p20, { [var82] = var92 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var92 = var29(false)
					
					if if var92 ~= nil then var82 == var92 else true then
						local messageId = var81.messageId
						
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
			signalsExperimentalModule.batch(var71)
			
			return
		end
		var71()
	end
	
	local function formatPrefixForUniverseChatTabs(value, p18, p19)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), computeNameColor (copy), playersService (copy)
		return if getFFlagTextChatEnableUniverseChatTabs() and p18 and #value ~= 0 then `<font color="#{(if p110.TextSource then computeNameColor(p110.TextSource.Username) else computeNameColor(if playersService.LocalPlayer then playersService.LocalPlayer.Name else "")):ToHex()}">{value}</font>` else value
	end
	
	local function handleIncomingOrOutgoingMessage(a, b, p18, p19, p20)
		-- upvalues: fFlagEnableInExpChatRewriteModule (copy), getTextAndTranslationModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), isWhiteSpaceOnlyModule (copy), fFlagExpChatFixLocalUserVerifiedBadgeModule (copy), playersService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), var14 (ref), fFlagExpChatPresetChatEnabled (copy), var13 (ref), set (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), expChatSharedModule (copy), var16 (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatDisableUniverseBubbleChat (copy), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatGlobalTabDefaultModule (copy), isGlobalBubbleChatEnabledModule (copy), shouldRenderTextChannelInDefaultWindow (copy), getTextChannelDisplayMode (copy), formatPrefixForUniverseChatTabs (ref), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagExpChatMessageHistoryExperiment (copy), expChatMessageHistoryExperimentation (copy), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), capHistoricalPrefix (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy), expChatPresetChatEmojiEffectExperimentation (copy), logPresetChatEmojiEffectExposureModule (copy)
		local var90, var91
		local _ = nil
		local _ = nil
		
		if fFlagEnableInExpChatRewriteModule then
			local var92, var93 = getTextAndTranslationModule(a)
			var90 = var92
			var91 = var93
		else
			var90 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TextInternal else a.Text
			var91 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TranslationInternal else a.Translation
		end
		if isWhiteSpaceOnlyModule(var90) and a.Status ~= Enum.TextChatMessageStatus.Floodchecked and a.Status ~= Enum.TextChatMessageStatus.MessageTooLong then return end
		local var94 = if a.TextSource then tostring(a.TextSource.UserId) elseif fFlagExpChatFixLocalUserVerifiedBadgeModule and b and playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
		
		if not (if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)) then return end
		local var95
		local _ = nil
		local var96 = var94 == nil or (if var14(false) or fFlagExpChatPresetChatEnabled and (a.PresetId or "") ~= "" then if a.Status ~= Enum.TextChatMessageStatus.Success then a.Status == Enum.TextChatMessageStatus.Sending else true else false)
		var96 = var96 and not (if var94 and var13(false) then set.has(var13(false), var94) else false)
		local var97 = false
		local _ = nil
		
		if fFlagExpChatUseChatConfigStore then
			var95 = getChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false)
		else
			local store = expChatSharedModule.context and expChatSharedModule.context.store
			var95 = if store then store:getState().Messages.isBubbleChatEnabled else var16(false)
		end
		if var95 and var96 and (not fFlagEnableInExpChatSummaryOnLuaModule or var94 ~= nil) and (a.Status == Enum.TextChatMessageStatus.Success or a.Status == Enum.TextChatMessageStatus.Sending) then
			var97 = true
		end
		if fFlagExpChatDisableUniverseBubbleChat and getFFlagTextChatEnableUniverseChatTabs() and p19 == true and (not fFlagExpChatGlobalTabDefaultModule or not isGlobalBubbleChatEnabledModule()) then
			var97 = false
		end
		if a.Status ~= Enum.TextChatMessageStatus.Success and a.Status ~= Enum.TextChatMessageStatus.Sending then
			var96 = false
			var97 = false
		end
		if p20 then
			var97 = false
		end
		if not p19 and p18 == nil and not shouldRenderTextChannelInDefaultWindow(a.TextChannel, getTextChannelDisplayMode()) then
			var96 = false
		end
		local t_1 = {
			shouldOverrideBubbleChatSettings = false,
			userId = var94,
			prefixText = formatPrefixForUniverseChatTabs(if getFFlagExpChatProtectedChatInternalAPIs() then a.PrefixTextInternal else a.PrefixText, p18, a),
			text = var90,
			translation = var91,
			useTranslation = getChatTranslationEnabled() and var91 ~= nil,
			messageId = a.MessageId,
			status = a.Status,
			timestamp = a.Timestamp,
			isVisibleInBubbleChat = var97,
			isVisibleInChatWindow = var96,
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
		local var98 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
		local var99 = var98 and var98[t_1.messageId] ~= nil
		
		if p20 and var99 then return end
		if fFlagExpChatMessageHistoryExperiment and p20 then
			expChatMessageHistoryExperimentation.logExposure(var14(false))
		end
		if t_1.isVisibleInChatWindow or t_1.isVisibleInBubbleChat or var99 then
			local var100 = function()
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
				local var101 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
				
				if isBorderlessBubbleChatEnabledModule() then
					local messageId = var101 and var101[t_1.messageId]
					t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
				end
				if var101 and var101[t_1.messageId] then
					if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
						var8(function(p21)
							-- upvalues: list (copy), t_1 (copy)
							return list.filter(p21, function(p22)
								-- upvalues: t_1 (copy)
								return p22 ~= t_1.messageId
							end)
						end)
						local var102 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
						
						if var102 then
							var10(function(p21)
								-- upvalues: var102 (ref), list (copy), t_1 (copy), dictionary (copy)
								local var103 = p21[var102]
								
								return if var103 then dictionary.join(p21, {
									[var102] = list.filter(var103, function(p22)
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
							
							local var103 = function(p21)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
								if p21 then
									local var104 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
										-- upvalues: t_1 (copy)
										return p22 ~= t_1.messageId
									end) else list.filter(p21, function(p22)
										-- upvalues: t_1 (copy)
										return p22.messageId ~= t_1.messageId
									end)
									
									return if #var104 == 0 then nil else var104
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId] = var103(var6[userId])
								
								return
							end
							var5(function(p21)
								-- upvalues: var103 (ref), userId (ref), dictionary (copy)
								local var104 = var103(p21[userId])
								
								return if var104 == nil then dictionary.removeKey(p21, userId) else dictionary.join(p21, { [userId] = var104 })
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
						
						local var104 = function(p21)
							-- upvalues: t_1 (copy), list (copy)
							if not p21 then
								return nil
							end
							local var105 = nil
							
							for i, v in ipairs(p21) do
								if v.messageId == t_1.messageId then break end
							end
							return if var105 then list.set(p21, var105, t_1) else p21
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var104(var6[userId])
							
							return
						end
						var5(function(p22)
							-- upvalues: var104 (ref), userId (ref), dictionary (copy)
							local var106 = var104(p22[userId])
							
							return if var106 == nil then dictionary.removeKey(p22, userId) else dictionary.join(p22, { [userId] = var106 })
						end)
					end
					return
				elseif fFlagExpChatRenderHistoricalMessagesModule then
					local var105 = t_1
					local var106 = var7(false)
					local var107 = false
					
					if var105.isHistorical == true then
						var107 = var105.isVisibleInChatWindow
						
						if var107 then
							var107 = false
							
							if t.messageLimit <= #var106 then
								local var108 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
								local var109 = var108 and var108[var106[1]]
								var107 = not (var109 ~= nil and var109.isHistorical == true)
							end
						end
					end
					if var107 then return end
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
				local var110 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var111 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var110.channelNameOverride then
					var111 = var110.channelNameOverride
				elseif var110.textChannel then
					var111 = if var110.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var110.textChannel.Name
				end
				if var110.isVisibleInChatWindow then
					local var112 = var7(false)
					local var113 = if var111 then var9(false)[var111] or {} else {}
					
					if t.messageLimit <= #var112 then
						local var114 = var112[1]
						local var115 = var101 and var101[var114]
						
						if var115 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var114] = nil
								else
									var2(function(p21)
										-- upvalues: dictionary (copy), var114 (ref)
										return dictionary.removeKey(p21, var114)
									end)
								end
							end
							if var115.userId then
								local userId_1 = var115.userId
								
								local var116 = function(p21)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var114 (ref), var17 (copy), var115 (ref), var20 (copy), dictionary (copy), var18 (copy)
									if not p21 then
										return nil
									end
									local var117 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
										-- upvalues: var114 (copy)
										return p22 ~= var114
									end) else list.filter(p21, function(p22)
										-- upvalues: var114 (copy)
										return p22.messageId ~= var114
									end)
									
									if #var117 ~= 0 then
										return var117
									end
									local var118 = var17(false)
									
									if var118[var115.userId] then
										local userId = var118[var115.userId]
										var20(function(p22)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p22, userId)
										end)
										var18(function(p22)
											-- upvalues: dictionary (copy), var115 (copy)
											return dictionary.removeKey(p22, var115.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var6[userId_1] = var116(var6[userId_1])
								else
									var5(function(p21)
										-- upvalues: var116 (ref), userId_1 (ref), dictionary (copy)
										local var117 = var116(p21[userId_1])
										
										return if var117 == nil then dictionary.removeKey(p21, userId_1) else dictionary.join(p21, { [userId_1] = var117 })
									end)
								end
							end
							var8(function(p21)
								-- upvalues: list (copy)
								return list.removeIndex(p21, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var114] = nil
							end
						end
					end
					if var111 and t.messageLimit <= #var113 then
						local var117 = var113[1]
						
						if var117 then
							var10(function(p21)
								-- upvalues: var111 (write), list (copy), dictionary (copy)
								return dictionary.join(p21, { [var111] = list.removeIndex(p21[var111] or {}, 1) })
							end)
							
							if var101 and var101[var117] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var117] = nil
								else
									var2(function(p21)
										-- upvalues: dictionary (copy), var117 (ref)
										return dictionary.removeKey(p21, var117)
									end)
								end
							end
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var117] = nil
							end
						end
					end
				end
				writeByMessageId(var110.messageId, var110)
				
				if var110.userId then
					local userId_1 = var110.userId
					
					local var118 = function(p21)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var110 (ref), list (copy)
						local p22 = p21 or {}
						local var119 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p22) do
								if v == var110.messageId then
									var119 = true
								end
							end
						else
							for i, v in ipairs(p22) do
								if v.messageId == var110.messageId then
									local var119 = true
									break
								end
							end
						end
						return if var119 then p22 else list.append(p22, if fFlagExpChatMessagesStoreMemoryCleanupModule then var110.messageId else var110)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId_1] = var118(var6[userId_1])
					else
						var5(function(p23)
							-- upvalues: var118 (ref), userId_1 (ref), dictionary (copy)
							local var120 = var118(p23[userId_1])
							
							return if var120 == nil then dictionary.removeKey(p23, userId_1) else dictionary.join(p23, { [userId_1] = var120 })
						end)
					end
				end
				local var120 = false
				
				if var110.isVisibleInChatWindow then
					var8(function(p23)
						-- upvalues: insertWindowMessageIdInOrder (copy), var110 (ref), var120 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
						local var121 = insertWindowMessageIdInOrder(p23, var110.messageId, var110.isHistorical)
						var120 = var120 or var121[#var121] ~= var110.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							local var122 = capHistoricalPrefix(var121, var110)
							var120 = var120 or #var122 < #var121
							
							return var122
						end
						return var121
					end)
					
					if var111 then
						var10(function(p23)
							-- upvalues: var111 (write), insertWindowMessageIdInOrder (copy), var110 (ref), var120 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
							local var121 = insertWindowMessageIdInOrder(p23[var111] or {}, var110.messageId, var110.isHistorical)
							var120 = var120 or var121[#var121] ~= var110.messageId
							
							if fFlagExpChatMessageHistoryExperiment then
								var121 = capHistoricalPrefix(var121, var110)
							end
							return dictionary.join(p23, { [var111] = var121 })
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var121 = var29(false)
						
						if if var121 ~= nil then var111 == var121 else true then
							local messageId = var110.messageId
							
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
				signalsExperimentalModule.batch(var100)
			else
				var100()
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
		
		local var119 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var120 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var120 and var120[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var120 and var120[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p21)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p21, function(p22)
							-- upvalues: t_1 (copy)
							return p22 ~= t_1.messageId
						end)
					end)
					local var121 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var121 then
						var10(function(p21)
							-- upvalues: var121 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var122 = p21[var121]
							
							return if var122 then dictionary.join(p21, {
								[var121] = list.filter(var122, function(p22)
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
						
						local var122 = function(p21)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p21 then
								local var123 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
									-- upvalues: t_1 (copy)
									return p22 ~= t_1.messageId
								end) else list.filter(p21, function(p22)
									-- upvalues: t_1 (copy)
									return p22.messageId ~= t_1.messageId
								end)
								
								return if #var123 == 0 then nil else var123
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var122(var6[userId])
							
							return
						end
						var5(function(p21)
							-- upvalues: var122 (ref), userId (ref), dictionary (copy)
							local var123 = var122(p21[userId])
							
							return if var123 == nil then dictionary.removeKey(p21, userId) else dictionary.join(p21, { [userId] = var123 })
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
					
					local var123 = function(p21)
						-- upvalues: t_1 (copy), list (copy)
						if not p21 then
							return nil
						end
						local var124 = nil
						
						for i, v in ipairs(p21) do
							if v.messageId == t_1.messageId then break end
						end
						return if var124 then list.set(p21, var124, t_1) else p21
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var123(var6[userId])
						
						return
					end
					var5(function(p22)
						-- upvalues: var123 (ref), userId (ref), dictionary (copy)
						local var125 = var123(p22[userId])
						
						return if var125 == nil then dictionary.removeKey(p22, userId) else dictionary.join(p22, { [userId] = var125 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var124 = t_1
				local var125 = var7(false)
				local var126 = false
				
				if var124.isHistorical == true then
					var126 = var124.isVisibleInChatWindow
					
					if var126 then
						var126 = false
						
						if t.messageLimit <= #var125 then
							local var127 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
							local var128 = var127 and var127[var125[1]]
							var126 = not (var128 ~= nil and var128.isHistorical == true)
						end
					end
				end
				if var126 then return end
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
					local var134 = var120 and var120[var133]
					
					if var134 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var133] = nil
							else
								var2(function(p21)
									-- upvalues: dictionary (copy), var133 (ref)
									return dictionary.removeKey(p21, var133)
								end)
							end
						end
						if var134.userId then
							local userId_1 = var134.userId
							
							local var135 = function(p21)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var133 (ref), var17 (copy), var134 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p21 then
									return nil
								end
								local var136 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
									-- upvalues: var133 (copy)
									return p22 ~= var133
								end) else list.filter(p21, function(p22)
									-- upvalues: var133 (copy)
									return p22.messageId ~= var133
								end)
								
								if #var136 ~= 0 then
									return var136
								end
								local var137 = var17(false)
								
								if var137[var134.userId] then
									local userId = var137[var134.userId]
									var20(function(p22)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p22, userId)
									end)
									var18(function(p22)
										-- upvalues: dictionary (copy), var134 (copy)
										return dictionary.removeKey(p22, var134.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var135(var6[userId_1])
							else
								var5(function(p21)
									-- upvalues: var135 (ref), userId_1 (ref), dictionary (copy)
									local var136 = var135(p21[userId_1])
									
									return if var136 == nil then dictionary.removeKey(p21, userId_1) else dictionary.join(p21, { [userId_1] = var136 })
								end)
							end
						end
						var8(function(p21)
							-- upvalues: list (copy)
							return list.removeIndex(p21, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var133] = nil
						end
					end
				end
				if var130 and t.messageLimit <= #var132 then
					local var136 = var132[1]
					
					if var136 then
						var10(function(p21)
							-- upvalues: var130 (write), list (copy), dictionary (copy)
							return dictionary.join(p21, { [var130] = list.removeIndex(p21[var130] or {}, 1) })
						end)
						
						if var120 and var120[var136] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var136] = nil
							else
								var2(function(p21)
									-- upvalues: dictionary (copy), var136 (ref)
									return dictionary.removeKey(p21, var136)
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
				
				local var137 = function(p21)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var129 (ref), list (copy)
					local p22 = p21 or {}
					local var138 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p22) do
							if v == var129.messageId then
								var138 = true
							end
						end
					else
						for i, v in ipairs(p22) do
							if v.messageId == var129.messageId then
								local var138 = true
								break
							end
						end
					end
					return if var138 then p22 else list.append(p22, if fFlagExpChatMessagesStoreMemoryCleanupModule then var129.messageId else var129)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var137(var6[userId_1])
				else
					var5(function(p23)
						-- upvalues: var137 (ref), userId_1 (ref), dictionary (copy)
						local var139 = var137(p23[userId_1])
						
						return if var139 == nil then dictionary.removeKey(p23, userId_1) else dictionary.join(p23, { [userId_1] = var139 })
					end)
				end
			end
			local var139 = false
			
			if var129.isVisibleInChatWindow then
				var8(function(p23)
					-- upvalues: insertWindowMessageIdInOrder (copy), var129 (ref), var139 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var140 = insertWindowMessageIdInOrder(p23, var129.messageId, var129.isHistorical)
					var139 = var139 or var140[#var140] ~= var129.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var141 = capHistoricalPrefix(var140, var129)
						var139 = var139 or #var141 < #var140
						
						return var141
					end
					return var140
				end)
				
				if var130 then
					var10(function(p23)
						-- upvalues: var130 (write), insertWindowMessageIdInOrder (copy), var129 (ref), var139 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var140 = insertWindowMessageIdInOrder(p23[var130] or {}, var129.messageId, var129.isHistorical)
						var139 = var139 or var140[#var140] ~= var129.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var140 = capHistoricalPrefix(var140, var129)
						end
						return dictionary.join(p23, { [var130] = var140 })
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
			signalsExperimentalModule.batch(var119)
		else
			var119()
		end
		if expChatPresetChatEmojiEffectExperimentation.isExperimentEnabled then
			logPresetChatEmojiEffectExposureModule(t_1)
		end
	end
	
	local function handleHiddenMessageReceived(p21)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), fIntExpChatRandomCharChangeLowerBoundModule (copy), fIntExpChatRandomCharChangeUpperBoundModule (copy), configModule (copy), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var138 = string.len(if getFFlagExpChatProtectedChatInternalAPIs() then p21.TextInternal else p21.Text)
		local t_1 = {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = configModule.LOCK_EMOJI .. " :",
			text = string.rep(configModule.DOT_TEXT, var138 + math.random(math.max(fIntExpChatRandomCharChangeLowerBoundModule, -(var138 - 1)), fIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = p21.TextChannel,
			messageId = p21.MessageId,
			status = p21.Status,
			timestamp = p21.Timestamp,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p21 else nil
		}
		
		local var139 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var140 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var140 and var140[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var140 and var140[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p22)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p22, function(p23)
							-- upvalues: t_1 (copy)
							return p23 ~= t_1.messageId
						end)
					end)
					local var141 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var141 then
						var10(function(p22)
							-- upvalues: var141 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var142 = p22[var141]
							
							return if var142 then dictionary.join(p22, {
								[var141] = list.filter(var142, function(p23)
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
						
						local var142 = function(p22)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p22 then
								local var143 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p22, function(p23)
									-- upvalues: t_1 (copy)
									return p23 ~= t_1.messageId
								end) else list.filter(p22, function(p23)
									-- upvalues: t_1 (copy)
									return p23.messageId ~= t_1.messageId
								end)
								
								return if #var143 == 0 then nil else var143
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var142(var6[userId])
							
							return
						end
						var5(function(p22)
							-- upvalues: var142 (ref), userId (ref), dictionary (copy)
							local var143 = var142(p22[userId])
							
							return if var143 == nil then dictionary.removeKey(p22, userId) else dictionary.join(p22, { [userId] = var143 })
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
					
					local var143 = function(p22)
						-- upvalues: t_1 (copy), list (copy)
						if not p22 then
							return nil
						end
						local var144 = nil
						
						for i, v in ipairs(p22) do
							if v.messageId == t_1.messageId then break end
						end
						return if var144 then list.set(p22, var144, t_1) else p22
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var143(var6[userId])
						
						return
					end
					var5(function(p23)
						-- upvalues: var143 (ref), userId (ref), dictionary (copy)
						local var145 = var143(p23[userId])
						
						return if var145 == nil then dictionary.removeKey(p23, userId) else dictionary.join(p23, { [userId] = var145 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var144 = t_1
				local var145 = var7(false)
				local var146 = false
				
				if var144.isHistorical == true then
					var146 = var144.isVisibleInChatWindow
					
					if var146 then
						var146 = false
						
						if t.messageLimit <= #var145 then
							local var147 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
							local var148 = var147 and var147[var145[1]]
							var146 = not (var148 ~= nil and var148.isHistorical == true)
						end
					end
				end
				if var146 then return end
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
			local var149 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var150 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var149.channelNameOverride then
				var150 = var149.channelNameOverride
			elseif var149.textChannel then
				var150 = if var149.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var149.textChannel.Name
			end
			if var149.isVisibleInChatWindow then
				local var151 = var7(false)
				local var152 = if var150 then var9(false)[var150] or {} else {}
				
				if t.messageLimit <= #var151 then
					local var153 = var151[1]
					local var154 = var140 and var140[var153]
					
					if var154 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var153] = nil
							else
								var2(function(p22)
									-- upvalues: dictionary (copy), var153 (ref)
									return dictionary.removeKey(p22, var153)
								end)
							end
						end
						if var154.userId then
							local userId_1 = var154.userId
							
							local var155 = function(p22)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var153 (ref), var17 (copy), var154 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p22 then
									return nil
								end
								local var156 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p22, function(p23)
									-- upvalues: var153 (copy)
									return p23 ~= var153
								end) else list.filter(p22, function(p23)
									-- upvalues: var153 (copy)
									return p23.messageId ~= var153
								end)
								
								if #var156 ~= 0 then
									return var156
								end
								local var157 = var17(false)
								
								if var157[var154.userId] then
									local userId = var157[var154.userId]
									var20(function(p23)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p23, userId)
									end)
									var18(function(p23)
										-- upvalues: dictionary (copy), var154 (copy)
										return dictionary.removeKey(p23, var154.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var155(var6[userId_1])
							else
								var5(function(p22)
									-- upvalues: var155 (ref), userId_1 (ref), dictionary (copy)
									local var156 = var155(p22[userId_1])
									
									return if var156 == nil then dictionary.removeKey(p22, userId_1) else dictionary.join(p22, { [userId_1] = var156 })
								end)
							end
						end
						var8(function(p22)
							-- upvalues: list (copy)
							return list.removeIndex(p22, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var153] = nil
						end
					end
				end
				if var150 and t.messageLimit <= #var152 then
					local var156 = var152[1]
					
					if var156 then
						var10(function(p22)
							-- upvalues: var150 (write), list (copy), dictionary (copy)
							return dictionary.join(p22, { [var150] = list.removeIndex(p22[var150] or {}, 1) })
						end)
						
						if var140 and var140[var156] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var156] = nil
							else
								var2(function(p22)
									-- upvalues: dictionary (copy), var156 (ref)
									return dictionary.removeKey(p22, var156)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var156] = nil
						end
					end
				end
			end
			writeByMessageId(var149.messageId, var149)
			
			if var149.userId then
				local userId_1 = var149.userId
				
				local var157 = function(p22)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var149 (ref), list (copy)
					local p23 = p22 or {}
					local var158 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p23) do
							if v == var149.messageId then
								var158 = true
							end
						end
					else
						for i, v in ipairs(p23) do
							if v.messageId == var149.messageId then
								local var158 = true
								break
							end
						end
					end
					return if var158 then p23 else list.append(p23, if fFlagExpChatMessagesStoreMemoryCleanupModule then var149.messageId else var149)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var157(var6[userId_1])
				else
					var5(function(p24)
						-- upvalues: var157 (ref), userId_1 (ref), dictionary (copy)
						local var159 = var157(p24[userId_1])
						
						return if var159 == nil then dictionary.removeKey(p24, userId_1) else dictionary.join(p24, { [userId_1] = var159 })
					end)
				end
			end
			local var159 = false
			
			if var149.isVisibleInChatWindow then
				var8(function(p24)
					-- upvalues: insertWindowMessageIdInOrder (copy), var149 (ref), var159 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var160 = insertWindowMessageIdInOrder(p24, var149.messageId, var149.isHistorical)
					var159 = var159 or var160[#var160] ~= var149.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var161 = capHistoricalPrefix(var160, var149)
						var159 = var159 or #var161 < #var160
						
						return var161
					end
					return var160
				end)
				
				if var150 then
					var10(function(p24)
						-- upvalues: var150 (write), insertWindowMessageIdInOrder (copy), var149 (ref), var159 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var160 = insertWindowMessageIdInOrder(p24[var150] or {}, var149.messageId, var149.isHistorical)
						var159 = var159 or var160[#var160] ~= var149.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var160 = capHistoricalPrefix(var160, var149)
						end
						return dictionary.join(p24, { [var150] = var160 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var160 = var29(false)
					
					if if var160 ~= nil then var150 == var160 else true then
						local messageId = var149.messageId
						
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
			signalsExperimentalModule.batch(var139)
			
			return
		end
		var139()
	end
	
	local function handlePlayerRemoved(p22)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var5 (ref), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (ref), var12 (ref), set (copy), var4 (ref), var17 (ref), var20 (ref), var18 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var158 = tostring(p22)
		
		local function doHandlePlayerRemoved()
			-- upvalues: var158 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var5 (copy), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (copy), var12 (copy), set (copy), var4 (copy), var17 (copy), var20 (copy), var18 (copy)
			if fFlagExpChatMessagesStoreUseProxyModule then
				var6[var158] = nil
			else
				var5(function(p23)
					-- upvalues: dictionary (copy), var158 (ref)
					return dictionary.removeKey(p23, var158)
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var158] = nil
			end
			var12(function(p23)
				-- upvalues: set (copy), var158 (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var17 (copy), var20 (copy), dictionary (copy), var18 (copy)
				if not p23 then
					return {}
				elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4(false))[var158] or {}) == 0 and not set.has(p23, var158) then
					return p23
				end
				local var159 = var17(false)
				
				if var159[var158] then
					local var160 = var159[var158]
					var20(function(p24)
						-- upvalues: dictionary (copy), var160 (ref)
						return dictionary.removeKey(p24, var160)
					end)
					var18(function(p24)
						-- upvalues: dictionary (copy), var158 (copy)
						return dictionary.removeKey(p24, var158)
					end)
				end
				return set.subtract(p23, var158)
			end)
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doHandlePlayerRemoved)
			
			return
		elseif fFlagExpChatMessagesStoreUseProxyModule then
			var6[var158] = nil
		else
			var5(function(p23)
				-- upvalues: dictionary (copy), var158 (ref)
				return dictionary.removeKey(p23, var158)
			end)
		end
		if fFlagExpChatMessagesStoreMemoryCleanupModule then
			t_4[var158] = nil
		end
		var12(function(p23)
			-- upvalues: set (copy), var158 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var17 (copy), var20 (copy), dictionary (copy), var18 (copy)
			if not p23 then
				return {}
			elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4(false))[var158] or {}) == 0 and not set.has(p23, var158) then
				return p23
			end
			local var159 = var17(false)
			
			if var159[var158] then
				local var160 = var159[var158]
				var20(function(p24)
					-- upvalues: dictionary (copy), var160 (ref)
					return dictionary.removeKey(p24, var160)
				end)
				var18(function(p24)
					-- upvalues: dictionary (copy), var158 (copy)
					return dictionary.removeKey(p24, var158)
				end)
			end
			return set.subtract(p23, var158)
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
					local var158 = t_1[v]
					
					if var158 then
						var158.setter(nil)
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
				local var158 = (if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false))[p22]
				
				return var158 and not var158.isHiddenMessage
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
		local var158 = function(p24)
			-- upvalues: rebuildMessageWithTranslation (copy), p22 (ref)
			return rebuildMessageWithTranslation(p24, p22)
		end
		
		if fFlagExpChatMessagesStoreUseProxyModule then
			local var159 = var3[p23]
			
			if var159 then
				local var160 = rebuildMessageWithTranslation(var159, p22)
				
				if var160 then
					var3[p23] = var160
					
					return
				end
			end
		else
			var2(function(p24)
				-- upvalues: p23 (ref), var158 (ref), dictionary (copy)
				if p24 and p24[p23] then
					local var161 = var158(p24[p23])
					
					return if var161 then dictionary.join(p24, { [p23] = var161 }) else p24
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
		
		local var158 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var159 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var159 and var159[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var159 and var159[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p23)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p23, function(p24)
							-- upvalues: t_1 (copy)
							return p24 ~= t_1.messageId
						end)
					end)
					local var160 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var160 then
						var10(function(p23)
							-- upvalues: var160 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var161 = p23[var160]
							
							return if var161 then dictionary.join(p23, {
								[var160] = list.filter(var161, function(p24)
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
						
						local var161 = function(p23)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p23 then
								local var162 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p23, function(p24)
									-- upvalues: t_1 (copy)
									return p24 ~= t_1.messageId
								end) else list.filter(p23, function(p24)
									-- upvalues: t_1 (copy)
									return p24.messageId ~= t_1.messageId
								end)
								
								return if #var162 == 0 then nil else var162
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var161(var6[userId])
							
							return
						end
						var5(function(p23)
							-- upvalues: var161 (ref), userId (ref), dictionary (copy)
							local var162 = var161(p23[userId])
							
							return if var162 == nil then dictionary.removeKey(p23, userId) else dictionary.join(p23, { [userId] = var162 })
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
					
					local var162 = function(p23)
						-- upvalues: t_1 (copy), list (copy)
						if not p23 then
							return nil
						end
						local var163 = nil
						
						for i, v in ipairs(p23) do
							if v.messageId == t_1.messageId then break end
						end
						return if var163 then list.set(p23, var163, t_1) else p23
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var162(var6[userId])
						
						return
					end
					var5(function(p24)
						-- upvalues: var162 (ref), userId (ref), dictionary (copy)
						local var164 = var162(p24[userId])
						
						return if var164 == nil then dictionary.removeKey(p24, userId) else dictionary.join(p24, { [userId] = var164 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var163 = t_1
				local var164 = var7(false)
				local var165 = false
				
				if var163.isHistorical == true then
					var165 = var163.isVisibleInChatWindow
					
					if var165 then
						var165 = false
						
						if t.messageLimit <= #var164 then
							local var166 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
							local var167 = var166 and var166[var164[1]]
							var165 = not (var167 ~= nil and var167.isHistorical == true)
						end
					end
				end
				if var165 then return end
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
			local var168 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var169 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var168.channelNameOverride then
				var169 = var168.channelNameOverride
			elseif var168.textChannel then
				var169 = if var168.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var168.textChannel.Name
			end
			if var168.isVisibleInChatWindow then
				local var170 = var7(false)
				local var171 = if var169 then var9(false)[var169] or {} else {}
				
				if t.messageLimit <= #var170 then
					local var172 = var170[1]
					local var173 = var159 and var159[var172]
					
					if var173 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var172] = nil
							else
								var2(function(p23)
									-- upvalues: dictionary (copy), var172 (ref)
									return dictionary.removeKey(p23, var172)
								end)
							end
						end
						if var173.userId then
							local userId_1 = var173.userId
							
							local var174 = function(p23)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var172 (ref), var17 (copy), var173 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p23 then
									return nil
								end
								local var175 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p23, function(p24)
									-- upvalues: var172 (copy)
									return p24 ~= var172
								end) else list.filter(p23, function(p24)
									-- upvalues: var172 (copy)
									return p24.messageId ~= var172
								end)
								
								if #var175 ~= 0 then
									return var175
								end
								local var176 = var17(false)
								
								if var176[var173.userId] then
									local userId = var176[var173.userId]
									var20(function(p24)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p24, userId)
									end)
									var18(function(p24)
										-- upvalues: dictionary (copy), var173 (copy)
										return dictionary.removeKey(p24, var173.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var174(var6[userId_1])
							else
								var5(function(p23)
									-- upvalues: var174 (ref), userId_1 (ref), dictionary (copy)
									local var175 = var174(p23[userId_1])
									
									return if var175 == nil then dictionary.removeKey(p23, userId_1) else dictionary.join(p23, { [userId_1] = var175 })
								end)
							end
						end
						var8(function(p23)
							-- upvalues: list (copy)
							return list.removeIndex(p23, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var172] = nil
						end
					end
				end
				if var169 and t.messageLimit <= #var171 then
					local var175 = var171[1]
					
					if var175 then
						var10(function(p23)
							-- upvalues: var169 (write), list (copy), dictionary (copy)
							return dictionary.join(p23, { [var169] = list.removeIndex(p23[var169] or {}, 1) })
						end)
						
						if var159 and var159[var175] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var175] = nil
							else
								var2(function(p23)
									-- upvalues: dictionary (copy), var175 (ref)
									return dictionary.removeKey(p23, var175)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var175] = nil
						end
					end
				end
			end
			writeByMessageId(var168.messageId, var168)
			
			if var168.userId then
				local userId_1 = var168.userId
				
				local var176 = function(p23)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var168 (ref), list (copy)
					local p24 = p23 or {}
					local var177 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p24) do
							if v == var168.messageId then
								var177 = true
							end
						end
					else
						for i, v in ipairs(p24) do
							if v.messageId == var168.messageId then
								local var177 = true
								break
							end
						end
					end
					return if var177 then p24 else list.append(p24, if fFlagExpChatMessagesStoreMemoryCleanupModule then var168.messageId else var168)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var176(var6[userId_1])
				else
					var5(function(p25)
						-- upvalues: var176 (ref), userId_1 (ref), dictionary (copy)
						local var178 = var176(p25[userId_1])
						
						return if var178 == nil then dictionary.removeKey(p25, userId_1) else dictionary.join(p25, { [userId_1] = var178 })
					end)
				end
			end
			local var178 = false
			
			if var168.isVisibleInChatWindow then
				var8(function(p25)
					-- upvalues: insertWindowMessageIdInOrder (copy), var168 (ref), var178 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy)
					local var179 = insertWindowMessageIdInOrder(p25, var168.messageId, var168.isHistorical)
					var178 = var178 or var179[#var179] ~= var168.messageId
					
					if fFlagExpChatMessageHistoryExperiment then
						local var180 = capHistoricalPrefix(var179, var168)
						var178 = var178 or #var180 < #var179
						
						return var180
					end
					return var179
				end)
				
				if var169 then
					var10(function(p25)
						-- upvalues: var169 (write), insertWindowMessageIdInOrder (copy), var168 (ref), var178 (write), fFlagExpChatMessageHistoryExperiment (copy), capHistoricalPrefix (copy), dictionary (copy)
						local var179 = insertWindowMessageIdInOrder(p25[var169] or {}, var168.messageId, var168.isHistorical)
						var178 = var178 or var179[#var179] ~= var168.messageId
						
						if fFlagExpChatMessageHistoryExperiment then
							var179 = capHistoricalPrefix(var179, var168)
						end
						return dictionary.join(p25, { [var169] = var179 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var179 = var29(false)
					
					if if var179 ~= nil then var169 == var179 else true then
						local messageId = var168.messageId
						
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
			signalsExperimentalModule.batch(var158)
			
			return
		end
		var158()
	end
	
	updateNextMessageComponent = function(p23)
		-- upvalues: var23 (ref), var25 (ref), var26 (ref), t_1 (ref), fFlagEnableInExpChatRewriteModule (copy), t_2 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), var28 (write), var27 (write)
		local var177 = var23(false)
		
		if #var177 == 0 then return end
		local var178 = var25(false)
		local var179 = var177[var178]
		
		if not var179 then
			var26(1)
			
			return
		end
		local var180 = t_1[var179]
		
		if var180 then
			var180.setter(p23)
		end
		local var181 = if fFlagEnableInExpChatRewriteModule then 10 else 1
		local var182 = t_2[var179]
		
		if fFlagExpChatRenderHistoricalMessagesModule then
			local var183 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			local var184 = var183 and var183[p23]
			
			if var184 ~= nil and var184.isHistorical == true then
				var28 += var181
				
				if var182 then
					var182.setter(var28 + -1000000)
				end
			else
				var27 += var181
				
				if var182 then
					var182.setter(var27)
				end
			end
			var26(var178 % #var177 + 1)
		end
	end
	
	return {
		getByMessageId = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1,
		getMessages = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else createComputed(function(p23)
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
			local var177 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p23) else var1(p23)
			
			if not var177 then
				return {}
			end
			local t = {}
			
			for i, v in var177 do
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
				local var178, var179 = createSignal(nil)
				t_1[p24] = { getter = var178, setter = var179 }
				local var180, var181 = createSignal(0)
				t_2[p24] = { getter = var180, setter = var181 }
				var24(function(p25)
					-- upvalues: list (copy), p24 (ref)
					return list.append(p25, p24)
				end)
			end
			return t_1[p24].getter
		end,
		unregisterMessageComponent = function(p24)
			-- upvalues: var23 (ref), t_1 (ref), t_2 (ref), var24 (ref), list (copy), var25 (ref), var26 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
			local var178 = nil
			
			for i, v in ipairs(var23(false)) do
				if v == p24 then
					var178 = i
					break
				end
			end
			if t_1[p24] then
				t_1[p24] = nil
			end
			if t_2[p24] then
				t_2[p24] = nil
			end
			if var178 then
				local function doUnregister()
					-- upvalues: var24 (copy), list (copy), p24 (ref), var23 (copy), var25 (copy), var26 (copy), var178 (write)
					var24(function(p25)
						-- upvalues: list (copy), p24 (copy)
						return list.filter(p25, function(p26)
							-- upvalues: p24 (copy)
							return p26 ~= p24
						end)
					end)
					local var179 = var23(false)
					local var180 = var25(false)
					
					if #var179 == 0 then
						var26(1)
						
						return
					elseif var178 < var180 then
						var26(var180 - 1)
						
						return
					elseif #var179 < var180 then
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
				local var179 = var29(false)
				local _ = nil
				local var180 = if var179 then var9(false)[var179] or {} else var7(false)
				var26(1)
				var27 = 0
				var28 = 0
				
				for i, v in ipairs(var180) do
					updateNextMessageComponent(v)
				end
				local var181 = var23(false)
				
				if #var180 < #var181 then
					for i_1 = var25(false), #var181 do
						local var182 = t_1[var181[i_1]]
						
						if var182 then
							var182.setter(nil)
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
			local var183 = t_1[value]
			
			return if var183 then var183.getter else nil
		end,
		getLayoutOrderSignal = function(value)
			-- upvalues: t_2 (ref)
			local var183 = t_2[value]
			
			return if var183 then var183.getter else nil
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
			local var183 = function(p27)
				-- upvalues: dictionary (copy), p26 (ref)
				return dictionary.join(p27, { text = p26 })
			end
			
			if fFlagExpChatMessagesStoreUseProxyModule then
				local var184 = var3[p25]
				
				if var184 then
					local var185 = dictionary.join(var184, { text = p26 })
					
					if var185 then
						var3[p25] = var185
						
						return
					end
				end
			else
				var2(function(p27)
					-- upvalues: p25 (ref), var183 (ref), dictionary (copy)
					if p27 and p27[p25] then
						local var186 = var183(p27[p25])
						
						return if var186 then dictionary.join(p27, { [p25] = var186 }) else p27
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