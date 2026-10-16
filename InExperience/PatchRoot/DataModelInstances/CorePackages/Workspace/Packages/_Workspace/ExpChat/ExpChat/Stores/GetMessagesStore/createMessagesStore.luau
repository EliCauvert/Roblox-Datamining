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

function getChatTranslationEnabled()
	-- upvalues: textChatService (ref)
	return textChatService.ChatTranslationEnabled
end

return function(p1)
	-- upvalues: createSignal (ref), fFlagExpChatMessagesStoreUseProxyModule (ref), createProxy (ref), createComputed (ref), dictionary (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatMessagesStoreBatchModule (ref), signalsExperimentalModule (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (ref), list (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (ref), httpService (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (ref), fFlagExpChatEnableV2ChatWindowModule (ref), set (ref), sanitizeForRichTextModule (ref), getFFlagExpChatSyntheticSystemMessageRichText (ref), generateRichSystemMessageTextFormatModule (ref), fFlagExpChatDictation (ref), computeNameColor (ref), playersService (ref), fFlagEnableInExpChatRewriteModule (ref), getTextAndTranslationModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), isWhiteSpaceOnlyModule (ref), fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), expChatSharedModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatDisableUniverseBubbleChat (ref), fFlagExpChatGlobalTabDefaultModule (ref), isGlobalBubbleChatEnabledModule (ref), shouldRenderTextChannelInDefaultWindow (ref), getTextChannelDisplayMode (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), fIntExpChatRandomCharChangeLowerBoundModule (ref), fIntExpChatRandomCharChangeUpperBoundModule (ref), configModule (ref), fFlagExpChatClearHiddenMessagesPostAgeCheckModule (ref)
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
	local t_2 = {}
	local var28, var29 = createSignal(nil)
	local updateNextMessageComponent = nil
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
			local var30 = var3[p3]
			
			if var30 then
				local var31 = p4(var30)
				
				if var31 then
					var3[p3] = var31
					
					return
				end
			end
		else
			var2(function(p5)
				-- upvalues: p3 (ref), p4 (ref), dictionary (copy)
				if not p5 or not p5[p3] then
					return p5 or {}
				end
				local var32 = p4(p5[p3])
				
				return if var32 then dictionary.join(p5, { [p3] = var32 }) else p5
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
			local var30 = var3[i]
			
			if var30 then
				local var31 = p3(i, var30)
				
				if var31 then
					var3[i] = var31
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
			local var32 = p5(p6[p4])
			
			return if var32 == nil then dictionary.removeKey(p6, p4) else dictionary.join(p6, { [p4] = var32 })
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
	
	local _ = function(p4)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), writeByMessageId (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var7 (ref), var9 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var32 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), p4 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), writeByMessageId (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var7 (copy), var9 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (copy), updateNextMessageComponent (copy)
			local var33 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if var33 and var33[p4.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (p4.status == Enum.TextChatMessageStatus.Floodchecked or p4.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p5)
						-- upvalues: list (copy), p4 (copy)
						return list.filter(p5, function(p6)
							-- upvalues: p4 (copy)
							return p6 ~= p4.messageId
						end)
					end)
					local var34 = resolveChannelNameForMapOrder(p4, p4.channelNameOverride)
					
					if var34 then
						var10(function(p5)
							-- upvalues: var34 (ref), list (copy), p4 (copy), dictionary (copy)
							local var35 = p5[var34]
							
							return if var35 then dictionary.join(p5, {
								[var34] = list.filter(var35, function(p6)
									-- upvalues: p4 (copy)
									return p6 ~= p4.messageId
								end)
							}) else p5
						end)
					end
					local messageId = p4.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p5)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p5, messageId)
						end)
					end
					if p4.userId then
						local userId = p4.userId
						
						local var35 = function(p5)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), p4 (copy)
							if not p5 then
								return nil
							end
							local var36 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p5, function(p6)
								-- upvalues: p4 (copy)
								return p6 ~= p4.messageId
							end) else list.filter(p5, function(p6)
								-- upvalues: p4 (copy)
								return p6.messageId ~= p4.messageId
							end)
							
							return if #var36 == 0 then nil else var36
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var35(var6[userId])
							
							return
						end
						var5(function(p5)
							-- upvalues: var35 (ref), userId (ref), dictionary (copy)
							local var36 = var35(p5[userId])
							
							return if var36 == nil then dictionary.removeKey(p5, userId) else dictionary.join(p5, { [userId] = var36 })
						end)
					end
					return
				else
					writeByMessageId(p4.messageId, p4)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and p4.userId then
						local userId = p4.userId
						
						local var36 = function(p5)
							-- upvalues: p4 (copy), list (copy)
							if not p5 then
								return nil
							end
							local var37 = nil
							
							for i, v in ipairs(p5) do
								if v.messageId == p4.messageId then
									var37 = i
									break
								end
							end
							return if var37 then list.set(p5, var37, p4) else p5
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var36(var6[userId])
							
							return
						end
						var5(function(p6)
							-- upvalues: var36 (ref), userId (ref), dictionary (copy)
							local var38 = var36(p6[userId])
							
							return if var38 == nil then dictionary.removeKey(p6, userId) else dictionary.join(p6, { [userId] = var38 })
						end)
					end
					return
				end
			else
				local userId = p4.userId
				local partOrModel = p4.partOrModel
				
				if not userId and partOrModel then
					userId = var19(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var18(function(p5)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p5, { [userId] = partOrModel })
						end)
						var20(function(p5)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p5, { [partOrModel] = userId })
						end)
					end
				end
				local var37 = if userId ~= p4.userId then p4 else dictionary.join(p4, { userId = userId })
				local var38 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var37.channelNameOverride then
					var38 = var37.channelNameOverride
				elseif var37.textChannel then
					var38 = if var37.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var37.textChannel.Name
				end
				if var37.isVisibleInChatWindow then
					local var39 = var7(false)
					local var40 = if var38 then var9(false)[var38] or {} else {}
					
					if t.messageLimit <= #var39 then
						local var41 = var39[1]
						local var42 = var33 and var33[var41]
						
						if var42 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var41] = nil
								else
									var2(function(p5)
										-- upvalues: dictionary (copy), var41 (ref)
										return dictionary.removeKey(p5, var41)
									end)
								end
							end
							if var42.userId then
								local userId_1 = var42.userId
								
								local var43 = function(p5)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var41 (ref), var17 (copy), var42 (ref), var20 (copy), dictionary (copy), var18 (copy)
									if not p5 then
										return nil
									end
									local var44 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p5, function(p6)
										-- upvalues: var41 (copy)
										return p6 ~= var41
									end) else list.filter(p5, function(p6)
										-- upvalues: var41 (copy)
										return p6.messageId ~= var41
									end)
									
									if #var44 ~= 0 then
										return var44
									end
									local var45 = var17(false)
									
									if var45[var42.userId] then
										local userId = var45[var42.userId]
										var20(function(p6)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p6, userId)
										end)
										var18(function(p6)
											-- upvalues: dictionary (copy), var42 (copy)
											return dictionary.removeKey(p6, var42.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var6[userId_1] = var43(var6[userId_1])
								else
									var5(function(p5)
										-- upvalues: var43 (ref), userId_1 (ref), dictionary (copy)
										local var44 = var43(p5[userId_1])
										
										return if var44 == nil then dictionary.removeKey(p5, userId_1) else dictionary.join(p5, { [userId_1] = var44 })
									end)
								end
							end
							var8(function(p5)
								-- upvalues: list (copy)
								return list.removeIndex(p5, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var41] = nil
							end
						end
					end
					if var38 and t.messageLimit <= #var40 then
						local var44 = var40[1]
						
						if var44 then
							var10(function(p5)
								-- upvalues: var38 (write), list (copy), dictionary (copy)
								return dictionary.join(p5, { [var38] = list.removeIndex(p5[var38] or {}, 1) })
							end)
							
							if var33 and var33[var44] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var44] = nil
								else
									var2(function(p5)
										-- upvalues: dictionary (copy), var44 (ref)
										return dictionary.removeKey(p5, var44)
									end)
								end
							end
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var44] = nil
							end
						end
					end
				end
				writeByMessageId(var37.messageId, var37)
				
				if var37.userId then
					local userId_1 = var37.userId
					
					local var45 = function(p5)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var37 (ref), list (copy)
						p5 = p5 or {}
						local var46 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p5) do
								if v == var37.messageId then
									var46 = true
								end
							end
						else
							for i, v in ipairs(p5) do
								if v.messageId == var37.messageId then
									var46 = true
									break
								end
							end
						end
						return if var46 then p5 else list.append(p5, if fFlagExpChatMessagesStoreMemoryCleanupModule then var37.messageId else var37)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId_1] = var45(var6[userId_1])
					else
						var5(function(p6)
							-- upvalues: var45 (ref), userId_1 (ref), dictionary (copy)
							local var47 = var45(p6[userId_1])
							
							return if var47 == nil then dictionary.removeKey(p6, userId_1) else dictionary.join(p6, { [userId_1] = var47 })
						end)
					end
				end
				if var37.isVisibleInChatWindow then
					var8(function(p6)
						-- upvalues: list (copy), var37 (ref)
						return list.append(p6, var37.messageId)
					end)
					
					if var38 then
						var10(function(p6)
							-- upvalues: var38 (write), list (copy), var37 (ref), dictionary (copy)
							return dictionary.join(p6, {
								[var38] = list.append(p6[var38] or {}, var37.messageId)
							})
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var47 = var28(false)
						
						if if var47 ~= nil then var38 == var47 else true then
							updateNextMessageComponent(var37.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var32)
			
			return
		end
		var32()
	end
	
	local t_4 = {}
	
	local function getMessage(p5)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), t_3 (ref), createComputed (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			return function(p6)
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), p5 (ref)
				return (if fFlagExpChatMessagesStoreUseProxyModule then var3(p6) else var1(p6))[p5]
			end
		elseif not t_3[p5] then
			t_3[p5] = createComputed(function(p6)
				-- upvalues: var1 (copy), p5 (ref)
				local var46 = var1(p6)
				
				return if var46 and var46[p5] then var46[p5] else nil
			end)
		end
		return t_3[p5]
	end
	
	local function getUserMessageCache(p5)
		-- upvalues: t_4 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), createComputed (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var4 (ref), var3 (ref), var1 (ref), var13 (ref), set (copy)
		local var46 = tostring(p5)
		
		if not t_4[var46] then
			t_4[var46] = {}
			
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var46].messages = createComputed(function(p6)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var46 (ref)
					return (if fFlagExpChatMessagesStoreUseProxyModule then var6(p6) else var4(p6))[var46] or {}
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var46].bubbleMessages = createComputed(function(p6)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var46 (ref), var3 (copy), var1 (copy), var13 (copy), set (copy)
					local var47 = (if fFlagExpChatMessagesStoreUseProxyModule then var6(p6) else var4(p6))[var46] or {}
					local var48 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p6) else var1(p6)
					local var49 = var13(p6)
					local t = {}
					
					for i, v in ipairs(var47) do
						local var50 = var48[v]
						
						if var50 then
							if var50.isVisibleInBubbleChat and not (var50.userId and set.has(var49, var50.userId) or false) then
								table.insert(t, var50)
							end
						end
					end
					return t
				end)
			else
				t_4[var46].bubbleMessages = createComputed(function(p7)
					-- upvalues: t_4 (copy), var46 (ref), var13 (copy), set (copy)
					local var51 = t_4[var46].messages(p7)
					local var52 = var13(p7)
					local t = {}
					
					for i, v in ipairs(var51) do
						if v.isVisibleInBubbleChat and not (v.userId and set.has(var52, v.userId) or false) then
							table.insert(t, v)
						end
					end
					return t
				end)
			end
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var46].lastMessage = createComputed(function(p7)
					-- upvalues: t_4 (copy), var46 (ref)
					local var51 = t_4[var46].messages(p7)
					
					return if #var51 > 0 then var51[#var51] else nil
				end)
			end
		end
		return t_4[var46]
	end
	
	local function getUserMessages(p6)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p6).messages
	end
	
	local function getUserBubbleMessages(p6)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p6).bubbleMessages
	end
	
	local function getUserLastMessage(p6)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p6).lastMessage
	end
	
	local _ = function()
		-- upvalues: createComputed (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
		return createComputed(function(p6)
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy)
			local var47 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p6) else var1(p6)
			
			if not var47 then
				return {}
			end
			local t = {}
			
			for i, v in var47 do
				table.insert(t, v)
			end
			return t
		end)
	end
	
	local function addSystemMessage(p6, p7, p8, p9, p10, p11)
		-- upvalues: sanitizeForRichTextModule (copy), getFFlagExpChatSyntheticSystemMessageRichText (copy), generateRichSystemMessageTextFormatModule (copy), fFlagExpChatDictation (copy), httpService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), writeByMessageId (ref), var19 (ref), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var7 (ref), var9 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var47 = sanitizeForRichTextModule(p6)
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
			text = if getFFlagExpChatSyntheticSystemMessageRichText() then generateRichSystemMessageTextFormatModule(var47, if fFlagExpChatDictation then p10 else nil, p9) else var47,
			messageId = httpService:GenerateGUID(false),
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			textChannel = p11,
			channelNameOverride = if p11 ~= nil then p7 else nil,
			metadata = p8
		}
		
		local var48 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), writeByMessageId (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var7 (copy), var9 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (copy), updateNextMessageComponent (copy)
			local var49 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if var49 and var49[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p12)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p12, function(p13)
							-- upvalues: t_1 (copy)
							return p13 ~= t_1.messageId
						end)
					end)
					local var50 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var50 then
						var10(function(p12)
							-- upvalues: var50 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var51 = p12[var50]
							
							return if var51 then dictionary.join(p12, {
								[var50] = list.filter(var51, function(p13)
									-- upvalues: t_1 (copy)
									return p13 ~= t_1.messageId
								end)
							}) else p12
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p12)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p12, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var51 = function(p12)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p12 then
								local var52 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p12, function(p13)
									-- upvalues: t_1 (copy)
									return p13 ~= t_1.messageId
								end) else list.filter(p12, function(p13)
									-- upvalues: t_1 (copy)
									return p13.messageId ~= t_1.messageId
								end)
								
								return if #var52 == 0 then nil else var52
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var51(var6[userId])
							
							return
						end
						var5(function(p12)
							-- upvalues: var51 (ref), userId (ref), dictionary (copy)
							local var52 = var51(p12[userId])
							
							return if var52 == nil then dictionary.removeKey(p12, userId) else dictionary.join(p12, { [userId] = var52 })
						end)
					end
					return
				else
					writeByMessageId(t_1.messageId, t_1)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
						local userId = t_1.userId
						
						local var52 = function(p12)
							-- upvalues: t_1 (copy), list (copy)
							if not p12 then
								return nil
							end
							local var53 = nil
							
							for i, v in ipairs(p12) do
								if v.messageId == t_1.messageId then break end
							end
							return if var53 then list.set(p12, var53, t_1) else p12
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var52(var6[userId])
							
							return
						end
						var5(function(p13)
							-- upvalues: var52 (ref), userId (ref), dictionary (copy)
							local var54 = var52(p13[userId])
							
							return if var54 == nil then dictionary.removeKey(p13, userId) else dictionary.join(p13, { [userId] = var54 })
						end)
					end
					return
				end
			else
				local userId = t_1.userId
				local partOrModel = t_1.partOrModel
				
				if not userId and partOrModel then
					userId = var19(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var18(function(p12)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p12, { [userId] = partOrModel })
						end)
						var20(function(p12)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p12, { [partOrModel] = userId })
						end)
					end
				end
				local var53 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var54 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var53.channelNameOverride then
					var54 = var53.channelNameOverride
				elseif var53.textChannel then
					var54 = if var53.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var53.textChannel.Name
				end
				if var53.isVisibleInChatWindow then
					local var55 = var7(false)
					local var56 = if var54 then var9(false)[var54] or {} else {}
					
					if t.messageLimit <= #var55 then
						local var57 = var55[1]
						local var58 = var49 and var49[var57]
						
						if var58 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var57] = nil
								else
									var2(function(p12)
										-- upvalues: dictionary (copy), var57 (ref)
										return dictionary.removeKey(p12, var57)
									end)
								end
							end
							if var58.userId then
								local userId_1 = var58.userId
								
								local var59 = function(p12)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var57 (ref), var17 (copy), var58 (ref), var20 (copy), dictionary (copy), var18 (copy)
									if not p12 then
										return nil
									end
									local var60 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p12, function(p13)
										-- upvalues: var57 (copy)
										return p13 ~= var57
									end) else list.filter(p12, function(p13)
										-- upvalues: var57 (copy)
										return p13.messageId ~= var57
									end)
									
									if #var60 ~= 0 then
										return var60
									end
									local var61 = var17(false)
									
									if var61[var58.userId] then
										local userId = var61[var58.userId]
										var20(function(p13)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p13, userId)
										end)
										var18(function(p13)
											-- upvalues: dictionary (copy), var58 (copy)
											return dictionary.removeKey(p13, var58.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var6[userId_1] = var59(var6[userId_1])
								else
									var5(function(p12)
										-- upvalues: var59 (ref), userId_1 (ref), dictionary (copy)
										local var60 = var59(p12[userId_1])
										
										return if var60 == nil then dictionary.removeKey(p12, userId_1) else dictionary.join(p12, { [userId_1] = var60 })
									end)
								end
							end
							var8(function(p12)
								-- upvalues: list (copy)
								return list.removeIndex(p12, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var57] = nil
							end
						end
					end
					if var54 and t.messageLimit <= #var56 then
						local var60 = var56[1]
						
						if var60 then
							var10(function(p12)
								-- upvalues: var54 (write), list (copy), dictionary (copy)
								return dictionary.join(p12, { [var54] = list.removeIndex(p12[var54] or {}, 1) })
							end)
							
							if var49 and var49[var60] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var60] = nil
								else
									var2(function(p12)
										-- upvalues: dictionary (copy), var60 (ref)
										return dictionary.removeKey(p12, var60)
									end)
								end
							end
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var60] = nil
							end
						end
					end
				end
				writeByMessageId(var53.messageId, var53)
				
				if var53.userId then
					local userId_1 = var53.userId
					
					local var61 = function(p12)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var53 (ref), list (copy)
						local p13 = p12 or {}
						local var62 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p13) do
								if v == var53.messageId then
									var62 = true
								end
							end
						else
							for i, v in ipairs(p13) do
								if v.messageId == var53.messageId then
									local var62 = true
									break
								end
							end
						end
						return if var62 then p13 else list.append(p13, if fFlagExpChatMessagesStoreMemoryCleanupModule then var53.messageId else var53)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId_1] = var61(var6[userId_1])
					else
						var5(function(p14)
							-- upvalues: var61 (ref), userId_1 (ref), dictionary (copy)
							local var63 = var61(p14[userId_1])
							
							return if var63 == nil then dictionary.removeKey(p14, userId_1) else dictionary.join(p14, { [userId_1] = var63 })
						end)
					end
				end
				if var53.isVisibleInChatWindow then
					var8(function(p14)
						-- upvalues: list (copy), var53 (ref)
						return list.append(p14, var53.messageId)
					end)
					
					if var54 then
						var10(function(p14)
							-- upvalues: var54 (write), list (copy), var53 (ref), dictionary (copy)
							return dictionary.join(p14, {
								[var54] = list.append(p14[var54] or {}, var53.messageId)
							})
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var63 = var28(false)
						
						if if var63 ~= nil then var54 == var63 else true then
							updateNextMessageComponent(var53.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var48)
			
			return
		end
		var48()
	end
	
	local function formatPrefixForUniverseChatTabs(value, p12, p13)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), computeNameColor (copy), playersService (copy)
		return if getFFlagTextChatEnableUniverseChatTabs() and p12 and #value ~= 0 then `<font color="#{(if p97.TextSource then computeNameColor(p97.TextSource.Username) else computeNameColor(if playersService.LocalPlayer then playersService.LocalPlayer.Name else "")):ToHex()}">{value}</font>` else value
	end
	
	local function handleIncomingOrOutgoingMessage(a, b, p12, p13)
		-- upvalues: fFlagEnableInExpChatRewriteModule (copy), getTextAndTranslationModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), isWhiteSpaceOnlyModule (copy), fFlagExpChatFixLocalUserVerifiedBadgeModule (copy), playersService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), var14 (ref), fFlagExpChatPresetChatEnabled (copy), var13 (ref), set (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), expChatSharedModule (copy), var16 (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatDisableUniverseBubbleChat (copy), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatGlobalTabDefaultModule (copy), isGlobalBubbleChatEnabledModule (copy), shouldRenderTextChannelInDefaultWindow (copy), getTextChannelDisplayMode (copy), formatPrefixForUniverseChatTabs (ref), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), writeByMessageId (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), var21 (ref), var7 (ref), var9 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var62, var63
		local _ = nil
		local _ = nil
		
		if fFlagEnableInExpChatRewriteModule then
			local var64, var65 = getTextAndTranslationModule(a)
			var62 = var64
			var63 = var65
		else
			var62 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TextInternal else a.Text
			var63 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TranslationInternal else a.Translation
		end
		if isWhiteSpaceOnlyModule(var62) and a.Status ~= Enum.TextChatMessageStatus.Floodchecked and a.Status ~= Enum.TextChatMessageStatus.MessageTooLong then return end
		local var66 = if a.TextSource then tostring(a.TextSource.UserId) elseif fFlagExpChatFixLocalUserVerifiedBadgeModule and b and playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
		
		if not (if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)) then return end
		local var67
		local _ = nil
		local var68 = var66 == nil or (if var14(false) or fFlagExpChatPresetChatEnabled and (a.PresetId or "") ~= "" then if a.Status ~= Enum.TextChatMessageStatus.Success then a.Status == Enum.TextChatMessageStatus.Sending else true else false)
		var68 = var68 and not (if var66 and var13(false) then set.has(var13(false), var66) else false)
		local var69 = false
		local _ = nil
		
		if fFlagExpChatUseChatConfigStore then
			var67 = getChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false)
		else
			local store = expChatSharedModule.context and expChatSharedModule.context.store
			var67 = if store then store:getState().Messages.isBubbleChatEnabled else var16(false)
		end
		if var67 and var68 and (not fFlagEnableInExpChatSummaryOnLuaModule or var66 ~= nil) and (a.Status == Enum.TextChatMessageStatus.Success or a.Status == Enum.TextChatMessageStatus.Sending) then
			var69 = true
		end
		if fFlagExpChatDisableUniverseBubbleChat and getFFlagTextChatEnableUniverseChatTabs() and p13 == true and (not fFlagExpChatGlobalTabDefaultModule or not isGlobalBubbleChatEnabledModule()) then
			var69 = false
		end
		if a.Status ~= Enum.TextChatMessageStatus.Success and a.Status ~= Enum.TextChatMessageStatus.Sending then
			var68 = false
			var69 = false
		end
		if not p13 and p12 == nil and not shouldRenderTextChannelInDefaultWindow(a.TextChannel, getTextChannelDisplayMode()) then
			var68 = false
		end
		local t_1 = {
			shouldOverrideBubbleChatSettings = false,
			userId = var66,
			prefixText = formatPrefixForUniverseChatTabs(if getFFlagExpChatProtectedChatInternalAPIs() then a.PrefixTextInternal else a.PrefixText, p12, a),
			text = var62,
			translation = var63,
			useTranslation = getChatTranslationEnabled() and var63 ~= nil,
			messageId = a.MessageId,
			status = a.Status,
			timestamp = a.Timestamp,
			isVisibleInBubbleChat = var69,
			isVisibleInChatWindow = var68,
			textChannel = a.TextChannel,
			bubbleChatMessageProperties = a.BubbleChatMessageProperties,
			chatWindowMessageProperties = a.ChatWindowMessageProperties,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then a else nil,
			partOrModel = if a.TextSource then a.TextSource.Parent else nil,
			wasRewritten = if fFlagEnableInExpChatRewriteModule then a.WasRewritten else nil,
			originalText = if fFlagEnableInExpChatRewriteModule then a.OriginalText else nil,
			channelNameOverride = if getFFlagTextChatEnableUniverseChatTabs() and p12 then p12 else nil,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then a.ChatActionType else nil,
			isUniverseChat = p13,
			presetId = if fFlagExpChatPresetChatEnabled then a.PresetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then a.PresetChatVersion else nil
		}
		local var70 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
		
		if t_1.isVisibleInChatWindow or t_1.isVisibleInBubbleChat or var70 and var70[t_1.messageId] ~= nil then
			local var71 = function()
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), writeByMessageId (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var7 (copy), var9 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (copy), updateNextMessageComponent (copy)
				local var72 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
				
				if var72 and var72[t_1.messageId] then
					if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
						var8(function(p14)
							-- upvalues: list (copy), t_1 (copy)
							return list.filter(p14, function(p15)
								-- upvalues: t_1 (copy)
								return p15 ~= t_1.messageId
							end)
						end)
						local var73 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
						
						if var73 then
							var10(function(p14)
								-- upvalues: var73 (ref), list (copy), t_1 (copy), dictionary (copy)
								local var74 = p14[var73]
								
								return if var74 then dictionary.join(p14, {
									[var73] = list.filter(var74, function(p15)
										-- upvalues: t_1 (copy)
										return p15 ~= t_1.messageId
									end)
								}) else p14
							end)
						end
						local messageId = t_1.messageId
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var3[messageId] = nil
						else
							var2(function(p14)
								-- upvalues: dictionary (copy), messageId (ref)
								return dictionary.removeKey(p14, messageId)
							end)
						end
						if t_1.userId then
							local userId = t_1.userId
							
							local var74 = function(p14)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
								if p14 then
									local var75 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p14, function(p15)
										-- upvalues: t_1 (copy)
										return p15 ~= t_1.messageId
									end) else list.filter(p14, function(p15)
										-- upvalues: t_1 (copy)
										return p15.messageId ~= t_1.messageId
									end)
									
									return if #var75 == 0 then nil else var75
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId] = var74(var6[userId])
								
								return
							end
							var5(function(p14)
								-- upvalues: var74 (ref), userId (ref), dictionary (copy)
								local var75 = var74(p14[userId])
								
								return if var75 == nil then dictionary.removeKey(p14, userId) else dictionary.join(p14, { [userId] = var75 })
							end)
						end
						return
					else
						writeByMessageId(t_1.messageId, t_1)
						
						if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
							local userId = t_1.userId
							
							local var75 = function(p14)
								-- upvalues: t_1 (copy), list (copy)
								if not p14 then
									return nil
								end
								local var76 = nil
								
								for i, v in ipairs(p14) do
									if v.messageId == t_1.messageId then break end
								end
								return if var76 then list.set(p14, var76, t_1) else p14
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var6[userId] = var75(var6[userId])
								
								return
							end
							var5(function(p15)
								-- upvalues: var75 (ref), userId (ref), dictionary (copy)
								local var77 = var75(p15[userId])
								
								return if var77 == nil then dictionary.removeKey(p15, userId) else dictionary.join(p15, { [userId] = var77 })
							end)
						end
						return
					end
				else
					local userId = t_1.userId
					local partOrModel = t_1.partOrModel
					
					if not userId and partOrModel then
						userId = var19(false)[partOrModel]
						
						if not userId then
							userId = httpService:GenerateGUID(false)
							var18(function(p14)
								-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
								return dictionary.join(p14, { [userId] = partOrModel })
							end)
							var20(function(p14)
								-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
								return dictionary.join(p14, { [partOrModel] = userId })
							end)
						end
					end
					local var76 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
					local var77 = nil
					
					if getFFlagTextChatEnableUniverseChatTabs() and var76.channelNameOverride then
						var77 = var76.channelNameOverride
					elseif var76.textChannel then
						var77 = if var76.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var76.textChannel.Name
					end
					if var76.isVisibleInChatWindow then
						local var78 = var7(false)
						local var79 = if var77 then var9(false)[var77] or {} else {}
						
						if t.messageLimit <= #var78 then
							local var80 = var78[1]
							local var81 = var72 and var72[var80]
							
							if var81 then
								if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
									if fFlagExpChatMessagesStoreUseProxyModule then
										var3[var80] = nil
									else
										var2(function(p14)
											-- upvalues: dictionary (copy), var80 (ref)
											return dictionary.removeKey(p14, var80)
										end)
									end
								end
								if var81.userId then
									local userId_1 = var81.userId
									
									local var82 = function(p14)
										-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var80 (ref), var17 (copy), var81 (ref), var20 (copy), dictionary (copy), var18 (copy)
										if not p14 then
											return nil
										end
										local var83 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p14, function(p15)
											-- upvalues: var80 (copy)
											return p15 ~= var80
										end) else list.filter(p14, function(p15)
											-- upvalues: var80 (copy)
											return p15.messageId ~= var80
										end)
										
										if #var83 ~= 0 then
											return var83
										end
										local var84 = var17(false)
										
										if var84[var81.userId] then
											local userId = var84[var81.userId]
											var20(function(p15)
												-- upvalues: dictionary (copy), userId (ref)
												return dictionary.removeKey(p15, userId)
											end)
											var18(function(p15)
												-- upvalues: dictionary (copy), var81 (copy)
												return dictionary.removeKey(p15, var81.userId)
											end)
										end
										return nil
									end
									
									if fFlagExpChatMessagesStoreUseProxyModule then
										var6[userId_1] = var82(var6[userId_1])
									else
										var5(function(p14)
											-- upvalues: var82 (ref), userId_1 (ref), dictionary (copy)
											local var83 = var82(p14[userId_1])
											
											return if var83 == nil then dictionary.removeKey(p14, userId_1) else dictionary.join(p14, { [userId_1] = var83 })
										end)
									end
								end
								var8(function(p14)
									-- upvalues: list (copy)
									return list.removeIndex(p14, 1)
								end)
								
								if fFlagExpChatMessagesStoreMemoryCleanupModule then
									t_3[var80] = nil
								end
							end
						end
						if var77 and t.messageLimit <= #var79 then
							local var83 = var79[1]
							
							if var83 then
								var10(function(p14)
									-- upvalues: var77 (write), list (copy), dictionary (copy)
									return dictionary.join(p14, { [var77] = list.removeIndex(p14[var77] or {}, 1) })
								end)
								
								if var72 and var72[var83] then
									if fFlagExpChatMessagesStoreUseProxyModule then
										var3[var83] = nil
									else
										var2(function(p14)
											-- upvalues: dictionary (copy), var83 (ref)
											return dictionary.removeKey(p14, var83)
										end)
									end
								end
								if fFlagExpChatMessagesStoreMemoryCleanupModule then
									t_3[var83] = nil
								end
							end
						end
					end
					writeByMessageId(var76.messageId, var76)
					
					if var76.userId then
						local userId_1 = var76.userId
						
						local var84 = function(p14)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var76 (ref), list (copy)
							local p15 = p14 or {}
							local var85 = false
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								for i, v in ipairs(p15) do
									if v == var76.messageId then
										var85 = true
									end
								end
							else
								for i, v in ipairs(p15) do
									if v.messageId == var76.messageId then
										local var85 = true
										break
									end
								end
							end
							return if var85 then p15 else list.append(p15, if fFlagExpChatMessagesStoreMemoryCleanupModule then var76.messageId else var76)
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId_1] = var84(var6[userId_1])
						else
							var5(function(p16)
								-- upvalues: var84 (ref), userId_1 (ref), dictionary (copy)
								local var86 = var84(p16[userId_1])
								
								return if var86 == nil then dictionary.removeKey(p16, userId_1) else dictionary.join(p16, { [userId_1] = var86 })
							end)
						end
					end
					if var76.isVisibleInChatWindow then
						var8(function(p16)
							-- upvalues: list (copy), var76 (ref)
							return list.append(p16, var76.messageId)
						end)
						
						if var77 then
							var10(function(p16)
								-- upvalues: var77 (write), list (copy), var76 (ref), dictionary (copy)
								return dictionary.join(p16, {
									[var77] = list.append(p16[var77] or {}, var76.messageId)
								})
							end)
						end
						if fFlagExpChatEnableV2ChatWindowModule then
							local var86 = var28(false)
							
							if if var86 ~= nil then var77 == var86 else true then
								updateNextMessageComponent(var76.messageId)
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
	end
	
	local function handleIncomingBubbleChatMessage(a)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), writeByMessageId (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var7 (ref), var9 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
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
		
		local var85 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), writeByMessageId (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var7 (copy), var9 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (copy), updateNextMessageComponent (copy)
			local var86 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if var86 and var86[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p14)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p14, function(p15)
							-- upvalues: t_1 (copy)
							return p15 ~= t_1.messageId
						end)
					end)
					local var87 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var87 then
						var10(function(p14)
							-- upvalues: var87 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var88 = p14[var87]
							
							return if var88 then dictionary.join(p14, {
								[var87] = list.filter(var88, function(p15)
									-- upvalues: t_1 (copy)
									return p15 ~= t_1.messageId
								end)
							}) else p14
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p14)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p14, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var88 = function(p14)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p14 then
								local var89 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p14, function(p15)
									-- upvalues: t_1 (copy)
									return p15 ~= t_1.messageId
								end) else list.filter(p14, function(p15)
									-- upvalues: t_1 (copy)
									return p15.messageId ~= t_1.messageId
								end)
								
								return if #var89 == 0 then nil else var89
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var88(var6[userId])
							
							return
						end
						var5(function(p14)
							-- upvalues: var88 (ref), userId (ref), dictionary (copy)
							local var89 = var88(p14[userId])
							
							return if var89 == nil then dictionary.removeKey(p14, userId) else dictionary.join(p14, { [userId] = var89 })
						end)
					end
					return
				else
					writeByMessageId(t_1.messageId, t_1)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
						local userId = t_1.userId
						
						local var89 = function(p14)
							-- upvalues: t_1 (copy), list (copy)
							if not p14 then
								return nil
							end
							local var90 = nil
							
							for i, v in ipairs(p14) do
								if v.messageId == t_1.messageId then break end
							end
							return if var90 then list.set(p14, var90, t_1) else p14
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var89(var6[userId])
							
							return
						end
						var5(function(p15)
							-- upvalues: var89 (ref), userId (ref), dictionary (copy)
							local var91 = var89(p15[userId])
							
							return if var91 == nil then dictionary.removeKey(p15, userId) else dictionary.join(p15, { [userId] = var91 })
						end)
					end
					return
				end
			else
				local userId = t_1.userId
				local partOrModel = t_1.partOrModel
				
				if not userId and partOrModel then
					userId = var19(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var18(function(p14)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p14, { [userId] = partOrModel })
						end)
						var20(function(p14)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p14, { [partOrModel] = userId })
						end)
					end
				end
				local var90 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var91 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var90.channelNameOverride then
					var91 = var90.channelNameOverride
				elseif var90.textChannel then
					var91 = if var90.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var90.textChannel.Name
				end
				if var90.isVisibleInChatWindow then
					local var92 = var7(false)
					local var93 = if var91 then var9(false)[var91] or {} else {}
					
					if t.messageLimit <= #var92 then
						local var94 = var92[1]
						local var95 = var86 and var86[var94]
						
						if var95 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var94] = nil
								else
									var2(function(p14)
										-- upvalues: dictionary (copy), var94 (ref)
										return dictionary.removeKey(p14, var94)
									end)
								end
							end
							if var95.userId then
								local userId_1 = var95.userId
								
								local var96 = function(p14)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var94 (ref), var17 (copy), var95 (ref), var20 (copy), dictionary (copy), var18 (copy)
									if not p14 then
										return nil
									end
									local var97 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p14, function(p15)
										-- upvalues: var94 (copy)
										return p15 ~= var94
									end) else list.filter(p14, function(p15)
										-- upvalues: var94 (copy)
										return p15.messageId ~= var94
									end)
									
									if #var97 ~= 0 then
										return var97
									end
									local var98 = var17(false)
									
									if var98[var95.userId] then
										local userId = var98[var95.userId]
										var20(function(p15)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p15, userId)
										end)
										var18(function(p15)
											-- upvalues: dictionary (copy), var95 (copy)
											return dictionary.removeKey(p15, var95.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var6[userId_1] = var96(var6[userId_1])
								else
									var5(function(p14)
										-- upvalues: var96 (ref), userId_1 (ref), dictionary (copy)
										local var97 = var96(p14[userId_1])
										
										return if var97 == nil then dictionary.removeKey(p14, userId_1) else dictionary.join(p14, { [userId_1] = var97 })
									end)
								end
							end
							var8(function(p14)
								-- upvalues: list (copy)
								return list.removeIndex(p14, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var94] = nil
							end
						end
					end
					if var91 and t.messageLimit <= #var93 then
						local var97 = var93[1]
						
						if var97 then
							var10(function(p14)
								-- upvalues: var91 (write), list (copy), dictionary (copy)
								return dictionary.join(p14, { [var91] = list.removeIndex(p14[var91] or {}, 1) })
							end)
							
							if var86 and var86[var97] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var97] = nil
								else
									var2(function(p14)
										-- upvalues: dictionary (copy), var97 (ref)
										return dictionary.removeKey(p14, var97)
									end)
								end
							end
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var97] = nil
							end
						end
					end
				end
				writeByMessageId(var90.messageId, var90)
				
				if var90.userId then
					local userId_1 = var90.userId
					
					local var98 = function(p14)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var90 (ref), list (copy)
						local p15 = p14 or {}
						local var99 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p15) do
								if v == var90.messageId then
									var99 = true
								end
							end
						else
							for i, v in ipairs(p15) do
								if v.messageId == var90.messageId then
									local var99 = true
									break
								end
							end
						end
						return if var99 then p15 else list.append(p15, if fFlagExpChatMessagesStoreMemoryCleanupModule then var90.messageId else var90)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId_1] = var98(var6[userId_1])
					else
						var5(function(p16)
							-- upvalues: var98 (ref), userId_1 (ref), dictionary (copy)
							local var100 = var98(p16[userId_1])
							
							return if var100 == nil then dictionary.removeKey(p16, userId_1) else dictionary.join(p16, { [userId_1] = var100 })
						end)
					end
				end
				if var90.isVisibleInChatWindow then
					var8(function(p16)
						-- upvalues: list (copy), var90 (ref)
						return list.append(p16, var90.messageId)
					end)
					
					if var91 then
						var10(function(p16)
							-- upvalues: var91 (write), list (copy), var90 (ref), dictionary (copy)
							return dictionary.join(p16, {
								[var91] = list.append(p16[var91] or {}, var90.messageId)
							})
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var100 = var28(false)
						
						if if var100 ~= nil then var91 == var100 else true then
							updateNextMessageComponent(var90.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var85)
			
			return
		end
		var85()
	end
	
	local function handleHiddenMessageReceived(p14)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), fIntExpChatRandomCharChangeLowerBoundModule (copy), fIntExpChatRandomCharChangeUpperBoundModule (copy), configModule (copy), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), writeByMessageId (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var7 (ref), var9 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var99 = string.len(if getFFlagExpChatProtectedChatInternalAPIs() then p14.TextInternal else p14.Text)
		local t_1 = {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = configModule.LOCK_EMOJI .. " :",
			text = string.rep(configModule.DOT_TEXT, var99 + math.random(math.max(fIntExpChatRandomCharChangeLowerBoundModule, -(var99 - 1)), fIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = p14.TextChannel,
			messageId = p14.MessageId,
			status = p14.Status,
			timestamp = p14.Timestamp,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p14 else nil
		}
		
		local var100 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), writeByMessageId (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var7 (copy), var9 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (copy), updateNextMessageComponent (copy)
			local var101 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if var101 and var101[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p15)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p15, function(p16)
							-- upvalues: t_1 (copy)
							return p16 ~= t_1.messageId
						end)
					end)
					local var102 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var102 then
						var10(function(p15)
							-- upvalues: var102 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var103 = p15[var102]
							
							return if var103 then dictionary.join(p15, {
								[var102] = list.filter(var103, function(p16)
									-- upvalues: t_1 (copy)
									return p16 ~= t_1.messageId
								end)
							}) else p15
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var3[messageId] = nil
					else
						var2(function(p15)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p15, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var103 = function(p15)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p15 then
								local var104 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p15, function(p16)
									-- upvalues: t_1 (copy)
									return p16 ~= t_1.messageId
								end) else list.filter(p15, function(p16)
									-- upvalues: t_1 (copy)
									return p16.messageId ~= t_1.messageId
								end)
								
								return if #var104 == 0 then nil else var104
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var103(var6[userId])
							
							return
						end
						var5(function(p15)
							-- upvalues: var103 (ref), userId (ref), dictionary (copy)
							local var104 = var103(p15[userId])
							
							return if var104 == nil then dictionary.removeKey(p15, userId) else dictionary.join(p15, { [userId] = var104 })
						end)
					end
					return
				else
					writeByMessageId(t_1.messageId, t_1)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
						local userId = t_1.userId
						
						local var104 = function(p15)
							-- upvalues: t_1 (copy), list (copy)
							if not p15 then
								return nil
							end
							local var105 = nil
							
							for i, v in ipairs(p15) do
								if v.messageId == t_1.messageId then break end
							end
							return if var105 then list.set(p15, var105, t_1) else p15
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var104(var6[userId])
							
							return
						end
						var5(function(p16)
							-- upvalues: var104 (ref), userId (ref), dictionary (copy)
							local var106 = var104(p16[userId])
							
							return if var106 == nil then dictionary.removeKey(p16, userId) else dictionary.join(p16, { [userId] = var106 })
						end)
					end
					return
				end
			else
				local userId = t_1.userId
				local partOrModel = t_1.partOrModel
				
				if not userId and partOrModel then
					userId = var19(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var18(function(p15)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p15, { [userId] = partOrModel })
						end)
						var20(function(p15)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p15, { [partOrModel] = userId })
						end)
					end
				end
				local var105 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var106 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var105.channelNameOverride then
					var106 = var105.channelNameOverride
				elseif var105.textChannel then
					var106 = if var105.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var105.textChannel.Name
				end
				if var105.isVisibleInChatWindow then
					local var107 = var7(false)
					local var108 = if var106 then var9(false)[var106] or {} else {}
					
					if t.messageLimit <= #var107 then
						local var109 = var107[1]
						local var110 = var101 and var101[var109]
						
						if var110 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var109] = nil
								else
									var2(function(p15)
										-- upvalues: dictionary (copy), var109 (ref)
										return dictionary.removeKey(p15, var109)
									end)
								end
							end
							if var110.userId then
								local userId_1 = var110.userId
								
								local var111 = function(p15)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var109 (ref), var17 (copy), var110 (ref), var20 (copy), dictionary (copy), var18 (copy)
									if not p15 then
										return nil
									end
									local var112 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p15, function(p16)
										-- upvalues: var109 (copy)
										return p16 ~= var109
									end) else list.filter(p15, function(p16)
										-- upvalues: var109 (copy)
										return p16.messageId ~= var109
									end)
									
									if #var112 ~= 0 then
										return var112
									end
									local var113 = var17(false)
									
									if var113[var110.userId] then
										local userId = var113[var110.userId]
										var20(function(p16)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p16, userId)
										end)
										var18(function(p16)
											-- upvalues: dictionary (copy), var110 (copy)
											return dictionary.removeKey(p16, var110.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var6[userId_1] = var111(var6[userId_1])
								else
									var5(function(p15)
										-- upvalues: var111 (ref), userId_1 (ref), dictionary (copy)
										local var112 = var111(p15[userId_1])
										
										return if var112 == nil then dictionary.removeKey(p15, userId_1) else dictionary.join(p15, { [userId_1] = var112 })
									end)
								end
							end
							var8(function(p15)
								-- upvalues: list (copy)
								return list.removeIndex(p15, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var109] = nil
							end
						end
					end
					if var106 and t.messageLimit <= #var108 then
						local var112 = var108[1]
						
						if var112 then
							var10(function(p15)
								-- upvalues: var106 (write), list (copy), dictionary (copy)
								return dictionary.join(p15, { [var106] = list.removeIndex(p15[var106] or {}, 1) })
							end)
							
							if var101 and var101[var112] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var112] = nil
								else
									var2(function(p15)
										-- upvalues: dictionary (copy), var112 (ref)
										return dictionary.removeKey(p15, var112)
									end)
								end
							end
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var112] = nil
							end
						end
					end
				end
				writeByMessageId(var105.messageId, var105)
				
				if var105.userId then
					local userId_1 = var105.userId
					
					local var113 = function(p15)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var105 (ref), list (copy)
						local p16 = p15 or {}
						local var114 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p16) do
								if v == var105.messageId then
									var114 = true
								end
							end
						else
							for i, v in ipairs(p16) do
								if v.messageId == var105.messageId then
									local var114 = true
									break
								end
							end
						end
						return if var114 then p16 else list.append(p16, if fFlagExpChatMessagesStoreMemoryCleanupModule then var105.messageId else var105)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId_1] = var113(var6[userId_1])
					else
						var5(function(p17)
							-- upvalues: var113 (ref), userId_1 (ref), dictionary (copy)
							local var115 = var113(p17[userId_1])
							
							return if var115 == nil then dictionary.removeKey(p17, userId_1) else dictionary.join(p17, { [userId_1] = var115 })
						end)
					end
				end
				if var105.isVisibleInChatWindow then
					var8(function(p17)
						-- upvalues: list (copy), var105 (ref)
						return list.append(p17, var105.messageId)
					end)
					
					if var106 then
						var10(function(p17)
							-- upvalues: var106 (write), list (copy), var105 (ref), dictionary (copy)
							return dictionary.join(p17, {
								[var106] = list.append(p17[var106] or {}, var105.messageId)
							})
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var115 = var28(false)
						
						if if var115 ~= nil then var106 == var115 else true then
							updateNextMessageComponent(var105.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var100)
			
			return
		end
		var100()
	end
	
	local function handlePlayerRemoved(p15)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (ref), var5 (ref), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (ref), var12 (ref), set (copy), var4 (ref), var17 (ref), var20 (ref), var18 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var114 = tostring(p15)
		
		local function doHandlePlayerRemoved()
			-- upvalues: var114 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var5 (copy), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (copy), var12 (copy), set (copy), var4 (copy), var17 (copy), var20 (copy), var18 (copy)
			if fFlagExpChatMessagesStoreUseProxyModule then
				var6[var114] = nil
			else
				var5(function(p16)
					-- upvalues: dictionary (copy), var114 (ref)
					return dictionary.removeKey(p16, var114)
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var114] = nil
			end
			var12(function(p16)
				-- upvalues: set (copy), var114 (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var17 (copy), var20 (copy), dictionary (copy), var18 (copy)
				if not p16 then
					return {}
				elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4(false))[var114] or {}) == 0 and not set.has(p16, var114) then
					return p16
				end
				local var115 = var17(false)
				
				if var115[var114] then
					local var116 = var115[var114]
					var20(function(p17)
						-- upvalues: dictionary (copy), var116 (ref)
						return dictionary.removeKey(p17, var116)
					end)
					var18(function(p17)
						-- upvalues: dictionary (copy), var114 (copy)
						return dictionary.removeKey(p17, var114)
					end)
				end
				return set.subtract(p16, var114)
			end)
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doHandlePlayerRemoved)
			
			return
		elseif fFlagExpChatMessagesStoreUseProxyModule then
			var6[var114] = nil
		else
			var5(function(p16)
				-- upvalues: dictionary (copy), var114 (ref)
				return dictionary.removeKey(p16, var114)
			end)
		end
		if fFlagExpChatMessagesStoreMemoryCleanupModule then
			t_4[var114] = nil
		end
		var12(function(p16)
			-- upvalues: set (copy), var114 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var6 (copy), var4 (copy), var17 (copy), var20 (copy), dictionary (copy), var18 (copy)
			if not p16 then
				return {}
			elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4(false))[var114] or {}) == 0 and not set.has(p16, var114) then
				return p16
			end
			local var115 = var17(false)
			
			if var115[var114] then
				local var116 = var115[var114]
				var20(function(p17)
					-- upvalues: dictionary (copy), var116 (ref)
					return dictionary.removeKey(p17, var116)
				end)
				var18(function(p17)
					-- upvalues: dictionary (copy), var114 (copy)
					return dictionary.removeKey(p17, var114)
				end)
			end
			return set.subtract(p16, var114)
		end)
	end
	
	local function muteUser(p15)
		-- upvalues: var12 (ref), set (copy)
		var12(function(p16)
			-- upvalues: set (copy), p15 (ref)
			return if p16 then set.add(p16, p15) else {}
		end)
	end
	
	local function unmuteUser(p15)
		-- upvalues: var12 (ref), set (copy)
		var12(function(p16)
			-- upvalues: set (copy), p15 (ref)
			return if p16 then set.subtract(p16, p15) else {}
		end)
	end
	
	local function clearWindowMessages()
		-- upvalues: forEachByMessageId (ref), dictionary (copy), var8 (ref), var10 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var26 (ref), var27 (write), var23 (ref), t_1 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local function doClearWindowMessages()
			-- upvalues: forEachByMessageId (copy), dictionary (copy), var8 (copy), var10 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var26 (copy), var27 (copy), var23 (copy), t_1 (copy)
			forEachByMessageId(function(_, p15)
				-- upvalues: dictionary (copy)
				return dictionary.join(p15, { isVisibleInChatWindow = false })
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
				
				for i, v in ipairs(var23(false)) do
					local var114 = t_1[v]
					
					if var114 then
						var114.setter(nil)
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
			forEachByMessageId(function(_, p15)
				-- upvalues: dictionary (copy)
				return if p15 and p15.isHiddenMessage then dictionary.join(p15, { isVisibleInChatWindow = false }) else nil
			end)
			
			local function isNotHidden(p15)
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy)
				local var114 = (if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false))[p15]
				
				return var114 and not var114.isHiddenMessage
			end
			
			var8(function(p15)
				-- upvalues: list (copy), isNotHidden (ref)
				return list.filter(p15, isNotHidden)
			end)
			var10(function(p15)
				-- upvalues: dictionary (copy), list (copy), isNotHidden (ref)
				return dictionary.map(p15, function(p16)
					-- upvalues: list (copy), isNotHidden (copy)
					return list.filter(p16, isNotHidden)
				end)
			end)
			
			return
		end
	end
	
	local function rebuildMessageWithTranslation(p15, p16)
		-- upvalues: getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPresetChatEnabled (copy)
		return {
			prefixText = p15.prefixText,
			text = p15.text,
			translation = p15.translation,
			useTranslation = p16,
			messageId = p15.messageId,
			status = p15.status,
			timestamp = p15.timestamp,
			isVisibleInBubbleChat = p15.isVisibleInBubbleChat,
			isVisibleInChatWindow = p15.isVisibleInChatWindow,
			partOrModel = p15.partOrModel,
			shouldOverrideBubbleChatSettings = p15.shouldOverrideBubbleChatSettings,
			bubbleChatMessageProperties = p15.bubbleChatMessageProperties,
			chatWindowMessageProperties = p15.chatWindowMessageProperties,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p15.textChatMessageInstance else nil,
			userId = p15.userId,
			textChannel = p15.textChannel,
			wasRewritten = if fFlagEnableInExpChatRewriteModule then p15.wasRewritten else nil,
			originalText = if fFlagEnableInExpChatRewriteModule then p15.originalText else nil,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p15.chatActionType else nil,
			presetId = if fFlagExpChatPresetChatEnabled then p15.presetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then p15.presetChatVersion else nil
		}
	end
	
	local function toggleGlobalTranslation(p15)
		-- upvalues: forEachByMessageId (ref), rebuildMessageWithTranslation (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local function doToggleGlobalTranslation()
			-- upvalues: forEachByMessageId (copy), rebuildMessageWithTranslation (copy), p15 (ref)
			forEachByMessageId(function(_, p16)
				-- upvalues: rebuildMessageWithTranslation (copy), p15 (copy)
				return rebuildMessageWithTranslation(p16, p15)
			end)
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doToggleGlobalTranslation)
			
			return
		end
		forEachByMessageId(function(_, p16)
			-- upvalues: rebuildMessageWithTranslation (copy), p15 (ref)
			return rebuildMessageWithTranslation(p16, p15)
		end)
	end
	
	local function toggleMessageTranslation(p15, p16)
		-- upvalues: rebuildMessageWithTranslation (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var2 (ref), dictionary (copy)
		local var114 = function(p17)
			-- upvalues: rebuildMessageWithTranslation (copy), p15 (ref)
			return rebuildMessageWithTranslation(p17, p15)
		end
		
		if fFlagExpChatMessagesStoreUseProxyModule then
			local var115 = var3[p16]
			
			if var115 then
				local var116 = rebuildMessageWithTranslation(var115, p15)
				
				if var116 then
					var3[p16] = var116
					
					return
				end
			end
		else
			var2(function(p17)
				-- upvalues: p16 (ref), var114 (ref), dictionary (copy)
				if p17 and p17[p16] then
					local var117 = var114(p17[p16])
					
					return if var117 then dictionary.join(p17, { [p16] = var117 }) else p17
				end
				return p17 or {}
			end)
		end
	end
	
	local function handleLegacyBubbleCreated(p15)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (ref), list (copy), resolveChannelNameForMapOrder (ref), var10 (ref), dictionary (copy), var2 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (ref), var5 (ref), writeByMessageId (ref), var19 (ref), httpService (copy), var18 (ref), var20 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (ref), var7 (ref), var9 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local timestamp = p15.timestamp
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
			userId = p15.userId,
			text = p15.text,
			messageId = p15.id,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = if timestamp then DateTime.fromUnixTimestampMillis(timestamp) else DateTime.now(),
			partOrModel = p15.adornee
		}
		
		local var114 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (copy), var1 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var8 (copy), list (copy), resolveChannelNameForMapOrder (copy), var10 (copy), dictionary (copy), var2 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var6 (copy), var5 (copy), writeByMessageId (copy), var19 (copy), httpService (copy), var18 (copy), var20 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var21 (copy), var7 (copy), var9 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var17 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var28 (copy), updateNextMessageComponent (copy)
			local var115 = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1(false)
			
			if var115 and var115[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var8(function(p16)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p16, function(p17)
							-- upvalues: t_1 (copy)
							return p17 ~= t_1.messageId
						end)
					end)
					local var116 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var116 then
						var10(function(p16)
							-- upvalues: var116 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var117 = p16[var116]
							
							return if var117 then dictionary.join(p16, {
								[var116] = list.filter(var117, function(p17)
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
						
						local var117 = function(p16)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p16 then
								local var118 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p16, function(p17)
									-- upvalues: t_1 (copy)
									return p17 ~= t_1.messageId
								end) else list.filter(p16, function(p17)
									-- upvalues: t_1 (copy)
									return p17.messageId ~= t_1.messageId
								end)
								
								return if #var118 == 0 then nil else var118
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var117(var6[userId])
							
							return
						end
						var5(function(p16)
							-- upvalues: var117 (ref), userId (ref), dictionary (copy)
							local var118 = var117(p16[userId])
							
							return if var118 == nil then dictionary.removeKey(p16, userId) else dictionary.join(p16, { [userId] = var118 })
						end)
					end
					return
				else
					writeByMessageId(t_1.messageId, t_1)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
						local userId = t_1.userId
						
						local var118 = function(p16)
							-- upvalues: t_1 (copy), list (copy)
							if not p16 then
								return nil
							end
							local var119 = nil
							
							for i, v in ipairs(p16) do
								if v.messageId == t_1.messageId then break end
							end
							return if var119 then list.set(p16, var119, t_1) else p16
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var6[userId] = var118(var6[userId])
							
							return
						end
						var5(function(p17)
							-- upvalues: var118 (ref), userId (ref), dictionary (copy)
							local var120 = var118(p17[userId])
							
							return if var120 == nil then dictionary.removeKey(p17, userId) else dictionary.join(p17, { [userId] = var120 })
						end)
					end
					return
				end
			else
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
				local var119 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var120 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var119.channelNameOverride then
					var120 = var119.channelNameOverride
				elseif var119.textChannel then
					var120 = if var119.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var21(false) then "RBXGeneral" else var119.textChannel.Name
				end
				if var119.isVisibleInChatWindow then
					local var121 = var7(false)
					local var122 = if var120 then var9(false)[var120] or {} else {}
					
					if t.messageLimit <= #var121 then
						local var123 = var121[1]
						local var124 = var115 and var115[var123]
						
						if var124 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var123] = nil
								else
									var2(function(p16)
										-- upvalues: dictionary (copy), var123 (ref)
										return dictionary.removeKey(p16, var123)
									end)
								end
							end
							if var124.userId then
								local userId_1 = var124.userId
								
								local var125 = function(p16)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var123 (ref), var17 (copy), var124 (ref), var20 (copy), dictionary (copy), var18 (copy)
									if not p16 then
										return nil
									end
									local var126 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p16, function(p17)
										-- upvalues: var123 (copy)
										return p17 ~= var123
									end) else list.filter(p16, function(p17)
										-- upvalues: var123 (copy)
										return p17.messageId ~= var123
									end)
									
									if #var126 ~= 0 then
										return var126
									end
									local var127 = var17(false)
									
									if var127[var124.userId] then
										local userId = var127[var124.userId]
										var20(function(p17)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p17, userId)
										end)
										var18(function(p17)
											-- upvalues: dictionary (copy), var124 (copy)
											return dictionary.removeKey(p17, var124.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var6[userId_1] = var125(var6[userId_1])
								else
									var5(function(p16)
										-- upvalues: var125 (ref), userId_1 (ref), dictionary (copy)
										local var126 = var125(p16[userId_1])
										
										return if var126 == nil then dictionary.removeKey(p16, userId_1) else dictionary.join(p16, { [userId_1] = var126 })
									end)
								end
							end
							var8(function(p16)
								-- upvalues: list (copy)
								return list.removeIndex(p16, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var123] = nil
							end
						end
					end
					if var120 and t.messageLimit <= #var122 then
						local var126 = var122[1]
						
						if var126 then
							var10(function(p16)
								-- upvalues: var120 (write), list (copy), dictionary (copy)
								return dictionary.join(p16, { [var120] = list.removeIndex(p16[var120] or {}, 1) })
							end)
							
							if var115 and var115[var126] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var3[var126] = nil
								else
									var2(function(p16)
										-- upvalues: dictionary (copy), var126 (ref)
										return dictionary.removeKey(p16, var126)
									end)
								end
							end
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var126] = nil
							end
						end
					end
				end
				writeByMessageId(var119.messageId, var119)
				
				if var119.userId then
					local userId_1 = var119.userId
					
					local var127 = function(p16)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var119 (ref), list (copy)
						local p17 = p16 or {}
						local var128 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p17) do
								if v == var119.messageId then
									var128 = true
								end
							end
						else
							for i, v in ipairs(p17) do
								if v.messageId == var119.messageId then
									local var128 = true
									break
								end
							end
						end
						return if var128 then p17 else list.append(p17, if fFlagExpChatMessagesStoreMemoryCleanupModule then var119.messageId else var119)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var6[userId_1] = var127(var6[userId_1])
					else
						var5(function(p18)
							-- upvalues: var127 (ref), userId_1 (ref), dictionary (copy)
							local var129 = var127(p18[userId_1])
							
							return if var129 == nil then dictionary.removeKey(p18, userId_1) else dictionary.join(p18, { [userId_1] = var129 })
						end)
					end
				end
				if var119.isVisibleInChatWindow then
					var8(function(p18)
						-- upvalues: list (copy), var119 (ref)
						return list.append(p18, var119.messageId)
					end)
					
					if var120 then
						var10(function(p18)
							-- upvalues: var120 (write), list (copy), var119 (ref), dictionary (copy)
							return dictionary.join(p18, {
								[var120] = list.append(p18[var120] or {}, var119.messageId)
							})
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var129 = var28(false)
						
						if if var129 ~= nil then var120 == var129 else true then
							updateNextMessageComponent(var119.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var114)
			
			return
		end
		var114()
	end
	
	updateNextMessageComponent = function(p16)
		-- upvalues: var23 (ref), var25 (ref), var26 (ref), t_1 (ref), fFlagEnableInExpChatRewriteModule (copy), var27 (write), t_2 (ref)
		local var128 = var23(false)
		
		if #var128 == 0 then return end
		local var129 = var25(false)
		local var130 = var128[var129]
		
		if not var130 then
			var26(1)
			
			return
		end
		local var131 = t_1[var130]
		
		if var131 then
			var131.setter(p16)
		end
		var27 += if fFlagEnableInExpChatRewriteModule then 10 else 1
		local var132 = t_2[var130]
		
		if var132 then
			var132.setter(var27)
		end
		var26(var129 % #var128 + 1)
	end
	
	return {
		getByMessageId = if fFlagExpChatMessagesStoreUseProxyModule then var3 else var1,
		getMessages = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else createComputed(function(p16)
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var1 (ref)
			local var128 = if fFlagExpChatMessagesStoreUseProxyModule then var3(p16) else var1(p16)
			
			if not var128 then
				return {}
			end
			local t = {}
			
			for i, v in var128 do
				table.insert(t, v)
			end
			return t
		end),
		getMessagesBySenderId = if fFlagExpChatMessagesStoreUseProxyModule then var6 else var4,
		getWindowMessagesInOrder = var7,
		getWindowMessagesInOrderByTabId = var9,
		getMutedUserIds = var13,
		getCanLocalUserChat = var14,
		getIsBubbleChatEnabled = var16,
		getMockUserIdToPartOrModel = var17,
		getPartOrModelToMockUserId = var19,
		getMessage = getMessage,
		getUserMessages = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserMessages,
		getUserBubbleMessages = getUserBubbleMessages,
		getUserLastMessage = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserLastMessage,
		registerMessageComponent = function(p17)
			-- upvalues: t_1 (ref), createSignal (copy), t_2 (ref), var24 (ref), list (copy)
			if not t_1[p17] then
				local var129, var130 = createSignal(nil)
				t_1[p17] = { getter = var129, setter = var130 }
				local var131, var132 = createSignal(0)
				t_2[p17] = { getter = var131, setter = var132 }
				var24(function(p18)
					-- upvalues: list (copy), p17 (ref)
					return list.append(p18, p17)
				end)
			end
			return t_1[p17].getter
		end,
		unregisterMessageComponent = function(p17)
			-- upvalues: var23 (ref), t_1 (ref), t_2 (ref), var24 (ref), list (copy), var25 (ref), var26 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
			local var129 = nil
			
			for i, v in ipairs(var23(false)) do
				if v == p17 then
					var129 = i
					break
				end
			end
			if t_1[p17] then
				t_1[p17] = nil
			end
			if t_2[p17] then
				t_2[p17] = nil
			end
			if var129 then
				local function doUnregister()
					-- upvalues: var24 (copy), list (copy), p17 (ref), var23 (copy), var25 (copy), var26 (copy), var129 (write)
					var24(function(p18)
						-- upvalues: list (copy), p17 (copy)
						return list.filter(p18, function(p19)
							-- upvalues: p17 (copy)
							return p19 ~= p17
						end)
					end)
					local var130 = var23(false)
					local var131 = var25(false)
					
					if #var130 == 0 then
						var26(1)
						
						return
					elseif var129 < var131 then
						var26(var131 - 1)
						
						return
					elseif #var130 < var131 then
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
			-- upvalues: var28 (ref), var9 (ref), var7 (ref), var26 (ref), var27 (write), updateNextMessageComponent (write), var23 (ref), var25 (ref), t_1 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
			local function doRepopulate()
				-- upvalues: var28 (copy), var9 (copy), var7 (copy), var26 (copy), var27 (copy), updateNextMessageComponent (copy), var23 (copy), var25 (copy), t_1 (copy)
				local var130 = var28(false)
				local _ = nil
				local var131 = if var130 then var9(false)[var130] or {} else var7(false)
				var26(1)
				var27 = 0
				
				for i, v in ipairs(var131) do
					updateNextMessageComponent(v)
				end
				local var132 = var23(false)
				
				if #var131 < #var132 then
					for i_1 = var25(false), #var132 do
						local var133 = t_1[var132[i_1]]
						
						if var133 then
							var133.setter(nil)
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
			local var134 = t_1[value]
			
			return if var134 then var134.getter else nil
		end,
		getLayoutOrderSignal = function(value)
			-- upvalues: t_2 (ref)
			local var134 = t_2[value]
			
			return if var134 then var134.getter else nil
		end,
		updateNextMessageComponent = updateNextMessageComponent,
		getMessageComponentRingBuffer = var23,
		getNextMessageComponentPointer = var25,
		setActiveChannelFilter = var29,
		getActiveChannelFilter = var28,
		setCanLocalUserChat = var15,
		muteUser = muteUser,
		unmuteUser = unmuteUser,
		handlePlayerRemoved = handlePlayerRemoved,
		clearWindowMessages = clearWindowMessages,
		toggleGlobalTranslation = toggleGlobalTranslation,
		toggleMessageTranslation = toggleMessageTranslation,
		handleIncomingOrOutgoingMessage = handleIncomingOrOutgoingMessage,
		handleIncomingBubbleChatMessage = handleIncomingBubbleChatMessage,
		handleLegacyBubbleCreated = handleLegacyBubbleCreated,
		handleLegacyBubbleTextUpdated = function(p18, p19)
			-- upvalues: dictionary (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var3 (ref), var2 (ref)
			local var134 = function(p20)
				-- upvalues: dictionary (copy), p19 (ref)
				return dictionary.join(p20, { text = p19 })
			end
			
			if fFlagExpChatMessagesStoreUseProxyModule then
				local var135 = var3[p18]
				
				if var135 then
					local var136 = dictionary.join(var135, { text = p19 })
					
					if var136 then
						var3[p18] = var136
						
						return
					end
				end
			else
				var2(function(p20)
					-- upvalues: p18 (ref), var134 (ref), dictionary (copy)
					if p20 and p20[p18] then
						local var137 = var134(p20[p18])
						
						return if var137 then dictionary.join(p20, { [p18] = var137 }) else p20
					end
					return p20 or {}
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