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
local var1 = require(flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
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
local var2 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()
local expChatSlotBatchSize = game:DefineFastInt("ExpChatSlotBatchSize", 10)

local function createSlot(p1)
	-- upvalues: reactModule (ref), textChatMessageChatActionTypeModule (ref), fFlagExpChatPresetChatEnabled (ref)
	local var3, var4 = reactModule.createBinding("")
	local var5, var6 = reactModule.createBinding("")
	local var7, var8 = reactModule.createBinding(false)
	local var9, var10 = reactModule.createBinding(0)
	local var11, var12 = reactModule.createBinding(false)
	local var13, var14 = reactModule.createBinding(p1)
	local var15, var16 = reactModule.createBinding(p1)
	local var17, var18 = reactModule.createBinding(false)
	local var19, var20 = reactModule.createBinding(false)
	local var21, var22 = reactModule.createBinding(false)
	local var23, var24 = reactModule.createBinding(false)
	local var25 = reactModule.createRef()
	local var26, var27 = reactModule.createBinding(textChatMessageChatActionTypeModule.Unknown)
	local var28 = nil
	local var29 = nil
	
	if fFlagExpChatPresetChatEnabled then
		local var30, var31 = reactModule.createBinding(false)
		var28 = var30
		var29 = var31
	end
	var25.current = {}
	
	return {
		bodyText = var3,
		setBodyText = var4,
		prefixText = var5,
		setPrefixText = var6,
		shouldShowTranslation = var7,
		setShowTranslation = var8,
		layoutOrder = var9,
		setLayoutOrder = var10,
		visible = var11,
		setVisible = var12,
		bodyTextProperties = var13,
		setBodyTextProperties = var14,
		prefixTextProperties = var15,
		setPrefixTextProperties = var16,
		message = var25,
		isUserVerified = var17,
		setIsUserVerified = var18,
		isTrustedConnection = var19,
		setIsTrustedConnection = var20,
		wasRewritten = var21,
		setWasRewritten = var22,
		isRewriteWindowOpen = var23,
		setIsRewriteWindowOpen = var24,
		chatActionType = var26,
		setChatActionType = var27,
		isPresetMessage = if fFlagExpChatPresetChatEnabled then var28 else nil,
		setIsPresetMessage = if fFlagExpChatPresetChatEnabled then var29 else nil
	}
end

local function resolvePrefixText(p1, p2, p3)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), userProfileStore (ref)
	if getFFlagTextChatEnableUniverseChatTabs() and p2.isUniverseChat then
		return p1
	end
	local userId = p2.userId
	
	if not userId or tostring(userId) == "0" then
		return p1
	end
	local var3 = userProfileStore.get().fetchNamesByUserIds({ tostring(userId) })(p3)
	local var4 = var3.data and var3.data[1]
	
	if not var4 or not var4.names then
		return p1
	end
	local displayName = var4.names.getDisplayName(p3)
	local inExperienceCombinedName = var4.names.getInExperienceCombinedName(p3)
	
	if string.len(displayName) > 0 and string.len(inExperienceCombinedName) > 0 and displayName ~= inExperienceCombinedName then
		p1 = string.gsub(p1, displayName, inExperienceCombinedName)
	end
	return p1
end

