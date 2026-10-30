local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UserProfilesModule = require(Parent.UserProfiles)
local VerifiedBadgeDisplayStore = UserProfilesModule.Stores.VerifiedBadgeDisplayStore
local SharedFlagsModule = require(Parent.SharedFlags)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local _ = require(ExpChat.MessageEffects.MessageEffect)
local GetMessageEffectsModule = require(ExpChat.MessageEffects.getMessageEffects)
local FFlagEnableVerifiedBadgeStore = SharedFlagsModule.FFlagEnableVerifiedBadgeStore
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatReportHistoricalRenders = SharedFlagsModule.FFlagExpChatReportHistoricalRenders
local EngineFeatureTextChatReportEmojiTelemetryEnabledModule = require(ExpChat.Flags.EngineFeatureTextChatReportEmojiTelemetryEnabled)
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local UserProfileStore = UserProfilesModule.Stores.UserProfileStore
local GetChatWindowMessageEffectsModule = require(ExpChat.MessageEffects.getChatWindowMessageEffects)
local TranslatedTextMessageV2Module = require(ExpChat.ChatWindow.UI.TranslatedTextMessageV2)
local ShouldSendHighFrequencyTelemetryModule = require(ExpChat.shouldSendHighFrequencyTelemetry)
local IsChatWindowEnlargeEnabledModule = require(ExpChat.isChatWindowEnlargeEnabled)
local Helpers = ExpChat.ChatWindow.Helpers
local GetMessageSettingsModule = require(Helpers.getMessageSettings)
local LocalizationModule = require(ExpChat.Localization)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local GetMessageTextModule = require(Helpers.getMessageText)
local Flags = ExpChat.Flags
local GetFFlagExpChatUseUpdatedMessageRenderedModule = require(Flags.getFFlagExpChatUseUpdatedMessageRendered)
local ShouldReportMessageRenderModule = require(ExpChat.shouldReportMessageRender)
local v1 = require(Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local GetFFlagExpChatExcludeFOMORendersModule = require(Flags.getFFlagExpChatExcludeFOMORenders)
local FFlagExpChatEnableFOMOUpsellModule = require(Flags.FFlagExpChatEnableFOMOUpsell)
local FFlagExpChatEnableCrossAgeChatActivityModule = require(Flags.FFlagExpChatEnableCrossAgeChatActivity)
local FFlagExpChatDynamicV2PoolModule = require(Flags.FFlagExpChatDynamicV2Pool)
local FFlagExpChatKeepV2PoolMountedModule = require(Flags.FFlagExpChatKeepV2PoolMounted)
local FFlagExpChatFixRateLimitedMessageRemovalModule = require(ExpChat.Flags.FFlagExpChatFixRateLimitedMessageRemoval)
local FFlagExpChatEvictFloodcheckedFromWindowOrderModule = require(ExpChat.Flags.FFlagExpChatEvictFloodcheckedFromWindowOrder)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatTopBannerForPresetChatAccessModule = require(Flags.FFlagExpChatTopBannerForPresetChatAccess)
local FFlagExpChatAddWindowSettingDependencyModule = require(Flags.FFlagExpChatAddWindowSettingDependency)
local FFlagEnableInExpChatRewriteModule = require(Flags.FFlagEnableInExpChatRewrite)
local FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module = require(Flags.FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2)
local FIntExpChatVisibleARButtonPaddingModule = require(Flags.FIntExpChatVisibleARButtonPadding)
local FIntExpChatDefaultARButtonPaddingModule = require(Flags.FIntExpChatDefaultARButtonPadding)
local EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local TextChatMessageChatActionTypeModule = require(ExpChat.TextChatMessageChatActionType)
local RewriteDropdownModule = require(ExpChat.ChatWindow.UI.TranslatedTextMessageV2.RewriteDropdown)
local GetRewriteDropdownStoreModule = require(ExpChat.Stores.GetRewriteDropdownStore)
local GetChatStatusStoreModule = require(ExpChat.Stores.GetChatStatusStore)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local IsChatRegionLockedModule = require(ExpChat.isChatRegionLocked)
local ShowChatEnabledUIModule = require(ExpChat.showChatEnabledUI)
local GetIsARButtonVisibleModule = require(ExpChat.getIsARButtonVisible)
local GetResult = require(Parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get()
local ExpChatSlotBatchSize = game:DefineFastInt("ExpChatSlotBatchSize", 10)

local function createSlot(ChatWindowSettings)
	-- upvalues: ReactModule (copy), TextChatMessageChatActionTypeModule (copy), FFlagExpChatPresetChatEnabled (copy), IsChatWindowEnlargeEnabledModule (copy)
	local Binding, Binding2 = ReactModule.createBinding("")
	local Binding1, Binding2_1 = ReactModule.createBinding("")
	local Binding3, Binding2_2 = ReactModule.createBinding(false)
	local Binding4, Binding2_3 = ReactModule.createBinding(0)
	local Binding5, Binding2_4 = ReactModule.createBinding(false)
	local Binding6, Binding2_5 = ReactModule.createBinding(ChatWindowSettings)
	local Binding7, Binding2_6 = ReactModule.createBinding(ChatWindowSettings)
	local Binding8, Binding2_7 = ReactModule.createBinding(false)
	local Binding9, Binding2_8 = ReactModule.createBinding(false)
	local Binding10, Binding2_9 = ReactModule.createBinding(false)
	local Binding11, Binding2_10 = ReactModule.createBinding(false)
	local Ref = ReactModule.createRef()
	local Binding12, Binding2_11 = ReactModule.createBinding(TextChatMessageChatActionTypeModule.Unknown)
	local v2 = nil
	local v3 = nil
	
	if FFlagExpChatPresetChatEnabled then
		v2, v85 = ReactModule.createBinding(false)
	end
	local v4 = nil
	local v5 = nil
	
	if IsChatWindowEnlargeEnabledModule() then
		v4, v87 = ReactModule.createBinding(nil)
	end
	Ref.current = {}
	
	return {
		bodyText = Binding,
		setBodyText = Binding2,
		prefixText = Binding1,
		setPrefixText = Binding2_1,
		shouldShowTranslation = Binding3,
		setShowTranslation = Binding2_2,
		layoutOrder = Binding4,
		setLayoutOrder = Binding2_3,
		visible = Binding5,
		setVisible = Binding2_4,
		bodyTextProperties = Binding6,
		setBodyTextProperties = Binding2_5,
		prefixTextProperties = Binding7,
		setPrefixTextProperties = Binding2_6,
		message = Ref,
		isUserVerified = Binding8,
		setIsUserVerified = Binding2_7,
		isTrustedConnection = Binding9,
		setIsTrustedConnection = Binding2_8,
		wasRewritten = Binding10,
		setWasRewritten = Binding2_9,
		isRewriteWindowOpen = Binding11,
		setIsRewriteWindowOpen = Binding2_10,
		chatActionType = Binding12,
		setChatActionType = Binding2_11,
		isPresetMessage = if FFlagExpChatPresetChatEnabled then v2 else nil,
		setIsPresetMessage = if FFlagExpChatPresetChatEnabled then v3 else nil,
		effects = if IsChatWindowEnlargeEnabledModule() then v4 else nil,
		setEffects = if IsChatWindowEnlargeEnabledModule() then v5 else nil
	}
end

local function resolvePrefixText(Text: string, Current, p1): string
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), UserProfileStore (copy)
	if GetFFlagTextChatEnableUniverseChatTabsFunction() and Current.isUniverseChat then
		return Text
	end
	local UserId = Current.userId
	
	if not UserId or tostring(UserId) == "0" then
		return Text
	end
	local v2 = UserProfileStore.get().fetchNamesByUserIds({ (tostring(UserId)) })(p1)
	local Entry = v2.data and v2.data[1]
	
	if not Entry or not Entry.names then
		return Text
	end
	local DisplayName: string = Entry.names.getDisplayName(p1)
	local InExperienceCombinedName: string = Entry.names.getInExperienceCombinedName(p1)
	
	if string.len(DisplayName) > 0 and string.len(InExperienceCombinedName) > 0 and DisplayName ~= InExperienceCombinedName then
		Text = string.gsub(Text, DisplayName, InExperienceCombinedName)
	end
	return Text
end

return function(p1)
	-- upvalues: FFlagExpChatGlobalTabDefaultModule (copy), LocalizationModule (copy), FFlagExpChatKeepV2PoolMountedModule (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), FFlagExpChatUseChannelTabsStore (copy), UseStoreFunction (copy), GetChatStatusStoreModule (copy), SignalsReactModule (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatTopBannerForPresetChatAccessModule (copy), GetPresetChatStoreModule (copy), ReactModule (copy), GetIsARButtonVisibleModule (copy), FIntExpChatVisibleARButtonPaddingModule (copy), FIntExpChatDefaultARButtonPaddingModule (copy), IsChatRegionLockedModule (copy), ShowChatEnabledUIModule (copy), FFlagExpChatDynamicV2PoolModule (copy), ExpChatSlotBatchSize (copy), createSlot (copy), SignalsModule (copy), FFlagEnableInExpChatRewriteModule (copy), GetRewriteDropdownStoreModule (copy), GetMessageSettingsModule (copy), GetMessageTextModule (copy), resolvePrefixText (copy), FFlagExpChatFixRateLimitedMessageRemovalModule (copy), IsChatWindowEnlargeEnabledModule (copy), GetMessageEffectsModule (copy), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), TextChatMessageChatActionTypeModule (copy), FFlagEnableVerifiedBadgeStore (copy), VerifiedBadgeDisplayStore (copy), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (copy), GetFFlagExpChatUseUpdatedMessageRenderedModule (copy), ShouldSendHighFrequencyTelemetryModule (copy), v1 (copy), GetFFlagExpChatExcludeFOMORendersModule (copy), FFlagExpChatReportHistoricalRenders (copy), ShouldReportMessageRenderModule (copy), GetChannelTabsStoreModule (copy), EngineFeatureTextChatReportEmojiTelemetryEnabledModule (copy), GetChatWindowMessageEffectsModule (copy), TextChatService (copy), FFlagExpChatEnableFOMOUpsellModule (copy), FFlagExpChatEnableCrossAgeChatActivityModule (copy), Players (copy), GetResult (copy), FFlagExpChatAddWindowSettingDependencyModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), TranslatedTextMessageV2Module (copy), RewriteDropdownModule (copy)
	local HereLabel = if FFlagExpChatGlobalTabDefaultModule then LocalizationModule.useLocalization({ hereLabel = "CoreScripts.TextChat.ChannelTabs.Here" }).hereLabel else nil
	local MessagesStore = p1.messagesStore
	local Enabled = p1.enabled
	local ChatWindowSettings = p1.chatWindowSettings
	local IsVisible = if FFlagExpChatKeepV2PoolMountedModule then Enabled and p1.visible ~= false else Enabled
	local UseStoreResult = if EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule and not FFlagExpChatUseChannelTabsStore then UseStoreFunction() else nil
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(GetChatStatusStoreModule(false).getChatStatus)
	local MapResult = nil
	
	if FFlagExpChatPresetChatEnabled and FFlagExpChatTopBannerForPresetChatAccessModule then
		local PresetChatStoreModule = GetPresetChatStoreModule(false)
		MapResult = ReactModule.joinBindings({
			UseSignalBindingResult,
			SignalsReactModule.useSignalBinding(PresetChatStoreModule.getIsEnabled),
			(SignalsReactModule.useSignalBinding(PresetChatStoreModule.getAccessLevel))
		}):map(function(Entry): UDim
			-- upvalues: GetIsARButtonVisibleModule (upval), FIntExpChatVisibleARButtonPaddingModule (upval), FIntExpChatDefaultARButtonPaddingModule (upval)
			return UDim.new(0, if GetIsARButtonVisibleModule(Entry[1], Entry[2], Entry[3]) then FIntExpChatVisibleARButtonPaddingModule else FIntExpChatDefaultARButtonPaddingModule)
		end)
	else
		MapResult = UseSignalBindingResult:map(function(p2): UDim
			-- upvalues: IsChatRegionLockedModule (upval), ShowChatEnabledUIModule (upval), FIntExpChatVisibleARButtonPaddingModule (upval), FIntExpChatDefaultARButtonPaddingModule (upval)
			local ShowChatEnabledUIModuleResult = not IsChatRegionLockedModule() and ShowChatEnabledUIModule(p2)
			
			return UDim.new(0, if ShowChatEnabledUIModuleResult then FIntExpChatVisibleARButtonPaddingModule else FIntExpChatDefaultARButtonPaddingModule)
		end)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(if FFlagExpChatDynamicV2PoolModule and Enabled then math.min(math.ceil(#(if p1.isChannelBarVisible and p1.targetTextChannel then MessagesStore.getWindowMessagesInOrderByTabId(false)[p1.targetTextChannel.Name] or {} else MessagesStore.getWindowMessagesInOrder(false) or {}) / ExpChatSlotBatchSize) * ExpChatSlotBatchSize, 50) else 50)
	local UseStateResult1 = if FFlagExpChatDynamicV2PoolModule then UseStateResult else 50
	local UseRefResult = ReactModule.useRef(nil)
	
	if Enabled and not UseRefResult.current then
		local Current = {}
		
		for i = 1, UseStateResult1 do
			Current[i] = createSlot(ChatWindowSettings)
		end
		UseRefResult.current = Current
	end
	if FFlagExpChatDynamicV2PoolModule and Enabled and UseRefResult.current then
		for i1 = #UseRefResult.current + 1, UseStateResult1 do
			UseRefResult.current[i1] = createSlot(ChatWindowSettings)
		end
	end
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(UseStateResult1)
	UseRefResult3.current = UseStateResult1
	
	local function createSlotEffects(CurrentEntry, ComponentId, MessagesStore, ChatWindowSettings, ShowTranslationButton)
		-- upvalues: SignalsModule (upval), FFlagEnableInExpChatRewriteModule (upval), GetRewriteDropdownStoreModule (upval), GetMessageSettingsModule (upval), FFlagExpChatGlobalTabDefaultModule (upval), HereLabel (copy), GetMessageTextModule (upval), resolvePrefixText (upval), FFlagExpChatFixRateLimitedMessageRemovalModule (upval), FFlagExpChatPresetChatEnabled (upval), IsChatWindowEnlargeEnabledModule (upval), GetMessageEffectsModule (upval), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (upval), TextChatMessageChatActionTypeModule (upval), FFlagEnableVerifiedBadgeStore (upval), VerifiedBadgeDisplayStore (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval), GetFFlagExpChatUseUpdatedMessageRenderedModule (upval), ShouldSendHighFrequencyTelemetryModule (upval), v1 (upval), GetFFlagExpChatExcludeFOMORendersModule (upval), FFlagExpChatReportHistoricalRenders (upval), ShouldReportMessageRenderModule (upval), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), UseStoreResult (copy), EngineFeatureTextChatReportEmojiTelemetryEnabledModule (upval), GetChatWindowMessageEffectsModule (upval), TextChatService (upval), FFlagExpChatEnableFOMOUpsellModule (upval), FFlagExpChatEnableCrossAgeChatActivityModule (upval), Players (upval), GetResult (upval)
		local RegisterMessageComponentResult = MessagesStore.registerMessageComponent(ComponentId)
		local LayoutOrderSignal = MessagesStore.getLayoutOrderSignal(ComponentId)
		
		return {
			cleanupMsg = SignalsModule.createEffect(function(p2)
				-- upvalues: RegisterMessageComponentResult (copy), FFlagEnableInExpChatRewriteModule (upval), GetRewriteDropdownStoreModule (upval), MessagesStore (copy), GetMessageSettingsModule (upval), ChatWindowSettings (copy), FFlagExpChatGlobalTabDefaultModule (upval), HereLabel (upval), ShowTranslationButton (copy), GetMessageTextModule (upval), CurrentEntry (copy), resolvePrefixText (upval), FFlagExpChatFixRateLimitedMessageRemovalModule (upval), FFlagExpChatPresetChatEnabled (upval), IsChatWindowEnlargeEnabledModule (upval), GetMessageEffectsModule (upval), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (upval), TextChatMessageChatActionTypeModule (upval), ComponentId (copy), FFlagEnableVerifiedBadgeStore (upval), VerifiedBadgeDisplayStore (upval), FFlagExpChatEvictFloodcheckedFromWindowOrderModule (upval)
				local RegisterMessageComponentResultResult = RegisterMessageComponentResult(p2)
				local OpenMessageId = nil
				local v2 = nil
				
				if FFlagEnableInExpChatRewriteModule then
					v2 = GetRewriteDropdownStoreModule(false)
					OpenMessageId = v2.getOpenMessageId(p2)
				end
				if RegisterMessageComponentResultResult then
					local Current = MessagesStore.getMessage(RegisterMessageComponentResultResult)(p2)
					
					if Current then
						local MessageSettingsModule = GetMessageSettingsModule(Current, ChatWindowSettings, if FFlagExpChatGlobalTabDefaultModule then HereLabel else nil)
						local IsNotTranslationMatch: boolean = ShowTranslationButton and (MessageSettingsModule.translation ~= nil and MessageSettingsModule.translation ~= "")
						local MessageTextModule = GetMessageTextModule(MessageSettingsModule.useTranslation, MessageSettingsModule.translation, MessageSettingsModule.text)
						local BodyTextProperties = MessageSettingsModule.bodyTextProperties
						local PrefixTextProperties = MessageSettingsModule.prefixTextProperties
						CurrentEntry.setBodyText(MessageTextModule)
						CurrentEntry.setPrefixText((resolvePrefixText(MessageSettingsModule.prefixText or "", Current, p2)))
						CurrentEntry.setShowTranslation(IsNotTranslationMatch)
						CurrentEntry.setVisible(not FFlagExpChatFixRateLimitedMessageRemovalModule or Current.isVisibleInChatWindow)
						CurrentEntry.setBodyTextProperties(BodyTextProperties)
						CurrentEntry.setPrefixTextProperties(PrefixTextProperties)
						CurrentEntry.message.current = Current
						
						if FFlagExpChatPresetChatEnabled then
							CurrentEntry.setIsPresetMessage((Current.presetId or "") ~= "")
						end
						if IsChatWindowEnlargeEnabledModule() then
							CurrentEntry.setEffects(GetMessageEffectsModule(MessageTextModule))
						end
						if FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
							CurrentEntry.setChatActionType(Current.chatActionType or TextChatMessageChatActionTypeModule.Unknown)
						end
						if FFlagEnableInExpChatRewriteModule then
							CurrentEntry.setWasRewritten(MessageSettingsModule.wasRewritten or false)
							
							if OpenMessageId == RegisterMessageComponentResultResult then
								v2.setComponentId(ComponentId)
								CurrentEntry.setIsRewriteWindowOpen(true)
							else
								CurrentEntry.setIsRewriteWindowOpen(false)
							end
						end
						if not FFlagEnableVerifiedBadgeStore then
							CurrentEntry.setIsUserVerified(false)
							
							return
						end
						local Number: number? = tonumber(Current.userId)
						
						if Number then
							CurrentEntry.setIsUserVerified(VerifiedBadgeDisplayStore.get().isBadgeVisible(Number))
							
							return
						else
							CurrentEntry.setIsUserVerified(false)
							
							return
						end
					elseif FFlagExpChatEvictFloodcheckedFromWindowOrderModule then
						CurrentEntry.setVisible(false)
						
						return
					end
				else
					CurrentEntry.setVisible(false)
					CurrentEntry.setIsUserVerified(false)
					
					if FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
						CurrentEntry.setChatActionType(TextChatMessageChatActionTypeModule.Unknown)
					end
				end
			end),
			cleanupLayout = if LayoutOrderSignal then SignalsModule.createEffect(function(p2)
				-- upvalues: LayoutOrderSignal (copy), CurrentEntry (copy)
				CurrentEntry.setLayoutOrder((LayoutOrderSignal(p2)))
			end) else nil,
			cleanupTelemetry = if GetFFlagExpChatUseUpdatedMessageRenderedModule() then SignalsModule.createEffect(function(p2)
				-- upvalues: RegisterMessageComponentResult (copy), MessagesStore (copy), ShouldSendHighFrequencyTelemetryModule (upval), v1 (upval), GetFFlagExpChatExcludeFOMORendersModule (upval), FFlagExpChatReportHistoricalRenders (upval), ShouldReportMessageRenderModule (upval), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), UseStoreResult (upval), EngineFeatureTextChatReportEmojiTelemetryEnabledModule (upval), IsChatWindowEnlargeEnabledModule (upval), GetMessageSettingsModule (upval), ChatWindowSettings (copy), FFlagExpChatGlobalTabDefaultModule (upval), HereLabel (upval), GetMessageTextModule (upval), GetChatWindowMessageEffectsModule (upval), GetMessageEffectsModule (upval), TextChatService (upval)
				local RegisterMessageComponentResultResult = RegisterMessageComponentResult(p2)
				
				if RegisterMessageComponentResultResult then
					local v2 = MessagesStore.getMessage(RegisterMessageComponentResultResult)(false)
					
					if v2 and v2.textChatMessageInstance and ShouldSendHighFrequencyTelemetryModule(v1) and (not GetFFlagExpChatExcludeFOMORendersModule() or not v2.isHiddenMessage) and (if FFlagExpChatReportHistoricalRenders then ShouldReportMessageRenderModule(v2) else not v2.isHistorical) then
						if EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
							local TabIndex = -1
							
							if FFlagExpChatUseChannelTabsStore then
								local ChannelTabsStoreModule = GetChannelTabsStoreModule(false)
								local ChannelTabsState = ChannelTabsStoreModule.getChannelTabsState(false)
								local SelectedTabName = ChannelTabsStoreModule.getSelectedTabName(false)
								
								if SelectedTabName and ChannelTabsState.allChannelTabs[SelectedTabName] then
									TabIndex = ChannelTabsState.allChannelTabs[SelectedTabName].tabIndex
								end
							else
								local ChannelTabs = UseStoreResult:getState().ChannelTabs
								local SelectedTabName1 = ChannelTabs and ChannelTabs.selectedTabName
								
								if SelectedTabName1 and ChannelTabs.allChannelTabs[SelectedTabName1] then
									TabIndex = ChannelTabs.allChannelTabs[SelectedTabName1].TabIndex
								end
							end
							if not EngineFeatureTextChatReportEmojiTelemetryEnabledModule then
								TextChatService:SendExpChatMessageClientRendered(v2.textChatMessageInstance, "chat_window", TabIndex)
								
								return
							end
							local t = {}
							
							if IsChatWindowEnlargeEnabledModule() then
								local MessageSettingsModule = GetMessageSettingsModule(v2, ChatWindowSettings, if FFlagExpChatGlobalTabDefaultModule then HereLabel else nil)
								t = GetChatWindowMessageEffectsModule(GetMessageEffectsModule((GetMessageTextModule(MessageSettingsModule.useTranslation, MessageSettingsModule.translation, MessageSettingsModule.text))))
							end
							TextChatService:SendExpChatMessageClientRendered(v2.textChatMessageInstance, "chat_window", TabIndex, "", t)
							
							return
						else
							TextChatService:SendExpChatMessageClientRendered(v2.textChatMessageInstance, "chat_window")
						end
					end
				end
			end) else nil,
			cleanupTc = SignalsModule.createEffect(function(p2)
				-- upvalues: RegisterMessageComponentResult (copy), MessagesStore (copy), FFlagExpChatEnableFOMOUpsellModule (upval), FFlagExpChatEnableCrossAgeChatActivityModule (upval), Players (upval), GetResult (upval), CurrentEntry (copy)
				local RegisterMessageComponentResultResult = RegisterMessageComponentResult(p2)
				
				if RegisterMessageComponentResultResult then
					local v2 = MessagesStore.getMessage(RegisterMessageComponentResultResult)(false)
					
					if v2 then
						local UserId = v2.userId
						local IsHiddenMessage = if FFlagExpChatEnableFOMOUpsellModule or FFlagExpChatEnableCrossAgeChatActivityModule then v2.isHiddenMessage else nil
						local Text = Players.LocalPlayer and (Players.LocalPlayer.UserId and tostring(Players.LocalPlayer.UserId))
						local NoIsHiddenMessage: boolean = UserId and UserId ~= "" and (not (Text and Text == UserId) and not IsHiddenMessage)
						CurrentEntry.setIsTrustedConnection(if NoIsHiddenMessage then GetResult.getIsTrustedConnection(UserId).data(p2) else false)
					end
				end
			end),
			componentId = ComponentId
		}
	end
	
	local List = {}
	
	if FFlagExpChatAddWindowSettingDependencyModule then
		table.insert(List, ChatWindowSettings)
	end
	if FFlagExpChatKeepV2PoolMountedModule then
		table.insert(List, IsVisible)
	end
	ReactModule.useEffect(function()
		-- upvalues: IsVisible (copy), UseStateResult1 (copy), createSlotEffects (copy), UseRefResult (copy), MessagesStore (copy), ChatWindowSettings (copy), p1 (copy), UseRefResult1 (copy), UseRefResult2 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagEnableInExpChatRewriteModule (upval), GetRewriteDropdownStoreModule (upval)
		if not IsVisible then return end
		for i = 1, UseStateResult1 do
			table.insert(UseRefResult1.current, (createSlotEffects(UseRefResult.current[i], "msg-component-" .. i, MessagesStore, ChatWindowSettings, p1.showTranslationButton)))
		end
		UseRefResult2.current = UseStateResult1
		MessagesStore.setActiveChannelFilter(if GetFFlagTextChatEnableUniverseChatTabsFunction() then if MessagesStore.getChannelTabsConfigurationEnabled(false) and p1.targetTextChannel then p1.targetTextChannel.Name else p1.selectedChannelName elseif p1.isChannelBarVisible and p1.targetTextChannel then p1.targetTextChannel.Name else nil)
		MessagesStore.repopulateMessageComponents()
		
		return function()
			-- upvalues: UseRefResult1 (upval), MessagesStore (upval), UseRefResult2 (upval), FFlagEnableInExpChatRewriteModule (upval), GetRewriteDropdownStoreModule (upval)
			for _, SlotEffects in ipairs(UseRefResult1.current) do
				if SlotEffects.cleanupMsg then
					pcall(SlotEffects.cleanupMsg)
				end
				if SlotEffects.cleanupLayout then
					pcall(SlotEffects.cleanupLayout)
				end
				if SlotEffects.cleanupTelemetry then
					pcall(SlotEffects.cleanupTelemetry)
				end
				if SlotEffects.cleanupTc then
					pcall(SlotEffects.cleanupTc)
				end
				MessagesStore.unregisterMessageComponent(SlotEffects.componentId)
			end
			UseRefResult1.current = {}
			UseRefResult2.current = 0
			
			if FFlagEnableInExpChatRewriteModule then
				GetRewriteDropdownStoreModule(false).setComponentId(nil)
			end
		end
	end, List)
	
	if FFlagExpChatDynamicV2PoolModule and Enabled then
		ReactModule.useEffect(function()
			-- upvalues: FFlagExpChatKeepV2PoolMountedModule (upval), IsVisible (copy), UseRefResult2 (copy), UseStateResult1 (copy), createSlotEffects (copy), UseRefResult (copy), MessagesStore (copy), ChatWindowSettings (copy), p1 (copy), UseRefResult1 (copy)
			if FFlagExpChatKeepV2PoolMountedModule and not IsVisible then return end
			local Current: number = UseRefResult2.current
			
			if UseStateResult1 <= Current then return end
			for i = Current + 1, UseStateResult1 do
				table.insert(UseRefResult1.current, (createSlotEffects(UseRefResult.current[i], "msg-component-" .. i, MessagesStore, ChatWindowSettings, p1.showTranslationButton)))
			end
			UseRefResult2.current = UseStateResult1
			MessagesStore.repopulateMessageComponents()
		end, if FFlagExpChatKeepV2PoolMountedModule then { UseStateResult1, IsVisible } else { UseStateResult1 })
		ReactModule.useEffect(function()
			-- upvalues: FFlagExpChatKeepV2PoolMountedModule (upval), IsVisible (copy), SignalsModule (upval), MessagesStore (copy), ExpChatSlotBatchSize (upval), UseRefResult3 (copy), UseStateResult2 (copy)
			if FFlagExpChatKeepV2PoolMountedModule and not IsVisible then return end
			local Effect = SignalsModule.createEffect(function(p2)
				-- upvalues: MessagesStore (upval), ExpChatSlotBatchSize (upval), UseRefResult3 (upval), UseStateResult2 (upval)
				local ActiveChannelFilter = MessagesStore.getActiveChannelFilter(p2)
				local Smallest = math.min(math.ceil((#(if ActiveChannelFilter then MessagesStore.getWindowMessagesInOrderByTabId(p2)[ActiveChannelFilter] or {} else MessagesStore.getWindowMessagesInOrder(p2) or {}) + 2) / ExpChatSlotBatchSize) * ExpChatSlotBatchSize, 50)
				
				if UseRefResult3.current < Smallest then
					UseStateResult2(Smallest)
				end
			end)
			
			return function()
				-- upvalues: Effect (copy)
				if Effect then
					pcall(Effect)
				end
			end
		end, if FFlagExpChatKeepV2PoolMountedModule then { IsVisible } else {})
	end
	local UseRefResult4 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: IsVisible (copy), UseRefResult4 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), p1 (copy), MessagesStore (copy)
		if not IsVisible then
			UseRefResult4.current = false
			
			return
		end
		if UseRefResult4.current then
			MessagesStore.setActiveChannelFilter(if GetFFlagTextChatEnableUniverseChatTabsFunction() then if MessagesStore.getChannelTabsConfigurationEnabled(false) and p1.targetTextChannel then p1.targetTextChannel.Name else p1.selectedChannelName elseif p1.isChannelBarVisible and p1.targetTextChannel then p1.targetTextChannel.Name else nil)
			MessagesStore.repopulateMessageComponents()
			
			return
		else
			UseRefResult4.current = true
		end
	end, {
		IsVisible,
		p1.targetTextChannel,
		p1.isChannelBarVisible,
		if GetFFlagTextChatEnableUniverseChatTabsFunction() then p1.selectedChannelName else nil
	})
	
	return {
		children = ReactModule.useMemo(function()
			-- upvalues: Enabled (copy), UseStateResult1 (copy), UseRefResult (copy), ReactModule (upval), TranslatedTextMessageV2Module (upval), p1 (copy), ChatWindowSettings (copy), FFlagEnableInExpChatRewriteModule (upval), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (upval), MapResult (ref), FFlagExpChatPresetChatEnabled (upval), IsChatWindowEnlargeEnabledModule (upval), RewriteDropdownModule (upval)
			if not Enabled then
				return nil
			end
			local Elements = {}
			
			for i = 1, UseStateResult1 do
				local CurrentEntry = UseRefResult.current[i]
				Elements["msg-component-" .. i] = ReactModule.createElement(TranslatedTextMessageV2Module, {
					originalBodyText = CurrentEntry.bodyText,
					originalPrefixText = CurrentEntry.prefixText,
					shouldShowTranslationToggle = CurrentEntry.shouldShowTranslation,
					bodyTextProperties = CurrentEntry.bodyTextProperties,
					prefixTextProperties = CurrentEntry.prefixTextProperties,
					layoutOrder = CurrentEntry.layoutOrder,
					visible = CurrentEntry.visible,
					textTransparency = p1.textTransparency,
					isUserVerified = CurrentEntry.isUserVerified,
					userId = CurrentEntry.userId,
					useTranslation = CurrentEntry.useTranslation,
					messageId = CurrentEntry.messageId,
					isSpatialUIEnabled = p1.isSpatialUIEnabled,
					chatWindowSettings = ChatWindowSettings,
					onTextMessageLabelButtonActivated = p1.onTextMessageLabelButtonActivated,
					message = CurrentEntry.message,
					isTrustedConnection = CurrentEntry.isTrustedConnection,
					wasRewritten = if FFlagEnableInExpChatRewriteModule then CurrentEntry.wasRewritten else nil,
					isRewriteWindowOpen = if FFlagEnableInExpChatRewriteModule then CurrentEntry.isRewriteWindowOpen else nil,
					chatActionType = if FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then CurrentEntry.chatActionType else nil,
					chatWindowTransparencyBindable = p1.chatWindowTransparencyBindable,
					arButtonPadding = MapResult,
					isPresetMessage = if FFlagExpChatPresetChatEnabled then CurrentEntry.isPresetMessage else nil,
					effects = if IsChatWindowEnlargeEnabledModule() then CurrentEntry.effects else nil
				})
			end
			if FFlagEnableInExpChatRewriteModule then
				Elements["$rewrite-dropdown"] = ReactModule.createElement(RewriteDropdownModule, {
					textTransparency = p1.textTransparency,
					arButtonPadding = MapResult
				})
			end
			Elements["$layout"] = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
			
			return Elements
		end, if FFlagExpChatKeepV2PoolMountedModule then { Enabled, UseStateResult1 } else {
			Enabled, p1.textTransparency, p1.isSpatialUIEnabled, ChatWindowSettings,
			p1.onTextMessageLabelButtonActivated, UseStateResult1
		})
	}
end