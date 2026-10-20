local IXPService = game:GetService("IXPService")
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Parent1 = ExpChat.Parent
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
local SignalsReactModule = require(Parent.SignalsReact)
local ReactModule = require(Parent1.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = require(Parent.Signals)
local FoundationModule = require(Parent.Foundation)
local Dictionary = require(Parent.llama).Dictionary
local LocalizationModule = require(ExpChat.Localization)
local IsChatRegionLockedModule = require(ExpChat.isChatRegionLocked)
local ShowChatEnabledUIModule = require(ExpChat.showChatEnabledUI)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetChatStatusStoreModule = require(ExpChat.Stores.GetChatStatusStore)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local ShouldSendHighFrequencyTelemetryModule = require(ExpChat.shouldSendHighFrequencyTelemetry)
local ExpChatPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local ApplyChatWindowMessageEffectsModule = require(ExpChat.MessageEffects.applyChatWindowMessageEffects)
local GetMessageEffectsModule = require(ExpChat.MessageEffects.getMessageEffects)
local GetChatWindowMessageEffectsModule = require(ExpChat.MessageEffects.getChatWindowMessageEffects)
local GetChatWindowPrefixOffsetModule = require(ExpChat.MessageEffects.getChatWindowPrefixOffset)
local GetChatWindowMessageLineHeightModule = require(ExpChat.MessageEffects.getChatWindowMessageLineHeight)
local MessageEffectModule = require(ExpChat.MessageEffects.MessageEffect)
local TextChatMessageChatActionTypeModule = require(ExpChat.TextChatMessageChatActionType)
local IsChatWindowEnlargeEnabledModule = require(ExpChat.isChatWindowEnlargeEnabled)
local FFlagExpChatMessageEffectChatWindowEnlargePaddingModule = require(ExpChat.Flags.FFlagExpChatMessageEffectChatWindowEnlargePadding)
local FFlagExpChatMessageEffectChatWindowEnlargeLineHeightModule = require(ExpChat.Flags.FFlagExpChatMessageEffectChatWindowEnlargeLineHeight)
local FIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule = require(ExpChat.Flags.FIntExpChatMessageEffectChatWindowEnlargePaddingPixels)
local EngineFeatureTextChatReportEmojiTelemetryEnabledModule = require(ExpChat.Flags.EngineFeatureTextChatReportEmojiTelemetryEnabled)
local FFlagDebugMessageProfilingModule = require(ExpChat.Flags.FFlagDebugMessageProfiling)
local ExpChatTranslationToggleSpacingFix = game:DefineFastFlag("ExpChatTranslationToggleSpacingFix", false)
local GetFFlagExpChatUseUpdatedMessageRenderedModule = require(ExpChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local v1 = require(ExpChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local GetFFlagExpChatExcludeFOMORendersModule = require(ExpChat.Flags.getFFlagExpChatExcludeFOMORenders)
local FFlagEnableInExpChatRewriteModule = require(ExpChat.Flags.FFlagEnableInExpChatRewrite)
local FStringInExpChatRewriteLabelKeyModule = require(ExpChat.Flags.FStringInExpChatRewriteLabelKey)
local FStringInExpChatRewriteReasonKeyModule = require(ExpChat.Flags.FStringInExpChatRewriteReasonKey)
local FFlagExpChatRewriteInlineModule = require(ExpChat.Flags.FFlagExpChatRewriteInline)
local FFlagExpChatRewriteInlineIxpEnabledModule = require(ExpChat.Flags.FFlagExpChatRewriteInlineIxpEnabled)
local FFlagExpChatRewriteToggleAnalyticsModule = require(ExpChat.Flags.FFlagExpChatRewriteToggleAnalytics)
local FStringExpChatRewriteInlineIxpLayerModule = require(ExpChat.Flags.FStringExpChatRewriteInlineIxpLayer)
local FIntExpChatWindowTransparencyRewriteInteractableThresholdModule = require(ExpChat.Flags.FIntExpChatWindowTransparencyRewriteInteractableThreshold)
local FFlagEnableInExpChatSummaryOnLuaModule = require(ExpChat.Flags.FFlagEnableInExpChatSummaryOnLua)
local FFlagExpChatPolishSummaryMessageUIModule = require(ExpChat.Flags.FFlagExpChatPolishSummaryMessageUI)
local EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(ExpChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local SummaryMessageRichTextModule = require(ExpChat.summaryMessageRichText)
local UseCursorFunction = require(Parent.UIBlox).App.SelectionCursor.useCursor
local ConfigModule = require(ExpChat.Config)
local Helpers = ExpChat.ChatWindow.Helpers
local GetMessageSettingsModule = require(Helpers.getMessageSettings)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local DuplicateInvisibleTextModule = require(Helpers.duplicateInvisibleText)
local Flags = ExpChat.Flags
local IsExperienceChatUserProfileApiEnabledModule = require(Flags.isExperienceChatUserProfileApiEnabled)
local FIntExpChatVisibleARButtonPaddingModule = require(Flags.FIntExpChatVisibleARButtonPadding)
local FIntExpChatDefaultARButtonPaddingModule = require(Flags.FIntExpChatDefaultARButtonPadding)
local FFlagExpChatTopBannerForPresetChatAccessModule = require(Flags.FFlagExpChatTopBannerForPresetChatAccess)
local FFlagExpChatFixLocalUserVerifiedBadgeModule = require(Flags.FFlagExpChatFixLocalUserVerifiedBadge)
local ExpChatSharedModule = require(Parent1.ExpChatShared)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetPresetIconRichTextFunction = ExpChatSharedModule.getPresetIconRichText
local UseIsARButtonVisibleModule = require(ExpChat.useIsARButtonVisible)
local IsPresetMessageFunction = ExpChatSharedModule.isPresetMessage

function appendVerifiedBadge(Text: string): string
	-- upvalues: ConfigModule (copy)
	return string.gsub(Text, ":(%S-)$", ConfigModule.VERIFIED_EMOJI .. ":%1")
end

local function v66(Message)
	-- upvalues: UserProfileStore (copy), SignalsReactModule (copy)
	local Entry = UserProfileStore.get().fetchNamesByUserIds({ (tostring(Message.userId)) })(false).data[1]
	
	return {
		displayName = SignalsReactModule.useSignalBinding(Entry.names.getDisplayName),
		inExperienceCombinedName = SignalsReactModule.useSignalBinding(Entry.names.getInExperienceCombinedName)
	}
end

function trim(p1)
	return if p1:match("^()%s*$") then "" else p1:match("^%s*(.*%S)")
end

function getMessageText(p1, p2, p3)
	return (if p2 == nil or p2 == "" then p3 elseif p1 then p2 else p3) or ""
end

local function _(p1: number, p2): number
	return p1 + p2 * (1 - p1)
end

local _ = function(p1, p2)
	return p2:map(function(p3): number
		-- upvalues: p1 (copy)
		return if p1 == nil then 1 else p1 + p3 * (1 - p1)
	end)
end

local _ = function()
	-- upvalues: FFlagExpChatPresetChatEnabled (copy), FFlagExpChatTopBannerForPresetChatAccessModule (copy), UseIsARButtonVisibleModule (copy), FIntExpChatVisibleARButtonPaddingModule (copy), FIntExpChatDefaultARButtonPaddingModule (copy), GetChatStatusStoreModule (copy), SignalsReactModule (copy), ShowChatEnabledUIModule (copy), IsChatRegionLockedModule (copy)
	if FFlagExpChatPresetChatEnabled and FFlagExpChatTopBannerForPresetChatAccessModule then
		return if UseIsARButtonVisibleModule() then FIntExpChatVisibleARButtonPaddingModule else FIntExpChatDefaultARButtonPaddingModule
	else
		local ShowChatEnabledUIModuleResult = ShowChatEnabledUIModule((SignalsReactModule.useSignalState(GetChatStatusStoreModule(false).getChatStatus)))
		
		return if not IsChatRegionLockedModule() and ShowChatEnabledUIModuleResult then FIntExpChatVisibleARButtonPaddingModule else FIntExpChatDefaultARButtonPaddingModule
	end
end

local function appendTrustedIndicator(Text: string, TrustedLabelText, p1, TextSize: number, UseTokensResult): string
	local Transparency: number = UseTokensResult.Color.Shift.Shift_300.Transparency
	local Transparency1: number = UseTokensResult.Color.Content.Emphasis.Transparency
	local MarkName: string = `{`{`{`{`<mark color='#{UseTokensResult.Color.Shift.Shift_300.Color3:ToHex()}' transparency='{Transparency + p11 * (1 - Transparency)}'>`}<font transparency='1' weight='{600}' size='{TextSize - 4}'><stroke transparency='1'>_`}<font color='#{UseTokensResult.Color.Content.Emphasis.Color3:ToHex()}' transparency='{Transparency1 + p11 * (1 - Transparency1)}'>{TrustedLabelText}</font>`}_</stroke></font>`}</mark>`
	
	return if string.find(Text, ":([%S:]-)$") then string.gsub(Text, ":([%S:]-)$", ` {MarkName} :%1`) else `{Text} {MarkName}`
end

local GetResult = DataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

local _ = function(p1, p2, p3, p4)
	-- upvalues: TextChatMessageChatActionTypeModule (copy), SummaryMessageRichTextModule (copy)
	local P15 = p2 or ""
	
	if p3.chatActionType == TextChatMessageChatActionTypeModule.Summary then
		P15 = SummaryMessageRichTextModule.wrapInSummaryMutedStyle(SummaryMessageRichTextModule.getSummaryIconPrefix(p4) .. " " .. P15, p1.Color.Content.Muted.Color3:ToHex(), p4)
	end
	return P15
end

local function v73(Frame)
	-- upvalues: FFlagDebugMessageProfilingModule (copy), ReactModule (copy), ExpChatPerfTracker (copy), LocalizationModule (copy), FFlagExpChatGlobalTabDefaultModule (copy), FFlagExpChatRewriteInlineModule (copy), FStringInExpChatRewriteLabelKeyModule (copy), FoundationModule (copy), GetMessageSettingsModule (copy), IsChatWindowEnlargeEnabledModule (copy), GetMessageEffectsModule (copy), ApplyChatWindowMessageEffectsModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), IsExperienceChatUserProfileApiEnabledModule (copy), v66 (copy), GetFFlagExpChatExcludeFOMORendersModule (copy), SignalsModule (copy), Players (copy), GetResult (copy), SignalsReactModule (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), FFlagExpChatUseChannelTabsStore (copy), UseStoreFunction (copy), GetFFlagExpChatUseUpdatedMessageRenderedModule (copy), ShouldSendHighFrequencyTelemetryModule (copy), v1 (copy), GetChannelTabsStoreModule (copy), EngineFeatureTextChatReportEmojiTelemetryEnabledModule (copy), GetChatWindowMessageEffectsModule (copy), TextChatService (copy), GetChatWindowPrefixOffsetModule (copy), FFlagExpChatMessageEffectChatWindowEnlargeLineHeightModule (copy), GetChatWindowMessageLineHeightModule (copy), appendTrustedIndicator (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagExpChatPolishSummaryMessageUIModule (copy), TextChatMessageChatActionTypeModule (copy), SummaryMessageRichTextModule (copy), FFlagExpChatPresetChatEnabled (copy), IsPresetMessageFunction (copy), GetPresetIconRichTextFunction (copy), ExpChatTranslationToggleSpacingFix (copy), DuplicateInvisibleTextModule (copy), UseCursorFunction (copy), FFlagExpChatMessageEffectChatWindowEnlargePaddingModule (copy), MessageEffectModule (copy), FIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule (copy), FFlagEnableInExpChatRewriteModule (copy), FFlagExpChatTopBannerForPresetChatAccessModule (copy), UseIsARButtonVisibleModule (copy), FIntExpChatVisibleARButtonPaddingModule (copy), FIntExpChatDefaultARButtonPaddingModule (copy), GetChatStatusStoreModule (copy), ShowChatEnabledUIModule (copy), IsChatRegionLockedModule (copy), FIntExpChatWindowTransparencyRewriteInteractableThresholdModule (copy)
	if FFlagDebugMessageProfilingModule then
		debug.profilebegin("TranslatedTextMessage")
	end
	local MessageId = Frame.message.messageId or "UNKNOWN_MESSAGE_ID"
	ReactModule.useEffect(function()
		-- upvalues: ExpChatPerfTracker (upval), MessageId (copy)
		ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = MessageId })
		ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = MessageId })
	end, { MessageId })
	local IsSpatialUIEnabled = Frame.isSpatialUIEnabled
	local SpatialPanelTextSize = if IsSpatialUIEnabled then Frame.chatWindowSettings.SpatialPanelTextSize else Frame.chatWindowSettings.TextSize
	local UseLocalizationResult = LocalizationModule.useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		hereLabel = if FFlagExpChatGlobalTabDefaultModule then "CoreScripts.TextChat.ChannelTabs.Here" else nil,
		rewrittenLabelText = if FFlagExpChatRewriteInlineModule then FStringInExpChatRewriteLabelKeyModule else nil,
		defaultRewrittenLabelText = if FFlagExpChatRewriteInlineModule then "CoreScripts.TextChat.ChatWindow.RewrittenLabel" else nil
	})
	local RewrittenLabelText = if FFlagExpChatRewriteInlineModule then if UseLocalizationResult.rewrittenLabelText and UseLocalizationResult.rewrittenLabelText ~= "" then UseLocalizationResult.rewrittenLabelText else UseLocalizationResult.defaultRewrittenLabelText else nil
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local MessageSettingsModule = GetMessageSettingsModule(Frame.message, Frame.chatWindowSettings, if FFlagExpChatGlobalTabDefaultModule then UseLocalizationResult.hereLabel else nil)
	local ShowTranslationButton = Frame.showTranslationButton
	local MessageText = getMessageText(MessageSettingsModule.useTranslation, MessageSettingsModule.translation, MessageSettingsModule.text)
	local List = nil
	
	if IsChatWindowEnlargeEnabledModule() then
		List = GetMessageEffectsModule(MessageText)
		MessageText = ApplyChatWindowMessageEffectsModule(MessageText, List)
	end
	local PrefixText = MessageSettingsModule.prefixText or ""
	local v2 = nil
	
	if GetFFlagTextChatEnableUniverseChatTabsFunction() and Frame.message.textChannel == nil then
		v2 = nil
	elseif IsExperienceChatUserProfileApiEnabledModule() and Frame.message.userId then
		if FFlagDebugMessageProfilingModule then
			debug.profilebegin("useCombinedName")
		end
		v2 = v66(Frame.message)
		
		if FFlagDebugMessageProfilingModule then
			debug.profileend()
		end
	end
	local Text = Frame.message.userId and tostring(Frame.message.userId)
	local IsHiddenMessage = if GetFFlagExpChatExcludeFOMORendersModule() then Frame.message.isHiddenMessage else nil
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Text (copy), Players (upval), IsHiddenMessage (copy), GetResult (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Text (upval), Players (upval), IsHiddenMessage (upval), GetResult (upval)
			local Text1 = Players.LocalPlayer and (Players.LocalPlayer.UserId and tostring(Players.LocalPlayer.UserId))
			local NoIsHiddenMessage: boolean = Text and Text ~= "" and (not (Text1 and Text1 == Text) and not IsHiddenMessage)
			
			return if NoIsHiddenMessage then GetResult.getIsTrustedConnection(Text).data(p1) else nil
		end)
	end, { Text, IsHiddenMessage })))
	local UseStoreResult = if EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule and not FFlagExpChatUseChannelTabsStore then UseStoreFunction() else nil
	
	if GetFFlagExpChatUseUpdatedMessageRenderedModule() then
		ReactModule.useEffect(function()
			-- upvalues: Frame (copy), ShouldSendHighFrequencyTelemetryModule (upval), v1 (upval), GetFFlagExpChatExcludeFOMORendersModule (upval), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), UseStoreResult (copy), EngineFeatureTextChatReportEmojiTelemetryEnabledModule (upval), IsChatWindowEnlargeEnabledModule (upval), GetChatWindowMessageEffectsModule (upval), List (ref), TextChatService (upval)
			if Frame.message.textChatMessageInstance and ShouldSendHighFrequencyTelemetryModule(v1) and (not GetFFlagExpChatExcludeFOMORendersModule() or not Frame.message.isHiddenMessage) and not Frame.message.isHistorical then
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
					if EngineFeatureTextChatReportEmojiTelemetryEnabledModule then
						TextChatService:SendExpChatMessageClientRendered(Frame.message.textChatMessageInstance, "chat_window", TabIndex, "", if IsChatWindowEnlargeEnabledModule() then GetChatWindowMessageEffectsModule(List) else {})
						
						return
					else
						TextChatService:SendExpChatMessageClientRendered(Frame.message.textChatMessageInstance, "chat_window", TabIndex)
						
						return
					end
				else
					TextChatService:SendExpChatMessageClientRendered(Frame.message.textChatMessageInstance, "chat_window")
				end
			end
		end, {})
	end
	local BodyTextProperties = MessageSettingsModule.bodyTextProperties
	local PrefixTextProperties = MessageSettingsModule.prefixTextProperties
	local SpatialPanelTextSize1 = if IsSpatialUIEnabled then SpatialPanelTextSize else BodyTextProperties.TextSize
	local XOffset = SpatialPanelTextSize1 - 2
	local _UDim2 = if IsChatWindowEnlargeEnabledModule() then UDim2.fromOffset(0, GetChatWindowPrefixOffsetModule(List, PrefixTextProperties.TextSize)) else nil
	local ChatWindowMessageLineHeightModule = if FFlagExpChatMessageEffectChatWindowEnlargeLineHeightModule and IsChatWindowEnlargeEnabledModule() then GetChatWindowMessageLineHeightModule(List, SpatialPanelTextSize1, PrefixTextProperties.TextSize) else nil
	local MapResult = ReactModule.joinBindings({
		ReactModule.joinBindings(if v2 == nil then {} else { v2.displayName, v2.inExperienceCombinedName }):map(function(Entry)
			-- upvalues: PrefixText (copy), Frame (copy)
			local Entry1 = Entry[1] or ""
			local Entry2 = Entry[2] or ""
			local Text = PrefixText
			
			if string.len(Entry1) > 0 and string.len(Entry2) > 0 and Entry1 ~= Entry2 then
				Text = string.gsub(Text, Entry1, Entry2)
			end
			if string.len(PrefixText) > 0 and Frame.isUserVerified then
				Text = appendVerifiedBadge(Text)
			end
			return Text
		end),
		UseSignalBindingResult,
		Frame.textTransparency
	}):map(function(Entry)
		-- upvalues: PrefixText (copy), appendTrustedIndicator (upval), UseLocalizationResult (copy), PrefixTextProperties (copy), UseTokensResult (copy)
		local Entry1 = Entry[1] or ""
		local Entry2 = Entry[2] or false
		local Entry3 = Entry[3]
		
		if Entry3 == nil then
			Entry3 = 1
		end
		if string.len(PrefixText) == 0 then
			return Entry1
		end
		if Entry2 then
			Entry1 = appendTrustedIndicator(Entry1, UseLocalizationResult.trustedLabelText, Entry3, PrefixTextProperties.TextSize, UseTokensResult)
		end
		return Entry1
	end)
	local MapResult1 = MapResult:map(function(p1)
		-- upvalues: PrefixText (copy)
		return if string.len(PrefixText) == 0 then p1 else trim(p1)
	end)
	local MapResult2 = MapResult:map(function(p1)
		-- upvalues: MessageText (ref), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagExpChatPolishSummaryMessageUIModule (upval), SpatialPanelTextSize1 (copy), UseTokensResult (copy), Frame (copy), TextChatMessageChatActionTypeModule (upval), SummaryMessageRichTextModule (upval), FFlagExpChatPresetChatEnabled (upval), IsPresetMessageFunction (upval), GetPresetIconRichTextFunction (upval), PrefixText (copy), ShowTranslationButton (copy), ExpChatTranslationToggleSpacingFix (upval), DuplicateInvisibleTextModule (upval), PrefixTextProperties (copy)
		local Text: string = MessageText
		
		if FFlagEnableInExpChatSummaryOnLuaModule then
			local SpatialPanelTextSize = if FFlagExpChatPolishSummaryMessageUIModule then SpatialPanelTextSize1 else nil
			local MessageText1 = MessageText or ""
			
			if Frame.message.chatActionType == TextChatMessageChatActionTypeModule.Summary then
				MessageText1 = SummaryMessageRichTextModule.wrapInSummaryMutedStyle(SummaryMessageRichTextModule.getSummaryIconPrefix(SpatialPanelTextSize) .. " " .. MessageText1, UseTokensResult.Color.Content.Muted.Color3:ToHex(), SpatialPanelTextSize)
			end
			Text = MessageText1
		end
		if FFlagExpChatPresetChatEnabled and IsPresetMessageFunction(Frame.message) then
			Text ..= ` {GetPresetIconRichTextFunction(SpatialPanelTextSize1)}`
		end
		if string.len(PrefixText) == 0 then
			return if FFlagEnableInExpChatSummaryOnLuaModule then Text else MessageText
		end
		if ShowTranslationButton then
			if ExpChatTranslationToggleSpacingFix then
				Text = "     " .. Text
			else
				Text = "   " .. Text
			end
		end
		return DuplicateInvisibleTextModule(p1, PrefixTextProperties.FontFace, PrefixTextProperties.TextSize) .. " " .. Text
	end)
	
	if FFlagExpChatRewriteInlineModule then
		MapResult2 = ReactModule.joinBindings({ MapResult2 }):map(function(Entry)
			-- upvalues: Frame (copy), FoundationModule (upval), PrefixTextProperties (copy), UseTokensResult (copy), RewrittenLabelText (ref)
			local Entry1 = Entry[1] or ""
			
			return if Frame.wasRewritten then `{Entry1} <font size='{PrefixTextProperties.TextSize - 4}' color='#{UseTokensResult.Color.Content.Muted.Color3:ToHex()}'>{`({RewrittenLabelText})`}<font transparency='1'><stroke transparency='1'>_</stroke></font>{`<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{if Frame.isRewriteMenuOpen then FoundationModule.Enums.IconName.ChevronLargeUp else FoundationModule.Enums.IconName.ChevronLargeDown}</font>`}</font>` else Entry1
		end)
	end
	local UseCursorResult = UseCursorFunction()
	local _UDim = if FFlagExpChatMessageEffectChatWindowEnlargePaddingModule and IsChatWindowEnlargeEnabledModule() then UDim.new(0, if List and table.find(List, MessageEffectModule.ChatWindowEnlarge) then FIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule else 0) else nil
	local UIPadding = nil
	
	if FFlagEnableInExpChatRewriteModule then
		local FIntExpChatVisibleARButtonPaddingModule1 = nil
		if FFlagExpChatPresetChatEnabled and FFlagExpChatTopBannerForPresetChatAccessModule then
			FIntExpChatVisibleARButtonPaddingModule1 = if UseIsARButtonVisibleModule() then FIntExpChatVisibleARButtonPaddingModule else FIntExpChatDefaultARButtonPaddingModule
		else
			local ShowChatEnabledUIModuleResult = ShowChatEnabledUIModule((SignalsReactModule.useSignalState(GetChatStatusStoreModule(false).getChatStatus)))
			FIntExpChatVisibleARButtonPaddingModule1 = if not IsChatRegionLockedModule() and ShowChatEnabledUIModuleResult then FIntExpChatVisibleARButtonPaddingModule else FIntExpChatDefaultARButtonPaddingModule
		end
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, FIntExpChatVisibleARButtonPaddingModule1),
			PaddingTop = _UDim,
			PaddingBottom = _UDim
		})
	else
		local ShowChatEnabledUIModuleResult = ShowChatEnabledUIModule((SignalsReactModule.useSignalState(GetChatStatusStoreModule(false).getChatStatus)))
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, if not IsChatRegionLockedModule() and ShowChatEnabledUIModuleResult then FIntExpChatVisibleARButtonPaddingModule else FIntExpChatDefaultARButtonPaddingModule),
			PaddingTop = _UDim,
			PaddingBottom = _UDim
		})
	end
	local NoChatWindowTransparencyBindable = if FFlagExpChatRewriteInlineModule and Frame.wasRewritten then Frame.chatWindowTransparencyBindable == nil or (if typeof(Frame.chatWindowTransparencyBindable) == "number" then Frame.chatWindowTransparencyBindable < FIntExpChatWindowTransparencyRewriteInteractableThresholdModule else Frame.chatWindowTransparencyBindable:map(function(p1): boolean
		-- upvalues: FIntExpChatWindowTransparencyRewriteInteractableThresholdModule (upval)
		return p1 < FIntExpChatWindowTransparencyRewriteInteractableThresholdModule
	end)) else nil
	local CreateElementFunction = ReactModule.createElement
	local v3 = "Frame"
	local config = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = Frame.LayoutOrder
	}
	local config1 = { UIPadding = UIPadding }
	local CreateElementFunction2 = ReactModule.createElement
	local v4 = "Frame"
	local config2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t = {}
	local TextLabel = false
	
	if string.len(PrefixText) > 0 then
		local TextStrokeTransparency = PrefixTextProperties.TextStrokeTransparency
		local v5 = 0
		TextLabel = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			RichText = true,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.XY,
			FontFace = PrefixTextProperties.FontFace,
			LineHeight = ChatWindowMessageLineHeightModule,
			Position = _UDim2,
			Text = MapResult,
			TextColor3 = PrefixTextProperties.TextColor3,
			TextSize = PrefixTextProperties.TextSize,
			TextStrokeColor3 = PrefixTextProperties.TextStrokeColor3,
			TextStrokeTransparency = Frame.textTransparency:map(function(p1): number
				-- upvalues: TextStrokeTransparency (copy)
				return if TextStrokeTransparency == nil then 1 else TextStrokeTransparency + p1 * (1 - TextStrokeTransparency)
			end),
			TextTransparency = Frame.textTransparency:map(function(p1): number
				-- upvalues: v5 (copy)
				return if v5 == nil then 1 else v5 + p1 * (1 - v5)
			end),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}, {
			UIGradient = PrefixTextProperties.UIGradient ~= nil and ReactModule.createElement("UIGradient", PrefixTextProperties.UIGradient)
		})
	end
	t.PrefixText = TextLabel
	local TextStrokeTransparency1 = BodyTextProperties.TextStrokeTransparency
	local v6 = 0
	t.BodyText = ReactModule.createElement(if FFlagExpChatRewriteInlineModule and Frame.wasRewritten then "TextButton" else "TextLabel", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		FontFace = BodyTextProperties.FontFace,
		LineHeight = ChatWindowMessageLineHeightModule,
		RichText = true,
		Size = UDim2.new(1, 0, 0, 0),
		Text = MapResult2,
		TextColor3 = BodyTextProperties.TextColor3,
		TextSize = SpatialPanelTextSize1,
		TextStrokeColor3 = BodyTextProperties.TextStrokeColor3,
		TextStrokeTransparency = Frame.textTransparency:map(function(p1): number
			-- upvalues: TextStrokeTransparency1 (copy)
			return if TextStrokeTransparency1 == nil then 1 else TextStrokeTransparency1 + p1 * (1 - TextStrokeTransparency1)
		end),
		TextTransparency = Frame.textTransparency:map(function(p1): number
			-- upvalues: v6 (copy)
			return if v6 == nil then 1 else v6 + p1 * (1 - v6)
		end),
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		[ReactModule.Event.Activated] = if FFlagExpChatRewriteInlineModule and Frame.wasRewritten then Frame.onTextBodyActivated else nil,
		Interactable = NoChatWindowTransparencyBindable
	})
	local TextMessageButton = nil
	
	if string.len(PrefixText) == 0 then
		TextMessageButton = nil
	else
		local CreateElementFunction1 = ReactModule.createElement
		local v7 = "Frame"
		local config3 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = _UDim2,
			Size = UDim2.new(1, 0, 0, 0)
		}
		local config4 = {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			TextButton = ReactModule.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				FontFace = PrefixTextProperties.FontFace,
				LineHeight = ChatWindowMessageLineHeightModule,
				RichText = true,
				SelectionImageObject = UseCursorResult,
				Size = UDim2.new(0, 0, 0, 0),
				Text = MapResult1,
				TextSize = PrefixTextProperties.TextSize,
				TextStrokeTransparency = 1,
				TextTransparency = 1,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 1,
				[ReactModule.Event.Activated] = function()
					-- upvalues: Frame (copy)
					Frame.onTextMessageLabelButtonActivated(Frame.message)
				end
			})
		}
		local ImageButton = nil
		
		if ShowTranslationButton then
			local v8 = 0
			ImageButton = ReactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				HoverImage = "rbxasset://textures/translateIconDark.png",
				Image = "rbxasset://textures/translateIcon.png",
				ImageTransparency = Frame.textTransparency:map(function(p1): number
					-- upvalues: v8 (copy)
					return if v8 == nil then 1 else v8 + p1 * (1 - v8)
				end),
				LayoutOrder = 2,
				PressedImage = "rbxasset://textures/translateIconDark.png",
				SelectionImageObject = UseCursorResult,
				Size = UDim2.new(0, XOffset, 0, XOffset),
				[ReactModule.Event.Activated] = function()
					-- upvalues: Frame (copy)
					Frame.onToggle(not Frame.message.useTranslation, Frame.message.messageId)
				end
			})
		else
			ImageButton = nil
		end
		config4.TranslationButton = ImageButton
		TextMessageButton = CreateElementFunction1(v7, config3, config4)
	end
	t.TextMessageButton = TextMessageButton
	config1.TextMessage = CreateElementFunction2(v4, config2, t)
	local Element = CreateElementFunction(v3, config, config1)
	
	if FFlagDebugMessageProfilingModule then
		debug.profileend()
	end
	return Element
