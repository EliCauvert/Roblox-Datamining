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

function getChatTranslationEnabled()
	-- upvalues: textChatService (ref)
	return textChatService.ChatTranslationEnabled
end

return function(p1)
	-- upvalues: createSignal (ref), fFlagExpChatMessagesStoreUseProxyModule (ref), createProxy (ref), createComputed (ref), dictionary (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatMessagesStoreBatchModule (ref), signalsExperimentalModule (ref), fFlagExpChatRenderHistoricalMessagesModule (ref), list (ref), isBorderlessBubbleChatEnabledModule (ref), getServerTimeNowMillisModule (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (ref), httpService (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (ref), fFlagExpChatEnableV2ChatWindowModule (ref), set (ref), sanitizeForRichTextModule (ref), getFFlagExpChatSyntheticSystemMessageRichText (ref), generateRichSystemMessageTextFormatModule (ref), fFlagExpChatDictation (ref), computeNameColor (ref), playersService (ref), fFlagEnableInExpChatRewriteModule (ref), getTextAndTranslationModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), isWhiteSpaceOnlyModule (ref), fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), expChatSharedModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatDisableUniverseBubbleChat (ref), fFlagExpChatGlobalTabDefaultModule (ref), isGlobalBubbleChatEnabledModule (ref), shouldRenderTextChannelInDefaultWindow (ref), getTextChannelDisplayMode (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), expChatPresetChatEmojiEffectExperimentation (ref), logPresetChatEmojiEffectExposureModule (ref), fIntExpChatRandomCharChangeLowerBoundModule (ref), fIntExpChatRandomCharChangeUpperBoundModule (ref), configModule (ref), fFlagExpChatClearHiddenMessagesPostAgeCheckModule (ref)
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
	
	local _ = function(p8)
		-- upvalues: var7 (ref), t (ref)
		return p8.isHistorical == true and (p8.isVisibleInChatWindow and t.messageLimit <= #var7(false))
	end
	
	local _ = function(p8, p9)
		-- upvalues: var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write)
		if not p9 and not var33 then
			updateNextMessageComponent(p8)
			
			return
		elseif var32 then
			var33 = true
			
			return
		end
		var31()
	end
	
	local function keepHistoricalFlag(p8)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), dictionary (copy)
		local var43 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
		local messageId = var43 and var43[p8.messageId]
		
		return if messageId ~= nil and messageId.isHistorical == true then dictionary.join(p8, { isHistorical = true }) else p8
	end
	
	local _ = function(p8)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var43 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), p8 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var44 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var44 and var44[p8.messageId]
				p8.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var44 and var44[p8.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (p8.status == Enum.TextChatMessageStatus.Floodchecked or p8.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p9)
						-- upvalues: list (copy), p8 (copy)
						return list.filter(p9, function(p10)
							-- upvalues: p8 (copy)
							return p10 ~= p8.messageId
						end)
					end)
					local var45 = resolveChannelNameForMapOrder(p8, p8.channelNameOverride)
					
					if var45 then
						var10(function(p9)
							-- upvalues: var45 (ref), list (copy), p8 (copy), dictionary (copy)
							local var46 = p9[var45]
							
							return if var46 then dictionary.join(p9, {
								[var45] = list.filter(var46, function(p10)
									-- upvalues: p8 (copy)
									return p10 ~= p8.messageId
								end)
							}) else p9
						end)
					end
					local messageId = p8.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p9)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p9, messageId)
						end)
					end
					if p8.userId then
						local userId = p8.userId
						
						local var46 = function(p9)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), p8 (copy)
							if not p9 then
								return nil
							end
							local var47 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p9, function(p10)
								-- upvalues: p8 (copy)
								return p10 ~= p8.messageId
							end) else list.filter(p9, function(p10)
								-- upvalues: p8 (copy)
								return p10.messageId ~= p8.messageId
							end)
							
							return if #var47 == 0 then nil else var47
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var46(var6[userId])
							
							return
						end
						var5(function(p9)
							-- upvalues: var46 (ref), userId (ref), dictionary (copy)
							local var47 = var46(p9[userId])
							
							return if var47 == nil then dictionary.removeKey(p9, userId) else dictionary.join(p9, { [userId] = var47 })
						end)
					end
					return
				elseif fFlagExpChatRenderHistoricalMessagesModule then
					writeByMessageId(p8.messageId, keepHistoricalFlag(p8))
				else
					writeByMessageId(p8.messageId, p8)
				end
				if not fFlagExpChatMessagesStoreMemoryCleanupModule and p8.userId then
					local userId = p8.userId
					
					local var47 = function(p9)
						-- upvalues: p8 (copy), list (copy)
						if not p9 then
							return nil
						end
						local var48 = nil
						
						for i, v in ipairs(p9) do
							if v.messageId == p8.messageId then
								var48 = i
								break
							end
						end
						return if var48 then list.set(p9, var48, p8) else p9
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var47(var6[userId])
						
						return
					end
					var5(function(p10)
						-- upvalues: var47 (ref), userId (ref), dictionary (copy)
						local var49 = var47(p10[userId])
						
						return if var49 == nil then dictionary.removeKey(p10, userId) else dictionary.join(p10, { [userId] = var49 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var48 = p8
				
				if var48.isHistorical == true and (var48.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
			end
			local userId = p8.userId
			local partOrModel = p8.partOrModel
			
			if not userId and partOrModel then
				userId = var19(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var18(function(p9)
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p9, { [userId] = partOrModel })
					end)
					var20(function(p9)
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p9, { [partOrModel] = userId })
					end)
				end
			end
			local var49 = if userId ~= p8.userId then p8 else dictionary.join(p8, { userId = userId })
			local var50 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var49.channelNameOverride then
				var50 = var49.channelNameOverride
			elseif var49.textChannel then
				var50 = if var49.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var49.textChannel.Name
			end
			if var49.isVisibleInChatWindow then
				local var51 = var7(false)
				local var52 = if var50 then var9(false)[var50] or {} else {}
				
				if t.messageLimit <= #var51 then
					local var53 = var51[1]
					local var54 = var44 and var44[var53]
					
					if var54 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var53] = nil
							else
								var2(function(p9)
									-- upvalues: dictionary (copy), var53 (ref)
									return dictionary.removeKey(p9, var53)
								end)
							end
						end
						if var54.userId then
							local userId_1 = var54.userId
							
							local var55 = function(p9)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var53 (ref), var17 (copy), var54 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p9 then
									return nil
								end
								local var56 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p9, function(p10)
									-- upvalues: var53 (copy)
									return p10 ~= var53
								end) else list.filter(p9, function(p10)
									-- upvalues: var53 (copy)
									return p10.messageId ~= var53
								end)
								
								if #var56 ~= 0 then
									return var56
								end
								local var57 = var17(false)
								
								if var57[var54.userId] then
									local userId = var57[var54.userId]
									var20(function(p10)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p10, userId)
									end)
									var18(function(p10)
										-- upvalues: dictionary (copy), var54 (copy)
										return dictionary.removeKey(p10, var54.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var55(var6[userId_1])
							else
								var5(function(p9)
									-- upvalues: var55 (ref), userId_1 (ref), dictionary (copy)
									local var56 = var55(p9[userId_1])
									
									return if var56 == nil then dictionary.removeKey(p9, userId_1) else dictionary.join(p9, { [userId_1] = var56 })
								end)
							end
						end
						var8(function(p9)
							-- upvalues: list (copy)
							return list.removeIndex(p9, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var53] = nil
						end
					end
				end
				if var50 and t.messageLimit <= #var52 then
					local var56 = var52[1]
					
					if var56 then
						var10(function(p9)
							-- upvalues: var50 (write), list (copy), dictionary (copy)
							return dictionary.join(p9, { [var50] = list.removeIndex(p9[var50] or {}, 1) })
						end)
						
						if var44 and var44[var56] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var56] = nil
							else
								var2(function(p9)
									-- upvalues: dictionary (copy), var56 (ref)
									return dictionary.removeKey(p9, var56)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var56] = nil
						end
					end
				end
			end
			writeByMessageId(var49.messageId, var49)
			
			if var49.userId then
				local userId_1 = var49.userId
				
				local var57 = function(p9)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var49 (ref), list (copy)
					p9 = p9 or {}
					local var58 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p9) do
							if v == var49.messageId then
								var58 = true
							end
						end
					else
						for i, v in ipairs(p9) do
							if v.messageId == var49.messageId then
								var58 = true
								break
							end
						end
					end
					return if var58 then p9 else list.append(p9, if fFlagExpChatMessagesStoreMemoryCleanupModule then var49.messageId else var49)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var57(var6[userId_1])
				else
					var5(function(p10)
						-- upvalues: var57 (ref), userId_1 (ref), dictionary (copy)
						local var59 = var57(p10[userId_1])
						
						return if var59 == nil then dictionary.removeKey(p10, userId_1) else dictionary.join(p10, { [userId_1] = var59 })
					end)
				end
			end
			local var59 = false
			
			if var49.isVisibleInChatWindow then
				var8(function(p10)
					-- upvalues: insertWindowMessageIdInOrder (copy), var49 (ref), var59 (write)
					local var60 = insertWindowMessageIdInOrder(p10, var49.messageId, var49.isHistorical)
					var59 = var59 or var60[#var60] ~= var49.messageId
					
					return var60
				end)
				
				if var50 then
					var10(function(p10)
						-- upvalues: var50 (write), insertWindowMessageIdInOrder (copy), var49 (ref), var59 (write), dictionary (copy)
						local var60 = insertWindowMessageIdInOrder(p10[var50] or {}, var49.messageId, var49.isHistorical)
						var59 = var59 or var60[#var60] ~= var49.messageId
						
						return dictionary.join(p10, { [var50] = var60 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var60 = var29(false)
					
					if if var60 ~= nil then var50 == var60 else true then
						local messageId = var49.messageId
						
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
			signalsExperimentalModule.batch(var43)
			
			return
		end
		var43()
	end
	
	local t_4 = {}
	
	local function getMessage(p9)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), t_3 (ref), createComputed (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			return function(p10)
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), p9 (ref)
				return (if fFlagExpChatMessagesStoreUseProxyModule then var3(p10) else var1(p10))[p9]
			end
		elseif not t_3[p9] then
			t_3[p9] = createComputed(function(p10)
				-- upvalues: var1 (copy), p9 (ref)
				local var58 = var1(p10)
				
				return if var58 and var58[p9] then var58[p9] else nil
			end)
		end
		return t_3[p9]
	end
	
	local function getUserMessageCache(p9)
		-- upvalues: t_4 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), createComputed (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var4 (ref), var3 (ref), var1 (ref), var13 (ref), set (copy)
		local var58 = tostring(p9)
		
		if not t_4[var58] then
			t_4[var58] = {}
			
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var58].messages = createComputed(function(p10)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var58 (ref)
					return (if fFlagExpChatMessagesStoreUseProxyModule then var6(p10) else var4(p10))[var58] or {}
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var58].bubbleMessages = createComputed(function(p10)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var58 (ref), var3 (copy), var1 (copy), var13 (copy), set (copy)
					local var59 = (if fFlagExpChatMessagesStoreUseProxyModule then var6(p10) else var4(p10))[var58] or {}
					local var60 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p10) else var1(p10)
					local var61 = var13(p10)
					local t = {}
					
					for i, v in ipairs(var59) do
						local var62 = var60[v]
						
						if var62 then
							if var62.isVisibleInBubbleChat and not (var62.userId and set.has(var61, var62.userId) or false) then
								table.insert(t, var62)
							end
						end
					end
					return t
				end)
			else
				t_4[var58].bubbleMessages = createComputed(function(p11)
					-- upvalues: t_4 (copy), var58 (ref), var13 (copy), set (copy)
					local var63 = t_4[var58].messages(p11)
					local var64 = var13(p11)
					local t = {}
					
					for i, v in ipairs(var63) do
						if v.isVisibleInBubbleChat and not (v.userId and set.has(var64, v.userId) or false) then
							table.insert(t, v)
						end
					end
					return t
				end)
			end
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var58].lastMessage = createComputed(function(p11)
					-- upvalues: t_4 (copy), var58 (ref)
					local var63 = t_4[var58].messages(p11)
					
					return if #var63 > 0 then var63[#var63] else nil
				end)
			end
		end
		return t_4[var58]
	end
	
	local function getUserMessages(p10)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p10).messages
	end
	
	local function getUserBubbleMessages(p10)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p10).bubbleMessages
	end
	
	local function getUserLastMessage(p10)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p10).lastMessage
	end
	
	local _ = function()
		-- upvalues: createComputed (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
		return createComputed(function(p10)
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy)
			local var59 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p10) else var1(p10)
			
			if not var59 then
				return {}
			end
			local t = {}
			
			for i, v in var59 do
				table.insert(t, v)
			end
			return t
		end)
	end
	
	local function addSystemMessage(p10, p11, p12, p13, p14, p15)
		-- upvalues: sanitizeForRichTextModule (copy), getFFlagExpChatSyntheticSystemMessageRichText (copy), generateRichSystemMessageTextFormatModule (copy), fFlagExpChatDictation (copy), httpService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var59 = sanitizeForRichTextModule(p10)
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
			text = if getFFlagExpChatSyntheticSystemMessageRichText() then generateRichSystemMessageTextFormatModule(var59, if fFlagExpChatDictation then p14 else nil, p13) else var59,
			messageId = httpService:GenerateGUID(false),
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			textChannel = p15,
			channelNameOverride = if p15 ~= nil then p11 else nil,
			metadata = p12
		}
		
		local var60 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var61 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var61 and var61[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var61 and var61[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p16)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p16, function(p17)
							-- upvalues: t_1 (copy)
							return p17 ~= t_1.messageId
						end)
					end)
					local var62 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var62 then
						var10(function(p16)
							-- upvalues: var62 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var63 = p16[var62]
							
							return if var63 then dictionary.join(p16, {
								[var62] = list.filter(var63, function(p17)
									-- upvalues: t_1 (copy)
									return p17 ~= t_1.messageId
								end)
							}) else p16
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p16)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p16, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var63 = function(p16)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p16 then
								local var64 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p16, function(p17)
									-- upvalues: t_1 (copy)
									return p17 ~= t_1.messageId
								end) else list.filter(p16, function(p17)
									-- upvalues: t_1 (copy)
									return p17.messageId ~= t_1.messageId
								end)
								
								return if #var64 == 0 then nil else var64
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var63(var6[userId])
							
							return
						end
						var5(function(p16)
							-- upvalues: var63 (ref), userId (ref), dictionary (copy)
							local var64 = var63(p16[userId])
							
							return if var64 == nil then dictionary.removeKey(p16, userId) else dictionary.join(p16, { [userId] = var64 })
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
					
					local var64 = function(p16)
						-- upvalues: t_1 (copy), list (copy)
						if not p16 then
							return nil
						end
						local var65 = nil
						
						for i, v in ipairs(p16) do
							if v.messageId == t_1.messageId then break end
						end
						return if var65 then list.set(p16, var65, t_1) else p16
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var64(var6[userId])
						
						return
					end
					var5(function(p17)
						-- upvalues: var64 (ref), userId (ref), dictionary (copy)
						local var66 = var64(p17[userId])
						
						return if var66 == nil then dictionary.removeKey(p17, userId) else dictionary.join(p17, { [userId] = var66 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var65 = t_1
				
				if var65.isHistorical == true and (var65.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
			end
			local userId = t_1.userId
			local partOrModel = t_1.partOrModel
			
			if not userId and partOrModel then
				userId = var19(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var18(function(p16)
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p16, { [userId] = partOrModel })
					end)
					var20(function(p16)
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p16, { [partOrModel] = userId })
					end)
				end
			end
			local var66 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var67 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var66.channelNameOverride then
				var67 = var66.channelNameOverride
			elseif var66.textChannel then
				var67 = if var66.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var66.textChannel.Name
			end
			if var66.isVisibleInChatWindow then
				local var68 = var7(false)
				local var69 = if var67 then var9(false)[var67] or {} else {}
				
				if t.messageLimit <= #var68 then
					local var70 = var68[1]
					local var71 = var61 and var61[var70]
					
					if var71 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var70] = nil
							else
								var2(function(p16)
									-- upvalues: dictionary (copy), var70 (ref)
									return dictionary.removeKey(p16, var70)
								end)
							end
						end
						if var71.userId then
							local userId_1 = var71.userId
							
							local var72 = function(p16)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var70 (ref), var17 (copy), var71 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p16 then
									return nil
								end
								local var73 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p16, function(p17)
									-- upvalues: var70 (copy)
									return p17 ~= var70
								end) else list.filter(p16, function(p17)
									-- upvalues: var70 (copy)
									return p17.messageId ~= var70
								end)
								
								if #var73 ~= 0 then
									return var73
								end
								local var74 = var17(false)
								
								if var74[var71.userId] then
									local userId = var74[var71.userId]
									var20(function(p17)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p17, userId)
									end)
									var18(function(p17)
										-- upvalues: dictionary (copy), var71 (copy)
										return dictionary.removeKey(p17, var71.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var72(var6[userId_1])
							else
								var5(function(p16)
									-- upvalues: var72 (ref), userId_1 (ref), dictionary (copy)
									local var73 = var72(p16[userId_1])
									
									return if var73 == nil then dictionary.removeKey(p16, userId_1) else dictionary.join(p16, { [userId_1] = var73 })
								end)
							end
						end
						var8(function(p16)
							-- upvalues: list (copy)
							return list.removeIndex(p16, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var70] = nil
						end
					end
				end
				if var67 and t.messageLimit <= #var69 then
					local var73 = var69[1]
					
					if var73 then
						var10(function(p16)
							-- upvalues: var67 (write), list (copy), dictionary (copy)
							return dictionary.join(p16, { [var67] = list.removeIndex(p16[var67] or {}, 1) })
						end)
						
						if var61 and var61[var73] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var73] = nil
							else
								var2(function(p16)
									-- upvalues: dictionary (copy), var73 (ref)
									return dictionary.removeKey(p16, var73)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var73] = nil
						end
					end
				end
			end
			writeByMessageId(var66.messageId, var66)
			
			if var66.userId then
				local userId_1 = var66.userId
				
				local var74 = function(p16)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var66 (ref), list (copy)
					local p17 = p16 or {}
					local var75 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p17) do
							if v == var66.messageId then
								var75 = true
							end
						end
					else
						for i, v in ipairs(p17) do
							if v.messageId == var66.messageId then
								local var75 = true
								break
							end
						end
					end
					return if var75 then p17 else list.append(p17, if fFlagExpChatMessagesStoreMemoryCleanupModule then var66.messageId else var66)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var74(var6[userId_1])
				else
					var5(function(p18)
						-- upvalues: var74 (ref), userId_1 (ref), dictionary (copy)
						local var76 = var74(p18[userId_1])
						
						return if var76 == nil then dictionary.removeKey(p18, userId_1) else dictionary.join(p18, { [userId_1] = var76 })
					end)
				end
			end
			local var76 = false
			
			if var66.isVisibleInChatWindow then
				var8(function(p18)
					-- upvalues: insertWindowMessageIdInOrder (copy), var66 (ref), var76 (write)
					local var77 = insertWindowMessageIdInOrder(p18, var66.messageId, var66.isHistorical)
					var76 = var76 or var77[#var77] ~= var66.messageId
					
					return var77
				end)
				
				if var67 then
					var10(function(p18)
						-- upvalues: var67 (write), insertWindowMessageIdInOrder (copy), var66 (ref), var76 (write), dictionary (copy)
						local var77 = insertWindowMessageIdInOrder(p18[var67] or {}, var66.messageId, var66.isHistorical)
						var76 = var76 or var77[#var77] ~= var66.messageId
						
						return dictionary.join(p18, { [var67] = var77 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var77 = var29(false)
					
					if if var77 ~= nil then var67 == var77 else true then
						local messageId = var66.messageId
						
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
			signalsExperimentalModule.batch(var60)
			
			return
		end
		var60()
	end
	
	local function formatPrefixForUniverseChatTabs(value, p16, p17)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), computeNameColor (copy), playersService (copy)
		return if getFFlagTextChatEnableUniverseChatTabs() and p16 and #value ~= 0 then `<font color="#{(if p107.TextSource then computeNameColor(p107.TextSource.Username) else computeNameColor(if playersService.LocalPlayer then playersService.LocalPlayer.Name else "")):ToHex()}">{value}</font>` else value
	end
	
	local function handleIncomingOrOutgoingMessage(a, b, p16, p17, p18)
		-- upvalues: fFlagEnableInExpChatRewriteModule (copy), getTextAndTranslationModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), isWhiteSpaceOnlyModule (copy), fFlagExpChatFixLocalUserVerifiedBadgeModule (copy), playersService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), var14 (ref), fFlagExpChatPresetChatEnabled (copy), var13 (ref), set (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), expChatSharedModule (copy), var16 (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatDisableUniverseBubbleChat (copy), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatGlobalTabDefaultModule (copy), isGlobalBubbleChatEnabledModule (copy), shouldRenderTextChannelInDefaultWindow (copy), getTextChannelDisplayMode (copy), formatPrefixForUniverseChatTabs (ref), getFFlagExpChatTelemetryEventTriggerModule (copy), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy), expChatPresetChatEmojiEffectExperimentation (copy), logPresetChatEmojiEffectExposureModule (copy)
		local var75, var76
		local _ = nil
		local _ = nil
		
		if fFlagEnableInExpChatRewriteModule then
			local var77, var78 = getTextAndTranslationModule(a)
			var75 = var77
			var76 = var78
		else
			var75 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TextInternal else a.Text
			var76 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TranslationInternal else a.Translation
		end
		if isWhiteSpaceOnlyModule(var75) and a.Status ~= Enum.TextChatMessageStatus.Floodchecked and a.Status ~= Enum.TextChatMessageStatus.MessageTooLong then return end
		local var79 = if a.TextSource then tostring(a.TextSource.UserId) elseif fFlagExpChatFixLocalUserVerifiedBadgeModule and b and playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
		
		if not (if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)) then return end
		local var80
		local _ = nil
		local var81 = var79 == nil or (if var14(false) or fFlagExpChatPresetChatEnabled and (a.PresetId or "") ~= "" then if a.Status ~= Enum.TextChatMessageStatus.Success then a.Status == Enum.TextChatMessageStatus.Sending else true else false)
		var81 = var81 and not (if var79 and var13(false) then set.has(var13(false), var79) else false)
		local var82 = false
		local _ = nil
		
		if fFlagExpChatUseChatConfigStore then
			var80 = getChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false)
		else
			local store = expChatSharedModule.context and expChatSharedModule.context.store
			var80 = if store then store:getState().Messages.isBubbleChatEnabled else var16(false)
		end
		if var80 and var81 and (not fFlagEnableInExpChatSummaryOnLuaModule or var79 ~= nil) and (a.Status == Enum.TextChatMessageStatus.Success or a.Status == Enum.TextChatMessageStatus.Sending) then
			var82 = true
		end
		if fFlagExpChatDisableUniverseBubbleChat and getFFlagTextChatEnableUniverseChatTabs() and p17 == true and (not fFlagExpChatGlobalTabDefaultModule or not isGlobalBubbleChatEnabledModule()) then
			var82 = false
		end
		if a.Status ~= Enum.TextChatMessageStatus.Success and a.Status ~= Enum.TextChatMessageStatus.Sending then
			var81 = false
			var82 = false
		end
		if p18 then
			var82 = false
		end
		if not p17 and p16 == nil and not shouldRenderTextChannelInDefaultWindow(a.TextChannel, getTextChannelDisplayMode()) then
			var81 = false
		end
		local t_1 = {
			shouldOverrideBubbleChatSettings = false,
			userId = var79,
			prefixText = formatPrefixForUniverseChatTabs(if getFFlagExpChatProtectedChatInternalAPIs() then a.PrefixTextInternal else a.PrefixText, p16, a),
			text = var75,
			translation = var76,
			useTranslation = getChatTranslationEnabled() and var76 ~= nil,
			messageId = a.MessageId,
			status = a.Status,
			timestamp = a.Timestamp,
			isVisibleInBubbleChat = var82,
			isVisibleInChatWindow = var81,
			textChannel = a.TextChannel,
			bubbleChatMessageProperties = a.BubbleChatMessageProperties,
			chatWindowMessageProperties = a.ChatWindowMessageProperties,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then a else nil,
			partOrModel = if a.TextSource then a.TextSource.Parent else nil,
			wasRewritten = if fFlagEnableInExpChatRewriteModule then a.WasRewritten else nil,
			originalText = if fFlagEnableInExpChatRewriteModule then a.OriginalText else nil,
			isHistorical = p18,
			channelNameOverride = if getFFlagTextChatEnableUniverseChatTabs() and p16 then p16 else nil,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then a.ChatActionType else nil,
			isUniverseChat = p17,
			presetId = if fFlagExpChatPresetChatEnabled then a.PresetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then a.PresetChatVersion else nil
		}
		local var83 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
		local var84 = var83 and var83[t_1.messageId] ~= nil
		
		if p18 and var84 then return end
		if t_1.isVisibleInChatWindow or t_1.isVisibleInBubbleChat or var84 then
			local var85 = function()
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
				local var86 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
				
				if isBorderlessBubbleChatEnabledModule() then
					local messageId = var86 and var86[t_1.messageId]
					t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
				end
				if var86 and var86[t_1.messageId] then
					if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
						var8(function(p19)
							-- upvalues: list (copy), t_1 (copy)
							return list.filter(p19, function(p20)
								-- upvalues: t_1 (copy)
								return p20 ~= t_1.messageId
							end)
						end)
						local var87 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
						
						if var87 then
							var10(function(p19)
								-- upvalues: var87 (ref), list (copy), t_1 (copy), dictionary (copy)
								local var88 = p19[var87]
								
								return if var88 then dictionary.join(p19, {
									[var87] = list.filter(var88, function(p20)
										-- upvalues: t_1 (copy)
										return p20 ~= t_1.messageId
									end)
								}) else p19
							end)
						end
						local messageId = t_1.messageId
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var3[messageId] = nil
						else
							var2(function(p19)
								-- upvalues: dictionary (copy), messageId (ref)
								return dictionary.removeKey(p19, messageId)
							end)
						end
						if t_1.userId then
							local userId = t_1.userId
							
							local var88 = function(p19)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
								if p19 then
									local var89 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p19, function(p20)
										-- upvalues: t_1 (copy)
										return p20 ~= t_1.messageId
									end) else list.filter(p19, function(p20)
										-- upvalues: t_1 (copy)
										return p20.messageId ~= t_1.messageId
									end)
									
									return if #var89 == 0 then nil else var89
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId] = var88(var6[userId])
								
								return
							end
							var5(function(p19)
								-- upvalues: var88 (ref), userId (ref), dictionary (copy)
								local var89 = var88(p19[userId])
								
								return if var89 == nil then dictionary.removeKey(p19, userId) else dictionary.join(p19, { [userId] = var89 })
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
						
						local var89 = function(p19)
							-- upvalues: t_1 (copy), list (copy)
							if not p19 then
								return nil
							end
							local var90 = nil
							
							for i, v in ipairs(p19) do
								if v.messageId == t_1.messageId then break end
							end
							return if var90 then list.set(p19, var90, t_1) else p19
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var89(var6[userId])
							
							return
						end
						var5(function(p20)
							-- upvalues: var89 (ref), userId (ref), dictionary (copy)
							local var91 = var89(p20[userId])
							
							return if var91 == nil then dictionary.removeKey(p20, userId) else dictionary.join(p20, { [userId] = var91 })
						end)
					end
					return
				elseif fFlagExpChatRenderHistoricalMessagesModule then
					local var90 = t_1
					
					if var90.isHistorical == true and (var90.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
				end
				local userId = t_1.userId
				local partOrModel = t_1.partOrModel
				
				if not userId and partOrModel then
					userId = var19(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var18(function(p19)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p19, { [userId] = partOrModel })
						end)
						var20(function(p19)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p19, { [partOrModel] = userId })
						end)
					end
				end
				local var91 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var92 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var91.channelNameOverride then
					var92 = var91.channelNameOverride
				elseif var91.textChannel then
					var92 = if var91.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var91.textChannel.Name
				end
				if var91.isVisibleInChatWindow then
					local var93 = var7(false)
					local var94 = if var92 then var9(false)[var92] or {} else {}
					
					if t.messageLimit <= #var93 then
						local var95 = var93[1]
						local var96 = var86 and var86[var95]
						
						if var96 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var95] = nil
								else
									var2(function(p19)
										-- upvalues: dictionary (copy), var95 (ref)
										return dictionary.removeKey(p19, var95)
									end)
								end
							end
							if var96.userId then
								local userId_1 = var96.userId
								
								local var97 = function(p19)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var95 (ref), var17 (copy), var96 (ref), var20 (copy), dictionary (copy), var18 (copy)
									if not p19 then
										return nil
									end
									local var98 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p19, function(p20)
										-- upvalues: var95 (copy)
										return p20 ~= var95
									end) else list.filter(p19, function(p20)
										-- upvalues: var95 (copy)
										return p20.messageId ~= var95
									end)
									
									if #var98 ~= 0 then
										return var98
									end
									local var99 = var17(false)
									
									if var99[var96.userId] then
										local userId = var99[var96.userId]
										var20(function(p20)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p20, userId)
										end)
										var18(function(p20)
											-- upvalues: dictionary (copy), var96 (copy)
											return dictionary.removeKey(p20, var96.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var6[userId_1] = var97(var6[userId_1])
								else
									var5(function(p19)
										-- upvalues: var97 (ref), userId_1 (ref), dictionary (copy)
										local var98 = var97(p19[userId_1])
										
										return if var98 == nil then dictionary.removeKey(p19, userId_1) else dictionary.join(p19, { [userId_1] = var98 })
									end)
								end
							end
							var8(function(p19)
								-- upvalues: list (copy)
								return list.removeIndex(p19, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var95] = nil
							end
						end
					end
					if var92 and t.messageLimit <= #var94 then
						local var98 = var94[1]
						
						if var98 then
							var10(function(p19)
								-- upvalues: var92 (write), list (copy), dictionary (copy)
								return dictionary.join(p19, { [var92] = list.removeIndex(p19[var92] or {}, 1) })
							end)
							
							if var86 and var86[var98] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var98] = nil
								else
									var2(function(p19)
										-- upvalues: dictionary (copy), var98 (ref)
										return dictionary.removeKey(p19, var98)
									end)
								end
							end
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var98] = nil
							end
						end
					end
				end
				writeByMessageId(var91.messageId, var91)
				
				if var91.userId then
					local userId_1 = var91.userId
					
					local var99 = function(p19)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var91 (ref), list (copy)
						local p20 = p19 or {}
						local var100 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p20) do
								if v == var91.messageId then
									var100 = true
								end
							end
						else
							for i, v in ipairs(p20) do
								if v.messageId == var91.messageId then
									local var100 = true
									break
								end
							end
						end
						return if var100 then p20 else list.append(p20, if fFlagExpChatMessagesStoreMemoryCleanupModule then var91.messageId else var91)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId_1] = var99(var6[userId_1])
					else
						var5(function(p21)
							-- upvalues: var99 (ref), userId_1 (ref), dictionary (copy)
							local var101 = var99(p21[userId_1])
							
							return if var101 == nil then dictionary.removeKey(p21, userId_1) else dictionary.join(p21, { [userId_1] = var101 })
						end)
					end
				end
				local var101 = false
				
				if var91.isVisibleInChatWindow then
					var8(function(p21)
						-- upvalues: insertWindowMessageIdInOrder (copy), var91 (ref), var101 (write)
						local var102 = insertWindowMessageIdInOrder(p21, var91.messageId, var91.isHistorical)
						var101 = var101 or var102[#var102] ~= var91.messageId
						
						return var102
					end)
					
					if var92 then
						var10(function(p21)
							-- upvalues: var92 (write), insertWindowMessageIdInOrder (copy), var91 (ref), var101 (write), dictionary (copy)
							local var102 = insertWindowMessageIdInOrder(p21[var92] or {}, var91.messageId, var91.isHistorical)
							var101 = var101 or var102[#var102] ~= var91.messageId
							
							return dictionary.join(p21, { [var92] = var102 })
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var102 = var29(false)
						
						if if var102 ~= nil then var92 == var102 else true then
							local messageId = var91.messageId
							
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
				signalsExperimentalModule.batch(var85)
			else
				var85()
			end
		end
		if expChatPresetChatEmojiEffectExperimentation.isExperimentEnabled then
			logPresetChatEmojiEffectExposureModule(t_1)
		end
	end
	
	local function handleIncomingBubbleChatMessage(a)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy), expChatPresetChatEmojiEffectExperimentation (copy), logPresetChatEmojiEffectExposureModule (copy)
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
		
		local var100 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var101 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var101 and var101[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var101 and var101[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p19)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p19, function(p20)
							-- upvalues: t_1 (copy)
							return p20 ~= t_1.messageId
						end)
					end)
					local var102 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var102 then
						var10(function(p19)
							-- upvalues: var102 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var103 = p19[var102]
							
							return if var103 then dictionary.join(p19, {
								[var102] = list.filter(var103, function(p20)
									-- upvalues: t_1 (copy)
									return p20 ~= t_1.messageId
								end)
							}) else p19
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p19)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p19, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var103 = function(p19)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p19 then
								local var104 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p19, function(p20)
									-- upvalues: t_1 (copy)
									return p20 ~= t_1.messageId
								end) else list.filter(p19, function(p20)
									-- upvalues: t_1 (copy)
									return p20.messageId ~= t_1.messageId
								end)
								
								return if #var104 == 0 then nil else var104
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var103(var6[userId])
							
							return
						end
						var5(function(p19)
							-- upvalues: var103 (ref), userId (ref), dictionary (copy)
							local var104 = var103(p19[userId])
							
							return if var104 == nil then dictionary.removeKey(p19, userId) else dictionary.join(p19, { [userId] = var104 })
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
					
					local var104 = function(p19)
						-- upvalues: t_1 (copy), list (copy)
						if not p19 then
							return nil
						end
						local var105 = nil
						
						for i, v in ipairs(p19) do
							if v.messageId == t_1.messageId then break end
						end
						return if var105 then list.set(p19, var105, t_1) else p19
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var104(var6[userId])
						
						return
					end
					var5(function(p20)
						-- upvalues: var104 (ref), userId (ref), dictionary (copy)
						local var106 = var104(p20[userId])
						
						return if var106 == nil then dictionary.removeKey(p20, userId) else dictionary.join(p20, { [userId] = var106 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var105 = t_1
				
				if var105.isHistorical == true and (var105.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
			end
			local userId = t_1.userId
			local partOrModel = t_1.partOrModel
			
			if not userId and partOrModel then
				userId = var19(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var18(function(p19)
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p19, { [userId] = partOrModel })
					end)
					var20(function(p19)
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p19, { [partOrModel] = userId })
					end)
				end
			end
			local var106 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var107 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var106.channelNameOverride then
				var107 = var106.channelNameOverride
			elseif var106.textChannel then
				var107 = if var106.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var106.textChannel.Name
			end
			if var106.isVisibleInChatWindow then
				local var108 = var7(false)
				local var109 = if var107 then var9(false)[var107] or {} else {}
				
				if t.messageLimit <= #var108 then
					local var110 = var108[1]
					local var111 = var101 and var101[var110]
					
					if var111 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var110] = nil
							else
								var2(function(p19)
									-- upvalues: dictionary (copy), var110 (ref)
									return dictionary.removeKey(p19, var110)
								end)
							end
						end
						if var111.userId then
							local userId_1 = var111.userId
							
							local var112 = function(p19)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var110 (ref), var17 (copy), var111 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p19 then
									return nil
								end
								local var113 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p19, function(p20)
									-- upvalues: var110 (copy)
									return p20 ~= var110
								end) else list.filter(p19, function(p20)
									-- upvalues: var110 (copy)
									return p20.messageId ~= var110
								end)
								
								if #var113 ~= 0 then
									return var113
								end
								local var114 = var17(false)
								
								if var114[var111.userId] then
									local userId = var114[var111.userId]
									var20(function(p20)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p20, userId)
									end)
									var18(function(p20)
										-- upvalues: dictionary (copy), var111 (copy)
										return dictionary.removeKey(p20, var111.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var112(var6[userId_1])
							else
								var5(function(p19)
									-- upvalues: var112 (ref), userId_1 (ref), dictionary (copy)
									local var113 = var112(p19[userId_1])
									
									return if var113 == nil then dictionary.removeKey(p19, userId_1) else dictionary.join(p19, { [userId_1] = var113 })
								end)
							end
						end
						var8(function(p19)
							-- upvalues: list (copy)
							return list.removeIndex(p19, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var110] = nil
						end
					end
				end
				if var107 and t.messageLimit <= #var109 then
					local var113 = var109[1]
					
					if var113 then
						var10(function(p19)
							-- upvalues: var107 (write), list (copy), dictionary (copy)
							return dictionary.join(p19, { [var107] = list.removeIndex(p19[var107] or {}, 1) })
						end)
						
						if var101 and var101[var113] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var113] = nil
							else
								var2(function(p19)
									-- upvalues: dictionary (copy), var113 (ref)
									return dictionary.removeKey(p19, var113)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var113] = nil
						end
					end
				end
			end
			writeByMessageId(var106.messageId, var106)
			
			if var106.userId then
				local userId_1 = var106.userId
				
				local var114 = function(p19)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var106 (ref), list (copy)
					local p20 = p19 or {}
					local var115 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p20) do
							if v == var106.messageId then
								var115 = true
							end
						end
					else
						for i, v in ipairs(p20) do
							if v.messageId == var106.messageId then
								local var115 = true
								break
							end
						end
					end
					return if var115 then p20 else list.append(p20, if fFlagExpChatMessagesStoreMemoryCleanupModule then var106.messageId else var106)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var114(var6[userId_1])
				else
					var5(function(p21)
						-- upvalues: var114 (ref), userId_1 (ref), dictionary (copy)
						local var116 = var114(p21[userId_1])
						
						return if var116 == nil then dictionary.removeKey(p21, userId_1) else dictionary.join(p21, { [userId_1] = var116 })
					end)
				end
			end
			local var116 = false
			
			if var106.isVisibleInChatWindow then
				var8(function(p21)
					-- upvalues: insertWindowMessageIdInOrder (copy), var106 (ref), var116 (write)
					local var117 = insertWindowMessageIdInOrder(p21, var106.messageId, var106.isHistorical)
					var116 = var116 or var117[#var117] ~= var106.messageId
					
					return var117
				end)
				
				if var107 then
					var10(function(p21)
						-- upvalues: var107 (write), insertWindowMessageIdInOrder (copy), var106 (ref), var116 (write), dictionary (copy)
						local var117 = insertWindowMessageIdInOrder(p21[var107] or {}, var106.messageId, var106.isHistorical)
						var116 = var116 or var117[#var117] ~= var106.messageId
						
						return dictionary.join(p21, { [var107] = var117 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var117 = var29(false)
					
					if if var117 ~= nil then var107 == var117 else true then
						local messageId = var106.messageId
						
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
		if expChatPresetChatEmojiEffectExperimentation.isExperimentEnabled then
			logPresetChatEmojiEffectExposureModule(t_1)
		end
	end
	
	local function handleHiddenMessageReceived(p19)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), fIntExpChatRandomCharChangeLowerBoundModule (copy), fIntExpChatRandomCharChangeUpperBoundModule (copy), configModule (copy), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var115 = string.len(if getFFlagExpChatProtectedChatInternalAPIs() then p19.TextInternal else p19.Text)
		local t_1 = {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = configModule.LOCK_EMOJI .. " :",
			text = string.rep(configModule.DOT_TEXT, var115 + math.random(math.max(fIntExpChatRandomCharChangeLowerBoundModule, -(var115 - 1)), fIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = p19.TextChannel,
			messageId = p19.MessageId,
			status = p19.Status,
			timestamp = p19.Timestamp,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p19 else nil
		}
		
		local var116 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var117 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var117 and var117[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var117 and var117[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p20)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p20, function(p21)
							-- upvalues: t_1 (copy)
							return p21 ~= t_1.messageId
						end)
					end)
					local var118 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var118 then
						var10(function(p20)
							-- upvalues: var118 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var119 = p20[var118]
							
							return if var119 then dictionary.join(p20, {
								[var118] = list.filter(var119, function(p21)
									-- upvalues: t_1 (copy)
									return p21 ~= t_1.messageId
								end)
							}) else p20
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p20)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p20, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var119 = function(p20)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p20 then
								local var120 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p20, function(p21)
									-- upvalues: t_1 (copy)
									return p21 ~= t_1.messageId
								end) else list.filter(p20, function(p21)
									-- upvalues: t_1 (copy)
									return p21.messageId ~= t_1.messageId
								end)
								
								return if #var120 == 0 then nil else var120
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var119(var6[userId])
							
							return
						end
						var5(function(p20)
							-- upvalues: var119 (ref), userId (ref), dictionary (copy)
							local var120 = var119(p20[userId])
							
							return if var120 == nil then dictionary.removeKey(p20, userId) else dictionary.join(p20, { [userId] = var120 })
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
					
					local var120 = function(p20)
						-- upvalues: t_1 (copy), list (copy)
						if not p20 then
							return nil
						end
						local var121 = nil
						
						for i, v in ipairs(p20) do
							if v.messageId == t_1.messageId then break end
						end
						return if var121 then list.set(p20, var121, t_1) else p20
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var120(var6[userId])
						
						return
					end
					var5(function(p21)
						-- upvalues: var120 (ref), userId (ref), dictionary (copy)
						local var122 = var120(p21[userId])
						
						return if var122 == nil then dictionary.removeKey(p21, userId) else dictionary.join(p21, { [userId] = var122 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var121 = t_1
				
				if var121.isHistorical == true and (var121.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
			end
			local userId = t_1.userId
			local partOrModel = t_1.partOrModel
			
			if not userId and partOrModel then
				userId = var19(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var18(function(p20)
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p20, { [userId] = partOrModel })
					end)
					var20(function(p20)
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p20, { [partOrModel] = userId })
					end)
				end
			end
			local var122 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var123 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var122.channelNameOverride then
				var123 = var122.channelNameOverride
			elseif var122.textChannel then
				var123 = if var122.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var122.textChannel.Name
			end
			if var122.isVisibleInChatWindow then
				local var124 = var7(false)
				local var125 = if var123 then var9(false)[var123] or {} else {}
				
				if t.messageLimit <= #var124 then
					local var126 = var124[1]
					local var127 = var117 and var117[var126]
					
					if var127 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var126] = nil
							else
								var2(function(p20)
									-- upvalues: dictionary (copy), var126 (ref)
									return dictionary.removeKey(p20, var126)
								end)
							end
						end
						if var127.userId then
							local userId_1 = var127.userId
							
							local var128 = function(p20)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var126 (ref), var17 (copy), var127 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p20 then
									return nil
								end
								local var129 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p20, function(p21)
									-- upvalues: var126 (copy)
									return p21 ~= var126
								end) else list.filter(p20, function(p21)
									-- upvalues: var126 (copy)
									return p21.messageId ~= var126
								end)
								
								if #var129 ~= 0 then
									return var129
								end
								local var130 = var17(false)
								
								if var130[var127.userId] then
									local userId = var130[var127.userId]
									var20(function(p21)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p21, userId)
									end)
									var18(function(p21)
										-- upvalues: dictionary (copy), var127 (copy)
										return dictionary.removeKey(p21, var127.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var128(var6[userId_1])
							else
								var5(function(p20)
									-- upvalues: var128 (ref), userId_1 (ref), dictionary (copy)
									local var129 = var128(p20[userId_1])
									
									return if var129 == nil then dictionary.removeKey(p20, userId_1) else dictionary.join(p20, { [userId_1] = var129 })
								end)
							end
						end
						var8(function(p20)
							-- upvalues: list (copy)
							return list.removeIndex(p20, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var126] = nil
						end
					end
				end
				if var123 and t.messageLimit <= #var125 then
					local var129 = var125[1]
					
					if var129 then
						var10(function(p20)
							-- upvalues: var123 (write), list (copy), dictionary (copy)
							return dictionary.join(p20, { [var123] = list.removeIndex(p20[var123] or {}, 1) })
						end)
						
						if var117 and var117[var129] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var129] = nil
							else
								var2(function(p20)
									-- upvalues: dictionary (copy), var129 (ref)
									return dictionary.removeKey(p20, var129)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var129] = nil
						end
					end
				end
			end
			writeByMessageId(var122.messageId, var122)
			
			if var122.userId then
				local userId_1 = var122.userId
				
				local var130 = function(p20)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var122 (ref), list (copy)
					local p21 = p20 or {}
					local var131 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p21) do
							if v == var122.messageId then
								var131 = true
							end
						end
					else
						for i, v in ipairs(p21) do
							if v.messageId == var122.messageId then
								local var131 = true
								break
							end
						end
					end
					return if var131 then p21 else list.append(p21, if fFlagExpChatMessagesStoreMemoryCleanupModule then var122.messageId else var122)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var130(var6[userId_1])
				else
					var5(function(p22)
						-- upvalues: var130 (ref), userId_1 (ref), dictionary (copy)
						local var132 = var130(p22[userId_1])
						
						return if var132 == nil then dictionary.removeKey(p22, userId_1) else dictionary.join(p22, { [userId_1] = var132 })
					end)
				end
			end
			local var132 = false
			
			if var122.isVisibleInChatWindow then
				var8(function(p22)
					-- upvalues: insertWindowMessageIdInOrder (copy), var122 (ref), var132 (write)
					local var133 = insertWindowMessageIdInOrder(p22, var122.messageId, var122.isHistorical)
					var132 = var132 or var133[#var133] ~= var122.messageId
					
					return var133
				end)
				
				if var123 then
					var10(function(p22)
						-- upvalues: var123 (write), insertWindowMessageIdInOrder (copy), var122 (ref), var132 (write), dictionary (copy)
						local var133 = insertWindowMessageIdInOrder(p22[var123] or {}, var122.messageId, var122.isHistorical)
						var132 = var132 or var133[#var133] ~= var122.messageId
						
						return dictionary.join(p22, { [var123] = var133 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var133 = var29(false)
					
					if if var133 ~= nil then var123 == var133 else true then
						local messageId = var122.messageId
						
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
			signalsExperimentalModule.batch(var116)
			
			return
		end
		var116()
	end
	
	local function handlePlayerRemoved(p20)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var5 (ref), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (ref), var12 (ref), set (copy), var4 (ref), var17 (ref), var20 (ref), var18 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var131 = tostring(p20)
		
		local function doHandlePlayerRemoved()
			-- upvalues: var131 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var5 (copy), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (copy), var12 (copy), set (copy), var4 (copy), var17 (copy), var20 (copy), var18 (copy)
			if fFlagExpChatMessagesStoreUseProxyModule then
				var6[var131] = nil
			else
				var5(function(p21)
					-- upvalues: dictionary (copy), var131 (ref)
					return dictionary.removeKey(p21, var131)
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var131] = nil
			end
			var12(function(p21)
				-- upvalues: set (copy), var131 (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var17 (copy), var20 (copy), dictionary (copy), var18 (copy)
				if not p21 then
					return {}
				elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4(false))[var131] or {}) == 0 and not set.has(p21, var131) then
					return p21
				end
				local var132 = var17(false)
				
				if var132[var131] then
					local var133 = var132[var131]
					var20(function(p22)
						-- upvalues: dictionary (copy), var133 (ref)
						return dictionary.removeKey(p22, var133)
					end)
					var18(function(p22)
						-- upvalues: dictionary (copy), var131 (copy)
						return dictionary.removeKey(p22, var131)
					end)
				end
				return set.subtract(p21, var131)
			end)
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doHandlePlayerRemoved)
			
			return
		elseif fFlagExpChatMessagesStoreUseProxyModule then
			var6[var131] = nil
		else
			var5(function(p21)
				-- upvalues: dictionary (copy), var131 (ref)
				return dictionary.removeKey(p21, var131)
			end)
		end
		if fFlagExpChatMessagesStoreMemoryCleanupModule then
			t_4[var131] = nil
		end
		var12(function(p21)
			-- upvalues: set (copy), var131 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var17 (copy), var20 (copy), dictionary (copy), var18 (copy)
			if not p21 then
				return {}
			elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4(false))[var131] or {}) == 0 and not set.has(p21, var131) then
				return p21
			end
			local var132 = var17(false)
			
			if var132[var131] then
				local var133 = var132[var131]
				var20(function(p22)
					-- upvalues: dictionary (copy), var133 (ref)
					return dictionary.removeKey(p22, var133)
				end)
				var18(function(p22)
					-- upvalues: dictionary (copy), var131 (copy)
					return dictionary.removeKey(p22, var131)
				end)
			end
			return set.subtract(p21, var131)
		end)
	end
	
	local function muteUser(p20)
		-- upvalues: var12 (ref), set (copy)
		var12(function(p21)
			-- upvalues: set (copy), p20 (ref)
			return if p21 then set.add(p21, p20) else {}
		end)
	end
	
	local function unmuteUser(p20)
		-- upvalues: var12 (ref), set (copy)
		var12(function(p21)
			-- upvalues: set (copy), p20 (ref)
			return if p21 then set.subtract(p21, p20) else {}
		end)
	end
	
	local function clearWindowMessages()
		-- upvalues: forEachByMessageId (ref), dictionary (copy), var8 (ref), var10 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var26 (ref), var27 (write), var28 (write), var23 (ref), t_1 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local function doClearWindowMessages()
			-- upvalues: forEachByMessageId (copy), dictionary (copy), var8 (copy), var10 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var26 (copy), var27 (copy), var28 (copy), var23 (copy), t_1 (copy)
			forEachByMessageId(function(_, p20)
				-- upvalues: dictionary (copy)
				return dictionary.join(p20, { isVisibleInChatWindow = false })
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
					local var131 = t_1[v]
					
					if var131 then
						var131.setter(nil)
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
			forEachByMessageId(function(_, p20)
				-- upvalues: dictionary (copy)
				return if p20 and p20.isHiddenMessage then dictionary.join(p20, { isVisibleInChatWindow = false }) else nil
			end)
			
			local function isNotHidden(p20)
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy)
				local var131 = (if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false))[p20]
				
				return var131 and not var131.isHiddenMessage
			end
			
			var8(function(p20)
				-- upvalues: list (copy), isNotHidden (ref)
				return list.filter(p20, isNotHidden)
			end)
			var10(function(p20)
				-- upvalues: dictionary (copy), list (copy), isNotHidden (ref)
				return dictionary.map(p20, function(p21)
					-- upvalues: list (copy), isNotHidden (copy)
					return list.filter(p21, isNotHidden)
				end)
			end)
			
			return
		end
	end
	
	local function rebuildMessageWithTranslation(p20, p21)
		-- upvalues: isBorderlessBubbleChatEnabledModule (copy), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPresetChatEnabled (copy), fFlagExpChatRenderHistoricalMessagesModule (copy)
		return {
			prefixText = p20.prefixText,
			text = p20.text,
			translation = p20.translation,
			useTranslation = p21,
			messageId = p20.messageId,
			status = p20.status,
			timestamp = p20.timestamp,
			bubbleChatReceivedAtMillis = if isBorderlessBubbleChatEnabledModule() then p20.bubbleChatReceivedAtMillis else nil,
			isVisibleInBubbleChat = p20.isVisibleInBubbleChat,
			isVisibleInChatWindow = p20.isVisibleInChatWindow,
			partOrModel = p20.partOrModel,
			shouldOverrideBubbleChatSettings = p20.shouldOverrideBubbleChatSettings,
			bubbleChatMessageProperties = p20.bubbleChatMessageProperties,
			chatWindowMessageProperties = p20.chatWindowMessageProperties,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p20.textChatMessageInstance else nil,
			userId = p20.userId,
			textChannel = p20.textChannel,
			wasRewritten = if fFlagEnableInExpChatRewriteModule then p20.wasRewritten else nil,
			originalText = if fFlagEnableInExpChatRewriteModule then p20.originalText else nil,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p20.chatActionType else nil,
			presetId = if fFlagExpChatPresetChatEnabled then p20.presetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then p20.presetChatVersion else nil,
			isHistorical = if fFlagExpChatRenderHistoricalMessagesModule then p20.isHistorical else nil
		}
	end
	
	local function toggleGlobalTranslation(p20)
		-- upvalues: forEachByMessageId (ref), rebuildMessageWithTranslation (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local function doToggleGlobalTranslation()
			-- upvalues: forEachByMessageId (copy), rebuildMessageWithTranslation (copy), p20 (ref)
			forEachByMessageId(function(_, p21)
				-- upvalues: rebuildMessageWithTranslation (copy), p20 (copy)
				return rebuildMessageWithTranslation(p21, p20)
			end)
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doToggleGlobalTranslation)
			
			return
		end
		forEachByMessageId(function(_, p21)
			-- upvalues: rebuildMessageWithTranslation (copy), p20 (ref)
			return rebuildMessageWithTranslation(p21, p20)
		end)
	end
	
	local function toggleMessageTranslation(p20, p21)
		-- upvalues: rebuildMessageWithTranslation (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var2 (ref), dictionary (copy)
		local var131 = function(p22)
			-- upvalues: rebuildMessageWithTranslation (copy), p20 (ref)
			return rebuildMessageWithTranslation(p22, p20)
		end
		
		if fFlagExpChatMessagesStoreUseProxyModule then
			local var132 = var3[p21]
			
			if var132 then
				local var133 = rebuildMessageWithTranslation(var132, p20)
				
				if var133 then
					var3[p21] = var133
					
					return
				end
			end
		else
			var2(function(p22)
				-- upvalues: p21 (ref), var131 (ref), dictionary (copy)
				if p22 and p22[p21] then
					local var134 = var131(p22[p21])
					
					return if var134 then dictionary.join(p22, { [p21] = var134 }) else p22
				end
				return p22 or {}
			end)
		end
	end
	
	local function handleLegacyBubbleCreated(p20)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), isBorderlessBubbleChatEnabledModule (copy), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (ref), keepHistoricalFlag (ref), var7 (ref), t (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var9 (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), insertWindowMessageIdInOrder (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (ref), var33 (write), updateNextMessageComponent (write), var32 (write), var31 (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local timestamp = p20.timestamp
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
			userId = p20.userId,
			text = p20.text,
			messageId = p20.id,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = if timestamp then DateTime.fromUnixTimestampMillis(timestamp) else DateTime.now(),
			partOrModel = p20.adornee
		}
		
		local var131 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), isBorderlessBubbleChatEnabledModule (copy), t_1 (ref), getServerTimeNowMillisModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), fFlagExpChatRenderHistoricalMessagesModule (copy), writeByMessageId (copy), keepHistoricalFlag (copy), var7 (copy), t (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var9 (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), insertWindowMessageIdInOrder (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var29 (copy), var33 (copy), updateNextMessageComponent (copy), var32 (copy), var31 (copy)
			local var132 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if isBorderlessBubbleChatEnabledModule() then
				local messageId = var132 and var132[t_1.messageId]
				t_1.bubbleChatReceivedAtMillis = if messageId then messageId.bubbleChatReceivedAtMillis else getServerTimeNowMillisModule()
			end
			if var132 and var132[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p21)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p21, function(p22)
							-- upvalues: t_1 (copy)
							return p22 ~= t_1.messageId
						end)
					end)
					local var133 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var133 then
						var10(function(p21)
							-- upvalues: var133 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var134 = p21[var133]
							
							return if var134 then dictionary.join(p21, {
								[var133] = list.filter(var134, function(p22)
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
						
						local var134 = function(p21)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p21 then
								local var135 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
									-- upvalues: t_1 (copy)
									return p22 ~= t_1.messageId
								end) else list.filter(p21, function(p22)
									-- upvalues: t_1 (copy)
									return p22.messageId ~= t_1.messageId
								end)
								
								return if #var135 == 0 then nil else var135
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var134(var6[userId])
							
							return
						end
						var5(function(p21)
							-- upvalues: var134 (ref), userId (ref), dictionary (copy)
							local var135 = var134(p21[userId])
							
							return if var135 == nil then dictionary.removeKey(p21, userId) else dictionary.join(p21, { [userId] = var135 })
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
					
					local var135 = function(p21)
						-- upvalues: t_1 (copy), list (copy)
						if not p21 then
							return nil
						end
						local var136 = nil
						
						for i, v in ipairs(p21) do
							if v.messageId == t_1.messageId then break end
						end
						return if var136 then list.set(p21, var136, t_1) else p21
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId] = var135(var6[userId])
						
						return
					end
					var5(function(p22)
						-- upvalues: var135 (ref), userId (ref), dictionary (copy)
						local var137 = var135(p22[userId])
						
						return if var137 == nil then dictionary.removeKey(p22, userId) else dictionary.join(p22, { [userId] = var137 })
					end)
				end
				return
			elseif fFlagExpChatRenderHistoricalMessagesModule then
				local var136 = t_1
				
				if var136.isHistorical == true and (var136.isVisibleInChatWindow and t.messageLimit <= #var7(false)) then return end
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
			local var137 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
			local var138 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var137.channelNameOverride then
				var138 = var137.channelNameOverride
			elseif var137.textChannel then
				var138 = if var137.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var137.textChannel.Name
			end
			if var137.isVisibleInChatWindow then
				local var139 = var7(false)
				local var140 = if var138 then var9(false)[var138] or {} else {}
				
				if t.messageLimit <= #var139 then
					local var141 = var139[1]
					local var142 = var132 and var132[var141]
					
					if var142 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var141] = nil
							else
								var2(function(p21)
									-- upvalues: dictionary (copy), var141 (ref)
									return dictionary.removeKey(p21, var141)
								end)
							end
						end
						if var142.userId then
							local userId_1 = var142.userId
							
							local var143 = function(p21)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var141 (ref), var17 (copy), var142 (ref), var20 (copy), dictionary (copy), var18 (copy)
								if not p21 then
									return nil
								end
								local var144 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p21, function(p22)
									-- upvalues: var141 (copy)
									return p22 ~= var141
								end) else list.filter(p21, function(p22)
									-- upvalues: var141 (copy)
									return p22.messageId ~= var141
								end)
								
								if #var144 ~= 0 then
									return var144
								end
								local var145 = var17(false)
								
								if var145[var142.userId] then
									local userId = var145[var142.userId]
									var20(function(p22)
										-- upvalues: dictionary (copy), userId (ref)
										return dictionary.removeKey(p22, userId)
									end)
									var18(function(p22)
										-- upvalues: dictionary (copy), var142 (copy)
										return dictionary.removeKey(p22, var142.userId)
									end)
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId_1] = var143(var6[userId_1])
							else
								var5(function(p21)
									-- upvalues: var143 (ref), userId_1 (ref), dictionary (copy)
									local var144 = var143(p21[userId_1])
									
									return if var144 == nil then dictionary.removeKey(p21, userId_1) else dictionary.join(p21, { [userId_1] = var144 })
								end)
							end
						end
						var8(function(p21)
							-- upvalues: list (copy)
							return list.removeIndex(p21, 1)
						end)
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var141] = nil
						end
					end
				end
				if var138 and t.messageLimit <= #var140 then
					local var144 = var140[1]
					
					if var144 then
						var10(function(p21)
							-- upvalues: var138 (write), list (copy), dictionary (copy)
							return dictionary.join(p21, { [var138] = list.removeIndex(p21[var138] or {}, 1) })
						end)
						
						if var132 and var132[var144] then
							if fFlagExpChatMessagesStoreUseProxyModule then
								var3[var144] = nil
							else
								var2(function(p21)
									-- upvalues: dictionary (copy), var144 (ref)
									return dictionary.removeKey(p21, var144)
								end)
							end
						end
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							t_3[var144] = nil
						end
					end
				end
			end
			writeByMessageId(var137.messageId, var137)
			
			if var137.userId then
				local userId_1 = var137.userId
				
				local var145 = function(p21)
					-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var137 (ref), list (copy)
					local p22 = p21 or {}
					local var146 = false
					
					if fFlagExpChatMessagesStoreMemoryCleanupModule then
						for i, v in ipairs(p22) do
							if v == var137.messageId then
								var146 = true
							end
						end
					else
						for i, v in ipairs(p22) do
							if v.messageId == var137.messageId then
								local var146 = true
								break
							end
						end
					end
					return if var146 then p22 else list.append(p22, if fFlagExpChatMessagesStoreMemoryCleanupModule then var137.messageId else var137)
				end
				
				if fFlagExpChatMessagesStoreUseProxyModule then
					var6[userId_1] = var145(var6[userId_1])
				else
					var5(function(p23)
						-- upvalues: var145 (ref), userId_1 (ref), dictionary (copy)
						local var147 = var145(p23[userId_1])
						
						return if var147 == nil then dictionary.removeKey(p23, userId_1) else dictionary.join(p23, { [userId_1] = var147 })
					end)
				end
			end
			local var147 = false
			
			if var137.isVisibleInChatWindow then
				var8(function(p23)
					-- upvalues: insertWindowMessageIdInOrder (copy), var137 (ref), var147 (write)
					local var148 = insertWindowMessageIdInOrder(p23, var137.messageId, var137.isHistorical)
					var147 = var147 or var148[#var148] ~= var137.messageId
					
					return var148
				end)
				
				if var138 then
					var10(function(p23)
						-- upvalues: var138 (write), insertWindowMessageIdInOrder (copy), var137 (ref), var147 (write), dictionary (copy)
						local var148 = insertWindowMessageIdInOrder(p23[var138] or {}, var137.messageId, var137.isHistorical)
						var147 = var147 or var148[#var148] ~= var137.messageId
						
						return dictionary.join(p23, { [var138] = var148 })
					end)
				end
				if fFlagExpChatEnableV2ChatWindowModule then
					local var148 = var29(false)
					
					if if var148 ~= nil then var138 == var148 else true then
						local messageId = var137.messageId
						
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
			signalsExperimentalModule.batch(var131)
			
			return
		end
		var131()
	end
	
	updateNextMessageComponent = function(p21)
		-- upvalues: var23 (ref), var25 (ref), var26 (ref), t_1 (ref), fFlagEnableInExpChatRewriteModule (copy), t_2 (ref), fFlagExpChatRenderHistoricalMessagesModule (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), var28 (write), var27 (write)
		local var146 = var23(false)
		
		if #var146 == 0 then return end
		local var147 = var25(false)
		local var148 = var146[var147]
		
		if not var148 then
			var26(1)
			
			return
		end
		local var149 = t_1[var148]
		
		if var149 then
			var149.setter(p21)
		end
		local var150 = if fFlagEnableInExpChatRewriteModule then 10 else 1
		local var151 = t_2[var148]
		
		if fFlagExpChatRenderHistoricalMessagesModule then
			local var152 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			local var153 = var152 and var152[p21]
			
			if var153 ~= nil and var153.isHistorical == true then
				var28 += var150
				
				if var151 then
					var151.setter(var28 + -1000000)
				end
			else
				var27 += var150
				
				if var151 then
					var151.setter(var27)
				end
			end
			var26(var147 % #var146 + 1)
		end
	end
	
	return {
		getByMessageId = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1,
		getMessages = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else createComputed(function(p21)
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
			local var146 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p21) else var1(p21)
			
			if not var146 then
				return {}
			end
			local t = {}
			
			for i, v in var146 do
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
		registerMessageComponent = function(p22)
			-- upvalues: t_1 (ref), createSignal (copy), t_2 (ref), var24 (ref), list (copy)
			if not t_1[p22] then
				local var147, var148 = createSignal(nil)
				t_1[p22] = { getter = var147, setter = var148 }
				local var149, var150 = createSignal(0)
				t_2[p22] = { getter = var149, setter = var150 }
				var24(function(p23)
					-- upvalues: list (copy), p22 (ref)
					return list.append(p23, p22)
				end)
			end
			return t_1[p22].getter
		end,
		unregisterMessageComponent = function(p22)
			-- upvalues: var23 (ref), t_1 (ref), t_2 (ref), var24 (ref), list (copy), var25 (ref), var26 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
			local var147 = nil
			
			for i, v in ipairs(var23(false)) do
				if v == p22 then
					var147 = i
					break
				end
			end
			if t_1[p22] then
				t_1[p22] = nil
			end
			if t_2[p22] then
				t_2[p22] = nil
			end
			if var147 then
				local function doUnregister()
					-- upvalues: var24 (copy), list (copy), p22 (ref), var23 (copy), var25 (copy), var26 (copy), var147 (write)
					var24(function(p23)
						-- upvalues: list (copy), p22 (copy)
						return list.filter(p23, function(p24)
							-- upvalues: p22 (copy)
							return p24 ~= p22
						end)
					end)
					local var148 = var23(false)
					local var149 = var25(false)
					
					if #var148 == 0 then
						var26(1)
						
						return
					elseif var147 < var149 then
						var26(var149 - 1)
						
						return
					elseif #var148 < var149 then
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
				local var148 = var29(false)
				local _ = nil
				local var149 = if var148 then var9(false)[var148] or {} else var7(false)
				var26(1)
				var27 = 0
				var28 = 0
				
				for i, v in ipairs(var149) do
					updateNextMessageComponent(v)
				end
				local var150 = var23(false)
				
				if #var149 < #var150 then
					for i_1 = var25(false), #var150 do
						local var151 = t_1[var150[i_1]]
						
						if var151 then
							var151.setter(nil)
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
			local var152 = t_1[value]
			
			return if var152 then var152.getter else nil
		end,
		getLayoutOrderSignal = function(value)
			-- upvalues: t_2 (ref)
			local var152 = t_2[value]
			
			return if var152 then var152.getter else nil
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
		handleLegacyBubbleTextUpdated = function(p23, p24)
			-- upvalues: dictionary (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var2 (ref)
			local var152 = function(p25)
				-- upvalues: dictionary (copy), p24 (ref)
				return dictionary.join(p25, { text = p24 })
			end
			
			if fFlagExpChatMessagesStoreUseProxyModule then
				local var153 = var3[p23]
				
				if var153 then
					local var154 = dictionary.join(var153, { text = p24 })
					
					if var154 then
						var3[p23] = var154
						
						return
					end
				end
			else
				var2(function(p25)
					-- upvalues: p23 (ref), var152 (ref), dictionary (copy)
					if p25 and p25[p23] then
						local var155 = var152(p25[p23])
						
						return if var155 then dictionary.join(p25, { [p23] = var155 }) else p25
					end
					return p25 or {}
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