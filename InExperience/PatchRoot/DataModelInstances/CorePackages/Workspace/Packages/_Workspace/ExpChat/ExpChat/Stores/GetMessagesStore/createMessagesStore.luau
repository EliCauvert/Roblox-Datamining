local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
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
local fFlagExpChatSupportHiddenMessagesInWindowV2Module = require(expChat.Flags.FFlagExpChatSupportHiddenMessagesInWindowV2)
local fFlagChatLineReportingGlobalMuteEnabled = sharedFlagsModule.FFlagChatLineReportingGlobalMuteEnabled
local fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule = require(expChat.Flags.FFlagExpChatEnablePostProcessRichSystemMessageTextFormat)
local fFlagExpChatMessagesStoreKeepInByMessageIdModule = require(expChat.Flags.FFlagExpChatMessagesStoreKeepInByMessageId)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getFFlagExpChatProtectedChatInternalAPIs = sharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local fFlagExpChatDictation = sharedFlagsModule.FFlagExpChatDictation
local fFlagExpChatEvictFloodcheckedFromWindowOrderModule = require(expChat.Flags.FFlagExpChatEvictFloodcheckedFromWindowOrder)

function getChatTranslationEnabled() --[[ line: 53 ]]
	-- upvalues: textChatService (ref)
	return textChatService.ChatTranslationEnabled
end

