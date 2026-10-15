local IXPService = game:GetService("IXPService")
local textChatService = game:GetService("TextChatService")
local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local parent_1 = expChat.Parent
local userProfileStore = require(parent.UserProfiles).Stores.UserProfileStore
local signalsReactModule = require(parent.SignalsReact)
local reactModule = require(parent_1.React)
local roactRoduxModule = require(parent.RoactRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local foundationModule = require(parent.Foundation)
local dictionary = require(parent.llama).Dictionary
local localizationModule = require(expChat.Localization)
local isChatRegionLockedModule = require(expChat.isChatRegionLocked)
local showChatEnabledUIModule = require(expChat.showChatEnabledUI)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local UIBloxModule = require(parent.UIBlox)
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local shouldSendHighFrequencyTelemetryModule = require(expChat.shouldSendHighFrequencyTelemetry)
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local applyChatWindowMessageEffectsModule = require(expChat.MessageEffects.applyChatWindowMessageEffects)
local getMessageEffectsModule = require(expChat.MessageEffects.getMessageEffects)
local getChatWindowMessageEffectsModule = require(expChat.MessageEffects.getChatWindowMessageEffects)
local getChatWindowPrefixOffsetModule = require(expChat.MessageEffects.getChatWindowPrefixOffset)
local getChatWindowMessageLineHeightModule = require(expChat.MessageEffects.getChatWindowMessageLineHeight)
local messageEffectModule = require(expChat.MessageEffects.MessageEffect)
local textChatMessageChatActionTypeModule = require(expChat.TextChatMessageChatActionType)
local isChatWindowEnlargeEnabledModule = require(expChat.isChatWindowEnlargeEnabled)
local fFlagExpChatMessageEffectChatWindowEnlargePaddingModule = require(expChat.Flags.FFlagExpChatMessageEffectChatWindowEnlargePadding)
local fFlagExpChatMessageEffectChatWindowEnlargeLineHeightModule = require(expChat.Flags.FFlagExpChatMessageEffectChatWindowEnlargeLineHeight)
local fIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule = require(expChat.Flags.FIntExpChatMessageEffectChatWindowEnlargePaddingPixels)
local engineFeatureTextChatReportEmojiTelemetryEnabledModule = require(expChat.Flags.EngineFeatureTextChatReportEmojiTelemetryEnabled)
local fFlagDebugMessageProfilingModule = require(expChat.Flags.FFlagDebugMessageProfiling)
local expChatTranslationToggleSpacingFix = game:DefineFastFlag("ExpChatTranslationToggleSpacingFix", false)
local getFFlagExpChatUseUpdatedMessageRenderedModule = require(expChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local var1 = require(expChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local getFFlagExpChatExcludeFOMORendersModule = require(expChat.Flags.getFFlagExpChatExcludeFOMORenders)
local fFlagEnableInExpChatRewriteModule = require(expChat.Flags.FFlagEnableInExpChatRewrite)
local fStringInExpChatRewriteLabelKeyModule = require(expChat.Flags.FStringInExpChatRewriteLabelKey)
local fStringInExpChatRewriteReasonKeyModule = require(expChat.Flags.FStringInExpChatRewriteReasonKey)
local fFlagExpChatRewriteInlineModule = require(expChat.Flags.FFlagExpChatRewriteInline)
local fFlagExpChatRewriteInlineIxpEnabledModule = require(expChat.Flags.FFlagExpChatRewriteInlineIxpEnabled)
local fFlagExpChatRewriteToggleAnalyticsModule = require(expChat.Flags.FFlagExpChatRewriteToggleAnalytics)
local fStringExpChatRewriteInlineIxpLayerModule = require(expChat.Flags.FStringExpChatRewriteInlineIxpLayer)
local fIntExpChatWindowTransparencyRewriteInteractableThresholdModule = require(expChat.Flags.FIntExpChatWindowTransparencyRewriteInteractableThreshold)
local fFlagEnableInExpChatSummaryOnLuaModule = require(expChat.Flags.FFlagEnableInExpChatSummaryOnLua)
local fFlagExpChatPolishSummaryMessageUIModule = require(expChat.Flags.FFlagExpChatPolishSummaryMessageUI)
local engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(expChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local summaryMessageRichTextModule = require(expChat.summaryMessageRichText)
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local configModule = require(expChat.Config)
local helpers = expChat.ChatWindow.Helpers
local getMessageSettingsModule = require(helpers.getMessageSettings)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)
local duplicateInvisibleTextModule = require(helpers.duplicateInvisibleText)
local flags = expChat.Flags
local isExperienceChatUserProfileApiEnabledModule = require(flags.isExperienceChatUserProfileApiEnabled)
local fIntExpChatVisibleARButtonPaddingModule = require(flags.FIntExpChatVisibleARButtonPadding)
local fIntExpChatDefaultARButtonPaddingModule = require(flags.FIntExpChatDefaultARButtonPadding)
local fFlagExpChatTopBannerForPresetChatAccessModule = require(flags.FFlagExpChatTopBannerForPresetChatAccess)
local fFlagExpChatFixLocalUserVerifiedBadgeModule = require(flags.FFlagExpChatFixLocalUserVerifiedBadge)
local expChatSharedModule = require(parent_1.ExpChatShared)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getPresetIconRichText = expChatSharedModule.getPresetIconRichText
local useIsARButtonVisibleModule = require(expChat.useIsARButtonVisible)
local isPresetMessage = expChatSharedModule.isPresetMessage

function appendVerifiedBadge(p1)
	-- upvalues: configModule (ref)
	return string.gsub(p1, ":(%S-)$", configModule.VERIFIED_EMOJI .. ":%1")
end

local var2 = function(p1)
	-- upvalues: userProfileStore (ref), signalsReactModule (ref)
	local var3 = userProfileStore.get().fetchNamesByUserIds({ tostring(p1.userId) })(false).data[1]
	
	return {
		displayName = signalsReactModule.useSignalBinding(var3.names.getDisplayName),
		inExperienceCombinedName = signalsReactModule.useSignalBinding(var3.names.getInExperienceCombinedName)
	}
end

function trim(p1)
	return if p1:match("^()%s*$") then "" else p1:match("^%s*(.*%S)")
end

function getMessageText(p1, p2, p3)
	return if p2 == nil or p2 == "" then p3 or "" elseif p1 then p2 or "" else p3 or ""
end

local function _(p1, p2)
	return p1 + p2 * (1 - p1)
end

local _ = function(value, p1)
	return p1:map(function(p2)
		-- upvalues: value (ref)
		return if value == nil then 1 else value + p2 * (1 - value)
	end)
end

local _ = function()
	-- upvalues: fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), useIsARButtonVisibleModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), showChatEnabledUIModule (ref), isChatRegionLockedModule (ref)
	if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
		return if useIsARButtonVisibleModule() then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
	end
	local _ = 0
	
	return if not isChatRegionLockedModule() and showChatEnabledUIModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
end

local function appendTrustedIndicator(p1, p2, p3, p4, p5)
	local var3 = p5.Color.Shift.Shift_300.Color3:ToHex()
	local transparency = p5.Color.Shift.Shift_300.Transparency
	local transparency_1 = p5.Color.Content.Emphasis.Transparency
	local var4 = `{`{`{`{`<mark color='#{var66}' transparency='{transparency + p12 * (1 - transparency)}'>`}<font transparency='1' weight='{600}' size='{p13 - 4}'><stroke transparency='1'>_`}<font color='#{p14.Color.Content.Emphasis.Color3:ToHex()}' transparency='{transparency_1 + p12 * (1 - transparency_1)}'>{p2}</font>`}_</stroke></font>`}</mark>`
	
	return if string.find(p1, ":([%S:]-)$") then string.gsub(p1, ":([%S:]-)$", ` {var4} :%1`) else `{p1} {var4}`
end

local var3 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

local _ = function(p1, p2, p3, p4)
	-- upvalues: textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref)
	p2 = p2 or ""
	
	if p3.chatActionType == textChatMessageChatActionTypeModule.Summary then
		p2 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(p4) .. " " .. p16, p1.Color.Content.Muted.Color3:ToHex(), p4)
	end
	return p2