return function(p1)
	-- upvalues: fFlagExpChatKeepV2PoolMountedModule (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), fFlagExpChatUseChannelTabsStore (ref), useStore (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), getPresetChatStoreModule (ref), reactModule (ref), getIsARButtonVisibleModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), isChatRegionLockedModule (ref), showChatEnabledUIModule (ref), fFlagExpChatDynamicV2PoolModule (ref), expChatSlotBatchSize (ref), createSlot (ref), signalsModule (ref), fFlagEnableInExpChatRewriteModule (ref), getRewriteDropdownStoreModule (ref), getMessageSettingsModule (ref), getMessageTextModule (ref), resolvePrefixText (ref), fFlagExpChatFixRateLimitedMessageRemovalModule (ref), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (ref), textChatMessageChatActionTypeModule (ref), fFlagEnableVerifiedBadgeStore (ref), verifiedBadgeDisplayStore (ref), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), var1 (ref), getFFlagExpChatExcludeFOMORendersModule (ref), getChannelTabsStoreModule (ref), textChatService (ref), fFlagExpChatEnableFOMOUpsellModule (ref), fFlagExpChatEnableCrossAgeChatActivityModule (ref), playersService (ref), var2 (ref), fFlagExpChatAddWindowSettingDependencyModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), translatedTextMessageV2Module (ref), rewriteDropdownModule (ref)
	local var3
	local messagesStore = p1.messagesStore
	local enabled = p1.enabled
	local chatWindowSettings = p1.chatWindowSettings
	
	if fFlagExpChatKeepV2PoolMountedModule then
		var3 = enabled
		
		if var3 then
			var3 = p1.visible ~= false
			var3 = nil
		end
	else
		var3 = enabled
	end
	local var4
	local var5 = if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule and not fFlagExpChatUseChannelTabsStore then useStore() else nil
	local var6 = signalsReactModule.useSignalBinding(getChatStatusStoreModule(false).getChatStatus)
	local _ = nil
	
	if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
		local var7 = getPresetChatStoreModule(false)
		var4 = reactModule.joinBindings({
			var6,
			signalsReactModule.useSignalBinding(var7.getIsEnabled),
			signalsReactModule.useSignalBinding(var7.getAccessLevel)
		}):map(function(p2)
			-- upvalues: getIsARButtonVisibleModule (copy), fIntExpChatVisibleARButtonPaddingModule (copy), fIntExpChatDefaultARButtonPaddingModule (copy)
			return UDim.new(0, if getIsARButtonVisibleModule(p2[1], p2[2], p2[3]) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule)
		end)
	else
		var4 = var6:map(function(p2)
			-- upvalues: isChatRegionLockedModule (copy), showChatEnabledUIModule (copy), fIntExpChatVisibleARButtonPaddingModule (copy), fIntExpChatDefaultARButtonPaddingModule (copy)
			return UDim.new(0, if not isChatRegionLockedModule() and showChatEnabledUIModule(p2) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule)
		end)
	end
	local var8 = 50
	
	if fFlagExpChatDynamicV2PoolModule and enabled then
		local _ = nil
		var8 = math.min(math.ceil(#(if p1.isChannelBarVisible and p1.targetTextChannel then messagesStore.getWindowMessagesInOrderByTabId(false)[p1.targetTextChannel.Name] or {} else messagesStore.getWindowMessagesInOrder(false) or {}) / expChatSlotBatchSize) * expChatSlotBatchSize, 50)
	end
	local var9, var10 = reactModule.useState(var8)
	local var11 = if fFlagExpChatDynamicV2PoolModule then var9 else 50
	local var12 = reactModule.useRef(nil)
	
	if enabled and not var12.current then
		local t = {}
		
		for i = 1, var11 do
			t[i] = createSlot(chatWindowSettings)
		end
		var12.current = t
	end
	if fFlagExpChatDynamicV2PoolModule and enabled and var12.current then
		for i_1 = #var12.current + 1, var11 do
			var12.current[i_1] = createSlot(chatWindowSettings)
		end
	end
	local var13 = reactModule.useRef({})
	local var14 = reactModule.useRef(0)
	local var15 = reactModule.useRef(var11)
	var15.current = var11
	
	local function createSlotEffects(p2, p3, p4, p5, p6)
		-- upvalues: signalsModule (copy), fFlagEnableInExpChatRewriteModule (copy), getRewriteDropdownStoreModule (copy), getMessageSettingsModule (copy), getMessageTextModule (copy), resolvePrefixText (copy), fFlagExpChatFixRateLimitedMessageRemovalModule (copy), fFlagExpChatPresetChatEnabled (copy), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), textChatMessageChatActionTypeModule (copy), fFlagEnableVerifiedBadgeStore (copy), verifiedBadgeDisplayStore (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), getFFlagExpChatUseUpdatedMessageRenderedModule (copy), shouldSendHighFrequencyTelemetryModule (copy), var1 (copy), getFFlagExpChatExcludeFOMORendersModule (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), var5 (ref), textChatService (copy), fFlagExpChatEnableFOMOUpsellModule (copy), fFlagExpChatEnableCrossAgeChatActivityModule (copy), playersService (copy), var2 (copy)
		local var16 = p4.registerMessageComponent(p3)
		local layoutOrderSignal = p4.getLayoutOrderSignal(p3)
		
		return {
			cleanupMsg = signalsModule.createEffect(function(p7)
				-- upvalues: var16 (ref), fFlagEnableInExpChatRewriteModule (copy), getRewriteDropdownStoreModule (copy), p4 (ref), getMessageSettingsModule (copy), p5 (ref), p6 (ref), getMessageTextModule (copy), p2 (ref), resolvePrefixText (copy), fFlagExpChatFixRateLimitedMessageRemovalModule (copy), fFlagExpChatPresetChatEnabled (copy), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), textChatMessageChatActionTypeModule (copy), p3 (ref), fFlagEnableVerifiedBadgeStore (copy), verifiedBadgeDisplayStore (copy), fFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy)
				local var17 = var16(p7)
				local openMessageId = nil
				local var18 = nil
				
				if fFlagEnableInExpChatRewriteModule then
					var18 = getRewriteDropdownStoreModule(false)
					openMessageId = var18.getOpenMessageId(p7)
				end
				if var17 then
					local var19 = p4.getMessage(var17)(p7)
					
					if var19 then
						local var20 = getMessageSettingsModule(var19, p5)
						local var21 = p6 and (var20.translation ~= nil and var20.translation ~= "")
						local var22 = getMessageTextModule(var20.useTranslation, var20.translation, var20.text)
						local bodyTextProperties = var20.bodyTextProperties
						local prefixTextProperties = var20.prefixTextProperties
						p2.setBodyText(var22)
						p2.setPrefixText(resolvePrefixText(var20.prefixText or "", var19, p7))
						p2.setShowTranslation(var21)
						p2.setVisible(if fFlagExpChatFixRateLimitedMessageRemovalModule then var19.isVisibleInChatWindow else true)
						p2.setBodyTextProperties(bodyTextProperties)
						p2.setPrefixTextProperties(prefixTextProperties)
						p2.message.current = var19
						
						if fFlagExpChatPresetChatEnabled then
							p2.setIsPresetMessage((var19.presetId or "") ~= "")
						end
						if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
							p2.setChatActionType(var19.chatActionType or textChatMessageChatActionTypeModule.Unknown)
						end
						if fFlagEnableInExpChatRewriteModule then
							p2.setWasRewritten(var20.wasRewritten or false)
							
							if openMessageId == var17 then
								var18.setComponentId(p3)
								p2.setIsRewriteWindowOpen(true)
							else
								p2.setIsRewriteWindowOpen(false)
							end
						end
						if fFlagEnableVerifiedBadgeStore then
							local var23 = tonumber(var19.userId)
							
							if var23 then
								p2.setIsUserVerified(verifiedBadgeDisplayStore.get().isBadgeVisible(var23))
								
								return
							end
							p2.setIsUserVerified(false)
							
							return
						else
							p2.setIsUserVerified(false)
							
							return
						end
					elseif fFlagExpChatEvictFloodcheckedFromWindowOrderModule then
						p2.setVisible(false)
						
						return
					end
				else
					p2.setVisible(false)
					p2.setIsUserVerified(false)
					
					if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
						p2.setChatActionType(textChatMessageChatActionTypeModule.Unknown)
					end
				end
			end),
			cleanupLayout = if layoutOrderSignal then signalsModule.createEffect(function(p7)
				-- upvalues: layoutOrderSignal (ref), p2 (ref)
				p2.setLayoutOrder(layoutOrderSignal(p7))
			end) else nil,
			cleanupTelemetry = if getFFlagExpChatUseUpdatedMessageRenderedModule() then signalsModule.createEffect(function(p7)
				-- upvalues: var16 (ref), p4 (ref), shouldSendHighFrequencyTelemetryModule (copy), var1 (copy), getFFlagExpChatExcludeFOMORendersModule (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), var5 (copy), textChatService (copy)
				local var17 = var16(p7)
				
				if var17 then
					local var18 = p4.getMessage(var17)(false)
					
					if var18 and var18.textChatMessageInstance and shouldSendHighFrequencyTelemetryModule(var1) and (not getFFlagExpChatExcludeFOMORendersModule() or not var18.isHiddenMessage) then
						if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
							local var19 = -1
							
							if fFlagExpChatUseChannelTabsStore then
								local var20 = getChannelTabsStoreModule(false)
								local channelTabsState = var20.getChannelTabsState(false)
								local selectedTabName = var20.getSelectedTabName(false)
								
								if selectedTabName and channelTabsState.allChannelTabs[selectedTabName] then
									var19 = channelTabsState.allChannelTabs[selectedTabName].tabIndex
								end
							else
								local channelTabs = var5:getState().ChannelTabs
								local selectedTabName = channelTabs and channelTabs.selectedTabName
								
								if selectedTabName and channelTabs.allChannelTabs[selectedTabName] then
									var19 = channelTabs.allChannelTabs[selectedTabName].TabIndex
								end
							end
							textChatService:SendExpChatMessageClientRendered(var18.textChatMessageInstance, "chat_window", var19)
							
							return
						else
							textChatService:SendExpChatMessageClientRendered(var18.textChatMessageInstance, "chat_window")
						end
					end
				end
			end) else nil,
			cleanupTc = signalsModule.createEffect(function(p7)
				-- upvalues: var16 (ref), p4 (ref), fFlagExpChatEnableFOMOUpsellModule (copy), fFlagExpChatEnableCrossAgeChatActivityModule (copy), playersService (copy), var2 (copy), p2 (ref)
				local var17 = var16(p7)
				
				if var17 then
					local var18 = p4.getMessage(var17)(false)
					
					if var18 then
						local userId = var18.userId
						local userId_1 = playersService.LocalPlayer and (playersService.LocalPlayer.UserId and tostring(playersService.LocalPlayer.UserId))
						p2.setIsTrustedConnection(if userId and userId ~= "" and (not (userId_1 and userId_1 == userId) and not (if fFlagExpChatEnableFOMOUpsellModule or fFlagExpChatEnableCrossAgeChatActivityModule then var18.isHiddenMessage else nil)) then var2.getIsTrustedConnection(userId).data(p7) else false)
					end
				end
			end),
			componentId = p3
		}
	end
	
	local t = {}
	
	if fFlagExpChatAddWindowSettingDependencyModule then
		table.insert(t, chatWindowSettings)
	end
	if fFlagExpChatKeepV2PoolMountedModule then
		table.insert(t, var3)
	end
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var11 (ref), createSlotEffects (ref), var12 (ref), messagesStore (ref), chatWindowSettings (ref), p1 (ref), var13 (ref), var14 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagEnableInExpChatRewriteModule (copy), getRewriteDropdownStoreModule (copy)
		if not var3 then return end
		for i = 1, var11 do
			table.insert(var13.current, createSlotEffects(var12.current[i], "msg-component-" .. i, messagesStore, chatWindowSettings, p1.showTranslationButton))
		end
		var14.current = var11
		local _ = nil
		messagesStore.setActiveChannelFilter(if getFFlagTextChatEnableUniverseChatTabs() then if messagesStore.getChannelTabsConfigurationEnabled(false) and p1.targetTextChannel then p1.targetTextChannel.Name else p1.selectedChannelName elseif p1.isChannelBarVisible and p1.targetTextChannel then p1.targetTextChannel.Name else nil)
		messagesStore.repopulateMessageComponents()
		
		return function()
			-- upvalues: var13 (copy), messagesStore (copy), var14 (copy), fFlagEnableInExpChatRewriteModule (copy), getRewriteDropdownStoreModule (copy)
			for i, v in ipairs(var13.current) do
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
			var13.current = {}
			var14.current = 0
			
			if fFlagEnableInExpChatRewriteModule then
				getRewriteDropdownStoreModule(false).setComponentId(nil)
			end
		end
	end, t)
	
	if fFlagExpChatDynamicV2PoolModule and enabled then
		reactModule.useEffect(function()
			-- upvalues: fFlagExpChatKeepV2PoolMountedModule (copy), var3 (ref), var14 (ref), var11 (ref), createSlotEffects (ref), var12 (ref), messagesStore (ref), chatWindowSettings (ref), p1 (ref), var13 (ref)
			if fFlagExpChatKeepV2PoolMountedModule and not var3 then return end
			local current = var14.current
			
			if var11 <= current then return end
			for i = current + 1, var11 do
				table.insert(var13.current, createSlotEffects(var12.current[i], "msg-component-" .. i, messagesStore, chatWindowSettings, p1.showTranslationButton))
			end
			var14.current = var11
			messagesStore.repopulateMessageComponents()
		end, if fFlagExpChatKeepV2PoolMountedModule then { var11, var3 } else { var11 })
		reactModule.useEffect(function()
			-- upvalues: fFlagExpChatKeepV2PoolMountedModule (copy), var3 (ref), signalsModule (copy), messagesStore (ref), expChatSlotBatchSize (copy), var15 (ref), var10 (ref)
			if fFlagExpChatKeepV2PoolMountedModule and not var3 then
				return
			end
			local var16 = signalsModule.createEffect(function(p2)
				-- upvalues: messagesStore (copy), expChatSlotBatchSize (copy), var15 (copy), var10 (copy)
				local activeChannelFilter = messagesStore.getActiveChannelFilter(p2)
				local minValue = math.min(math.ceil((#(if activeChannelFilter then messagesStore.getWindowMessagesInOrderByTabId(p2)[activeChannelFilter] or {} else messagesStore.getWindowMessagesInOrder(p2) or {}) + 2) / expChatSlotBatchSize) * expChatSlotBatchSize, 50)
				
				if var15.current < minValue then
					var10(minValue)
				end
			end)
			
			return function()
				-- upvalues: var16 (ref)
				if var16 then
					pcall(var16)
				end
			end
		end, if fFlagExpChatKeepV2PoolMountedModule then { var3 } else {})
	end
	local var16 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var16 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), p1 (ref), messagesStore (ref)
		if not var3 then
			var16.current = false
			
			return
		elseif not var16.current then
			var16.current = true
			
			return
		end
		local _ = nil
		messagesStore.setActiveChannelFilter(if getFFlagTextChatEnableUniverseChatTabs() then if messagesStore.getChannelTabsConfigurationEnabled(false) and p1.targetTextChannel then p1.targetTextChannel.Name else p1.selectedChannelName elseif p1.isChannelBarVisible and p1.targetTextChannel then p1.targetTextChannel.Name else nil)
		messagesStore.repopulateMessageComponents()
	end, {
		var3,
		p1.targetTextChannel,
		p1.isChannelBarVisible,
		if getFFlagTextChatEnableUniverseChatTabs() then p1.selectedChannelName else nil
	})
	
	return {
		children = reactModule.useMemo(function()
			-- upvalues: enabled (ref), var11 (ref), var12 (ref), reactModule (copy), translatedTextMessageV2Module (copy), p1 (ref), chatWindowSettings (ref), fFlagEnableInExpChatRewriteModule (copy), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), var4 (write), fFlagExpChatPresetChatEnabled (copy), rewriteDropdownModule (copy)
			if not enabled then
				return nil
			end
			local t = {}
			
			for i = 1, var11 do
				local var17 = var12.current[i]
				t["msg-component-" .. i] = reactModule.createElement(translatedTextMessageV2Module, {
					originalBodyText = var17.bodyText,
					originalPrefixText = var17.prefixText,
					shouldShowTranslationToggle = var17.shouldShowTranslation,
					bodyTextProperties = var17.bodyTextProperties,
					prefixTextProperties = var17.prefixTextProperties,
					layoutOrder = var17.layoutOrder,
					visible = var17.visible,
					textTransparency = p1.textTransparency,
					isUserVerified = var17.isUserVerified,
					userId = var17.userId,
					useTranslation = var17.useTranslation,
					messageId = var17.messageId,
					isSpatialUIEnabled = p1.isSpatialUIEnabled,
					chatWindowSettings = chatWindowSettings,
					onTextMessageLabelButtonActivated = p1.onTextMessageLabelButtonActivated,
					message = var17.message,
					isTrustedConnection = var17.isTrustedConnection,
					wasRewritten = if fFlagEnableInExpChatRewriteModule then var17.wasRewritten else nil,
					isRewriteWindowOpen = if fFlagEnableInExpChatRewriteModule then var17.isRewriteWindowOpen else nil,
					chatActionType = if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then var17.chatActionType else nil,
					chatWindowTransparencyBindable = p1.chatWindowTransparencyBindable,
					arButtonPadding = var4,
					isPresetMessage = if fFlagExpChatPresetChatEnabled then var17.isPresetMessage else nil
				})
			end
			if fFlagEnableInExpChatRewriteModule then
				t["$rewrite-dropdown"] = reactModule.createElement(rewriteDropdownModule, {
					textTransparency = p1.textTransparency,
					arButtonPadding = var4
				})
			end
			t["$layout"] = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
			
			return t
		end, if fFlagExpChatKeepV2PoolMountedModule then { enabled, var11 } else {
			enabled, p1.textTransparency, p1.isSpatialUIEnabled, chatWindowSettings,
			p1.onTextMessageLabelButtonActivated, var11
		})
	}
end