end

local function TranslatedTextMessageWithToggle(_)
	-- upvalues: RoactRoduxModule (copy), GetMessagesStoreModule (copy), v73 (copy)
	return RoactRoduxModule.connect(function() end, function(_)
		-- upvalues: GetMessagesStoreModule (upval)
		return {
			onToggle = function(NoUseTranslation, MessageId)
				-- upvalues: GetMessagesStoreModule (upval)
				GetMessagesStoreModule(false).toggleMessageTranslation(NoUseTranslation, MessageId)
			end
		}
	end)(v73)
end

local function RewriteLabelWithButton(Frame)
	-- upvalues: FoundationModule (copy), LocalizationModule (copy), FStringInExpChatRewriteLabelKeyModule (copy), ReactModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseLocalizationResult = LocalizationModule.useLocalization({
		defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel",
		rewrittenLabelText = FStringInExpChatRewriteLabelKeyModule
	})
	local Transparency = UseTokensResult.Color.Content.Muted.Transparency
	local v9 = 0.5
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y row align-y-center gap-xsmall",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(FoundationModule.Text, {
			tag = "size-0-0 auto-xy text-caption-small text-align-x-left",
			LayoutOrder = 1,
			RichText = true,
			Text = "(" .. (if UseLocalizationResult.rewrittenLabelText and UseLocalizationResult.rewrittenLabelText ~= "" then UseLocalizationResult.rewrittenLabelText else UseLocalizationResult.defaultRewrittenLabelText) .. ")",
			textStyle = {
				Color3 = UseTokensResult.Color.Content.Muted.Color3,
				Transparency = Frame.textTransparency:map(function(p1): number
					-- upvalues: Transparency (copy)
					return if Transparency == nil then 1 else Transparency + p1 * (1 - Transparency)
				end)
			},
			stroke = {
				Color = Color3.fromRGB(0, 0, 0),
				Transparency = Frame.textTransparency:map(function(p1): number
					-- upvalues: v9 (copy)
					return if v9 == nil then 1 else v9 + p1 * (1 - v9)
				end),
				Thickness = UseTokensResult.Stroke.Thin
			}
		}),
		IconButton = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			LayoutOrder = 2,
			size = FoundationModule.Enums.InputSize.XSmall,
			icon = if Frame.isRewriteMenuOpen then FoundationModule.Enums.IconName.ChevronLargeUp else FoundationModule.Enums.IconName.ChevronLargeDown,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			Visible = Frame.textTransparency:map(function(p1: number): boolean
				return p1 < 1
			end),
			onActivated = Frame.onActivated
		})
	})