end

local var4 = function(p1)
	-- upvalues: fFlagDebugMessageProfilingModule (ref), reactModule (ref), expChatPerfTracker (ref), localizationModule (ref), fFlagExpChatGlobalTabDefaultModule (ref), fFlagExpChatRewriteInlineModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), foundationModule (ref), getMessageSettingsModule (ref), isChatWindowEnlargeEnabledModule (ref), getMessageEffectsModule (ref), applyChatWindowMessageEffectsModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), isExperienceChatUserProfileApiEnabledModule (ref), var2 (ref), getFFlagExpChatExcludeFOMORendersModule (ref), signalsModule (ref), playersService (ref), var3 (ref), signalsReactModule (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), fFlagExpChatUseChannelTabsStore (ref), useStore (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), var1 (ref), getChannelTabsStoreModule (ref), engineFeatureTextChatReportEmojiTelemetryEnabledModule (ref), getChatWindowMessageEffectsModule (ref), textChatService (ref), getChatWindowPrefixOffsetModule (ref), fFlagExpChatMessageEffectChatWindowEnlargeLineHeightModule (ref), getChatWindowMessageLineHeightModule (ref), appendTrustedIndicator (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPolishSummaryMessageUIModule (ref), textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconRichText (ref), expChatTranslationToggleSpacingFix (ref), duplicateInvisibleTextModule (ref), useCursor (ref), fFlagExpChatMessageEffectChatWindowEnlargePaddingModule (ref), messageEffectModule (ref), fIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), useIsARButtonVisibleModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), getChatStatusStoreModule (ref), showChatEnabledUIModule (ref), isChatRegionLockedModule (ref), fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (ref)
	if fFlagDebugMessageProfilingModule then
		debug.profilebegin("TranslatedTextMessage")
	end
	local messageId = p1.message.messageId or "UNKNOWN_MESSAGE_ID"
	reactModule.useEffect(function()
		-- upvalues: expChatPerfTracker (copy), messageId (ref)
		expChatPerfTracker.finish(expChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = messageId })
		expChatPerfTracker.finish(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = messageId })
	end, { messageId })
	local isSpatialUIEnabled = p1.isSpatialUIEnabled
	local var5 = if isSpatialUIEnabled then p1.chatWindowSettings.SpatialPanelTextSize else p1.chatWindowSettings.TextSize
	local var6 = localizationModule.useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		hereLabel = if fFlagExpChatGlobalTabDefaultModule then "CoreScripts.TextChat.ChannelTabs.Here" else nil,
		rewrittenLabelText = if fFlagExpChatRewriteInlineModule then fStringInExpChatRewriteLabelKeyModule else nil,
		defaultRewrittenLabelText = if fFlagExpChatRewriteInlineModule then "CoreScripts.TextChat.ChatWindow.RewrittenLabel" else nil
	})
	local var7 = nil
	
	if fFlagExpChatRewriteInlineModule then
		var7 = if var6.rewrittenLabelText and var6.rewrittenLabelText ~= "" then var6.rewrittenLabelText else var6.defaultRewrittenLabelText
	end
	local var8 = foundationModule.Hooks.useTokens()
	local var9 = getMessageSettingsModule(p1.message, p1.chatWindowSettings, if fFlagExpChatGlobalTabDefaultModule then var6.hereLabel else nil)
	local showTranslationButton = p1.showTranslationButton
	local var10 = getMessageText(var9.useTranslation, var9.translation, var9.text)
	local var11 = nil
	
	if isChatWindowEnlargeEnabledModule() then
		var11 = getMessageEffectsModule(var10)
		var10 = applyChatWindowMessageEffectsModule(var10, var11)
	end
	local prefixText = var9.prefixText or ""
	local var12 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() and p1.message.textChannel == nil then
		var12 = nil
	elseif isExperienceChatUserProfileApiEnabledModule() and p1.message.userId then
		if fFlagDebugMessageProfilingModule then
			debug.profilebegin("useCombinedName")
		end
		var12 = var2(p1.message)
		
		if fFlagDebugMessageProfilingModule then
			debug.profileend()
		end
	end
	local _ = nil
	local userId = p1.message.userId and tostring(p1.message.userId)
	local var13 = if getFFlagExpChatExcludeFOMORendersModule() then p1.message.isHiddenMessage else nil
	local var14 = signalsReactModule.useSignalBinding(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), userId (ref), playersService (copy), var13 (ref), var3 (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: userId (copy), playersService (copy), var13 (copy), var3 (copy)
			local userId_1 = playersService.LocalPlayer and (playersService.LocalPlayer.UserId and tostring(playersService.LocalPlayer.UserId))
			
			return if userId and userId ~= "" and (not (userId_1 and userId_1 == userId) and not var13) then var3.getIsTrustedConnection(userId).data(p2) else nil
		end)
	end, { userId, var13 }))
	local var15 = if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule and not fFlagExpChatUseChannelTabsStore then useStore() else nil
	
	if getFFlagExpChatUseUpdatedMessageRenderedModule() then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), shouldSendHighFrequencyTelemetryModule (copy), var1 (copy), getFFlagExpChatExcludeFOMORendersModule (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), var15 (ref), engineFeatureTextChatReportEmojiTelemetryEnabledModule (copy), isChatWindowEnlargeEnabledModule (copy), getChatWindowMessageEffectsModule (copy), var11 (write), textChatService (copy)
			if p1.message.textChatMessageInstance and shouldSendHighFrequencyTelemetryModule(var1) and (not getFFlagExpChatExcludeFOMORendersModule() or not p1.message.isHiddenMessage) and not p1.message.isHistorical then
				if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
					local var16 = -1
					
					if fFlagExpChatUseChannelTabsStore then
						local var17 = getChannelTabsStoreModule(false)
						local channelTabsState = var17.getChannelTabsState(false)
						local selectedTabName = var17.getSelectedTabName(false)
						
						if selectedTabName and channelTabsState.allChannelTabs[selectedTabName] then
							var16 = channelTabsState.allChannelTabs[selectedTabName].tabIndex
						end
					else
						local channelTabs = var15:getState().ChannelTabs
						local selectedTabName = channelTabs and channelTabs.selectedTabName
						
						if selectedTabName and channelTabs.allChannelTabs[selectedTabName] then
							var16 = channelTabs.allChannelTabs[selectedTabName].TabIndex
						end
					end
					if engineFeatureTextChatReportEmojiTelemetryEnabledModule then
						textChatService:SendExpChatMessageClientRendered(p1.message.textChatMessageInstance, "chat_window", var16, "", if isChatWindowEnlargeEnabledModule() then getChatWindowMessageEffectsModule(var11) else {})
						
						return
					end
					textChatService:SendExpChatMessageClientRendered(p1.message.textChatMessageInstance, "chat_window", var16)
					
					return
				else
					textChatService:SendExpChatMessageClientRendered(p1.message.textChatMessageInstance, "chat_window")
				end
			end
		end, {})
	end
	local bodyTextProperties = var9.bodyTextProperties
	local prefixTextProperties = var9.prefixTextProperties
	local var16 = if isSpatialUIEnabled then var5 else bodyTextProperties.TextSize
	local var17 = var16 - 2
	local var18 = if isChatWindowEnlargeEnabledModule() then UDim2.fromOffset(0, getChatWindowPrefixOffsetModule(var11, prefixTextProperties.TextSize)) else nil
	local var19 = if fFlagExpChatMessageEffectChatWindowEnlargeLineHeightModule and isChatWindowEnlargeEnabledModule() then getChatWindowMessageLineHeightModule(var11, var16, prefixTextProperties.TextSize) else nil
	local var20 = reactModule.joinBindings({
		reactModule.joinBindings(if var12 ~= nil then {} else { var12.displayName, var12.inExperienceCombinedName }):map(function(p2)
			-- upvalues: prefixText (ref), p1 (ref)
			local var21 = p2[1] or ""
			local var22 = p2[2] or ""
			local var23 = prefixText
			
			if string.len(var21) > 0 and string.len(var22) > 0 and var21 ~= var22 then
				var23 = string.gsub(var23, var21, var22)
			end
			if string.len(prefixText) > 0 and p1.isUserVerified then
				var23 = appendVerifiedBadge(var23)
			end
			return var23
		end),
		var14,
		p1.textTransparency
	}):map(function(p2)
		-- upvalues: prefixText (ref), appendTrustedIndicator (copy), var6 (ref), prefixTextProperties (ref), var8 (ref)
		local var21 = p2[1] or ""
		local var22 = p2[2] or false
		local var23 = p2[3]
		
		if var23 == nil then
			var23 = 1
		end
		if string.len(prefixText) == 0 then
			return var21
		elseif var22 then
			var21 = appendTrustedIndicator(var21, var6.trustedLabelText, var23, prefixTextProperties.TextSize, var8)
		end
		return var21
	end)
	var20 = var20:map(function(p2)
		-- upvalues: prefixText (ref)
		return if string.len(prefixText) == 0 then p2 else trim(p2)
	end)
	local var21 = var20:map(function(p2)
		-- upvalues: var10 (write), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPolishSummaryMessageUIModule (copy), var16 (ref), var8 (ref), p1 (ref), textChatMessageChatActionTypeModule (copy), summaryMessageRichTextModule (copy), fFlagExpChatPresetChatEnabled (copy), isPresetMessage (copy), getPresetIconRichText (copy), prefixText (ref), showTranslationButton (ref), expChatTranslationToggleSpacingFix (copy), duplicateInvisibleTextModule (copy), prefixTextProperties (ref)
		local var22 = var10
		
		if fFlagEnableInExpChatSummaryOnLuaModule then
			local var23 = if fFlagExpChatPolishSummaryMessageUIModule then var16 else nil
			local var24 = var8
			local var25 = var10 or ""
			
			if p1.message.chatActionType == textChatMessageChatActionTypeModule.Summary then
				var25 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(var23) .. " " .. var75_1, var24.Color.Content.Muted.Color3:ToHex(), var23)
			end
			var22 = var25
		end
		if fFlagExpChatPresetChatEnabled and isPresetMessage(p1.message) then
			var22 ..= ` {getPresetIconRichText(var16)}`
		end
		if string.len(prefixText) == 0 then
			return if fFlagEnableInExpChatSummaryOnLuaModule then var22 else var10
		elseif showTranslationButton then
			var22 = if expChatTranslationToggleSpacingFix then "     " .. var125 else "   " .. var125
		end
		return duplicateInvisibleTextModule(p2, prefixTextProperties.FontFace, prefixTextProperties.TextSize) .. " " .. var125
	end)
	
	if fFlagExpChatRewriteInlineModule then
		var21 = reactModule.joinBindings({ var21 }):map(function(p2)
			-- upvalues: p1 (ref), foundationModule (copy), prefixTextProperties (ref), var8 (ref), var7 (write)
			local var22 = p2[1] or ""
			
			return if p1.wasRewritten then `{var22} <font size='{prefixTextProperties.TextSize - 4}' color='#{var73.Color.Content.Muted.Color3:ToHex()}'>{`({var7})`}<font transparency='1'><stroke transparency='1'>_</stroke></font>{`<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{if p1.isRewriteMenuOpen then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown}</font>`}</font>` else var22
		end)
	end
	local var22 = useCursor()
	local uDim = nil
	
	if fFlagExpChatMessageEffectChatWindowEnlargePaddingModule and isChatWindowEnlargeEnabledModule() then
		uDim = UDim.new(0, if var11 and table.find(var11, messageEffectModule.ChatWindowEnlarge) then fIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule else 0)
	end
	local UIPadding
	local _ = nil
	
	if fFlagEnableInExpChatRewriteModule then
		local var23
		if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
			var23 = if useIsARButtonVisibleModule() then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
		else
			local _ = 0
			var23 = if not isChatRegionLockedModule() and showChatEnabledUIModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
		end
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, var23),
			PaddingTop = uDim,
			PaddingBottom = uDim
		})
	else
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, if not isChatRegionLockedModule() and showChatEnabledUIModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule),
			PaddingTop = uDim,
			PaddingBottom = uDim
		})
	end
	local var24 = nil
	
	if fFlagExpChatRewriteInlineModule and p1.wasRewritten then
		if p1.chatWindowTransparencyBindable == nil then
			var24 = true
		elseif typeof(p1.chatWindowTransparencyBindable) == "number" then
			var24 = p1.chatWindowTransparencyBindable < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
			var24 = nil
		else
			var24 = p1.chatWindowTransparencyBindable:map(function(p2)
				-- upvalues: fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (copy)
				return p2 < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
			end)
		end
	end
	local createElement = reactModule.createElement
	local var25 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.LayoutOrder
	}
	local t_1 = { UIPadding = UIPadding }
	local createElement_1 = reactModule.createElement
	local var26 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_3 = {}
	local var27 = false
	
	if string.len(prefixText) > 0 then
		var27 = reactModule.createElement
		local var28 = "TextLabel"
		local t_4 = {
			BackgroundTransparency = 1,
			RichText = true,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.XY,
			FontFace = prefixTextProperties.FontFace,
			LineHeight = var19,
			Position = var18,
			Text = var20,
			TextColor3 = prefixTextProperties.TextColor3,
			TextSize = prefixTextProperties.TextSize,
			TextStrokeColor3 = prefixTextProperties.TextStrokeColor3
		}
		local textStrokeTransparency = prefixTextProperties.TextStrokeTransparency
		t_4.TextStrokeTransparency = p1.textTransparency:map(function(p2)
			-- upvalues: textStrokeTransparency (ref)
			return if textStrokeTransparency == nil then 1 else textStrokeTransparency + p2 * (1 - textStrokeTransparency)
		end)
		local var29 = 0
		t_4.TextTransparency = p1.textTransparency:map(function(p2)
			-- upvalues: var29 (ref)
			return if var29 == nil then 1 else var29 + p2 * (1 - var29)
		end)
		t_4.TextXAlignment = Enum.TextXAlignment.Left
		t_4.TextYAlignment = Enum.TextYAlignment.Top
		var27 = var27(var28, t_4, {
			UIGradient = prefixTextProperties.UIGradient ~= nil and reactModule.createElement("UIGradient", prefixTextProperties.UIGradient)
		})
	end
	local createElement_3
	t_3.PrefixText = var27
	local createElement_2 = reactModule.createElement
	local var30 = if fFlagExpChatRewriteInlineModule and p1.wasRewritten then "TextButton" else "TextLabel"
	local t_4 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		FontFace = bodyTextProperties.FontFace,
		LineHeight = var19,
		RichText = true,
		Size = UDim2.new(1, 0, 0, 0),
		Text = var21,
		TextColor3 = bodyTextProperties.TextColor3,
		TextSize = var16,
		TextStrokeColor3 = bodyTextProperties.TextStrokeColor3
	}
	local textStrokeTransparency = bodyTextProperties.TextStrokeTransparency
	t_4.TextStrokeTransparency = p1.textTransparency:map(function(p2)
		-- upvalues: textStrokeTransparency (ref)
		return if textStrokeTransparency == nil then 1 else textStrokeTransparency + p2 * (1 - textStrokeTransparency)
	end)
	local var31 = 0
	t_4.TextTransparency = p1.textTransparency:map(function(p2)
		-- upvalues: var31 (ref)
		return if var31 == nil then 1 else var31 + p2 * (1 - var31)
	end)
	t_4.TextWrapped = true
	t_4.TextXAlignment = Enum.TextXAlignment.Left
	t_4.TextYAlignment = Enum.TextYAlignment.Top
	t_4[reactModule.Event.Activated] = if fFlagExpChatRewriteInlineModule and p1.wasRewritten then p1.onTextBodyActivated else nil
	t_4.Interactable = var24
	t_3.BodyText = createElement_2(var30, t_4)
	
	if string.len(prefixText) == 0 then
		createElement_3 = nil
	else
		local createElement_4
		createElement_3 = reactModule.createElement
		local var32 = "Frame"
		local t_5 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = var18,
			Size = UDim2.new(1, 0, 0, 0)
		}
		local t_6 = {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			TextButton = reactModule.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				FontFace = prefixTextProperties.FontFace,
				LineHeight = var19,
				RichText = true,
				SelectionImageObject = var22,
				Size = UDim2.new(0, 0, 0, 0),
				Text = var20,
				TextSize = prefixTextProperties.TextSize,
				TextStrokeTransparency = 1,
				TextTransparency = 1,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 1,
				[reactModule.Event.Activated] = function()
					-- upvalues: p1 (ref)
					p1.onTextMessageLabelButtonActivated(p1.message)
				end
			})
		}
		
		if showTranslationButton then
			createElement_4 = reactModule.createElement
			local var33 = "ImageButton"
			local t_7 = {
				BackgroundTransparency = 1,
				HoverImage = "rbxasset://textures/translateIconDark.png",
				Image = "rbxasset://textures/translateIcon.png"
			}
			local var34 = 0
			t_7.ImageTransparency = p1.textTransparency:map(function(p2)
				-- upvalues: var34 (ref)
				return if var34 == nil then 1 else var34 + p2 * (1 - var34)
			end)
			t_7.LayoutOrder = 2
			t_7.PressedImage = "rbxasset://textures/translateIconDark.png"
			t_7.SelectionImageObject = var22
			t_7.Size = UDim2.new(0, var17, 0, var17)
			
			t_7[reactModule.Event.Activated] = function()
				-- upvalues: p1 (ref)
				p1.onToggle(not p1.message.useTranslation, p1.message.messageId)
			end
			
			createElement_4 = createElement_4(var33, t_7)
		else
			createElement_4 = nil
		end
		t_6.TranslationButton = createElement_4
		createElement_3 = createElement_3(var32, t_5, t_6)
	end
	t_3.TextMessageButton = createElement_3
	t_1.TextMessage = createElement_1(var26, t_2, t_3)
	createElement = createElement(var25, t, t_1)
	
	if fFlagDebugMessageProfilingModule then
		debug.profileend()
	end
	return createElement
