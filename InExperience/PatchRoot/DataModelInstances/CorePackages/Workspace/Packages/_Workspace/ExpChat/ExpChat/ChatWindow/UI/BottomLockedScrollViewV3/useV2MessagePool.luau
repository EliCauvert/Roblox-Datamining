local textChatService = game:GetService("TextChatService")
local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)
local userProfilesModule = require(parent.UserProfiles)
local verifiedBadgeDisplayStore = userProfilesModule.Stores.VerifiedBadgeDisplayStore
local sharedFlagsModule = require(parent.SharedFlags)
local expChatSharedModule = require(parent.ExpChatShared)
local fFlagEnableVerifiedBadgeStore = sharedFlagsModule.FFlagEnableVerifiedBadgeStore
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local userProfileStore = userProfilesModule.Stores.UserProfileStore
local translatedTextMessageV2Module = require(expChat.ChatWindow.UI.TranslatedTextMessageV2)
local shouldSendHighFrequencyTelemetryModule = require(expChat.shouldSendHighFrequencyTelemetry)
local helpers = expChat.ChatWindow.Helpers
local getMessageSettingsModule = require(helpers.getMessageSettings)
local getMessageTextModule = require(helpers.getMessageText)
local flags = expChat.Flags
local getFFlagExpChatUseUpdatedMessageRenderedModule = require(flags.getFFlagExpChatUseUpdatedMessageRendered)
local var15 = require(flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local getFFlagExpChatExcludeFOMORendersModule = require(flags.getFFlagExpChatExcludeFOMORenders)
local fFlagExpChatEnableFOMOUpsellModule = require(flags.FFlagExpChatEnableFOMOUpsell)
local fFlagExpChatEnableCrossAgeChatActivityModule = require(flags.FFlagExpChatEnableCrossAgeChatActivity)
local fFlagExpChatDynamicV2PoolModule = require(flags.FFlagExpChatDynamicV2Pool)
local fFlagExpChatKeepV2PoolMountedModule = require(flags.FFlagExpChatKeepV2PoolMounted)
local fFlagExpChatFixRateLimitedMessageRemovalModule = require(expChat.Flags.FFlagExpChatFixRateLimitedMessageRemoval)
local fFlagExpChatEvictFloodcheckedFromWindowOrderModule = require(expChat.Flags.FFlagExpChatEvictFloodcheckedFromWindowOrder)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatTopBannerForPresetChatAccessModule = require(flags.FFlagExpChatTopBannerForPresetChatAccess)
local fFlagExpChatAddWindowSettingDependencyModule = require(flags.FFlagExpChatAddWindowSettingDependency)
local fFlagEnableInExpChatRewriteModule = require(flags.FFlagEnableInExpChatRewrite)
local fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module = require(flags.FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2)
local fIntExpChatVisibleARButtonPaddingModule = require(flags.FIntExpChatVisibleARButtonPadding)
local fIntExpChatDefaultARButtonPaddingModule = require(flags.FIntExpChatDefaultARButtonPadding)
local engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local textChatMessageChatActionTypeModule = require(expChat.TextChatMessageChatActionType)
local rewriteDropdownModule = require(expChat.ChatWindow.UI.TranslatedTextMessageV2.RewriteDropdown)
local getRewriteDropdownStoreModule = require(expChat.Stores.GetRewriteDropdownStore)
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local isChatRegionLockedModule = require(expChat.isChatRegionLocked)
local showChatEnabledUIModule = require(expChat.showChatEnabledUI)
local getIsARButtonVisibleModule = require(expChat.getIsARButtonVisible)
local var39 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()
local expChatSlotBatchSize = game:DefineFastInt("ExpChatSlotBatchSize", 10)

local function createSlot(p0) --[[ line: 68 ]]
	-- upvalues: reactModule (ref), textChatMessageChatActionTypeModule (ref), fFlagExpChatPresetChatEnabled (ref)
	local var43, var44 = reactModule.createBinding("")
	local var45, var46 = reactModule.createBinding("")
	local var47, var48 = reactModule.createBinding(false)
	local var49, var50 = reactModule.createBinding(0)
	local var51, var52 = reactModule.createBinding(false)
	local var53, var54 = reactModule.createBinding(p0)
	local var55, var56 = reactModule.createBinding(p0)
	local var57, var58 = reactModule.createBinding(false)
	local var59, var60 = reactModule.createBinding(false)
	local var61, var62 = reactModule.createBinding(false)
	local var63, var64 = reactModule.createBinding(false)
	local var65 = reactModule.createRef()
	local var66, var67 = reactModule.createBinding(textChatMessageChatActionTypeModule.Unknown)
	local var68 = nil
	local var69 = nil
	
	if fFlagExpChatPresetChatEnabled then
		local var70, var71 = reactModule.createBinding(false)
		var68 = var70
		var69 = var71
	end
	var65.current = {}
	
	return {
		bodyText = var43,
		setBodyText = var44,
		prefixText = var45,
		setPrefixText = var46,
		shouldShowTranslation = var47,
		setShowTranslation = var48,
		layoutOrder = var49,
		setLayoutOrder = var50,
		visible = var51,
		setVisible = var52,
		bodyTextProperties = var53,
		setBodyTextProperties = var54,
		prefixTextProperties = var55,
		setPrefixTextProperties = var56,
		message = var65,
		isUserVerified = var57,
		setIsUserVerified = var58,
		isTrustedConnection = var59,
		setIsTrustedConnection = var60,
		wasRewritten = var61,
		setWasRewritten = var62,
		isRewriteWindowOpen = var63,
		setIsRewriteWindowOpen = var64,
		chatActionType = var66,
		setChatActionType = var67,
		isPresetMessage = if fFlagExpChatPresetChatEnabled then var68 else nil,
		setIsPresetMessage = if fFlagExpChatPresetChatEnabled then var69 else nil
	}
end

local function resolvePrefixText(p1, p2, p3) --[[ line: 119 ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), userProfileStore (ref)
	if getFFlagTextChatEnableUniverseChatTabs() and p2.isUniverseChat then
		return p1
	end
	local userId = p2.userId
	
	if not userId or tostring(userId) == "0" then
		return p1
	end
	local var72 = userProfileStore.get().fetchNamesByUserIds({ tostring(userId) })(p3)
	local var73 = var72.data and var72.data[1]
	
	if not var73 or not var73.names then
		return p1
	end
	local displayName = var73.names.getDisplayName(p3)
	local inExperienceCombinedName = var73.names.getInExperienceCombinedName(p3)
	
	if string.len(displayName) > 0 and string.len(inExperienceCombinedName) > 0 and displayName ~= inExperienceCombinedName then
		p1 = string.gsub(p1, displayName, inExperienceCombinedName)
	end
	return p1
end

return function(p4) --[[ line: 184 | named "useV2MessagePool" ]]
	-- upvalues: fFlagExpChatKeepV2PoolMountedModule (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), fFlagExpChatUseChannelTabsStore (ref), useStore (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), getPresetChatStoreModule (ref), reactModule (ref), getIsARButtonVisibleModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), isChatRegionLockedModule (ref), showChatEnabledUIModule (ref), fFlagExpChatDynamicV2PoolModule (ref), expChatSlotBatchSize (ref), createSlot (ref), signalsModule (ref), fFlagEnableInExpChatRewriteModule (ref), getRewriteDropdownStoreModule (ref), getMessageSettingsModule (ref), getMessageTextModule (ref), resolvePrefixText (ref), fFlagExpChatFixRateLimitedMessageRemovalModule (ref), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (ref), textChatMessageChatActionTypeModule (ref), fFlagEnableVerifiedBadgeStore (ref), verifiedBadgeDisplayStore (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), var15 (ref), getFFlagExpChatExcludeFOMORendersModule (ref), getChannelTabsStoreModule (ref), textChatService (ref), fFlagExpChatEnableFOMOUpsellModule (ref), fFlagExpChatEnableCrossAgeChatActivityModule (ref), playersService (ref), var39 (ref), fFlagExpChatAddWindowSettingDependencyModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), translatedTextMessageV2Module (ref), rewriteDropdownModule (ref)
	local var76
	local messagesStore = p4.messagesStore
	local enabled = p4.enabled
	local chatWindowSettings = p4.chatWindowSettings
	
	if fFlagExpChatKeepV2PoolMountedModule then
		var76 = enabled
		
		if var76 then
			var76 = p4.visible ~= false
			var76 = nil
		end
	else
		var76 = enabled
	end
	local var79
	local var77 = if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule and not fFlagExpChatUseChannelTabsStore then useStore() else nil
	local var78 = signalsReactModule.useSignalBinding(getChatStatusStoreModule(false).getChatStatus)
	local _ = nil
	
	if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
		local var80 = getPresetChatStoreModule(false)
		var79 = reactModule.joinBindings({
			var78,
			signalsReactModule.useSignalBinding(var80.getIsEnabled),
			signalsReactModule.useSignalBinding(var80.getAccessLevel)
		}):map(function(p5) --[[ line: 207 ]]
			-- upvalues: getIsARButtonVisibleModule (copy), fIntExpChatVisibleARButtonPaddingModule (copy), fIntExpChatDefaultARButtonPaddingModule (copy)
			return UDim.new(0, if getIsARButtonVisibleModule(p5[1], p5[2], p5[3]) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule)
		end)
	else
		var79 = var78:map(function(p6) --[[ line: 215 ]]
			-- upvalues: isChatRegionLockedModule (copy), showChatEnabledUIModule (copy), fIntExpChatVisibleARButtonPaddingModule (copy), fIntExpChatDefaultARButtonPaddingModule (copy)
			return UDim.new(0, if not isChatRegionLockedModule() and showChatEnabledUIModule(p6) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule)
		end)
	end
	local var81 = 50
	
	if fFlagExpChatDynamicV2PoolModule and enabled then
		local _ = nil
		var81 = math.min(math.ceil(#(if p4.isChannelBarVisible and p4.targetTextChannel then messagesStore.getWindowMessagesInOrderByTabId(false)[p4.targetTextChannel.Name] or {} else messagesStore.getWindowMessagesInOrder(false) or {}) / expChatSlotBatchSize) * expChatSlotBatchSize, 50)
	end
	local var82, var83 = reactModule.useState(var81)
	local var84 = if fFlagExpChatDynamicV2PoolModule then var82 else 50
	local var85 = reactModule.useRef(nil)
	
	if enabled and not var85.current then
		local t = {}
		
		for i = 1, var84 do
			t[i] = createSlot(chatWindowSettings)
		end
		var85.current = t
	end
	if fFlagExpChatDynamicV2PoolModule and enabled and var85.current then
		for i_1 = #var85.current + 1, var84 do
			var85.current[i_1] = createSlot(chatWindowSettings)
		end
	end
	local var87 = reactModule.useRef({})
	local var88 = reactModule.useRef(0)
	local var89 = reactModule.useRef(var84)
	var89.current = var84
	
	local function createSlotEffects(p7, p8, p9, p10, p11) --[[ line: 265 ]]
		-- upvalues: signalsModule (copy), fFlagEnableInExpChatRewriteModule (copy), getRewriteDropdownStoreModule (copy), getMessageSettingsModule (copy), getMessageTextModule (copy), resolvePrefixText (copy), fFlagExpChatFixRateLimitedMessageRemovalModule (copy), fFlagExpChatPresetChatEnabled (copy), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), textChatMessageChatActionTypeModule (copy), fFlagEnableVerifiedBadgeStore (copy), verifiedBadgeDisplayStore (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), getFFlagExpChatUseUpdatedMessageRenderedModule (copy), shouldSendHighFrequencyTelemetryModule (copy), var15 (copy), getFFlagExpChatExcludeFOMORendersModule (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), var77 (ref), textChatService (copy), fFlagExpChatEnableFOMOUpsellModule (copy), fFlagExpChatEnableCrossAgeChatActivityModule (copy), playersService (copy), var39 (copy)
		local var93 = p9.registerMessageComponent(p8)
		local layoutOrderSignal = p9.getLayoutOrderSignal(p8)
		
		return {
			cleanupMsg = signalsModule.createEffect(function(p12) --[[ line: 275 ]]
				-- upvalues: var93 (ref), fFlagEnableInExpChatRewriteModule (copy), getRewriteDropdownStoreModule (copy), p9 (ref), getMessageSettingsModule (copy), p10 (ref), p11 (ref), getMessageTextModule (copy), p7 (ref), resolvePrefixText (copy), fFlagExpChatFixRateLimitedMessageRemovalModule (copy), fFlagExpChatPresetChatEnabled (copy), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), textChatMessageChatActionTypeModule (copy), p8 (ref), fFlagEnableVerifiedBadgeStore (copy), verifiedBadgeDisplayStore (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy)
				local var95 = var93(p12)
				local openMessageId = nil
				local var97 = nil
				
				if fFlagEnableInExpChatRewriteModule then
					var97 = getRewriteDropdownStoreModule(false)
					openMessageId = var97.getOpenMessageId(p12)
				end
				if var95 then
					local var98 = p9.getMessage(var95)(p12)
					
					if var98 then
						local var99 = getMessageSettingsModule(var98, p10)
						local var100 = p11 and (var99.translation ~= nil and var99.translation ~= "")
						local var101 = getMessageTextModule(var99.useTranslation, var99.translation, var99.text)
						local bodyTextProperties = var99.bodyTextProperties
						local prefixTextProperties = var99.prefixTextProperties
						p7.setBodyText(var101)
						p7.setPrefixText(resolvePrefixText(var99.prefixText or "", var98, p12))
						p7.setShowTranslation(var100)
						p7.setVisible(if fFlagExpChatFixRateLimitedMessageRemovalModule then var98.isVisibleInChatWindow else true)
						p7.setBodyTextProperties(bodyTextProperties)
						p7.setPrefixTextProperties(prefixTextProperties)
						p7.message.current = var98
						
						if fFlagExpChatPresetChatEnabled then
							p7.setIsPresetMessage((var98.presetId or "") ~= "")
						end
						if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
							p7.setChatActionType(var98.chatActionType or textChatMessageChatActionTypeModule.Unknown)
						end
						if fFlagEnableInExpChatRewriteModule then
							p7.setWasRewritten(var99.wasRewritten or false)
							
							if openMessageId == var95 then
								var97.setComponentId(p8)
								p7.setIsRewriteWindowOpen(true)
							else
								p7.setIsRewriteWindowOpen(false)
							end
						end
						if fFlagEnableVerifiedBadgeStore then
							local var102 = tonumber(var98.userId)
							
							if var102 then
								p7.setIsUserVerified(verifiedBadgeDisplayStore.get().isBadgeVisible(var102))
								
								return
							end
							p7.setIsUserVerified(false)
							
							return
						else
							p7.setIsUserVerified(false)
							
							return
						end
					elseif fFlagExpChatEvictFloodcheckedFromWindowOrderModule then
						p7.setVisible(false)
						
						return
					end
				else
					p7.setVisible(false)
					p7.setIsUserVerified(false)
					
					if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
						p7.setChatActionType(textChatMessageChatActionTypeModule.Unknown)
					end
				end
			end),
			cleanupLayout = if layoutOrderSignal then signalsModule.createEffect(function(p13) --[[ line: 347 ]]
				-- upvalues: layoutOrderSignal (ref), p7 (ref)
				p7.setLayoutOrder(layoutOrderSignal(p13))
			end) else nil,
			cleanupTelemetry = if getFFlagExpChatUseUpdatedMessageRenderedModule() then signalsModule.createEffect(function(p14) --[[ line: 354 ]]
				-- upvalues: var93 (ref), p9 (ref), shouldSendHighFrequencyTelemetryModule (copy), var15 (copy), getFFlagExpChatExcludeFOMORendersModule (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), var77 (copy), textChatService (copy)
				local var103 = var93(p14)
				
				if var103 then
					local var104 = p9.getMessage(var103)(false)
					
					if var104 and var104.textChatMessageInstance and shouldSendHighFrequencyTelemetryModule(var15) and (not getFFlagExpChatExcludeFOMORendersModule() or not var104.isHiddenMessage) then
						if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
							local var105 = -1
							
							if fFlagExpChatUseChannelTabsStore then
								local var106 = getChannelTabsStoreModule(false)
								local channelTabsState = var106.getChannelTabsState(false)
								local selectedTabName = var106.getSelectedTabName(false)
								
								if selectedTabName and channelTabsState.allChannelTabs[selectedTabName] then
									var105 = channelTabsState.allChannelTabs[selectedTabName].tabIndex
								end
							else
								local channelTabs = var77:getState().ChannelTabs
								local selectedTabName = channelTabs and channelTabs.selectedTabName
								
								if selectedTabName and channelTabs.allChannelTabs[selectedTabName] then
									var105 = channelTabs.allChannelTabs[selectedTabName].TabIndex
								end
							end
							textChatService:SendExpChatMessageClientRendered(var104.textChatMessageInstance, "chat_window", var105)
							
							return
						else
							textChatService:SendExpChatMessageClientRendered(var104.textChatMessageInstance, "chat_window")
						end
					end
				end
			end) else nil,
			cleanupTc = signalsModule.createEffect(function(p15) --[[ line: 398 ]]
				-- upvalues: var93 (ref), p9 (ref), fFlagExpChatEnableFOMOUpsellModule (copy), fFlagExpChatEnableCrossAgeChatActivityModule (copy), playersService (copy), var39 (copy), p7 (ref)
				local var110 = var93(p15)
				
				if var110 then
					local var111 = p9.getMessage(var110)(false)
					
					if var111 then
						local userId = var111.userId
						local userId_1 = playersService.LocalPlayer and (playersService.LocalPlayer.UserId and tostring(playersService.LocalPlayer.UserId))
						p7.setIsTrustedConnection(if userId and userId ~= "" and (not (userId_1 and userId_1 == userId) and not (if fFlagExpChatEnableFOMOUpsellModule or fFlagExpChatEnableCrossAgeChatActivityModule then var111.isHiddenMessage else nil)) then var39.getIsTrustedConnection(userId).data(p15) else false)
					end
				end
			end),
			componentId = p8
		}
	end
	
	local t = {}
	
	if fFlagExpChatAddWindowSettingDependencyModule then
		table.insert(t, chatWindowSettings)
	end
	if fFlagExpChatKeepV2PoolMountedModule then
		table.insert(t, var76)
	end
	reactModule.useEffect(function() --[[ line: 446 ]]
		-- upvalues: var76 (ref), var84 (ref), createSlotEffects (ref), var85 (ref), messagesStore (ref), chatWindowSettings (ref), p4 (ref), var87 (ref), var88 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagEnableInExpChatRewriteModule (copy), getRewriteDropdownStoreModule (copy)
		if not var76 then return end
		for i = 1, var84 do
			table.insert(var87.current, createSlotEffects(var85.current[i], "msg-component-" .. i, messagesStore, chatWindowSettings, p4.showTranslationButton))
		end
		var88.current = var84
		local _ = nil
		messagesStore.setActiveChannelFilter(if getFFlagTextChatEnableUniverseChatTabs() then if messagesStore.getChannelTabsConfigurationEnabled(false) and p4.targetTextChannel then p4.targetTextChannel.Name else p4.selectedChannelName elseif p4.isChannelBarVisible and p4.targetTextChannel then p4.targetTextChannel.Name else nil)
		messagesStore.repopulateMessageComponents()
		
		return function() --[[ line: 480 ]]
			-- upvalues: var87 (copy), messagesStore (copy), var88 (copy), fFlagEnableInExpChatRewriteModule (copy), getRewriteDropdownStoreModule (copy)
			for i, v in ipairs(var87.current) do
				if v.cleanupMsg then
					pcall(v.cleanupMsg)
				end
				if v.cleanupLayout then
					pcall(v.cleanupLayout)
				end
				if v.cleanupTelemetry then
					pcall(v.cleanupTelemetry)
				end
				if v.cleanupTc then
					pcall(v.cleanupTc)
				end
				messagesStore.unregisterMessageComponent(v.componentId)
			end
			var87.current = {}
			var88.current = 0
			
			if fFlagEnableInExpChatRewriteModule then
				getRewriteDropdownStoreModule(false).setComponentId(nil)
			end
		end
	end, t)
	
	if fFlagExpChatDynamicV2PoolModule and enabled then
		reactModule.useEffect(function() --[[ line: 507 ]]
			-- upvalues: fFlagExpChatKeepV2PoolMountedModule (copy), var76 (ref), var88 (ref), var84 (ref), createSlotEffects (ref), var85 (ref), messagesStore (ref), chatWindowSettings (ref), p4 (ref), var87 (ref)
			if fFlagExpChatKeepV2PoolMountedModule and not var76 then return end
			local current = var88.current
			
			if var84 <= current then return end
			for i = current + 1, var84 do
				table.insert(var87.current, createSlotEffects(var85.current[i], "msg-component-" .. i, messagesStore, chatWindowSettings, p4.showTranslationButton))
			end
			var88.current = var84
			messagesStore.repopulateMessageComponents()
		end, if fFlagExpChatKeepV2PoolMountedModule then { var84, var76 } else { var84 })
		reactModule.useEffect(function() --[[ line: 536 ]]
			-- upvalues: fFlagExpChatKeepV2PoolMountedModule (copy), var76 (ref), signalsModule (copy), messagesStore (ref), expChatSlotBatchSize (copy), var89 (ref), var83 (ref)
			if fFlagExpChatKeepV2PoolMountedModule and not var76 then
				return
			end
			local var113 = signalsModule.createEffect(function(p16) --[[ line: 541 ]]
				-- upvalues: messagesStore (copy), expChatSlotBatchSize (copy), var89 (copy), var83 (copy)
				local activeChannelFilter = messagesStore.getActiveChannelFilter(p16)
				local minValue = math.min(math.ceil((#(if activeChannelFilter then messagesStore.getWindowMessagesInOrderByTabId(p16)[activeChannelFilter] or {} else messagesStore.getWindowMessagesInOrder(p16) or {}) + 2) / expChatSlotBatchSize) * expChatSlotBatchSize, 50)
				
				if var89.current < minValue then
					var83(minValue)
				end
			end)
			
			return function() --[[ line: 558 ]]
				-- upvalues: var113 (ref)
				if var113 then
					pcall(var113)
				end
			end
		end, if fFlagExpChatKeepV2PoolMountedModule then { var76 } else {})
	end
	local var92 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 569 ]]
		-- upvalues: var76 (ref), var92 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), p4 (ref), messagesStore (ref)
		if not var76 then
			var92.current = false
			
			return
		elseif not var92.current then
			var92.current = true
			
			return
		end
		local _ = nil
		messagesStore.setActiveChannelFilter(if getFFlagTextChatEnableUniverseChatTabs() then if messagesStore.getChannelTabsConfigurationEnabled(false) and p4.targetTextChannel then p4.targetTextChannel.Name else p4.selectedChannelName elseif p4.isChannelBarVisible and p4.targetTextChannel then p4.targetTextChannel.Name else nil)
		messagesStore.repopulateMessageComponents()
	end, {
		var76,
		p4.targetTextChannel,
		p4.isChannelBarVisible,
		if getFFlagTextChatEnableUniverseChatTabs() then p4.selectedChannelName else nil
	})
	
	return {
		children = reactModule.useMemo(function() --[[ line: 603 ]]
			-- upvalues: enabled (ref), var84 (ref), var85 (ref), reactModule (copy), translatedTextMessageV2Module (copy), p4 (ref), chatWindowSettings (ref), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), var79 (write), fFlagExpChatPresetChatEnabled (copy), rewriteDropdownModule (copy)
			if not enabled then
				return nil
			end
			local t = {}
			
			for i = 1, var84 do
				local var117 = var85.current[i]
				t["msg-component-" .. i] = reactModule.createElement(translatedTextMessageV2Module, {
					originalBodyText = var117.bodyText,
					originalPrefixText = var117.prefixText,
					shouldShowTranslationToggle = var117.shouldShowTranslation,
					bodyTextProperties = var117.bodyTextProperties,
					prefixTextProperties = var117.prefixTextProperties,
					layoutOrder = var117.layoutOrder,
					visible = var117.visible,
					textTransparency = p4.textTransparency,
					isUserVerified = var117.isUserVerified,
					userId = var117.userId,
					useTranslation = var117.useTranslation,
					messageId = var117.messageId,
					isSpatialUIEnabled = p4.isSpatialUIEnabled,
					chatWindowSettings = chatWindowSettings,
					onTextMessageLabelButtonActivated = p4.onTextMessageLabelButtonActivated,
					message = var117.message,
					isTrustedConnection = var117.isTrustedConnection,
					wasRewritten = if fFlagEnableInExpChatRewriteModule then var117.wasRewritten else nil,
					isRewriteWindowOpen = if fFlagEnableInExpChatRewriteModule then var117.isRewriteWindowOpen else nil,
					chatActionType = if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then var117.chatActionType else nil,
					chatWindowTransparencyBindable = p4.chatWindowTransparencyBindable,
					arButtonPadding = var79,
					isPresetMessage = if fFlagExpChatPresetChatEnabled then var117.isPresetMessage else nil
				})
			end
			if fFlagEnableInExpChatRewriteModule then
				t["$rewrite-dropdown"] = reactModule.createElement(rewriteDropdownModule, {
					textTransparency = p4.textTransparency,
					arButtonPadding = var79
				})
			end
			t["$layout"] = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
			
			return t
		end, if fFlagExpChatKeepV2PoolMountedModule then { enabled, var84 } else {
			enabled, p4.textTransparency, p4.isSpatialUIEnabled, chatWindowSettings,
			p4.onTextMessageLabelButtonActivated, var84
		})
	}
end