end

return ReactModule.memo(function(Frame)
	-- upvalues: GetMessageSettingsModule (copy), FFlagEnableInExpChatRewriteModule (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatTopBannerForPresetChatAccessModule (copy), UseIsARButtonVisibleModule (copy), FIntExpChatVisibleARButtonPaddingModule (copy), FIntExpChatDefaultARButtonPaddingModule (copy), GetChatStatusStoreModule (copy), SignalsReactModule (copy), ShowChatEnabledUIModule (copy), IsChatRegionLockedModule (copy), LocalizationModule (copy), FStringInExpChatRewriteReasonKeyModule (copy), FoundationModule (copy), ReactModule (copy), FFlagExpChatRewriteToggleAnalyticsModule (copy), ExpChatSharedModule (copy), FFlagExpChatRewriteInlineIxpEnabledModule (copy), IXPService (copy), FStringExpChatRewriteInlineIxpLayerModule (copy), FFlagExpChatRewriteInlineModule (copy), Dictionary (copy), TranslatedTextMessageWithToggle (copy), v73 (copy), RewriteLabelWithButton (copy)
	local MessageSettingsModule = GetMessageSettingsModule(Frame.message, Frame.chatWindowSettings)
	local ShowTranslationButton = Frame.showTranslationButton
	local UseTokensResult = nil
	local IsRewriteMenuOpen = nil
	local UseStateResult2 = nil
	local UseResult = nil
	local OriginalText = nil
	local v9 = false
	local WasRewritten = false
	local Largest = 0
	local RewrittenReasonLabelText = ""
	
	if FFlagEnableInExpChatRewriteModule then
		local FIntExpChatVisibleARButtonPaddingModule1 = nil
		if FFlagExpChatPresetChatEnabled and FFlagExpChatTopBannerForPresetChatAccessModule then
			FIntExpChatVisibleARButtonPaddingModule1 = if UseIsARButtonVisibleModule() then FIntExpChatVisibleARButtonPaddingModule else FIntExpChatDefaultARButtonPaddingModule
		else
			local ShowChatEnabledUIModuleResult = ShowChatEnabledUIModule((SignalsReactModule.useSignalState(GetChatStatusStoreModule(false).getChatStatus)))
			FIntExpChatVisibleARButtonPaddingModule1 = if not IsChatRegionLockedModule() and ShowChatEnabledUIModuleResult then FIntExpChatVisibleARButtonPaddingModule else FIntExpChatDefaultARButtonPaddingModule
		end
		Largest = math.max(FIntExpChatVisibleARButtonPaddingModule1 - FIntExpChatDefaultARButtonPaddingModule, 0)
		local UseLocalizationResult = LocalizationModule.useLocalization({
			defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel",
			rewrittenReasonLabelText = FStringInExpChatRewriteReasonKeyModule
		})
		RewrittenReasonLabelText = if UseLocalizationResult.rewrittenReasonLabelText and UseLocalizationResult.rewrittenReasonLabelText ~= "" then UseLocalizationResult.rewrittenReasonLabelText else UseLocalizationResult.defaultRewrittenReasonLabelText
		UseTokensResult = FoundationModule.Hooks.useTokens()
		IsRewriteMenuOpen, UseStateResult2 = ReactModule.useState(false)
		WasRewritten = MessageSettingsModule.wasRewritten
		OriginalText = MessageSettingsModule.originalText
		v9 = WasRewritten and (OriginalText ~= nil and OriginalText ~= "")
		UseResult = ReactModule.useCallback(function()
			-- upvalues: FFlagExpChatRewriteToggleAnalyticsModule (upval), ExpChatSharedModule (upval), Frame (copy), IsRewriteMenuOpen (ref), v9 (ref), UseStateResult2 (ref)
			if FFlagExpChatRewriteToggleAnalyticsModule then
				ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.RewriteDropdownToggledConfig, {
					messageId = Frame.message.messageId,
					isDropdownOpen = tostring(IsRewriteMenuOpen),
					showOriginalText = tostring(v9)
				}, ExpChatSharedModule.Analytics.DefaultStandardizedFields)
			end
			UseStateResult2(function(p1): boolean
				return not p1
			end)
		end, { IsRewriteMenuOpen, v9, Frame.message.messageId })
		
		if FFlagExpChatRewriteInlineIxpEnabledModule then
			ReactModule.useEffect(function()
				-- upvalues: WasRewritten (ref), IXPService (upval), FStringExpChatRewriteInlineIxpLayerModule (upval)
				if WasRewritten then
					IXPService:LogFlagLinkedUserLayerExposure(FStringExpChatRewriteInlineIxpLayerModule)
				end
			end, { WasRewritten })
		end
	end
	local JoinResult = Frame
	
	if FFlagExpChatRewriteInlineModule and WasRewritten then
		JoinResult = Dictionary.join(JoinResult, {
			LayoutOrder = 1,
			isRewriteMenuOpen = IsRewriteMenuOpen,
			wasRewritten = WasRewritten,
			onTextBodyActivated = UseResult
		})
	elseif FFlagEnableInExpChatRewriteModule and WasRewritten then
		JoinResult = Dictionary.join(JoinResult, { LayoutOrder = 1 })
	end
	local Element = if ShowTranslationButton then ReactModule.createElement(TranslatedTextMessageWithToggle, JoinResult) else ReactModule.createElement(v73, JoinResult)
	local Element1 = nil
	
	if FFlagEnableInExpChatRewriteModule and WasRewritten then
		local CreateElementFunction1 = ReactModule.createElement
		local View = FoundationModule.View
		local config = {
			tag = `size-full-0 auto-y align-y-top col{if FFlagExpChatRewriteInlineModule then " gap-xsmall" else ""}`,
			LayoutOrder = Frame.LayoutOrder
		}
		local config1 = {
			UIPadding = if IsRewriteMenuOpen then ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 4) }) else nil,
			TranslatedTextMessage = Element,
			RewriteLabelWithButton = if WasRewritten and not FFlagExpChatRewriteInlineModule then ReactModule.createElement(RewriteLabelWithButton, {
				LayoutOrder = 2,
				onActivated = UseResult,
				isRewriteMenuOpen = IsRewriteMenuOpen,
				transparencyValue = Frame.transparencyValue,
				textTransparency = Frame.textTransparency
			}) else nil
		}
		local DropdownMenu = nil
		
		if IsRewriteMenuOpen then
			local CreateElementFunction = ReactModule.createElement
			local View1 = FoundationModule.View
			local v10 = 0.7
			local config2 = {
				tag = "align-x-left col radius-medium gap-xxsmall padding-small",
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -FIntExpChatDefaultARButtonPaddingModule, 0, 0),
				backgroundStyle = {
					Color3 = UseTokensResult.Color.Common.Scrim.Color3,
					Transparency = Frame.transparencyValue:map(function(p1): number
						-- upvalues: v10 (copy)
						return if v10 == nil then 1 else v10 + p1 * (1 - v10)
					end)
				}
			}
			local t = {}
			local Element2 = nil
			
			if v9 then
				local Transparency = UseTokensResult.Color.Content.Muted.Transparency
				local v11 = 0.5
				Element2 = ReactModule.createElement(FoundationModule.Text, {
					tag = "text-body-small text-align-x-left",
					LayoutOrder = 1,
					RichText = true,
					TextWrapped = true,
					Text = OriginalText,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, -Largest, 0, 0),
					textStyle = {
						Color3 = UseTokensResult.Color.Content.Muted.Color3,
						Transparency = Frame.textTransparency:map(function(p1): number
							-- upvalues: Transparency (copy)
							return if Transparency == nil then 1 else Transparency + p1 * (1 - Transparency)
						end)
					},
					stroke = {
						Color = Color3.fromRGB(0, 0, 0),
						Transparency = Frame.textTransparency:map(function(p1): number
							-- upvalues: v11 (copy)
							return if v11 == nil then 1 else v11 + p1 * (1 - v11)
						end),
						Thickness = UseTokensResult.Stroke.Thin
					}
				})
			else
				Element2 = nil
			end
			t.OriginalText = Element2
			t.Divider = if v9 then ReactModule.createElement(FoundationModule.Divider, {
				LayoutOrder = 2,
				orientation = FoundationModule.Enums.Orientation.Horizontal,
				Visible = Frame.textTransparency:map(function(p1: number): boolean
					return p1 < 1
				end),
				DividerVariant = FoundationModule.Enums.DividerVariant.Default
			}) else nil
			local Transparency1 = UseTokensResult.Color.Content.Default.Transparency
			local v12 = 0.5
			t.ReasoningText = ReactModule.createElement(FoundationModule.Text, {
				tag = "text-body-small text-align-x-left",
				LayoutOrder = 3,
				RichText = true,
				TextWrapped = true,
				Text = RewrittenReasonLabelText,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -Largest, 0, 0),
				textStyle = {
					Color3 = UseTokensResult.Color.Content.Default.Color3,
					Transparency = Frame.textTransparency:map(function(p1): number
						-- upvalues: Transparency1 (copy)
						return if Transparency1 == nil then 1 else Transparency1 + p1 * (1 - Transparency1)
					end)
				},
				stroke = {
					Color = Color3.fromRGB(0, 0, 0),
					Transparency = Frame.textTransparency:map(function(p1): number
						-- upvalues: v12 (copy)
						return if v12 == nil then 1 else v12 + p1 * (1 - v12)
					end),
					Thickness = UseTokensResult.Stroke.Thin
				}
			})
			DropdownMenu = CreateElementFunction(View1, config2, t)
		else
			DropdownMenu = nil
		end
		config1.DropdownMenu = DropdownMenu
		Element1 = CreateElementFunction1(View, config, config1)
	else
		Element1 = Element
	end
	return Element1
