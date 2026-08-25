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
local getFFlagExpChatSyntheticSystemMessageRichText = expChatSharedModule.Flags.GetFFlagExpChatSyntheticSystemMessageRichText
local fFlagChatLineReportingGlobalMuteEnabled = sharedFlagsModule.FFlagChatLineReportingGlobalMuteEnabled
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

return function(p0)
	-- upvalues: createSignal (ref), fFlagExpChatMessagesStoreUseProxyModule (ref), createProxy (ref), createComputed (ref), dictionary (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatMessagesStoreBatchModule (ref), signalsExperimentalModule (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (ref), list (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (ref), httpService (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (ref), fFlagExpChatEnableV2ChatWindowModule (ref), set (ref), sanitizeForRichTextModule (ref), getFFlagExpChatSyntheticSystemMessageRichText (ref), generateRichSystemMessageTextFormatModule (ref), fFlagExpChatDictation (ref), computeNameColor (ref), playersService (ref), fFlagEnableInExpChatRewriteModule (ref), getTextAndTranslationModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), isWhiteSpaceOnlyModule (ref), fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), expChatSharedModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatDisableUniverseBubbleChat (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagChatLineReportingGlobalMuteEnabled (ref), fIntExpChatRandomCharChangeLowerBoundModule (ref), fIntExpChatRandomCharChangeUpperBoundModule (ref), configModule (ref), fFlagExpChatClearHiddenMessagesPostAgeCheckModule (ref)
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
	local var29, var30 = createSignal(t.byMessageId)
	local var31 = if fFlagExpChatMessagesStoreUseProxyModule then createProxy({}) else nil
	local var32, var33 = createSignal(t.messagesBySenderId)
	local var34 = if fFlagExpChatMessagesStoreUseProxyModule then createProxy({}) else nil
	local var35, var36 = createSignal(t.windowMessagesInOrder)
	local var37, var38 = createSignal(t.windowMessagesInOrderByTabId)
	local var39, var40 = createSignal(t.mutedUserIds)
	local var41 = if p0 ~= nil then var39 else createComputed(function(p1)
		-- upvalues: var39 (ref), p0 (ref)
		local cloned = table.clone(var39(p1))
		
		for i in p0(p1) do
			cloned[i] = true
		end
		return cloned
	end)
	local var42, var43 = createSignal(t.canLocalUserChat)
	local var44, _ = createSignal(t.isBubbleChatEnabled)
	local var45, var46 = createSignal(t.mockUserIdToPartOrModel)
	local var47, var48 = createSignal(t.partOrModelToMockUserId)
	local var49, var50 = createSignal(false)
	local var51, var52 = createSignal(t.messageComponentRingBuffer)
	local var53, var54 = createSignal(t.nextMessageComponentPointer)
	local t_1 = {}
	local var56 = 0
	local t_2 = {}
	local var58, var59 = createSignal(nil)
	local updateNextMessageComponent = nil
	local t_3 = {}
	
	local function _()
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref)
		return if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false)
	end
	
	local _ = function(p2)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref)
		return if fFlagExpChatMessagesStoreUseProxyModule then var31(p2) else var29(p2)
	end
	
	local function writeByMessageId(p3, p4)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var30 (ref), dictionary (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			var31[p3] = p4
			
			return
		elseif p4 == nil then
			var30(function(p5)
				-- upvalues: dictionary (copy), p3 (ref)
				return dictionary.removeKey(p5, p3)
			end)
			
			return
		end
		var30(function(p6)
			-- upvalues: dictionary (copy), p3 (ref), p4 (ref)
			return dictionary.join(p6, { [p3] = p4 })
		end)
	end
	
	local _ = function(p7, p8)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var30 (ref), dictionary (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			local var86 = var31[p7]
			
			if var86 then
				local var87 = p8(var86)
				
				if var87 then
					var31[p7] = var87
					
					return
				end
			end
		else
			var30(function(p9)
				-- upvalues: p7 (ref), p8 (ref), dictionary (copy)
				if not p9 or not p9[p7] then
					return p9 or {}
				end
				local var88 = p8(p9[p7])
				
				return if var88 then dictionary.join(p9, { [p7] = var88 }) else p9
			end)
		end
	end
	
	local function forEachByMessageId(p10)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var30 (ref)
		if not fFlagExpChatMessagesStoreUseProxyModule then
			var30(function(p11)
				-- upvalues: p10 (ref)
				if not p11 then
					return {}
				end
				local t = {}
				
				for i, v in p11 do
					t[i] = p10(i, v) or v
				end
				return t
			end)
			
			return
		end
		for i in var31 do
			local var89 = var31[i]
			
			if var89 then
				local var90 = p10(i, var89)
				
				if var90 then
					var31[i] = var90
				end
			end
		end
	end
	
	local _ = function(p12)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (ref), var32 (ref)
		return if fFlagExpChatMessagesStoreUseProxyModule then var34(p12) else var32(p12)
	end
	
	local _ = function(p13, p14)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (ref), var33 (ref), dictionary (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			var34[p13] = p14
			
			return
		elseif p14 == nil then
			var33(function(p15)
				-- upvalues: dictionary (copy), p13 (ref)
				return dictionary.removeKey(p15, p13)
			end)
			
			return
		end
		var33(function(p16)
			-- upvalues: dictionary (copy), p13 (ref), p14 (ref)
			return dictionary.join(p16, { [p13] = p14 })
		end)
	end
	
	local _ = function(p17, p18)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (ref), var33 (ref), dictionary (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			var34[p17] = p18(var34[p17])
			
			return
		end
		var33(function(p19)
			-- upvalues: p18 (ref), p17 (ref), dictionary (copy)
			local var92 = p18(p19[p17])
			
			return if var92 == nil then dictionary.removeKey(p19, p17) else dictionary.join(p19, { [p17] = var92 })
		end)
	end
	
	local function resolveChannelNameForMapOrder(p20, p21)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), var49 (ref)
		return if getFFlagTextChatEnableUniverseChatTabs() then p21 or (if p20.textChannel then if p20.textChannel.Name == "RBXSystem" or not var49(false) then "RBXGeneral" else p20.textChannel.Name else nil) elseif p20.textChannel then if p20.textChannel.Name == "RBXSystem" then "RBXGeneral" else p20.textChannel.Name else nil
	end
	
	local _ = function(p22)
		-- upvalues: fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(p22)
			
			return
		end
		p22()
	end
	
	local _ = function(p23)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (ref), list (copy), resolveChannelNameForMapOrder (ref), var38 (ref), dictionary (copy), var30 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (ref), var33 (ref), writeByMessageId (ref), var47 (ref), httpService (copy), var46 (ref), var48 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (ref), var35 (ref), var37 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var93 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (copy), var29 (copy), p23 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (copy), list (copy), resolveChannelNameForMapOrder (copy), var38 (copy), dictionary (copy), var30 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (copy), var33 (copy), writeByMessageId (copy), var47 (copy), httpService (copy), var46 (copy), var48 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (copy), var35 (copy), var37 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (copy), updateNextMessageComponent (copy)
			local var94 = if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false)
			
			if var94 and var94[p23.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (p23.status == Enum.TextChatMessageStatus.Floodchecked or p23.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var36(function(p24)
						-- upvalues: list (copy), p23 (copy)
						return list.filter(p24, function(p25)
							-- upvalues: p23 (copy)
							return p25 ~= p23.messageId
						end)
					end)
					local var95 = resolveChannelNameForMapOrder(p23, p23.channelNameOverride)
					
					if var95 then
						var38(function(p26)
							-- upvalues: var95 (ref), list (copy), p23 (copy), dictionary (copy)
							local var108 = p26[var95]
							
							return if var108 then dictionary.join(p26, {
								[var95] = list.filter(var108, function(p27)
									-- upvalues: p23 (copy)
									return p27 ~= p23.messageId
								end)
							}) else p26
						end)
					end
					local messageId = p23.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var31[messageId] = nil
					else
						var30(function(p28)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p28, messageId)
						end)
					end
					if p23.userId then
						local userId = p23.userId
						
						local var96 = function(p29)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), p23 (copy)
							if not p29 then
								return nil
							end
							local var109 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p29, function(p31)
								-- upvalues: p23 (copy)
								return p31 ~= p23.messageId
							end) else list.filter(p29, function(p30)
								-- upvalues: p23 (copy)
								return p30.messageId ~= p23.messageId
							end)
							
							return if #var109 == 0 then nil else var109
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var96(var34[userId])
							
							return
						end
						var33(function(p32)
							-- upvalues: var96 (ref), userId (ref), dictionary (copy)
							local var92 = var96(p32[userId])
							
							return if var92 == nil then dictionary.removeKey(p32, userId) else dictionary.join(p32, { [userId] = var92 })
						end)
					end
					return
				else
					writeByMessageId(p23.messageId, p23)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and p23.userId then
						local userId = p23.userId
						
						local var97 = function(p33)
							-- upvalues: p23 (copy), list (copy)
							if not p33 then
								return nil
							end
							local var110 = nil
							
							for i, v in ipairs(p33) do
								if v.messageId == p23.messageId then
									var110 = i
									break
								end
							end
							return if var110 then list.set(p33, var110, p23) else p33
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var97(var34[userId])
							
							return
						end
						var33(function(p34)
							-- upvalues: var97 (ref), userId (ref), dictionary (copy)
							local var92 = var97(p34[userId])
							
							return if var92 == nil then dictionary.removeKey(p34, userId) else dictionary.join(p34, { [userId] = var92 })
						end)
					end
					return
				end
			else
				local userId = p23.userId
				local partOrModel = p23.partOrModel
				
				if not userId and partOrModel then
					userId = var47(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var46(function(p35)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p35, { [userId] = partOrModel })
						end)
						var48(function(p36)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p36, { [partOrModel] = userId })
						end)
					end
				end
				local var98 = if userId ~= p23.userId then p23 else dictionary.join(p23, { userId = userId })
				local var99 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var98.channelNameOverride then
					var99 = var98.channelNameOverride
				elseif var98.textChannel then
					var99 = if var98.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var49(false) then "RBXGeneral" else var98.textChannel.Name
				end
				if var98.isVisibleInChatWindow then
					local var100 = var35(false)
					local var101 = if var99 then var37(false)[var99] or {} else {}
					
					if t.messageLimit <= #var100 then
						local var102 = var100[1]
						local var103 = var94 and var94[var102]
						
						if var103 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var102] = nil
								else
									var30(function(p37)
										-- upvalues: dictionary (copy), var102 (ref)
										return dictionary.removeKey(p37, var102)
									end)
								end
							end
							if var103.userId then
								local userId_1 = var103.userId
								
								local var104 = function(p38)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var102 (ref), var45 (copy), var103 (ref), var48 (copy), dictionary (copy), var46 (copy)
									if not p38 then
										return nil
									end
									local var111 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p38, function(p40)
										-- upvalues: var102 (copy)
										return p40 ~= var102
									end) else list.filter(p38, function(p39)
										-- upvalues: var102 (copy)
										return p39.messageId ~= var102
									end)
									
									if #var111 ~= 0 then
										return var111
									end
									local var112 = var45(false)
									
									if var112[var103.userId] then
										local userId = var112[var103.userId]
										var48(function(p41)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p41, userId)
										end)
										var46(function(p42)
											-- upvalues: dictionary (copy), var103 (copy)
											return dictionary.removeKey(p42, var103.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var34[userId_1] = var104(var34[userId_1])
								else
									var33(function(p43)
										-- upvalues: var104 (ref), userId_1 (ref), dictionary (copy)
										local var92 = var104(p43[userId_1])
										
										return if var92 == nil then dictionary.removeKey(p43, userId_1) else dictionary.join(p43, { [userId_1] = var92 })
									end)
								end
							end
							var36(function(p44)
								-- upvalues: list (copy)
								return list.removeIndex(p44, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var102] = nil
							end
						end
					end
					if var99 and t.messageLimit <= #var101 then
						local var105 = var101[1]
						
						if var105 then
							var38(function(p45)
								-- upvalues: var99 (write), list (copy), dictionary (copy)
								return dictionary.join(p45, { [var99] = list.removeIndex(p45[var99] or {}, 1) })
							end)
							
							if var94 and var94[var105] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var105] = nil
								else
									var30(function(p46)
										-- upvalues: dictionary (copy), var105 (ref)
										return dictionary.removeKey(p46, var105)
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
					
					local var106 = function(p47)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var98 (ref), list (copy)
						p47 = p47 or {}
						local var114 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p47) do
								if v == var98.messageId then
									var114 = true
								end
							end
						else
							for i, v in ipairs(p47) do
								if v.messageId == var98.messageId then
									var114 = true
									break
								end
							end
						end
						return if var114 then p47 else list.append(p47, if fFlagExpChatMessagesStoreMemoryCleanupModule then var98.messageId else var98)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var34[userId_1] = var106(var34[userId_1])
					else
						var33(function(p48)
							-- upvalues: var106 (ref), userId_1 (ref), dictionary (copy)
							local var92 = var106(p48[userId_1])
							
							return if var92 == nil then dictionary.removeKey(p48, userId_1) else dictionary.join(p48, { [userId_1] = var92 })
						end)
					end
				end
				if var98.isVisibleInChatWindow then
					var36(function(p49)
						-- upvalues: list (copy), var98 (ref)
						return list.append(p49, var98.messageId)
					end)
					
					if var99 then
						var38(function(p50)
							-- upvalues: var99 (write), list (copy), var98 (ref), dictionary (copy)
							return dictionary.join(p50, { [var99] = list.append(p50[var99] or {}, var98.messageId) })
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var107 = var58(false)
						
						if if var107 ~= nil then var99 == var107 else true then
							updateNextMessageComponent(var98.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var93)
			
			return
		end
		var93()
	end
	
	local t_4 = {}
	
	local function getMessage(p51)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref), t_3 (ref), createComputed (copy)
		if fFlagExpChatMessagesStoreUseProxyModule then
			return function(p52)
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (copy), var29 (copy), p51 (ref)
				return (if fFlagExpChatMessagesStoreUseProxyModule then var31(p52) else var29(p52))[p51]
			end
		elseif not t_3[p51] then
			t_3[p51] = createComputed(function(p53)
				-- upvalues: var29 (copy), p51 (ref)
				local var115 = var29(p53)
				
				return if var115 and var115[p51] then var115[p51] else nil
			end)
		end
		return t_3[p51]
	end
	
	local function getUserMessageCache(p54)
		-- upvalues: t_4 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), createComputed (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (ref), var32 (ref), var31 (ref), var29 (ref), var41 (ref), set (copy)
		local var116 = tostring(p54)
		
		if not t_4[var116] then
			t_4[var116] = {}
			
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var116].messages = createComputed(function(p55)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (copy), var32 (copy), var116 (ref)
					return (if fFlagExpChatMessagesStoreUseProxyModule then var34(p55) else var32(p55))[var116] or {}
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var116].bubbleMessages = createComputed(function(p56)
					-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (copy), var32 (copy), var116 (ref), var31 (copy), var29 (copy), var41 (copy), set (copy)
					local var117 = (if fFlagExpChatMessagesStoreUseProxyModule then var34(p56) else var32(p56))[var116] or {}
					local var118 = if fFlagExpChatMessagesStoreUseProxyModule then var31(p56) else var29(p56)
					local var119 = var41(p56)
					local t = {}
					
					for i, v in ipairs(var117) do
						local var121 = var118[v]
						
						if var121 then
							if var121.isVisibleInBubbleChat and not (var121.userId and set.has(var119, var121.userId) or false) then
								table.insert(t, var121)
							end
						end
					end
					return t
				end)
			else
				t_4[var116].bubbleMessages = createComputed(function(p57)
					-- upvalues: t_4 (copy), var116 (ref), var41 (copy), set (copy)
					local var122 = t_4[var116].messages(p57)
					local var123 = var41(p57)
					local t = {}
					
					for i, v in ipairs(var122) do
						if v.isVisibleInBubbleChat and not (v.userId and set.has(var123, v.userId) or false) then
							table.insert(t, v)
						end
					end
					return t
				end)
			end
			if not fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var116].lastMessage = createComputed(function(p58)
					-- upvalues: t_4 (copy), var116 (ref)
					local var125 = t_4[var116].messages(p58)
					
					return if #var125 > 0 then var125[#var125] else nil
				end)
			end
		end
		return t_4[var116]
	end
	
	local function getUserMessages(p59)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p59).messages
	end
	
	local function getUserBubbleMessages(p60)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p60).bubbleMessages
	end
	
	local function getUserLastMessage(p61)
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p61).lastMessage
	end
	
	local _ = function()
		-- upvalues: createComputed (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref)
		return createComputed(function(p62)
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (copy), var29 (copy)
			local var126 = if fFlagExpChatMessagesStoreUseProxyModule then var31(p62) else var29(p62)
			
			if not var126 then
				return {}
			end
			local t = {}
			
			for i, v in var126 do
				table.insert(t, v)
			end
			return t
		end)
	end
	
	local function addSystemMessage(p63, p64, p65, p66, p67)
		-- upvalues: sanitizeForRichTextModule (copy), getFFlagExpChatSyntheticSystemMessageRichText (copy), generateRichSystemMessageTextFormatModule (copy), fFlagExpChatDictation (copy), httpService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (ref), list (copy), resolveChannelNameForMapOrder (ref), var38 (ref), dictionary (copy), var30 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (ref), var33 (ref), writeByMessageId (ref), var47 (ref), var46 (ref), var48 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (ref), var35 (ref), var37 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var128 = sanitizeForRichTextModule(p63)
		local t_1 = {
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
			text = if getFFlagExpChatSyntheticSystemMessageRichText() then generateRichSystemMessageTextFormatModule(var128, if fFlagExpChatDictation then p67 else nil, p66) else var128,
			messageId = httpService:GenerateGUID(false),
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			channelNameOverride = p64,
			metadata = p65
		}
		
		local var130 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (copy), var29 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (copy), list (copy), resolveChannelNameForMapOrder (copy), var38 (copy), dictionary (copy), var30 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (copy), var33 (copy), writeByMessageId (copy), var47 (copy), httpService (copy), var46 (copy), var48 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (copy), var35 (copy), var37 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (copy), updateNextMessageComponent (copy)
			local var94 = if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false)
			
			if var94 and var94[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var36(function(p68)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p68, function(p69)
							-- upvalues: t_1 (copy)
							return p69 ~= t_1.messageId
						end)
					end)
					local var95 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var95 then
						var38(function(p70)
							-- upvalues: var95 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var108 = p70[var95]
							
							return if var108 then dictionary.join(p70, {
								[var95] = list.filter(var108, function(p71)
									-- upvalues: t_1 (copy)
									return p71 ~= t_1.messageId
								end)
							}) else p70
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var31[messageId] = nil
					else
						var30(function(p72)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p72, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var96 = function(p73)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p73 then
								local var109 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p73, function(p75)
									-- upvalues: t_1 (copy)
									return p75 ~= t_1.messageId
								end) else list.filter(p73, function(p74)
									-- upvalues: t_1 (copy)
									return p74.messageId ~= t_1.messageId
								end)
								
								return if #var109 == 0 then nil else var109
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var96(var34[userId])
							
							return
						end
						var33(function(p76)
							-- upvalues: var96 (ref), userId (ref), dictionary (copy)
							local var92 = var96(p76[userId])
							
							return if var92 == nil then dictionary.removeKey(p76, userId) else dictionary.join(p76, { [userId] = var92 })
						end)
					end
					return
				else
					writeByMessageId(t_1.messageId, t_1)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
						local userId = t_1.userId
						
						local var97 = function(p77)
							-- upvalues: t_1 (copy), list (copy)
							if not p77 then
								return nil
							end
							local var110 = nil
							
							for i, v in ipairs(p77) do
								if v.messageId == t_1.messageId then break end
							end
							return if var110 then list.set(p77, var110, t_1) else p77
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var97(var34[userId])
							
							return
						end
						var33(function(p78)
							-- upvalues: var97 (ref), userId (ref), dictionary (copy)
							local var92 = var97(p78[userId])
							
							return if var92 == nil then dictionary.removeKey(p78, userId) else dictionary.join(p78, { [userId] = var92 })
						end)
					end
					return
				end
			else
				local userId = t_1.userId
				local partOrModel = t_1.partOrModel
				
				if not userId and partOrModel then
					userId = var47(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var46(function(p79)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p79, { [userId] = partOrModel })
						end)
						var48(function(p80)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p80, { [partOrModel] = userId })
						end)
					end
				end
				local var98 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var99 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var98.channelNameOverride then
					var99 = var98.channelNameOverride
				elseif var98.textChannel then
					var99 = if var98.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var49(false) then "RBXGeneral" else var98.textChannel.Name
				end
				if var98.isVisibleInChatWindow then
					local var100 = var35(false)
					local var101 = if var99 then var37(false)[var99] or {} else {}
					
					if t.messageLimit <= #var100 then
						local var102 = var100[1]
						local var103 = var94 and var94[var102]
						
						if var103 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var102] = nil
								else
									var30(function(p81)
										-- upvalues: dictionary (copy), var102 (ref)
										return dictionary.removeKey(p81, var102)
									end)
								end
							end
							if var103.userId then
								local userId_1 = var103.userId
								
								local var104 = function(p82)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var102 (ref), var45 (copy), var103 (ref), var48 (copy), dictionary (copy), var46 (copy)
									if not p82 then
										return nil
									end
									local var111 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p82, function(p84)
										-- upvalues: var102 (copy)
										return p84 ~= var102
									end) else list.filter(p82, function(p83)
										-- upvalues: var102 (copy)
										return p83.messageId ~= var102
									end)
									
									if #var111 ~= 0 then
										return var111
									end
									local var112 = var45(false)
									
									if var112[var103.userId] then
										local userId = var112[var103.userId]
										var48(function(p85)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p85, userId)
										end)
										var46(function(p86)
											-- upvalues: dictionary (copy), var103 (copy)
											return dictionary.removeKey(p86, var103.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var34[userId_1] = var104(var34[userId_1])
								else
									var33(function(p87)
										-- upvalues: var104 (ref), userId_1 (ref), dictionary (copy)
										local var92 = var104(p87[userId_1])
										
										return if var92 == nil then dictionary.removeKey(p87, userId_1) else dictionary.join(p87, { [userId_1] = var92 })
									end)
								end
							end
							var36(function(p88)
								-- upvalues: list (copy)
								return list.removeIndex(p88, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var102] = nil
							end
						end
					end
					if var99 and t.messageLimit <= #var101 then
						local var105 = var101[1]
						
						if var105 then
							var38(function(p89)
								-- upvalues: var99 (write), list (copy), dictionary (copy)
								return dictionary.join(p89, { [var99] = list.removeIndex(p89[var99] or {}, 1) })
							end)
							
							if var94 and var94[var105] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var105] = nil
								else
									var30(function(p90)
										-- upvalues: dictionary (copy), var105 (ref)
										return dictionary.removeKey(p90, var105)
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
					
					local var106 = function(p91)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var98 (ref), list (copy)
						local p47 = p91 or {}
						local var114 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p47) do
								if v == var98.messageId then
									var114 = true
								end
							end
						else
							for i, v in ipairs(p47) do
								if v.messageId == var98.messageId then
									local var114 = true
									break
								end
							end
						end
						return if var114 then p47 else list.append(p47, if fFlagExpChatMessagesStoreMemoryCleanupModule then var98.messageId else var98)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var34[userId_1] = var106(var34[userId_1])
					else
						var33(function(p92)
							-- upvalues: var106 (ref), userId_1 (ref), dictionary (copy)
							local var92 = var106(p92[userId_1])
							
							return if var92 == nil then dictionary.removeKey(p92, userId_1) else dictionary.join(p92, { [userId_1] = var92 })
						end)
					end
				end
				if var98.isVisibleInChatWindow then
					var36(function(p93)
						-- upvalues: list (copy), var98 (ref)
						return list.append(p93, var98.messageId)
					end)
					
					if var99 then
						var38(function(p94)
							-- upvalues: var99 (write), list (copy), var98 (ref), dictionary (copy)
							return dictionary.join(p94, { [var99] = list.append(p94[var99] or {}, var98.messageId) })
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var107 = var58(false)
						
						if if var107 ~= nil then var99 == var107 else true then
							updateNextMessageComponent(var98.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var130)
			
			return
		end
		var130()
	end
	
	local function formatPrefixForUniverseChatTabs(value, p95, p96)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), computeNameColor (copy), playersService (copy)
		return if getFFlagTextChatEnableUniverseChatTabs() and p95 and #value ~= 0 then `<font color="#{(if p96.TextSource then computeNameColor(p96.TextSource.Username) else computeNameColor(if playersService.LocalPlayer then playersService.LocalPlayer.Name else "")):ToHex()}">{value}</font>` else value
	end
	
	local function handleIncomingOrOutgoingMessage(a, b, p97, p98)
		-- upvalues: fFlagEnableInExpChatRewriteModule (copy), getTextAndTranslationModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), isWhiteSpaceOnlyModule (copy), fFlagExpChatFixLocalUserVerifiedBadgeModule (copy), playersService (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref), var42 (ref), fFlagExpChatPresetChatEnabled (copy), var41 (ref), set (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), expChatSharedModule (copy), var44 (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatDisableUniverseBubbleChat (copy), getFFlagTextChatEnableUniverseChatTabs (copy), formatPrefixForUniverseChatTabs (ref), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagChatLineReportingGlobalMuteEnabled (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (ref), list (copy), resolveChannelNameForMapOrder (ref), var38 (ref), dictionary (copy), var30 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (ref), var33 (ref), writeByMessageId (ref), var47 (ref), httpService (copy), var46 (ref), var48 (ref), var49 (ref), var35 (ref), var37 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var133, var134
		local _ = nil
		local _ = nil
		
		if fFlagEnableInExpChatRewriteModule then
			local var131, var132 = getTextAndTranslationModule(a)
			var133 = var131
			var134 = var132
		else
			var133 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TextInternal else a.Text
			var134 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TranslationInternal else a.Translation
		end
		if isWhiteSpaceOnlyModule(var133) and a.Status ~= Enum.TextChatMessageStatus.Floodchecked and a.Status ~= Enum.TextChatMessageStatus.MessageTooLong then return end
		local var135 = if a.TextSource then tostring(a.TextSource.UserId) elseif fFlagExpChatFixLocalUserVerifiedBadgeModule and b and playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else nil
		
		if not (if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false)) then return end
		local var139
		local _ = nil
		local var136 = var135 == nil or (if var42(false) or fFlagExpChatPresetChatEnabled and (a.PresetId or "") ~= "" then if a.Status ~= Enum.TextChatMessageStatus.Success then a.Status == Enum.TextChatMessageStatus.Sending else true else false)
		var136 = var136 and not (if var135 and var41(false) then set.has(var41(false), var135) else false)
		local var137 = false
		local _ = nil
		
		if fFlagExpChatUseChatConfigStore then
			var139 = getChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false)
		else
			local store = expChatSharedModule.context and expChatSharedModule.context.store
			var139 = if store then store:getState().Messages.isBubbleChatEnabled else var44(false)
		end
		if var139 and var136 and (not fFlagEnableInExpChatSummaryOnLuaModule or var135 ~= nil) and (a.Status == Enum.TextChatMessageStatus.Success or a.Status == Enum.TextChatMessageStatus.Sending) then
			var137 = true
		end
		if fFlagExpChatDisableUniverseBubbleChat and getFFlagTextChatEnableUniverseChatTabs() and p98 == true then
			var137 = false
		end
		if a.Status ~= Enum.TextChatMessageStatus.Success and a.Status ~= Enum.TextChatMessageStatus.Sending then
			var136 = false
			var137 = false
		end
		local t_1 = {
			shouldOverrideBubbleChatSettings = false,
			userId = var135,
			prefixText = formatPrefixForUniverseChatTabs(if getFFlagExpChatProtectedChatInternalAPIs() then a.PrefixTextInternal else a.PrefixText, p97, a),
			text = var133,
			translation = var134,
			useTranslation = getChatTranslationEnabled() and var134 ~= nil,
			messageId = a.MessageId,
			status = a.Status,
			timestamp = a.Timestamp,
			isVisibleInBubbleChat = var137,
			isVisibleInChatWindow = var136,
			textChannel = a.TextChannel,
			bubbleChatMessageProperties = a.BubbleChatMessageProperties,
			chatWindowMessageProperties = a.ChatWindowMessageProperties,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then a else nil,
			partOrModel = if a.TextSource then a.TextSource.Parent else nil,
			wasRewritten = if fFlagEnableInExpChatRewriteModule then a.WasRewritten else nil,
			originalText = if fFlagEnableInExpChatRewriteModule then a.OriginalText else nil,
			channelNameOverride = if getFFlagTextChatEnableUniverseChatTabs() and p97 then p97 else nil,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then a.ChatActionType else nil,
			isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p98 else nil,
			presetId = if fFlagExpChatPresetChatEnabled then a.PresetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then a.PresetChatVersion else nil
		}
		local var141 = if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false)
		
		if t_1.isVisibleInChatWindow or t_1.isVisibleInBubbleChat or var141 and var141[t_1.messageId] ~= nil then
			local var142 = function()
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (copy), var29 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (copy), list (copy), resolveChannelNameForMapOrder (copy), var38 (copy), dictionary (copy), var30 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (copy), var33 (copy), writeByMessageId (copy), var47 (copy), httpService (copy), var46 (copy), var48 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (copy), var35 (copy), var37 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (copy), updateNextMessageComponent (copy)
				local var94 = if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false)
				
				if var94 and var94[t_1.messageId] then
					if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
						var36(function(p99)
							-- upvalues: list (copy), t_1 (copy)
							return list.filter(p99, function(p100)
								-- upvalues: t_1 (copy)
								return p100 ~= t_1.messageId
							end)
						end)
						local var95 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
						
						if var95 then
							var38(function(p101)
								-- upvalues: var95 (ref), list (copy), t_1 (copy), dictionary (copy)
								local var108 = p101[var95]
								
								return if var108 then dictionary.join(p101, {
									[var95] = list.filter(var108, function(p102)
										-- upvalues: t_1 (copy)
										return p102 ~= t_1.messageId
									end)
								}) else p101
							end)
						end
						local messageId = t_1.messageId
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var31[messageId] = nil
						else
							var30(function(p103)
								-- upvalues: dictionary (copy), messageId (ref)
								return dictionary.removeKey(p103, messageId)
							end)
						end
						if t_1.userId then
							local userId = t_1.userId
							
							local var96 = function(p104)
								-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
								if p104 then
									local var109 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p104, function(p106)
										-- upvalues: t_1 (copy)
										return p106 ~= t_1.messageId
									end) else list.filter(p104, function(p105)
										-- upvalues: t_1 (copy)
										return p105.messageId ~= t_1.messageId
									end)
									
									return if #var109 == 0 then nil else var109
								end
								return nil
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var34[userId] = var96(var34[userId])
								
								return
							end
							var33(function(p107)
								-- upvalues: var96 (ref), userId (ref), dictionary (copy)
								local var92 = var96(p107[userId])
								
								return if var92 == nil then dictionary.removeKey(p107, userId) else dictionary.join(p107, { [userId] = var92 })
							end)
						end
						return
					else
						writeByMessageId(t_1.messageId, t_1)
						
						if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
							local userId = t_1.userId
							
							local var97 = function(p108)
								-- upvalues: t_1 (copy), list (copy)
								if not p108 then
									return nil
								end
								local var110 = nil
								
								for i, v in ipairs(p108) do
									if v.messageId == t_1.messageId then break end
								end
								return if var110 then list.set(p108, var110, t_1) else p108
							end
							
							if fFlagExpChatMessagesStoreUseProxyModule then
								var34[userId] = var97(var34[userId])
								
								return
							end
							var33(function(p109)
								-- upvalues: var97 (ref), userId (ref), dictionary (copy)
								local var92 = var97(p109[userId])
								
								return if var92 == nil then dictionary.removeKey(p109, userId) else dictionary.join(p109, { [userId] = var92 })
							end)
						end
						return
					end
				else
					local userId = t_1.userId
					local partOrModel = t_1.partOrModel
					
					if not userId and partOrModel then
						userId = var47(false)[partOrModel]
						
						if not userId then
							userId = httpService:GenerateGUID(false)
							var46(function(p110)
								-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
								return dictionary.join(p110, { [userId] = partOrModel })
							end)
							var48(function(p111)
								-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
								return dictionary.join(p111, { [partOrModel] = userId })
							end)
						end
					end
					local var98 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
					local var99 = nil
					
					if getFFlagTextChatEnableUniverseChatTabs() and var98.channelNameOverride then
						var99 = var98.channelNameOverride
					elseif var98.textChannel then
						var99 = if var98.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var49(false) then "RBXGeneral" else var98.textChannel.Name
					end
					if var98.isVisibleInChatWindow then
						local var100 = var35(false)
						local var101 = if var99 then var37(false)[var99] or {} else {}
						
						if t.messageLimit <= #var100 then
							local var102 = var100[1]
							local var103 = var94 and var94[var102]
							
							if var103 then
								if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
									if fFlagExpChatMessagesStoreUseProxyModule then
										var31[var102] = nil
									else
										var30(function(p112)
											-- upvalues: dictionary (copy), var102 (ref)
											return dictionary.removeKey(p112, var102)
										end)
									end
								end
								if var103.userId then
									local userId_1 = var103.userId
									
									local var104 = function(p113)
										-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var102 (ref), var45 (copy), var103 (ref), var48 (copy), dictionary (copy), var46 (copy)
										if not p113 then
											return nil
										end
										local var111 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p113, function(p115)
											-- upvalues: var102 (copy)
											return p115 ~= var102
										end) else list.filter(p113, function(p114)
											-- upvalues: var102 (copy)
											return p114.messageId ~= var102
										end)
										
										if #var111 ~= 0 then
											return var111
										end
										local var112 = var45(false)
										
										if var112[var103.userId] then
											local userId = var112[var103.userId]
											var48(function(p116)
												-- upvalues: dictionary (copy), userId (ref)
												return dictionary.removeKey(p116, userId)
											end)
											var46(function(p117)
												-- upvalues: dictionary (copy), var103 (copy)
												return dictionary.removeKey(p117, var103.userId)
											end)
										end
										return nil
									end
									
									if fFlagExpChatMessagesStoreUseProxyModule then
										var34[userId_1] = var104(var34[userId_1])
									else
										var33(function(p118)
											-- upvalues: var104 (ref), userId_1 (ref), dictionary (copy)
											local var92 = var104(p118[userId_1])
											
											return if var92 == nil then dictionary.removeKey(p118, userId_1) else dictionary.join(p118, { [userId_1] = var92 })
										end)
									end
								end
								var36(function(p119)
									-- upvalues: list (copy)
									return list.removeIndex(p119, 1)
								end)
								
								if fFlagExpChatMessagesStoreMemoryCleanupModule then
									t_3[var102] = nil
								end
							end
						end
						if var99 and t.messageLimit <= #var101 then
							local var105 = var101[1]
							
							if var105 then
								var38(function(p120)
									-- upvalues: var99 (write), list (copy), dictionary (copy)
									return dictionary.join(p120, { [var99] = list.removeIndex(p120[var99] or {}, 1) })
								end)
								
								if var94 and var94[var105] then
									if fFlagExpChatMessagesStoreUseProxyModule then
										var31[var105] = nil
									else
										var30(function(p121)
											-- upvalues: dictionary (copy), var105 (ref)
											return dictionary.removeKey(p121, var105)
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
						
						local var106 = function(p122)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var98 (ref), list (copy)
							local p47 = p122 or {}
							local var114 = false
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								for i, v in ipairs(p47) do
									if v == var98.messageId then
										var114 = true
									end
								end
							else
								for i, v in ipairs(p47) do
									if v.messageId == var98.messageId then
										local var114 = true
										break
									end
								end
							end
							return if var114 then p47 else list.append(p47, if fFlagExpChatMessagesStoreMemoryCleanupModule then var98.messageId else var98)
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId_1] = var106(var34[userId_1])
						else
							var33(function(p123)
								-- upvalues: var106 (ref), userId_1 (ref), dictionary (copy)
								local var92 = var106(p123[userId_1])
								
								return if var92 == nil then dictionary.removeKey(p123, userId_1) else dictionary.join(p123, { [userId_1] = var92 })
							end)
						end
					end
					if var98.isVisibleInChatWindow then
						var36(function(p124)
							-- upvalues: list (copy), var98 (ref)
							return list.append(p124, var98.messageId)
						end)
						
						if var99 then
							var38(function(p125)
								-- upvalues: var99 (write), list (copy), var98 (ref), dictionary (copy)
								return dictionary.join(p125, {
									[var99] = list.append(p125[var99] or {}, var98.messageId)
								})
							end)
						end
						if fFlagExpChatEnableV2ChatWindowModule then
							local var107 = var58(false)
							
							if if var107 ~= nil then var99 == var107 else true then
								updateNextMessageComponent(var98.messageId)
							end
						end
					end
				end
			end
			
			if fFlagExpChatMessagesStoreBatchModule then
				signalsExperimentalModule.batch(var142)
				
				return
			end
			var142()
		end
	end
	
	local function handleIncomingBubbleChatMessage(a)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (ref), list (copy), resolveChannelNameForMapOrder (ref), var38 (ref), dictionary (copy), var30 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (ref), var33 (ref), writeByMessageId (ref), var47 (ref), httpService (copy), var46 (ref), var48 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (ref), var35 (ref), var37 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
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
		
		local var144 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (copy), var29 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (copy), list (copy), resolveChannelNameForMapOrder (copy), var38 (copy), dictionary (copy), var30 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (copy), var33 (copy), writeByMessageId (copy), var47 (copy), httpService (copy), var46 (copy), var48 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (copy), var35 (copy), var37 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (copy), updateNextMessageComponent (copy)
			local var94 = if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false)
			
			if var94 and var94[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var36(function(p126)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p126, function(p127)
							-- upvalues: t_1 (copy)
							return p127 ~= t_1.messageId
						end)
					end)
					local var95 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var95 then
						var38(function(p128)
							-- upvalues: var95 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var108 = p128[var95]
							
							return if var108 then dictionary.join(p128, {
								[var95] = list.filter(var108, function(p129)
									-- upvalues: t_1 (copy)
									return p129 ~= t_1.messageId
								end)
							}) else p128
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var31[messageId] = nil
					else
						var30(function(p130)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p130, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var96 = function(p131)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p131 then
								local var109 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p131, function(p133)
									-- upvalues: t_1 (copy)
									return p133 ~= t_1.messageId
								end) else list.filter(p131, function(p132)
									-- upvalues: t_1 (copy)
									return p132.messageId ~= t_1.messageId
								end)
								
								return if #var109 == 0 then nil else var109
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var96(var34[userId])
							
							return
						end
						var33(function(p134)
							-- upvalues: var96 (ref), userId (ref), dictionary (copy)
							local var92 = var96(p134[userId])
							
							return if var92 == nil then dictionary.removeKey(p134, userId) else dictionary.join(p134, { [userId] = var92 })
						end)
					end
					return
				else
					writeByMessageId(t_1.messageId, t_1)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
						local userId = t_1.userId
						
						local var97 = function(p135)
							-- upvalues: t_1 (copy), list (copy)
							if not p135 then
								return nil
							end
							local var110 = nil
							
							for i, v in ipairs(p135) do
								if v.messageId == t_1.messageId then break end
							end
							return if var110 then list.set(p135, var110, t_1) else p135
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var97(var34[userId])
							
							return
						end
						var33(function(p136)
							-- upvalues: var97 (ref), userId (ref), dictionary (copy)
							local var92 = var97(p136[userId])
							
							return if var92 == nil then dictionary.removeKey(p136, userId) else dictionary.join(p136, { [userId] = var92 })
						end)
					end
					return
				end
			else
				local userId = t_1.userId
				local partOrModel = t_1.partOrModel
				
				if not userId and partOrModel then
					userId = var47(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var46(function(p137)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p137, { [userId] = partOrModel })
						end)
						var48(function(p138)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p138, { [partOrModel] = userId })
						end)
					end
				end
				local var98 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var99 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var98.channelNameOverride then
					var99 = var98.channelNameOverride
				elseif var98.textChannel then
					var99 = if var98.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var49(false) then "RBXGeneral" else var98.textChannel.Name
				end
				if var98.isVisibleInChatWindow then
					local var100 = var35(false)
					local var101 = if var99 then var37(false)[var99] or {} else {}
					
					if t.messageLimit <= #var100 then
						local var102 = var100[1]
						local var103 = var94 and var94[var102]
						
						if var103 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var102] = nil
								else
									var30(function(p139)
										-- upvalues: dictionary (copy), var102 (ref)
										return dictionary.removeKey(p139, var102)
									end)
								end
							end
							if var103.userId then
								local userId_1 = var103.userId
								
								local var104 = function(p140)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var102 (ref), var45 (copy), var103 (ref), var48 (copy), dictionary (copy), var46 (copy)
									if not p140 then
										return nil
									end
									local var111 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p140, function(p142)
										-- upvalues: var102 (copy)
										return p142 ~= var102
									end) else list.filter(p140, function(p141)
										-- upvalues: var102 (copy)
										return p141.messageId ~= var102
									end)
									
									if #var111 ~= 0 then
										return var111
									end
									local var112 = var45(false)
									
									if var112[var103.userId] then
										local userId = var112[var103.userId]
										var48(function(p143)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p143, userId)
										end)
										var46(function(p144)
											-- upvalues: dictionary (copy), var103 (copy)
											return dictionary.removeKey(p144, var103.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var34[userId_1] = var104(var34[userId_1])
								else
									var33(function(p145)
										-- upvalues: var104 (ref), userId_1 (ref), dictionary (copy)
										local var92 = var104(p145[userId_1])
										
										return if var92 == nil then dictionary.removeKey(p145, userId_1) else dictionary.join(p145, { [userId_1] = var92 })
									end)
								end
							end
							var36(function(p146)
								-- upvalues: list (copy)
								return list.removeIndex(p146, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var102] = nil
							end
						end
					end
					if var99 and t.messageLimit <= #var101 then
						local var105 = var101[1]
						
						if var105 then
							var38(function(p147)
								-- upvalues: var99 (write), list (copy), dictionary (copy)
								return dictionary.join(p147, { [var99] = list.removeIndex(p147[var99] or {}, 1) })
							end)
							
							if var94 and var94[var105] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var105] = nil
								else
									var30(function(p148)
										-- upvalues: dictionary (copy), var105 (ref)
										return dictionary.removeKey(p148, var105)
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
					
					local var106 = function(p149)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var98 (ref), list (copy)
						local p47 = p149 or {}
						local var114 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p47) do
								if v == var98.messageId then
									var114 = true
								end
							end
						else
							for i, v in ipairs(p47) do
								if v.messageId == var98.messageId then
									local var114 = true
									break
								end
							end
						end
						return if var114 then p47 else list.append(p47, if fFlagExpChatMessagesStoreMemoryCleanupModule then var98.messageId else var98)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var34[userId_1] = var106(var34[userId_1])
					else
						var33(function(p150)
							-- upvalues: var106 (ref), userId_1 (ref), dictionary (copy)
							local var92 = var106(p150[userId_1])
							
							return if var92 == nil then dictionary.removeKey(p150, userId_1) else dictionary.join(p150, { [userId_1] = var92 })
						end)
					end
				end
				if var98.isVisibleInChatWindow then
					var36(function(p151)
						-- upvalues: list (copy), var98 (ref)
						return list.append(p151, var98.messageId)
					end)
					
					if var99 then
						var38(function(p152)
							-- upvalues: var99 (write), list (copy), var98 (ref), dictionary (copy)
							return dictionary.join(p152, {
								[var99] = list.append(p152[var99] or {}, var98.messageId)
							})
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var107 = var58(false)
						
						if if var107 ~= nil then var99 == var107 else true then
							updateNextMessageComponent(var98.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var144)
			
			return
		end
		var144()
	end
	
	local function handleHiddenMessageReceived(p153)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), fIntExpChatRandomCharChangeLowerBoundModule (copy), fIntExpChatRandomCharChangeUpperBoundModule (copy), configModule (copy), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (ref), list (copy), resolveChannelNameForMapOrder (ref), var38 (ref), dictionary (copy), var30 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (ref), var33 (ref), writeByMessageId (ref), var47 (ref), httpService (copy), var46 (ref), var48 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (ref), var35 (ref), var37 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var145 = string.len(if getFFlagExpChatProtectedChatInternalAPIs() then p153.TextInternal else p153.Text)
		local t_1 = {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = configModule.LOCK_EMOJI .. " :",
			text = string.rep(configModule.DOT_TEXT, var145 + math.random(math.max(fIntExpChatRandomCharChangeLowerBoundModule, -(var145 - 1)), fIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = p153.TextChannel,
			messageId = p153.MessageId,
			status = p153.Status,
			timestamp = p153.Timestamp,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p153 else nil
		}
		
		local var147 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (copy), var29 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (copy), list (copy), resolveChannelNameForMapOrder (copy), var38 (copy), dictionary (copy), var30 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (copy), var33 (copy), writeByMessageId (copy), var47 (copy), httpService (copy), var46 (copy), var48 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (copy), var35 (copy), var37 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (copy), updateNextMessageComponent (copy)
			local var94 = if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false)
			
			if var94 and var94[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var36(function(p154)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p154, function(p155)
							-- upvalues: t_1 (copy)
							return p155 ~= t_1.messageId
						end)
					end)
					local var95 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var95 then
						var38(function(p156)
							-- upvalues: var95 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var108 = p156[var95]
							
							return if var108 then dictionary.join(p156, {
								[var95] = list.filter(var108, function(p157)
									-- upvalues: t_1 (copy)
									return p157 ~= t_1.messageId
								end)
							}) else p156
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var31[messageId] = nil
					else
						var30(function(p158)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p158, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var96 = function(p159)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p159 then
								local var109 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p159, function(p161)
									-- upvalues: t_1 (copy)
									return p161 ~= t_1.messageId
								end) else list.filter(p159, function(p160)
									-- upvalues: t_1 (copy)
									return p160.messageId ~= t_1.messageId
								end)
								
								return if #var109 == 0 then nil else var109
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var96(var34[userId])
							
							return
						end
						var33(function(p162)
							-- upvalues: var96 (ref), userId (ref), dictionary (copy)
							local var92 = var96(p162[userId])
							
							return if var92 == nil then dictionary.removeKey(p162, userId) else dictionary.join(p162, { [userId] = var92 })
						end)
					end
					return
				else
					writeByMessageId(t_1.messageId, t_1)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
						local userId = t_1.userId
						
						local var97 = function(p163)
							-- upvalues: t_1 (copy), list (copy)
							if not p163 then
								return nil
							end
							local var110 = nil
							
							for i, v in ipairs(p163) do
								if v.messageId == t_1.messageId then break end
							end
							return if var110 then list.set(p163, var110, t_1) else p163
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var97(var34[userId])
							
							return
						end
						var33(function(p164)
							-- upvalues: var97 (ref), userId (ref), dictionary (copy)
							local var92 = var97(p164[userId])
							
							return if var92 == nil then dictionary.removeKey(p164, userId) else dictionary.join(p164, { [userId] = var92 })
						end)
					end
					return
				end
			else
				local userId = t_1.userId
				local partOrModel = t_1.partOrModel
				
				if not userId and partOrModel then
					userId = var47(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var46(function(p165)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p165, { [userId] = partOrModel })
						end)
						var48(function(p166)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p166, { [partOrModel] = userId })
						end)
					end
				end
				local var98 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var99 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var98.channelNameOverride then
					var99 = var98.channelNameOverride
				elseif var98.textChannel then
					var99 = if var98.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var49(false) then "RBXGeneral" else var98.textChannel.Name
				end
				if var98.isVisibleInChatWindow then
					local var100 = var35(false)
					local var101 = if var99 then var37(false)[var99] or {} else {}
					
					if t.messageLimit <= #var100 then
						local var102 = var100[1]
						local var103 = var94 and var94[var102]
						
						if var103 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var102] = nil
								else
									var30(function(p167)
										-- upvalues: dictionary (copy), var102 (ref)
										return dictionary.removeKey(p167, var102)
									end)
								end
							end
							if var103.userId then
								local userId_1 = var103.userId
								
								local var104 = function(p168)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var102 (ref), var45 (copy), var103 (ref), var48 (copy), dictionary (copy), var46 (copy)
									if not p168 then
										return nil
									end
									local var111 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p168, function(p170)
										-- upvalues: var102 (copy)
										return p170 ~= var102
									end) else list.filter(p168, function(p169)
										-- upvalues: var102 (copy)
										return p169.messageId ~= var102
									end)
									
									if #var111 ~= 0 then
										return var111
									end
									local var112 = var45(false)
									
									if var112[var103.userId] then
										local userId = var112[var103.userId]
										var48(function(p171)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p171, userId)
										end)
										var46(function(p172)
											-- upvalues: dictionary (copy), var103 (copy)
											return dictionary.removeKey(p172, var103.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var34[userId_1] = var104(var34[userId_1])
								else
									var33(function(p173)
										-- upvalues: var104 (ref), userId_1 (ref), dictionary (copy)
										local var92 = var104(p173[userId_1])
										
										return if var92 == nil then dictionary.removeKey(p173, userId_1) else dictionary.join(p173, { [userId_1] = var92 })
									end)
								end
							end
							var36(function(p174)
								-- upvalues: list (copy)
								return list.removeIndex(p174, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var102] = nil
							end
						end
					end
					if var99 and t.messageLimit <= #var101 then
						local var105 = var101[1]
						
						if var105 then
							var38(function(p175)
								-- upvalues: var99 (write), list (copy), dictionary (copy)
								return dictionary.join(p175, { [var99] = list.removeIndex(p175[var99] or {}, 1) })
							end)
							
							if var94 and var94[var105] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var105] = nil
								else
									var30(function(p176)
										-- upvalues: dictionary (copy), var105 (ref)
										return dictionary.removeKey(p176, var105)
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
					
					local var106 = function(p177)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var98 (ref), list (copy)
						local p47 = p177 or {}
						local var114 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p47) do
								if v == var98.messageId then
									var114 = true
								end
							end
						else
							for i, v in ipairs(p47) do
								if v.messageId == var98.messageId then
									local var114 = true
									break
								end
							end
						end
						return if var114 then p47 else list.append(p47, if fFlagExpChatMessagesStoreMemoryCleanupModule then var98.messageId else var98)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var34[userId_1] = var106(var34[userId_1])
					else
						var33(function(p178)
							-- upvalues: var106 (ref), userId_1 (ref), dictionary (copy)
							local var92 = var106(p178[userId_1])
							
							return if var92 == nil then dictionary.removeKey(p178, userId_1) else dictionary.join(p178, { [userId_1] = var92 })
						end)
					end
				end
				if var98.isVisibleInChatWindow then
					var36(function(p179)
						-- upvalues: list (copy), var98 (ref)
						return list.append(p179, var98.messageId)
					end)
					
					if var99 then
						var38(function(p180)
							-- upvalues: var99 (write), list (copy), var98 (ref), dictionary (copy)
							return dictionary.join(p180, {
								[var99] = list.append(p180[var99] or {}, var98.messageId)
							})
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var107 = var58(false)
						
						if if var107 ~= nil then var99 == var107 else true then
							updateNextMessageComponent(var98.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var147)
			
			return
		end
		var147()
	end
	
	local function handlePlayerRemoved(p181)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (ref), var33 (ref), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (ref), var40 (ref), set (copy), var32 (ref), var45 (ref), var48 (ref), var46 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local var148 = tostring(p181)
		
		local function doHandlePlayerRemoved()
			-- upvalues: var148 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (copy), var33 (copy), dictionary (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), t_4 (copy), var40 (copy), set (copy), var32 (copy), var45 (copy), var48 (copy), var46 (copy)
			if fFlagExpChatMessagesStoreUseProxyModule then
				var34[var148] = nil
			else
				var33(function(p182)
					-- upvalues: dictionary (copy), var148 (ref)
					return dictionary.removeKey(p182, var148)
				end)
			end
			if fFlagExpChatMessagesStoreMemoryCleanupModule then
				t_4[var148] = nil
			end
			var40(function(p183)
				-- upvalues: set (copy), var148 (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (copy), var32 (copy), var45 (copy), var48 (copy), dictionary (copy), var46 (copy)
				if not p183 then
					return {}
				elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var34 else var32(false))[var148] or {}) == 0 and not set.has(p183, var148) then
					return p183
				end
				local var150 = var45(false)
				
				if var150[var148] then
					local var151 = var150[var148]
					var48(function(p184)
						-- upvalues: dictionary (copy), var151 (ref)
						return dictionary.removeKey(p184, var151)
					end)
					var46(function(p185)
						-- upvalues: dictionary (copy), var148 (copy)
						return dictionary.removeKey(p185, var148)
					end)
				end
				return set.subtract(p183, var148)
			end)
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doHandlePlayerRemoved)
			
			return
		elseif fFlagExpChatMessagesStoreUseProxyModule then
			var34[var148] = nil
		else
			var33(function(p186)
				-- upvalues: dictionary (copy), var148 (ref)
				return dictionary.removeKey(p186, var148)
			end)
		end
		if fFlagExpChatMessagesStoreMemoryCleanupModule then
			t_4[var148] = nil
		end
		var40(function(p187)
			-- upvalues: set (copy), var148 (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var34 (copy), var32 (copy), var45 (copy), var48 (copy), dictionary (copy), var46 (copy)
			if not p187 then
				return {}
			elseif #((if fFlagExpChatMessagesStoreUseProxyModule then var34 else var32(false))[var148] or {}) == 0 and not set.has(p187, var148) then
				return p187
			end
			local var150 = var45(false)
			
			if var150[var148] then
				local var151 = var150[var148]
				var48(function(p188)
					-- upvalues: dictionary (copy), var151 (ref)
					return dictionary.removeKey(p188, var151)
				end)
				var46(function(p189)
					-- upvalues: dictionary (copy), var148 (copy)
					return dictionary.removeKey(p189, var148)
				end)
			end
			return set.subtract(p187, var148)
		end)
	end
	
	local function muteUser(p190)
		-- upvalues: var40 (ref), set (copy)
		var40(function(p191)
			-- upvalues: set (copy), p190 (ref)
			return if p191 then set.add(p191, p190) else {}
		end)
	end
	
	local function unmuteUser(p192)
		-- upvalues: var40 (ref), set (copy)
		var40(function(p193)
			-- upvalues: set (copy), p192 (ref)
			return if p193 then set.subtract(p193, p192) else {}
		end)
	end
	
	local function clearWindowMessages()
		-- upvalues: forEachByMessageId (ref), dictionary (copy), var36 (ref), var38 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var54 (ref), var56 (write), var51 (ref), t_1 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local function doClearWindowMessages()
			-- upvalues: forEachByMessageId (copy), dictionary (copy), var36 (copy), var38 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var54 (copy), var56 (copy), var51 (copy), t_1 (copy)
			forEachByMessageId(function(_, p194)
				-- upvalues: dictionary (copy)
				return dictionary.join(p194, { isVisibleInChatWindow = false })
			end)
			var36(function(_)
				return {}
			end)
			var38(function(_)
				return {}
			end)
			
			if fFlagExpChatEnableV2ChatWindowModule then
				var54(1)
				var56 = 0
				
				for i, v in ipairs(var51(false)) do
					local var153 = t_1[v]
					
					if var153 then
						var153.setter(nil)
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
		-- upvalues: fFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy), forEachByMessageId (ref), dictionary (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref), var36 (ref), list (copy), var38 (ref)
		if fFlagExpChatClearHiddenMessagesPostAgeCheckModule then
			forEachByMessageId(function(_, p195)
				-- upvalues: dictionary (copy)
				return if p195 and p195.isHiddenMessage then dictionary.join(p195, { isVisibleInChatWindow = false }) else nil
			end)
			
			local function isNotHidden(p196)
				-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (copy), var29 (copy)
				local var155 = (if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false))[p196]
				
				return var155 and not var155.isHiddenMessage
			end
			
			var36(function(p197)
				-- upvalues: list (copy), isNotHidden (ref)
				return list.filter(p197, isNotHidden)
			end)
			var38(function(p198)
				-- upvalues: dictionary (copy), list (copy), isNotHidden (ref)
				return dictionary.map(p198, function(p199)
					-- upvalues: list (copy), isNotHidden (copy)
					return list.filter(p199, isNotHidden)
				end)
			end)
			
			return
		end
	end
	
	local function rebuildMessageWithTranslation(p200, p201)
		-- upvalues: getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPresetChatEnabled (copy)
		return {
			prefixText = p200.prefixText,
			text = p200.text,
			translation = p200.translation,
			useTranslation = p201,
			messageId = p200.messageId,
			status = p200.status,
			timestamp = p200.timestamp,
			isVisibleInBubbleChat = p200.isVisibleInBubbleChat,
			isVisibleInChatWindow = p200.isVisibleInChatWindow,
			partOrModel = p200.partOrModel,
			shouldOverrideBubbleChatSettings = p200.shouldOverrideBubbleChatSettings,
			bubbleChatMessageProperties = p200.bubbleChatMessageProperties,
			chatWindowMessageProperties = p200.chatWindowMessageProperties,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p200.textChatMessageInstance else nil,
			userId = p200.userId,
			textChannel = p200.textChannel,
			wasRewritten = if fFlagEnableInExpChatRewriteModule then p200.wasRewritten else nil,
			originalText = if fFlagEnableInExpChatRewriteModule then p200.originalText else nil,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then p200.chatActionType else nil,
			presetId = if fFlagExpChatPresetChatEnabled then p200.presetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then p200.presetChatVersion else nil
		}
	end
	
	local function toggleGlobalTranslation(p202)
		-- upvalues: forEachByMessageId (ref), rebuildMessageWithTranslation (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local function doToggleGlobalTranslation()
			-- upvalues: forEachByMessageId (copy), rebuildMessageWithTranslation (copy), p202 (ref)
			forEachByMessageId(function(_, p203)
				-- upvalues: rebuildMessageWithTranslation (copy), p202 (copy)
				return rebuildMessageWithTranslation(p203, p202)
			end)
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(doToggleGlobalTranslation)
			
			return
		end
		forEachByMessageId(function(_, p204)
			-- upvalues: rebuildMessageWithTranslation (copy), p202 (ref)
			return rebuildMessageWithTranslation(p204, p202)
		end)
	end
	
	local function toggleMessageTranslation(p205, p206)
		-- upvalues: rebuildMessageWithTranslation (ref), fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var30 (ref), dictionary (copy)
		local var157 = function(p207)
			-- upvalues: rebuildMessageWithTranslation (copy), p205 (ref)
			return rebuildMessageWithTranslation(p207, p205)
		end
		
		if fFlagExpChatMessagesStoreUseProxyModule then
			local var158 = var31[p206]
			
			if var158 then
				local var159 = rebuildMessageWithTranslation(var158, p205)
				
				if var159 then
					var31[p206] = var159
					
					return
				end
			end
		else
			var30(function(p208)
				-- upvalues: p206 (ref), var157 (ref), dictionary (copy)
				if p208 and p208[p206] then
					local var88 = var157(p208[p206])
					
					return if var88 then dictionary.join(p208, { [p206] = var88 }) else p208
				end
				return p208 or {}
			end)
		end
	end
	
	local function handleLegacyBubbleCreated(p209)
		-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (ref), list (copy), resolveChannelNameForMapOrder (ref), var38 (ref), dictionary (copy), var30 (ref), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (ref), var33 (ref), writeByMessageId (ref), var47 (ref), httpService (copy), var46 (ref), var48 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (ref), var35 (ref), var37 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (ref), t_3 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (ref), updateNextMessageComponent (write), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
		local timestamp = p209.timestamp
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
			userId = p209.userId,
			text = p209.text,
			messageId = p209.id,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = if timestamp then DateTime.fromUnixTimestampMillis(timestamp) else DateTime.now(),
			partOrModel = p209.adornee
		}
		
		local var161 = function()
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (copy), var29 (copy), t_1 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var36 (copy), list (copy), resolveChannelNameForMapOrder (copy), var38 (copy), dictionary (copy), var30 (copy), fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var34 (copy), var33 (copy), writeByMessageId (copy), var47 (copy), httpService (copy), var46 (copy), var48 (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var49 (copy), var35 (copy), var37 (copy), t (copy), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var45 (copy), t_3 (copy), fFlagExpChatEnableV2ChatWindowModule (copy), var58 (copy), updateNextMessageComponent (copy)
			local var94 = if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29(false)
			
			if var94 and var94[t_1.messageId] then
				if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (t_1.status == Enum.TextChatMessageStatus.Floodchecked or t_1.status == Enum.TextChatMessageStatus.MessageTooLong) then
					var36(function(p210)
						-- upvalues: list (copy), t_1 (copy)
						return list.filter(p210, function(p211)
							-- upvalues: t_1 (copy)
							return p211 ~= t_1.messageId
						end)
					end)
					local var95 = resolveChannelNameForMapOrder(t_1, t_1.channelNameOverride)
					
					if var95 then
						var38(function(p212)
							-- upvalues: var95 (ref), list (copy), t_1 (copy), dictionary (copy)
							local var108 = p212[var95]
							
							return if var108 then dictionary.join(p212, {
								[var95] = list.filter(var108, function(p213)
									-- upvalues: t_1 (copy)
									return p213 ~= t_1.messageId
								end)
							}) else p212
						end)
					end
					local messageId = t_1.messageId
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var31[messageId] = nil
					else
						var30(function(p214)
							-- upvalues: dictionary (copy), messageId (ref)
							return dictionary.removeKey(p214, messageId)
						end)
					end
					if t_1.userId then
						local userId = t_1.userId
						
						local var96 = function(p215)
							-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), t_1 (copy)
							if p215 then
								local var109 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p215, function(p217)
									-- upvalues: t_1 (copy)
									return p217 ~= t_1.messageId
								end) else list.filter(p215, function(p216)
									-- upvalues: t_1 (copy)
									return p216.messageId ~= t_1.messageId
								end)
								
								return if #var109 == 0 then nil else var109
							end
							return nil
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var96(var34[userId])
							
							return
						end
						var33(function(p218)
							-- upvalues: var96 (ref), userId (ref), dictionary (copy)
							local var92 = var96(p218[userId])
							
							return if var92 == nil then dictionary.removeKey(p218, userId) else dictionary.join(p218, { [userId] = var92 })
						end)
					end
					return
				else
					writeByMessageId(t_1.messageId, t_1)
					
					if not fFlagExpChatMessagesStoreMemoryCleanupModule and t_1.userId then
						local userId = t_1.userId
						
						local var97 = function(p219)
							-- upvalues: t_1 (copy), list (copy)
							if not p219 then
								return nil
							end
							local var110 = nil
							
							for i, v in ipairs(p219) do
								if v.messageId == t_1.messageId then break end
							end
							return if var110 then list.set(p219, var110, t_1) else p219
						end
						
						if fFlagExpChatMessagesStoreUseProxyModule then
							var34[userId] = var97(var34[userId])
							
							return
						end
						var33(function(p220)
							-- upvalues: var97 (ref), userId (ref), dictionary (copy)
							local var92 = var97(p220[userId])
							
							return if var92 == nil then dictionary.removeKey(p220, userId) else dictionary.join(p220, { [userId] = var92 })
						end)
					end
					return
				end
			else
				local userId = t_1.userId
				local partOrModel = t_1.partOrModel
				
				if not userId and partOrModel then
					userId = var47(false)[partOrModel]
					
					if not userId then
						userId = httpService:GenerateGUID(false)
						var46(function(p221)
							-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
							return dictionary.join(p221, { [userId] = partOrModel })
						end)
						var48(function(p222)
							-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
							return dictionary.join(p222, { [partOrModel] = userId })
						end)
					end
				end
				local var98 = if userId ~= t_1.userId then t_1 else dictionary.join(t_1, { userId = userId })
				local var99 = nil
				
				if getFFlagTextChatEnableUniverseChatTabs() and var98.channelNameOverride then
					var99 = var98.channelNameOverride
				elseif var98.textChannel then
					var99 = if var98.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var49(false) then "RBXGeneral" else var98.textChannel.Name
				end
				if var98.isVisibleInChatWindow then
					local var100 = var35(false)
					local var101 = if var99 then var37(false)[var99] or {} else {}
					
					if t.messageLimit <= #var100 then
						local var102 = var100[1]
						local var103 = var94 and var94[var102]
						
						if var103 then
							if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var102] = nil
								else
									var30(function(p223)
										-- upvalues: dictionary (copy), var102 (ref)
										return dictionary.removeKey(p223, var102)
									end)
								end
							end
							if var103.userId then
								local userId_1 = var103.userId
								
								local var104 = function(p224)
									-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), list (copy), var102 (ref), var45 (copy), var103 (ref), var48 (copy), dictionary (copy), var46 (copy)
									if not p224 then
										return nil
									end
									local var111 = if fFlagExpChatMessagesStoreMemoryCleanupModule then list.filter(p224, function(p226)
										-- upvalues: var102 (copy)
										return p226 ~= var102
									end) else list.filter(p224, function(p225)
										-- upvalues: var102 (copy)
										return p225.messageId ~= var102
									end)
									
									if #var111 ~= 0 then
										return var111
									end
									local var112 = var45(false)
									
									if var112[var103.userId] then
										local userId = var112[var103.userId]
										var48(function(p227)
											-- upvalues: dictionary (copy), userId (ref)
											return dictionary.removeKey(p227, userId)
										end)
										var46(function(p228)
											-- upvalues: dictionary (copy), var103 (copy)
											return dictionary.removeKey(p228, var103.userId)
										end)
									end
									return nil
								end
								
								if fFlagExpChatMessagesStoreUseProxyModule then
									var34[userId_1] = var104(var34[userId_1])
								else
									var33(function(p229)
										-- upvalues: var104 (ref), userId_1 (ref), dictionary (copy)
										local var92 = var104(p229[userId_1])
										
										return if var92 == nil then dictionary.removeKey(p229, userId_1) else dictionary.join(p229, { [userId_1] = var92 })
									end)
								end
							end
							var36(function(p230)
								-- upvalues: list (copy)
								return list.removeIndex(p230, 1)
							end)
							
							if fFlagExpChatMessagesStoreMemoryCleanupModule then
								t_3[var102] = nil
							end
						end
					end
					if var99 and t.messageLimit <= #var101 then
						local var105 = var101[1]
						
						if var105 then
							var38(function(p231)
								-- upvalues: var99 (write), list (copy), dictionary (copy)
								return dictionary.join(p231, { [var99] = list.removeIndex(p231[var99] or {}, 1) })
							end)
							
							if var94 and var94[var105] then
								if fFlagExpChatMessagesStoreUseProxyModule then
									var31[var105] = nil
								else
									var30(function(p232)
										-- upvalues: dictionary (copy), var105 (ref)
										return dictionary.removeKey(p232, var105)
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
					
					local var106 = function(p233)
						-- upvalues: fFlagExpChatMessagesStoreMemoryCleanupModule (copy), var98 (ref), list (copy)
						local p47 = p233 or {}
						local var114 = false
						
						if fFlagExpChatMessagesStoreMemoryCleanupModule then
							for i, v in ipairs(p47) do
								if v == var98.messageId then
									var114 = true
								end
							end
						else
							for i, v in ipairs(p47) do
								if v.messageId == var98.messageId then
									local var114 = true
									break
								end
							end
						end
						return if var114 then p47 else list.append(p47, if fFlagExpChatMessagesStoreMemoryCleanupModule then var98.messageId else var98)
					end
					
					if fFlagExpChatMessagesStoreUseProxyModule then
						var34[userId_1] = var106(var34[userId_1])
					else
						var33(function(p234)
							-- upvalues: var106 (ref), userId_1 (ref), dictionary (copy)
							local var92 = var106(p234[userId_1])
							
							return if var92 == nil then dictionary.removeKey(p234, userId_1) else dictionary.join(p234, { [userId_1] = var92 })
						end)
					end
				end
				if var98.isVisibleInChatWindow then
					var36(function(p235)
						-- upvalues: list (copy), var98 (ref)
						return list.append(p235, var98.messageId)
					end)
					
					if var99 then
						var38(function(p236)
							-- upvalues: var99 (write), list (copy), var98 (ref), dictionary (copy)
							return dictionary.join(p236, {
								[var99] = list.append(p236[var99] or {}, var98.messageId)
							})
						end)
					end
					if fFlagExpChatEnableV2ChatWindowModule then
						local var107 = var58(false)
						
						if if var107 ~= nil then var99 == var107 else true then
							updateNextMessageComponent(var98.messageId)
						end
					end
				end
			end
		end
		
		if fFlagExpChatMessagesStoreBatchModule then
			signalsExperimentalModule.batch(var161)
			
			return
		end
		var161()
	end
	
	updateNextMessageComponent = function(p237)
		-- upvalues: var51 (ref), var53 (ref), var54 (ref), t_1 (ref), fFlagEnableInExpChatRewriteModule (copy), var56 (write), t_2 (ref)
		local var162 = var51(false)
		
		if #var162 == 0 then return end
		local var163 = var53(false)
		local var164 = var162[var163]
		
		if not var164 then
			var54(1)
			
			return
		end
		local var165 = t_1[var164]
		
		if var165 then
			var165.setter(p237)
		end
		var56 += if fFlagEnableInExpChatRewriteModule then 10 else 1
		local var166 = t_2[var164]
		
		if var166 then
			var166.setter(var56)
		end
		var54(var163 % #var162 + 1)
	end
	
	return {
		getByMessageId = if fFlagExpChatMessagesStoreUseProxyModule then var31 else var29,
		getMessages = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else createComputed(function(p238)
			-- upvalues: fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var29 (ref)
			local var126 = if fFlagExpChatMessagesStoreUseProxyModule then var31(p238) else var29(p238)
			
			if not var126 then
				return {}
			end
			local t = {}
			
			for i, v in var126 do
				table.insert(t, v)
			end
			return t
		end),
		getMessagesBySenderId = if fFlagExpChatMessagesStoreUseProxyModule then var34 else var32,
		getWindowMessagesInOrder = var35,
		getWindowMessagesInOrderByTabId = var37,
		getMutedUserIds = var41,
		getCanLocalUserChat = var42,
		getIsBubbleChatEnabled = var44,
		getMockUserIdToPartOrModel = var45,
		getPartOrModelToMockUserId = var47,
		getMessage = getMessage,
		getUserMessages = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserMessages,
		getUserBubbleMessages = getUserBubbleMessages,
		getUserLastMessage = if fFlagExpChatMessagesStoreMemoryCleanupModule then nil else getUserLastMessage,
		registerMessageComponent = function(p239)
			-- upvalues: t_1 (ref), createSignal (copy), t_2 (ref), var52 (ref), list (copy)
			if not t_1[p239] then
				local var167, var168 = createSignal(nil)
				t_1[p239] = { getter = var167, setter = var168 }
				local var169, var170 = createSignal(0)
				t_2[p239] = { getter = var169, setter = var170 }
				var52(function(p240)
					-- upvalues: list (copy), p239 (ref)
					return list.append(p240, p239)
				end)
			end
			return t_1[p239].getter
		end,
		unregisterMessageComponent = function(p241)
			-- upvalues: var51 (ref), t_1 (ref), t_2 (ref), var52 (ref), list (copy), var53 (ref), var54 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
			local var171 = nil
			
			for i, v in ipairs(var51(false)) do
				if v == p241 then
					var171 = i
					break
				end
			end
			if t_1[p241] then
				t_1[p241] = nil
			end
			if t_2[p241] then
				t_2[p241] = nil
			end
			if var171 then
				local function doUnregister()
					-- upvalues: var52 (copy), list (copy), p241 (ref), var51 (copy), var53 (copy), var54 (copy), var171 (write)
					var52(function(p242)
						-- upvalues: list (copy), p241 (copy)
						return list.filter(p242, function(p243)
							-- upvalues: p241 (copy)
							return p243 ~= p241
						end)
					end)
					local var173 = var51(false)
					local var174 = var53(false)
					
					if #var173 == 0 then
						var54(1)
						
						return
					elseif var171 < var174 then
						var54(var174 - 1)
						
						return
					elseif #var173 < var174 then
						var54(1)
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
			-- upvalues: var58 (ref), var37 (ref), var35 (ref), var54 (ref), var56 (write), updateNextMessageComponent (write), var51 (ref), var53 (ref), t_1 (ref), fFlagExpChatMessagesStoreBatchModule (copy), signalsExperimentalModule (copy)
			local function doRepopulate()
				-- upvalues: var58 (copy), var37 (copy), var35 (copy), var54 (copy), var56 (copy), updateNextMessageComponent (copy), var51 (copy), var53 (copy), t_1 (copy)
				local var176 = var58(false)
				local _ = nil
				local var177 = if var176 then var37(false)[var176] or {} else var35(false)
				var54(1)
				var56 = 0
				
				for i, v in ipairs(var177) do
					updateNextMessageComponent(v)
				end
				local var178 = var51(false)
				
				if #var177 < #var178 then
					for i_1 = var53(false), #var178 do
						local var179 = t_1[var178[i_1]]
						
						if var179 then
							var179.setter(nil)
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
			local var180 = t_1[value]
			
			return if var180 then var180.getter else nil
		end,
		getLayoutOrderSignal = function(value)
			-- upvalues: t_2 (ref)
			local var181 = t_2[value]
			
			return if var181 then var181.getter else nil
		end,
		updateNextMessageComponent = updateNextMessageComponent,
		getMessageComponentRingBuffer = var51,
		getNextMessageComponentPointer = var53,
		setActiveChannelFilter = var59,
		getActiveChannelFilter = var58,
		setCanLocalUserChat = var43,
		muteUser = muteUser,
		unmuteUser = unmuteUser,
		handlePlayerRemoved = handlePlayerRemoved,
		clearWindowMessages = clearWindowMessages,
		toggleGlobalTranslation = toggleGlobalTranslation,
		toggleMessageTranslation = toggleMessageTranslation,
		handleIncomingOrOutgoingMessage = handleIncomingOrOutgoingMessage,
		handleIncomingBubbleChatMessage = handleIncomingBubbleChatMessage,
		handleLegacyBubbleCreated = handleLegacyBubbleCreated,
		handleLegacyBubbleTextUpdated = function(p244, p245)
			-- upvalues: dictionary (copy), fFlagExpChatMessagesStoreUseProxyModule (copy), var31 (ref), var30 (ref)
			local var182 = function(p246)
				-- upvalues: dictionary (copy), p245 (ref)
				return dictionary.join(p246, { text = p245 })
			end
			
			if fFlagExpChatMessagesStoreUseProxyModule then
				local var183 = var31[p244]
				
				if var183 then
					local var184 = dictionary.join(var183, { text = p245 })
					
					if var184 then
						var31[p244] = var184
						
						return
					end
				end
			else
				var30(function(p247)
					-- upvalues: p244 (ref), var182 (ref), dictionary (copy)
					if p247 and p247[p244] then
						local var88 = var182(p247[p244])
						
						return if var88 then dictionary.join(p247, { [p244] = var88 }) else p247
					end
					return p247 or {}
				end)
			end
		end,
		handleHiddenMessageReceived = handleHiddenMessageReceived,
		handleHiddenMessagesCleared = handleHiddenMessagesCleared,
		addSystemMessage = addSystemMessage,
		getChannelTabsConfigurationEnabled = var49,
		setChannelTabsConfigurationEnabled = var50
	}
end