end

local function TranslatedTextMessageWithToggle(_)
	-- upvalues: roactRoduxModule (ref), getMessagesStoreModule (ref), var4 (ref)
	return roactRoduxModule.connect(function() end, function(_)
		-- upvalues: getMessagesStoreModule (copy)
		return {
			onToggle = function(p2, p3)
				-- upvalues: getMessagesStoreModule (copy)
				getMessagesStoreModule(false).toggleMessageTranslation(p2, p3)
			end
		}
	end)(var4)
end

local function RewriteLabelWithButton(p2)
	-- upvalues: foundationModule (ref), localizationModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), reactModule (ref)
	local var35 = foundationModule.Hooks.useTokens()
	local var36 = localizationModule.useLocalization({
		defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel",
		rewrittenLabelText = fStringInExpChatRewriteLabelKeyModule
	})
	local var37 = if var36.rewrittenLabelText and var36.rewrittenLabelText ~= "" then var36.rewrittenLabelText else var36.defaultRewrittenLabelText
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "size-full-0 auto-y row align-y-center gap-xsmall",
		LayoutOrder = p2.LayoutOrder
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local text = foundationModule.Text
	local t_2 = {
		tag = "size-0-0 auto-xy text-caption-small text-align-x-left",
		LayoutOrder = 1,
		RichText = true,
		Text = "(" .. var132 .. ")"
	}
	local t_3 = { Color3 = var35.Color.Content.Muted.Color3 }
	local transparency = var35.Color.Content.Muted.Transparency
	t_3.Transparency = p2.textTransparency:map(function(p3)
		-- upvalues: transparency (ref)
		return if transparency == nil then 1 else transparency + p3 * (1 - transparency)
	end)
	t_2.textStyle = t_3
	local t_4 = { Color = Color3.fromRGB(0, 0, 0) }
	local var38 = 0.5
	t_4.Transparency = p2.textTransparency:map(function(p3)
		-- upvalues: var38 (ref)
		return if var38 == nil then 1 else var38 + p3 * (1 - var38)
	end)
	t_4.Thickness = var35.Stroke.Thin
	t_2.stroke = t_4
	t_1.Label = createElement_1(text, t_2)
	t_1.IconButton = reactModule.createElement(foundationModule.IconButton, {
		isCircular = true,
		LayoutOrder = 2,
		size = foundationModule.Enums.InputSize.XSmall,
		icon = if p2.isRewriteMenuOpen then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown,
		variant = foundationModule.Enums.ButtonVariant.Utility,
		Visible = p2.textTransparency:map(function(p3)
			return p3 < 1
		end),
		onActivated = p2.onActivated
	})
	
	return createElement(view, t, t_1)