end, function(p1, p2): boolean
	-- upvalues: FFlagExpChatFixLocalUserVerifiedBadgeModule (copy), FFlagEnableInExpChatRewriteModule (copy), FFlagExpChatRewriteInlineModule (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagExpChatPresetChatEnabled (copy)
	local Flag = false
	
	if p1.message.text == p2.message.text then
		Flag = false
		
		if p1.message.prefixText == p2.message.prefixText then
			Flag = false
			
			if p1.message.translation == p2.message.translation then
				Flag = false
				
				if p1.message.useTranslation == p2.message.useTranslation then
					Flag = false
					
					if p1.message.messageId == p2.message.messageId then
						Flag = not FFlagExpChatFixLocalUserVerifiedBadgeModule or p1.message.userId == p2.message.userId and p1.isUserVerified == p2.isUserVerified
						
						if Flag then
							Flag = false
							
							if p1.chatWindowSettings == p2.chatWindowSettings then
								Flag = not FFlagEnableInExpChatRewriteModule or p1.message.wasRewritten == p2.message.wasRewritten and p1.message.originalText == p2.message.originalText
								
								if Flag then
									Flag = not FFlagExpChatRewriteInlineModule or p1.chatWindowTransparencyBindable == p2.chatWindowTransparencyBindable
									
									if Flag then
										Flag = not FFlagEnableInExpChatSummaryOnLuaModule or p1.message.chatActionType == p2.message.chatActionType
										
										if Flag then
											if FFlagExpChatPresetChatEnabled then
												return p1.message.presetId == p2.message.presetId
											end
											Flag = true
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return Flag
end)