return function() --[[ line: 173 | named "createMessagesStore" ]]
	-- upvalues: createSignal (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (ref), list (ref), dictionary (ref), httpService (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (ref), createComputed (ref), set (ref), sanitizeForRichTextModule (ref), getFFlagExpChatSyntheticSystemMessageRichText (ref), generateRichSystemMessageTextFormatModule (ref), fFlagExpChatDictation (ref), fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (ref), fFlagExpChatEnableV2ChatWindowModule (ref), computeNameColor (ref), playersService (ref), fFlagEnableInExpChatRewriteModule (ref), getTextAndTranslationModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), isWhiteSpaceOnlyModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), expChatSharedModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatDisableUniverseBubbleChat (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), fFlagChatLineReportingGlobalMuteEnabled (ref), fIntExpChatRandomCharChangeLowerBoundModule (ref), fIntExpChatRandomCharChangeUpperBoundModule (ref), configModule (ref), fFlagExpChatSupportHiddenMessagesInWindowV2Module (ref), fFlagExpChatClearHiddenMessagesPostAgeCheckModule (ref)
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
	local var26, var27 = createSignal(t.byMessageId)
	local var28, var29 = createSignal(t.messagesBySenderId)
	local var30, var31 = createSignal(t.windowMessagesInOrder)
	local var32, var33 = createSignal(t.windowMessagesInOrderByTabId)
	local var34, var35 = createSignal(t.mutedUserIds)
	local var36, var37 = createSignal(t.canLocalUserChat)
	local var38, _ = createSignal(t.isBubbleChatEnabled)
	local var39, var40 = createSignal(t.mockUserIdToPartOrModel)
	local var41, var42 = createSignal(t.partOrModelToMockUserId)
	local var43, var44 = createSignal(false)
	local var45, var46 = createSignal(t.messageComponentRingBuffer)
	local var47, var48 = createSignal(t.nextMessageComponentPointer)
	local t_1 = {}
	local var50 = 0
	local t_2 = {}
	local var52, var53 = createSignal(nil)
	local updateNextMessageComponent = nil
	
	local function resolveChannelNameForMapOrder(p0, p1) --[[ line: 225 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), var43 (ref)
		return if getFFlagTextChatEnableUniverseChatTabs() then p1 or (if p0.textChannel then if p0.textChannel.Name == "RBXSystem" or not var43(false) then "RBXGeneral" else p0.textChannel.Name else nil) elseif p0.textChannel then if p0.textChannel.Name == "RBXSystem" then "RBXGeneral" else p0.textChannel.Name else nil
	end
	
	local function addMessage(p2) --[[ line: 245 ]]
		-- upvalues: var26 (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), var31 (ref), list (copy), resolveChannelNameForMapOrder (ref), var33 (ref), dictionary (copy), var27 (ref), var29 (ref), var41 (ref), httpService (copy), var40 (ref), var42 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var43 (ref), var30 (ref), var32 (ref), t (ref), fFlagExpChatMessagesStoreKeepInByMessageIdModule (copy), var39 (ref)
		local var69 = var26(false)
		
		if var69 and var69[p2.messageId] then
			if fFlagExpChatEvictFloodcheckedFromWindowOrderModule and (p2.status == Enum.TextChatMessageStatus.Floodchecked or p2.status == Enum.TextChatMessageStatus.MessageTooLong) then
				var31(function(p3) --[[ line: 256 ]]
					-- upvalues: list (copy), p2 (ref)
					return list.filter(p3, function(p4) --[[ line: 257 ]]
						-- upvalues: p2 (copy)
						return p4 ~= p2.messageId
					end)
				end)
				local var70 = resolveChannelNameForMapOrder(p2, p2.channelNameOverride)
				
				if var70 then
					var33(function(p5) --[[ line: 264 ]]
						-- upvalues: var70 (ref), list (copy), p2 (ref), dictionary (copy)
						local var78 = p5[var70]
						
						return if var78 then dictionary.join(p5, {
							[var70] = list.filter(var78, function(p6) --[[ line: 269 ]]
								-- upvalues: p2 (copy)
								return p6 ~= p2.messageId
							end)
						}) else p5
					end)
				end
				var27(function(p7) --[[ line: 278 ]]
					-- upvalues: dictionary (copy), p2 (ref)
					return dictionary.removeKey(p7, p2.messageId)
				end)
				
				if p2.userId then
					var29(function(p8) --[[ line: 283 ]]
						-- upvalues: p2 (ref), list (copy), dictionary (copy)
						local userId = p8[p2.userId]
						
						if not userId then
							return p8
						end
						local var79 = list.filter(userId, function(p9) --[[ line: 288 ]]
							-- upvalues: p2 (copy)
							return p9.messageId ~= p2.messageId
						end)
						
						return if #var79 == 0 then dictionary.removeKey(p8, p2.userId) else dictionary.join(p8, { [p2.userId] = var79 })
					end)
				end
				return
			else
				var27(function(p10) --[[ line: 304 ]]
					-- upvalues: dictionary (copy), p2 (ref)
					return dictionary.join(p10, { [p2.messageId] = p2 })
				end)
				
				if p2.userId then
					var29(function(p11) --[[ line: 310 ]]
						-- upvalues: p2 (ref), list (copy), dictionary (copy)
						local userId = p11[p2.userId] or {}
						local var81 = nil
						
						for i, v in ipairs(userId) do
							if v.messageId == p2.messageId then
								var81 = i
								break
							end
						end
						return if var81 then dictionary.join(p11, { [p2.userId] = list.set(userId, var81, p2) }) else p11
					end)
				end
				return
			end
		else
			local userId = p2.userId
			local partOrModel = p2.partOrModel
			
			if not userId and partOrModel then
				userId = var41(false)[partOrModel]
				
				if not userId then
					userId = httpService:GenerateGUID(false)
					var40(function(p12) --[[ line: 346 ]]
						-- upvalues: dictionary (copy), userId (write), partOrModel (ref)
						return dictionary.join(p12, { [userId] = partOrModel })
					end)
					var42(function(p13) --[[ line: 353 ]]
						-- upvalues: dictionary (copy), partOrModel (ref), userId (write)
						return dictionary.join(p13, { [partOrModel] = userId })
					end)
				end
			end
			local var71 = if userId ~= p2.userId then p2 else dictionary.join(p2, { userId = userId })
			local var72 = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() and var71.channelNameOverride then
				var72 = var71.channelNameOverride
			elseif var71.textChannel then
				var72 = if var71.textChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var43(false) then "RBXGeneral" else var71.textChannel.Name
			end
			if var71.isVisibleInChatWindow then
				local var73 = var30(false)
				local var74 = if var72 then var32(false)[var72] or {} else {}
				
				if t.messageLimit <= #var73 then
					local var75 = var73[1]
					local var76 = var69 and var69[var75]
					
					if var76 then
						if not fFlagExpChatMessagesStoreKeepInByMessageIdModule then
							var27(function(p14) --[[ line: 395 ]]
								-- upvalues: dictionary (copy), var75 (ref)
								return dictionary.removeKey(p14, var75)
							end)
						end
						if var76.userId then
							var29(function(p15) --[[ line: 402 ]]
								-- upvalues: var76 (ref), list (copy), var75 (ref), var39 (copy), var42 (copy), dictionary (copy), var40 (copy)
								local userId = p15[var76.userId]
								
								if not userId then
									return p15
								end
								local var82 = list.filter(userId, function(p16) --[[ line: 405 ]]
									-- upvalues: var75 (copy)
									return p16.messageId ~= var75
								end)
								
								if #var82 ~= 0 then
									return dictionary.join(p15, { [var76.userId] = var82 })
								end
								local var83 = var39(false)
								
								if var83[var76.userId] then
									local userId_1 = var83[var76.userId]
									var42(function(p17) --[[ line: 415 ]]
										-- upvalues: dictionary (copy), userId_1 (ref)
										return dictionary.removeKey(p17, userId_1)
									end)
									var40(function(p18) --[[ line: 419 ]]
										-- upvalues: dictionary (copy), var76 (copy)
										return dictionary.removeKey(p18, var76.userId)
									end)
								end
								return dictionary.removeKey(p15, var76.userId)
							end)
						end
						var31(function(p19) --[[ line: 436 ]]
							-- upvalues: list (copy)
							return list.removeIndex(p19, 1)
						end)
					end
				end
				if var72 and t.messageLimit <= #var74 then
					local var77 = var74[1]
					
					if var77 then
						var33(function(p20) --[[ line: 446 ]]
							-- upvalues: var72 (write), list (copy), dictionary (copy)
							return dictionary.join(p20, { [var72] = list.removeIndex(p20[var72] or {}, 1) })
						end)
						
						if var69 and var69[var77] then
							var27(function(p21) --[[ line: 455 ]]
								-- upvalues: dictionary (copy), var77 (ref)
								return dictionary.removeKey(p21, var77)
							end)
						end
					end
				end
			end
			var27(function(p22) --[[ line: 463 ]]
				-- upvalues: dictionary (copy), var71 (ref)
				return dictionary.join(p22, { [var71.messageId] = var71 })
			end)
			
			if var71.userId then
				var29(function(p23) --[[ line: 468 ]]
					-- upvalues: var71 (ref), list (copy), dictionary (copy)
					local userId = p23[var71.userId] or {}
					local var85 = false
					
					for i, v in ipairs(userId) do
						if v.messageId == var71.messageId then
							var85 = true
							break
						end
					end
					return if var85 then p23 else dictionary.join(p23, { [var71.userId] = list.append(userId, var71) })
				end)
			end
			if var71.isVisibleInChatWindow then
				var31(function(p24) --[[ line: 493 ]]
					-- upvalues: list (copy), var71 (ref)
					return list.append(p24, var71.messageId)
				end)
				
				if var72 then
					var33(function(p25) --[[ line: 499 ]]
						-- upvalues: var72 (write), list (copy), var71 (ref), dictionary (copy)
						return dictionary.join(p25, { [var72] = list.append(p25[var72] or {}, var71.messageId) })
					end)
				end
			end
		end
	end
	
	local t_3 = {}
	local t_4 = {}
	
	local function getMessage(p26) --[[ line: 520 ]]
		-- upvalues: t_3 (ref), createComputed (copy), var26 (ref)
		if not t_3[p26] then
			t_3[p26] = createComputed(function(p27) --[[ line: 522 ]]
				-- upvalues: var26 (copy), p26 (ref)
				local var86 = var26(p27)
				
				return if var86 and var86[p26] then var86[p26] else nil
			end)
		end
		return t_3[p26]
	end
	
	local function getUserMessageCache(p28) --[[ line: 533 ]]
		-- upvalues: t_4 (ref), createComputed (copy), var28 (ref), var34 (ref), set (copy)
		local var87 = tostring(p28)
		
		if not t_4[var87] then
			t_4[var87] = {}
			t_4[var87].messages = createComputed(function(p29) --[[ line: 537 ]]
				-- upvalues: var28 (copy), var87 (ref)
				return var28(p29)[var87] or {}
			end)
			t_4[var87].bubbleMessages = createComputed(function(p30) --[[ line: 541 ]]
				-- upvalues: t_4 (copy), var87 (ref), var34 (copy), set (copy)
				local var88 = t_4[var87].messages(p30)
				local var89 = var34(p30)
				local t = {}
				
				for i, v in ipairs(var88) do
					if v.isVisibleInBubbleChat and not (v.userId and set.has(var89, v.userId) or false) then
						table.insert(t, v)
					end
				end
				return t
			end)
			t_4[var87].lastMessage = createComputed(function(p31) --[[ line: 553 ]]
				-- upvalues: t_4 (copy), var87 (ref)
				local var91 = t_4[var87].messages(p31)
				
				return if #var91 > 0 then var91[#var91] else nil
			end)
		end
		return t_4[var87]
	end
	
	local function getUserMessages(p32) --[[ line: 564 ]]
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p32).messages
	end
	
	local function getUserBubbleMessages(p33) --[[ line: 569 ]]
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p33).bubbleMessages
	end
	
	local function getUserLastMessage(p34) --[[ line: 574 ]]
		-- upvalues: getUserMessageCache (ref)
		return getUserMessageCache(p34).lastMessage
	end
	
	local function _() --[[ line: 579 | named "createMessagesArraySignal" ]]
		-- upvalues: createComputed (copy), var26 (ref)
		return createComputed(function(p35) --[[ line: 580 ]]
			-- upvalues: var26 (copy)
			local t = {}
			
			for i, v in pairs(var26(p35) or {}) do
				table.insert(t, v)
			end
			return t
		end)
	end
	
	local function addSystemMessage(p36, p37, p38, p39, p40) --[[ line: 590 ]]
		-- upvalues: sanitizeForRichTextModule (copy), getFFlagExpChatSyntheticSystemMessageRichText (copy), generateRichSystemMessageTextFormatModule (copy), fFlagExpChatDictation (copy), fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (copy), httpService (copy), addMessage (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var52 (ref), updateNextMessageComponent (write)
		local var93 = sanitizeForRichTextModule(p36)
		local var94 = httpService:GenerateGUID(false)
		addMessage({
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
			text = if getFFlagExpChatSyntheticSystemMessageRichText() then generateRichSystemMessageTextFormatModule(var93, if fFlagExpChatDictation then p40 else nil, if fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then p39 else nil) else var93,
			messageId = var94,
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			channelNameOverride = p37,
			metadata = p38
		})
		
		if fFlagExpChatEnableV2ChatWindowModule then
			local var95 = var52(false)
			
			if if var95 ~= nil then p37 == var95 else true then
				updateNextMessageComponent(var94)
			end
		end
	end
	
	local function formatPrefixForUniverseChatTabs(value, p41, p42) --[[ line: 636 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), computeNameColor (copy), playersService (copy)
		return if getFFlagTextChatEnableUniverseChatTabs() and p41 and #value ~= 0 then `<font color="#{(if p42.TextSource then computeNameColor(p42.TextSource.Username) else computeNameColor(if playersService.LocalPlayer then playersService.LocalPlayer.Name else "")):ToHex()}">{value}</font>` else value
	end
	
	local function handleIncomingOrOutgoingMessage(a, _, p43, p44) --[[ line: 659 ]]
		-- upvalues: fFlagEnableInExpChatRewriteModule (copy), getTextAndTranslationModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), isWhiteSpaceOnlyModule (copy), var26 (ref), var36 (ref), fFlagExpChatPresetChatEnabled (copy), var34 (ref), set (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), expChatSharedModule (copy), var38 (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatDisableUniverseBubbleChat (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var43 (ref), formatPrefixForUniverseChatTabs (ref), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagChatLineReportingGlobalMuteEnabled (copy), addMessage (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var52 (ref), updateNextMessageComponent (write)
		local var98, var99
		local _ = nil
		local _ = nil
		
		if fFlagEnableInExpChatRewriteModule then
			local var96, var97 = getTextAndTranslationModule(a)
			var98 = var96
			var99 = var97
		else
			var98 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TextInternal else a.Text
			var99 = if getFFlagExpChatProtectedChatInternalAPIs() then a.TranslationInternal else a.Translation
		end
		if isWhiteSpaceOnlyModule(var98) and a.Status ~= Enum.TextChatMessageStatus.Floodchecked and a.Status ~= Enum.TextChatMessageStatus.MessageTooLong then return end
		local var100 = if a.TextSource then tostring(a.TextSource.UserId) else nil
		
		if not var26(false) then return end
		local var104
		local _ = nil
		local var101 = var100 == nil or (if var36(false) or fFlagExpChatPresetChatEnabled and (a.PresetId or "") ~= "" then if a.Status ~= Enum.TextChatMessageStatus.Success then a.Status == Enum.TextChatMessageStatus.Sending else true else false)
		var101 = var101 and not (if var100 and var34(false) then set.has(var34(false), var100) else false)
		local var102 = false
		local _ = nil
		
		if fFlagExpChatUseChatConfigStore then
			var104 = getChatConfigurationStoreModule(false).getIsBubbleChatEnabled(false)
		else
			local store = expChatSharedModule.context and expChatSharedModule.context.store
			var104 = if store then store:getState().Messages.isBubbleChatEnabled else var38(false)
		end
		if var104 and var101 and (not fFlagEnableInExpChatSummaryOnLuaModule or var100 ~= nil) and (a.Status == Enum.TextChatMessageStatus.Success or a.Status == Enum.TextChatMessageStatus.Sending) then
			var102 = true
		end
		if fFlagExpChatDisableUniverseBubbleChat and getFFlagTextChatEnableUniverseChatTabs() and p44 == true then
			var102 = false
		end
		if a.Status ~= Enum.TextChatMessageStatus.Success and a.Status ~= Enum.TextChatMessageStatus.Sending then
			var101 = false
			var102 = false
		end
		local var105 = nil
		
		if getFFlagTextChatEnableUniverseChatTabs() and p43 then
			var105 = p43
		elseif a.TextChannel then
			var105 = if a.TextChannel.Name == "RBXSystem" or getFFlagTextChatEnableUniverseChatTabs() and not var43(false) then "RBXGeneral" else a.TextChannel.Name
		end
		local t = {
			shouldOverrideBubbleChatSettings = false,
			userId = var100,
			prefixText = formatPrefixForUniverseChatTabs(if getFFlagExpChatProtectedChatInternalAPIs() then a.PrefixTextInternal else a.PrefixText, p43, a),
			text = var98,
			translation = var99,
			useTranslation = getChatTranslationEnabled() and var99 ~= nil,
			messageId = a.MessageId,
			status = a.Status,
			timestamp = a.Timestamp,
			isVisibleInBubbleChat = var102,
			isVisibleInChatWindow = var101,
			textChannel = a.TextChannel,
			bubbleChatMessageProperties = a.BubbleChatMessageProperties,
			chatWindowMessageProperties = a.ChatWindowMessageProperties,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then a else nil,
			partOrModel = if a.TextSource then a.TextSource.Parent else nil,
			wasRewritten = if fFlagEnableInExpChatRewriteModule then a.WasRewritten else nil,
			originalText = if fFlagEnableInExpChatRewriteModule then a.OriginalText else nil,
			channelNameOverride = if getFFlagTextChatEnableUniverseChatTabs() and p43 then p43 else nil,
			chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then a.ChatActionType else nil,
			isUniverseChat = if fFlagChatLineReportingGlobalMuteEnabled then p44 else nil,
			presetId = if fFlagExpChatPresetChatEnabled then a.PresetId else nil,
			presetChatVersion = if fFlagExpChatPresetChatEnabled then a.PresetChatVersion else nil
		}
		local var107 = var26(false)
		local var108 = var107 and var107[t.messageId] ~= nil
		
		if t.isVisibleInChatWindow or t.isVisibleInBubbleChat or var108 then
			addMessage(t)
			
			if fFlagExpChatEnableV2ChatWindowModule and t.isVisibleInChatWindow and not var108 then
				local var109 = var52(false)
				
				if if var109 ~= nil then var105 == var109 else true then
					updateNextMessageComponent(t.messageId)
				end
			end
		end
	end
	
	local function handleIncomingBubbleChatMessage(a) --[[ line: 831 ]]
		-- upvalues: addMessage (ref)
		addMessage({
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
		})
	end
	
	local function handleHiddenMessageReceived(p45) --[[ line: 854 ]]
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), fIntExpChatRandomCharChangeLowerBoundModule (copy), fIntExpChatRandomCharChangeUpperBoundModule (copy), configModule (copy), getFFlagExpChatTelemetryEventTriggerModule (copy), addMessage (ref), fFlagExpChatEnableV2ChatWindowModule (copy), fFlagExpChatSupportHiddenMessagesInWindowV2Module (copy), resolveChannelNameForMapOrder (ref), var52 (ref), updateNextMessageComponent (write)
		local var110 = string.len(if getFFlagExpChatProtectedChatInternalAPIs() then p45.TextInternal else p45.Text)
		local t = {
			userId = nil,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			isHiddenMessage = true,
			prefixText = configModule.LOCK_EMOJI .. " :",
			text = string.rep(configModule.DOT_TEXT, var110 + math.random(math.max(fIntExpChatRandomCharChangeLowerBoundModule, -(var110 - 1)), fIntExpChatRandomCharChangeUpperBoundModule)),
			textChannel = p45.TextChannel,
			messageId = p45.MessageId,
			status = p45.Status,
			timestamp = p45.Timestamp,
			textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then p45 else nil
		}
		addMessage(t)
		
		if fFlagExpChatEnableV2ChatWindowModule and fFlagExpChatSupportHiddenMessagesInWindowV2Module then
			local var112 = var52(false)
			
			if if var112 ~= nil then resolveChannelNameForMapOrder(t) == var112 else true then
				updateNextMessageComponent(t.messageId)
			end
		end
	end
	
	updateNextMessageComponent = function(p46) --[[ line: 1270 | named "updateNextMessageComponent" ]]
		-- upvalues: var45 (ref), var47 (ref), var48 (ref), t_1 (ref), fFlagEnableInExpChatRewriteModule (copy), var50 (write), t_2 (ref)
		local var113 = var45(false)
		
		if #var113 == 0 then return end
		local var114 = var47(false)
		local var115 = var113[var114]
		
		if not var115 then
			var48(1)
			
			return
		end
		local var116 = t_1[var115]
		
		if var116 then
			var116.setter(p46)
		end
		var50 += if fFlagEnableInExpChatRewriteModule then 10 else 1
		local var117 = t_2[var115]
		
		if var117 then
			var117.setter(var50)
		end
		var48(var114 % #var113 + 1)
	end
	
	return {
		getByMessageId = var26,
		getMessages = createComputed(function(p47) --[[ line: 580 ]]
			-- upvalues: var26 (ref)
			local t = {}
			
			for i, v in pairs(var26(p47) or {}) do
				table.insert(t, v)
			end
			return t
		end),
		getMessagesBySenderId = var28,
		getWindowMessagesInOrder = var30,
		getWindowMessagesInOrderByTabId = var32,
		getMutedUserIds = var34,
		getCanLocalUserChat = var36,
		getIsBubbleChatEnabled = var38,
		getMockUserIdToPartOrModel = var39,
		getPartOrModelToMockUserId = var41,
		getMessage = getMessage,
		getUserMessages = getUserMessages,
		getUserBubbleMessages = getUserBubbleMessages,
		getUserLastMessage = getUserLastMessage,
		registerMessageComponent = function(p48) --[[ line: 1187 ]]
			-- upvalues: t_1 (ref), createSignal (copy), t_2 (ref), var46 (ref), list (copy)
			if not t_1[p48] then
				local var118, var119 = createSignal(nil)
				t_1[p48] = { getter = var118, setter = var119 }
				local var120, var121 = createSignal(0)
				t_2[p48] = { getter = var120, setter = var121 }
				var46(function(p49) --[[ line: 1202 ]]
					-- upvalues: list (copy), p48 (ref)
					return list.append(p49, p48)
				end)
			end
			return t_1[p48].getter
		end,
		unregisterMessageComponent = function(p50) --[[ line: 1211 ]]
			-- upvalues: var45 (ref), t_1 (ref), t_2 (ref), var46 (ref), list (copy), var47 (ref), var48 (ref)
			local var122 = nil
			
			for i, v in ipairs(var45(false)) do
				if v == p50 then
					var122 = i
					break
				end
			end
			if t_1[p50] then
				t_1[p50] = nil
			end
			if t_2[p50] then
				t_2[p50] = nil
			end
			if var122 then
				var46(function(p51) --[[ line: 1234 ]]
					-- upvalues: list (copy), p50 (ref)
					return list.filter(p51, function(p52) --[[ line: 1235 ]]
						-- upvalues: p50 (copy)
						return p52 ~= p50
					end)
				end)
				local var123 = var45(false)
				local var124 = var47(false)
				
				if #var123 == 0 then
					var48(1)
					
					return
				elseif var122 < var124 then
					var48(var124 - 1)
					
					return
				elseif #var123 < var124 then
					var48(1)
				end
			end
		end,
		repopulateMessageComponents = function() --[[ line: 1307 ]]
			-- upvalues: var52 (ref), var32 (ref), var30 (ref), var48 (ref), var50 (write), updateNextMessageComponent (write), var45 (ref), var47 (ref), t_1 (ref)
			local var125 = var52(false)
			local _ = nil
			local var126 = if var125 then var32(false)[var125] or {} else var30(false)
			var48(1)
			var50 = 0
			
			for i, v in ipairs(var126) do
				updateNextMessageComponent(v)
			end
			local var127 = var45(false)
			
			if #var126 < #var127 then
				for i_1 = var47(false), #var127 do
					local var128 = t_1[var127[i_1]]
					
					if var128 then
						var128.setter(nil)
					end
				end
			end
		end,
		getMessageComponentSignal = function(value) --[[ line: 1258 ]]
			-- upvalues: t_1 (ref)
			local var129 = t_1[value]
			
			return if var129 then var129.getter else nil
		end,
		getLayoutOrderSignal = function(value) --[[ line: 1264 ]]
			-- upvalues: t_2 (ref)
			local var130 = t_2[value]
			
			return if var130 then var130.getter else nil
		end,
		updateNextMessageComponent = updateNextMessageComponent,
		getMessageComponentRingBuffer = var45,
		getNextMessageComponentPointer = var47,
		setActiveChannelFilter = var53,
		getActiveChannelFilter = var52,
		setCanLocalUserChat = var37,
		muteUser = function(p53) --[[ line: 930 ]]
			-- upvalues: var35 (ref), set (copy)
			var35(function(p54) --[[ line: 931 ]]
				-- upvalues: set (copy), p53 (ref)
				return if p54 then set.add(p54, p53) else {}
			end)
		end,
		unmuteUser = function(p55) --[[ line: 940 ]]
			-- upvalues: var35 (ref), set (copy)
			var35(function(p56) --[[ line: 941 ]]
				-- upvalues: set (copy), p55 (ref)
				return if p56 then set.subtract(p56, p55) else {}
			end)
		end,
		handlePlayerRemoved = function(p57) --[[ line: 896 ]]
			-- upvalues: var29 (ref), dictionary (copy), var35 (ref), set (copy), var28 (ref), var39 (ref), var42 (ref), var40 (ref)
			var29(function(p58) --[[ line: 898 ]]
				-- upvalues: dictionary (copy), p57 (ref)
				return dictionary.removeKey(p58, p57)
			end)
			var35(function(p59) --[[ line: 902 ]]
				-- upvalues: set (copy), p57 (ref), var28 (copy), var39 (copy), var42 (copy), dictionary (copy), var40 (copy)
				if not p59 then
					return {}
				elseif #(var28(false)[p57] or {}) == 0 and not set.has(p59, p57) then
					return p59
				end
				local var131 = var39(false)
				
				if var131[p57] then
					local var132 = var131[p57]
					var42(function(p60) --[[ line: 917 ]]
						-- upvalues: dictionary (copy), var132 (ref)
						return dictionary.removeKey(p60, var132)
					end)
					var40(function(p61) --[[ line: 921 ]]
						-- upvalues: dictionary (copy), p57 (copy)
						return dictionary.removeKey(p61, p57)
					end)
				end
				return set.subtract(p59, p57)
			end)
		end,
		clearWindowMessages = function() --[[ line: 950 ]]
			-- upvalues: var27 (ref), dictionary (copy), var31 (ref), var33 (ref), fFlagExpChatEnableV2ChatWindowModule (copy), var48 (ref), var50 (write), var45 (ref), t_1 (ref)
			var27(function(p62) --[[ line: 951 ]]
				-- upvalues: dictionary (copy)
				return if p62 then dictionary.map(p62, function(p63) --[[ line: 956 ]]
					-- upvalues: dictionary (copy)
					return dictionary.join(p63, { isVisibleInChatWindow = false })
				end) else {}
			end)
			var31(function(_) --[[ line: 966 ]]
				return {}
			end)
			var33(function(_) --[[ line: 971 ]]
				return {}
			end)
			
			if fFlagExpChatEnableV2ChatWindowModule then
				var48(1)
				var50 = 0
				
				for i, v in ipairs(var45(false)) do
					local var133 = t_1[v]
					
					if var133 then
						var133.setter(nil)
					end
				end
			end
		end,
		toggleGlobalTranslation = function(p64) --[[ line: 1029 ]]
			-- upvalues: var27 (ref), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPresetChatEnabled (copy)
			var27(function(p65) --[[ line: 1030 ]]
				-- upvalues: p64 (ref), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPresetChatEnabled (copy)
				if not p65 then
					return {}
				end
				local t = {}
				
				for i, v in pairs(p65) do
					local var135 = p65[i]
					
					if var135 ~= nil then
						t[i] = {
							prefixText = var135.prefixText,
							text = var135.text,
							translation = var135.translation,
							useTranslation = p64,
							messageId = var135.messageId,
							status = var135.status,
							timestamp = var135.timestamp,
							isVisibleInBubbleChat = var135.isVisibleInBubbleChat,
							isVisibleInChatWindow = var135.isVisibleInChatWindow,
							partOrModel = var135.partOrModel,
							shouldOverrideBubbleChatSettings = var135.shouldOverrideBubbleChatSettings,
							bubbleChatMessageProperties = var135.bubbleChatMessageProperties,
							chatWindowMessageProperties = var135.chatWindowMessageProperties,
							textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then var135.textChatMessageInstance else nil,
							userId = var135.userId,
							textChannel = var135.textChannel,
							wasRewritten = if fFlagEnableInExpChatRewriteModule then var135.wasRewritten else nil,
							originalText = if fFlagEnableInExpChatRewriteModule then var135.originalText else nil,
							chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then var135.chatActionType else nil,
							presetId = if fFlagExpChatPresetChatEnabled then var135.presetId else nil,
							presetChatVersion = if fFlagExpChatPresetChatEnabled then var135.presetChatVersion else nil
						}
					end
				end
				return t
			end)
		end,
		toggleMessageTranslation = function(p66, p67) --[[ line: 1078 ]]
			-- upvalues: var27 (ref), dictionary (copy), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPresetChatEnabled (copy)
			var27(function(p68) --[[ line: 1079 ]]
				-- upvalues: p67 (ref), dictionary (copy), p66 (ref), getFFlagExpChatTelemetryEventTriggerModule (copy), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPresetChatEnabled (copy)
				if not p68 then
					return {}
				end
				local var136 = p68[p67]
				
				return if var136 == nil then p68 else dictionary.join(p68, {
					[p67] = {
						prefixText = var136.prefixText,
						text = var136.text,
						translation = var136.translation,
						useTranslation = p66,
						messageId = var136.messageId,
						status = var136.status,
						timestamp = var136.timestamp,
						isVisibleInBubbleChat = var136.isVisibleInBubbleChat,
						isVisibleInChatWindow = var136.isVisibleInChatWindow,
						partOrModel = var136.partOrModel,
						shouldOverrideBubbleChatSettings = var136.shouldOverrideBubbleChatSettings,
						bubbleChatMessageProperties = var136.bubbleChatMessageProperties,
						chatWindowMessageProperties = var136.chatWindowMessageProperties,
						textChatMessageInstance = if getFFlagExpChatTelemetryEventTriggerModule() then var136.textChatMessageInstance else nil,
						userId = var136.userId,
						textChannel = var136.textChannel,
						wasRewritten = if fFlagEnableInExpChatRewriteModule then var136.wasRewritten else nil,
						originalText = if fFlagEnableInExpChatRewriteModule then var136.originalText else nil,
						chatActionType = if fFlagEnableInExpChatSummaryOnLuaModule then var136.chatActionType else nil,
						presetId = if fFlagExpChatPresetChatEnabled then var136.presetId else nil,
						presetChatVersion = if fFlagExpChatPresetChatEnabled then var136.presetChatVersion else nil
					}
				})
			end)
		end,
		handleIncomingOrOutgoingMessage = handleIncomingOrOutgoingMessage,
		handleIncomingBubbleChatMessage = handleIncomingBubbleChatMessage,
		handleLegacyBubbleCreated = function(p69) --[[ line: 1124 ]]
			-- upvalues: addMessage (ref)
			local timestamp = p69.timestamp
			addMessage({
				prefixText = "",
				shouldOverrideBubbleChatSettings = true,
				isVisibleInBubbleChat = true,
				isVisibleInChatWindow = false,
				translation = nil,
				useTranslation = false,
				textChannel = nil,
				bubbleChatMessageProperties = nil,
				chatWindowMessageProperties = nil,
				userId = p69.userId,
				text = p69.text,
				messageId = p69.id,
				status = Enum.TextChatMessageStatus.Success,
				timestamp = if timestamp then DateTime.fromUnixTimestampMillis(timestamp) else DateTime.now(),
				partOrModel = p69.adornee
			})
		end,
		handleLegacyBubbleTextUpdated = function(p70, p71) --[[ line: 1161 ]]
			-- upvalues: var27 (ref), dictionary (copy)
			var27(function(p72) --[[ line: 1162 ]]
				-- upvalues: p70 (ref), dictionary (copy), p71 (ref)
				return if p72 then if p72[p70] then dictionary.join(p72, { [p70] = dictionary.join(p72[p70], { text = p71 }) }) else p72 else {}
			end)
		end,
		handleHiddenMessageReceived = handleHiddenMessageReceived,
		handleHiddenMessagesCleared = function() --[[ line: 991 ]]
			-- upvalues: fFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy), var27 (ref), dictionary (copy), var31 (ref), list (copy), var26 (ref), var33 (ref)
			if fFlagExpChatClearHiddenMessagesPostAgeCheckModule then
				var27(function(p73) --[[ line: 998 ]]
					-- upvalues: dictionary (copy)
					return dictionary.map(p73, function(p74) --[[ line: 999 ]]
						-- upvalues: dictionary (copy)
						return if p74.isHiddenMessage then dictionary.join(p74, { isVisibleInChatWindow = false }) else p74
					end)
				end)
				var31(function(p75) --[[ line: 1011 ]]
					-- upvalues: list (copy), var26 (copy)
					return list.filter(p75, function(p76) --[[ line: 1012 ]]
						-- upvalues: var26 (copy)
						local var137 = var26(false)[p76]
						
						return var137 and not var137.isHiddenMessage
					end)
				end)
				var33(function(p77) --[[ line: 1019 ]]
					-- upvalues: dictionary (copy), list (copy), var26 (copy)
					return dictionary.map(p77, function(p78) --[[ line: 1020 ]]
						-- upvalues: list (copy), var26 (copy)
						return list.filter(p78, function(p79) --[[ line: 1021 ]]
							-- upvalues: var26 (copy)
							local var138 = var26(false)[p79]
							
							return var138 and not var138.isHiddenMessage
						end)
					end)
				end)
				
				return
			end
		end,
		addSystemMessage = addSystemMessage,
		getChannelTabsConfigurationEnabled = var43,
		setChannelTabsConfigurationEnabled = var44
	}
end