end

return reactModule.memo(function(p2)
	-- upvalues: getMessageSettingsModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), useIsARButtonVisibleModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), showChatEnabledUIModule (ref), isChatRegionLockedModule (ref), localizationModule (ref), fStringInExpChatRewriteReasonKeyModule (ref), foundationModule (ref), reactModule (ref), fFlagExpChatRewriteToggleAnalyticsModule (ref), expChatSharedModule (ref), fFlagExpChatRewriteInlineIxpEnabledModule (ref), IXPService (ref), fStringExpChatRewriteInlineIxpLayerModule (ref), fFlagExpChatRewriteInlineModule (ref), dictionary (ref), TranslatedTextMessageWithToggle (ref), var4 (ref), RewriteLabelWithButton (ref)
	local var35 = getMessageSettingsModule(p2.message, p2.chatWindowSettings)
	local showTranslationButton = p2.showTranslationButton
	local var36 = nil
	local _ = nil
	local var37 = nil
	local _ = nil
	local var38 = nil
	local originalText = nil
	local var39 = false
	local wasRewritten = false
	local var40 = 0
	local var41 = ""
	
	if fFlagEnableInExpChatRewriteModule then
		local var42
		if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
			var42 = if useIsARButtonVisibleModule() then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
		else
			local _ = 0
			var42 = if not isChatRegionLockedModule() and showChatEnabledUIModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
		end
		var40 = math.max(var42 - fIntExpChatDefaultARButtonPaddingModule, 0)
		local var43 = localizationModule.useLocalization({
			defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel",
			rewrittenReasonLabelText = fStringInExpChatRewriteReasonKeyModule
		})
		var41 = if var43.rewrittenReasonLabelText and var43.rewrittenReasonLabelText ~= "" then var43.rewrittenReasonLabelText else var43.defaultRewrittenReasonLabelText
		var36 = foundationModule.Hooks.useTokens()
		local var44, var45 = reactModule.useState(false)
		var37 = var44
		local var46 = var45
		wasRewritten = var35.wasRewritten
		originalText = var35.originalText
		var39 = wasRewritten and (originalText ~= nil and originalText ~= "")
		var38 = reactModule.useCallback(function()
			-- upvalues: fFlagExpChatRewriteToggleAnalyticsModule (copy), expChatSharedModule (copy), p2 (ref), var37 (write), var39 (write), var46 (write)
			if fFlagExpChatRewriteToggleAnalyticsModule then
				expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.RewriteDropdownToggledConfig, {
					messageId = p2.message.messageId,
					isDropdownOpen = tostring(var37),
					showOriginalText = tostring(var39)
				}, expChatSharedModule.Analytics.DefaultStandardizedFields)
			end
			var46(function(p3)
				return not p3
			end)
		end, { var37, var39, p2.message.messageId })
		
		if fFlagExpChatRewriteInlineIxpEnabledModule then
			reactModule.useEffect(function()
				-- upvalues: wasRewritten (write), IXPService (copy), fStringExpChatRewriteInlineIxpLayerModule (copy)
				if wasRewritten then
					IXPService:LogFlagLinkedUserLayerExposure(fStringExpChatRewriteInlineIxpLayerModule)
				end
			end, { wasRewritten })
		end
	end
	local _ = nil
	local var47 = p2
	
	if fFlagExpChatRewriteInlineModule and wasRewritten then
		var47 = dictionary.join(var47, {
			LayoutOrder = 1,
			isRewriteMenuOpen = var37,
			wasRewritten = wasRewritten,
			onTextBodyActivated = var38
		})
	elseif fFlagEnableInExpChatRewriteModule and wasRewritten then
		var47 = dictionary.join(var47, { LayoutOrder = 1 })
	end
	local var48
	local var49 = if showTranslationButton then reactModule.createElement(TranslatedTextMessageWithToggle, var47) else reactModule.createElement(var4, var47)
	
	if fFlagEnableInExpChatRewriteModule and wasRewritten then
		local var50
		var48 = reactModule.createElement
		local view = foundationModule.View
		local t = {
			tag = `size-full-0 auto-y align-y-top col{if fFlagExpChatRewriteInlineModule then " gap-xsmall" else ""}`,
			LayoutOrder = p2.LayoutOrder
		}
		local t_1 = {
			UIPadding = if var37 then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 4) }) else nil,
			TranslatedTextMessage = var49,
			RewriteLabelWithButton = if wasRewritten and not fFlagExpChatRewriteInlineModule then reactModule.createElement(RewriteLabelWithButton, {
				LayoutOrder = 2,
				onActivated = var38,
				isRewriteMenuOpen = var37,
				transparencyValue = p2.transparencyValue,
				textTransparency = p2.textTransparency
			}) else nil
		}
		
		if var37 then
			local createElement
			var50 = reactModule.createElement
			local view_1 = foundationModule.View
			local t_2 = {
				tag = "align-x-left col radius-medium gap-xxsmall padding-small",
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -fIntExpChatDefaultARButtonPaddingModule, 0, 0)
			}
			local t_3 = { Color3 = var36.Color.Common.Scrim.Color3 }
			local var51 = 0.7
			t_3.Transparency = p2.transparencyValue:map(function(p3)
				-- upvalues: var51 (ref)
				return if var51 == nil then 1 else var51 + p3 * (1 - var51)
			end)
			t_2.backgroundStyle = t_3
			local t_4 = {}
			
			if var39 then
				createElement = reactModule.createElement
				local text = foundationModule.Text
				local t_5 = {
					tag = "text-body-small text-align-x-left",
					LayoutOrder = 1,
					RichText = true,
					TextWrapped = true,
					Text = originalText,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, -var40, 0, 0)
				}
				local t_6 = { Color3 = var36.Color.Content.Muted.Color3 }
				local transparency = var36.Color.Content.Muted.Transparency
				t_6.Transparency = p2.textTransparency:map(function(p3)
					-- upvalues: transparency (ref)
					return if transparency == nil then 1 else transparency + p3 * (1 - transparency)
				end)
				t_5.textStyle = t_6
				local t_7 = { Color = Color3.fromRGB(0, 0, 0) }
				local var52 = 0.5
				t_7.Transparency = p2.textTransparency:map(function(p3)
					-- upvalues: var52 (ref)
					return if var52 == nil then 1 else var52 + p3 * (1 - var52)
				end)
				t_7.Thickness = var36.Stroke.Thin
				t_5.stroke = t_7
				createElement = createElement(text, t_5)
			else
				createElement = nil
			end
			t_4.OriginalText = createElement
			t_4.Divider = if var39 then reactModule.createElement(foundationModule.Divider, {
				LayoutOrder = 2,
				orientation = foundationModule.Enums.Orientation.Horizontal,
				Visible = p2.textTransparency:map(function(p3)
					return p3 < 1
				end),
				DividerVariant = foundationModule.Enums.DividerVariant.Default
			}) else nil
			local createElement_1 = reactModule.createElement
			local text = foundationModule.Text
			local t_5 = {
				tag = "text-body-small text-align-x-left",
				LayoutOrder = 3,
				RichText = true,
				TextWrapped = true,
				Text = var41,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -var40, 0, 0)
			}
			local t_6 = { Color3 = var36.Color.Content.Default.Color3 }
			local transparency = var36.Color.Content.Default.Transparency
			t_6.Transparency = p2.textTransparency:map(function(p3)
				-- upvalues: transparency (ref)
				return if transparency == nil then 1 else transparency + p3 * (1 - transparency)
			end)
			t_5.textStyle = t_6
			local t_7 = { Color = Color3.fromRGB(0, 0, 0) }
			local var53 = 0.5
			t_7.Transparency = p2.textTransparency:map(function(p3)
				-- upvalues: var53 (ref)
				return if var53 == nil then 1 else var53 + p3 * (1 - var53)
			end)
			t_7.Thickness = var36.Stroke.Thin
			t_5.stroke = t_7
			t_4.ReasoningText = createElement_1(text, t_5)
			var50 = var50(view_1, t_2, t_4)
		else
			var50 = nil
		end
		t_1.DropdownMenu = var50
		var48 = var48(view, t, t_1)
	else
		var48 = var49
	end
	return var48
end, function(p3, p4)
	-- upvalues: fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagExpChatRewriteInlineModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPresetChatEnabled (ref)
	local var54 = false
	
	if p3.message.text == p4.message.text then
		var54 = false
		
		if p3.message.prefixText == p4.message.prefixText then
			var54 = false
			
			if p3.message.translation == p4.message.translation then
				var54 = false
				
				if p3.message.useTranslation == p4.message.useTranslation then
					var54 = false
					
					if p3.message.messageId == p4.message.messageId then
						if fFlagExpChatFixLocalUserVerifiedBadgeModule then
							var54 = false
							
							if p3.message.userId == p4.message.userId then
								local _ = p3.isUserVerified == p4.isUserVerified
							end
						else
							var54 = true
						end
						if var54 then
							var54 = false
							
							if p3.chatWindowSettings == p4.chatWindowSettings then
								if fFlagEnableInExpChatRewriteModule then
									var54 = false
									
									if p3.message.wasRewritten == p4.message.wasRewritten then
										var54 = p3.message.originalText == p4.message.originalText
										var54 = nil
									end
								else
									var54 = true
								end
								if var54 then
									if fFlagExpChatRewriteInlineModule then
										var54 = p3.chatWindowTransparencyBindable == p4.chatWindowTransparencyBindable
										var54 = nil
									else
										var54 = true
									end
									if var54 then
										if fFlagEnableInExpChatSummaryOnLuaModule then
											var54 = p3.message.chatActionType == p4.message.chatActionType
											var54 = nil
										else
											var54 = true
										end
										if var54 then
											if fFlagExpChatPresetChatEnabled then
												return p3.message.presetId == p4.message.presetId
											end
											var54 = true
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
	return var54
end)