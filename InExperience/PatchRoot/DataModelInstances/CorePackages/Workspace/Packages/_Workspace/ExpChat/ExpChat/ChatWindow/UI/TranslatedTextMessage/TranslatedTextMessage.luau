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
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local shouldSendHighFrequencyTelemetryModule = require(expChat.shouldSendHighFrequencyTelemetry)
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local textChatMessageChatActionTypeModule = require(expChat.TextChatMessageChatActionType)
local fFlagDebugMessageProfilingModule = require(expChat.Flags.FFlagDebugMessageProfiling)
local expChatTranslationToggleSpacingFix = game:DefineFastFlag("ExpChatTranslationToggleSpacingFix", false)
local getFFlagExpChatUseUpdatedMessageRenderedModule = require(expChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local var23 = require(expChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
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
local duplicateInvisibleTextModule = require(helpers.duplicateInvisibleText)
local flags = expChat.Flags
local isExperienceChatUserProfileApiEnabledModule = require(flags.isExperienceChatUserProfileApiEnabled)
local fIntExpChatVisibleARButtonPaddingModule = require(flags.FIntExpChatVisibleARButtonPadding)
local fIntExpChatDefaultARButtonPaddingModule = require(flags.FIntExpChatDefaultARButtonPadding)
local fFlagAEGIS2EnableGatesForExpChatModule = require(flags.FFlagAEGIS2EnableGatesForExpChat)
local fFlagExpChatTopBannerForPresetChatAccessModule = require(flags.FFlagExpChatTopBannerForPresetChatAccess)
local fFlagExpChatFixLocalUserVerifiedBadgeModule = require(flags.FFlagExpChatFixLocalUserVerifiedBadge)
local expChatSharedModule = require(parent_1.ExpChatShared)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getPresetIconRichText = expChatSharedModule.getPresetIconRichText
local useIsARButtonVisibleModule = require(expChat.useIsARButtonVisible)
local isPresetMessage = expChatSharedModule.isPresetMessage

function appendVerifiedBadge(p0) --[[ line: 78 ]]
	-- upvalues: configModule (ref)
	return string.gsub(p0, ":(%S-)$", configModule.VERIFIED_EMOJI .. ":%1")
end

local var48 = function(p1) --[[ line: 82 ]]
	-- upvalues: userProfileStore (ref), signalsReactModule (ref)
	local var55 = userProfileStore.get().fetchNamesByUserIds({ tostring(p1.userId) })(false).data[1]
	
	return {
		displayName = signalsReactModule.useSignalBinding(var55.names.getDisplayName),
		inExperienceCombinedName = signalsReactModule.useSignalBinding(var55.names.getInExperienceCombinedName)
	}
end

function trim(p2) --[[ line: 91 ]]
	return if p2:match("^()%s*$") then "" else p2:match("^%s*(.*%S)")
end

function getMessageText(p3, p4, p5) --[[ line: 95 ]]
	return if p4 == nil or p4 == "" then p5 or "" elseif p3 then p4 or "" else p5 or ""
end

local function _(p6, p7) --[[ line: 105 | named "calculateTransparency" ]]
	return p6 + p7 * (1 - p6)
end

local _ = function(value, p8) --[[ line: 109 | named "setTransparency" ]]
	return p8:map(function(p9) --[[ line: 110 ]]
		-- upvalues: value (ref)
		return if value == nil then 1 else value + p9 * (1 - value)
	end)
end

local function useARButtonRightPadding() --[[ line: 115 ]]
	-- upvalues: fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), useIsARButtonVisibleModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), showChatEnabledUIModule (ref), isChatRegionLockedModule (ref)
	if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
		return if useIsARButtonVisibleModule() then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
	end
	local _ = 0
	local _ = nil
	local _ = nil
	
	return if not isChatRegionLockedModule() and (if fFlagAEGIS2EnableGatesForExpChatModule then showChatEnabledUIModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)) else true) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
end

local function appendTrustedIndicator(p10, p11, p12, p13, p14) --[[ line: 140 ]]
	local var56 = p14.Color.Shift.Shift_300.Color3:ToHex()
	local transparency = p14.Color.Shift.Shift_300.Transparency
	local transparency_1 = p14.Color.Content.Emphasis.Transparency
	local var57 = `{`{`{`{`<mark color='#{var56}' transparency='{transparency + p12 * (1 - transparency)}'>`}<font transparency='1' weight='{600}' size='{p13 - 4}'><stroke transparency='1'>_`}<font color='#{p14.Color.Content.Emphasis.Color3:ToHex()}' transparency='{transparency_1 + p12 * (1 - transparency_1)}'>{p11}</font>`}_</stroke></font>`}</mark>`
	
	return if string.find(p10, ":([%S:]-)$") then string.gsub(p10, ":([%S:]-)$", ` {var57} :%1`) else `{p10} {var57}`
end

local var51 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

local _ = function(p15, p16, p17, p18) --[[ line: 177 | named "applyStyleToText" ]]
	-- upvalues: textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref)
	p16 = p16 or ""
	
	if p17.chatActionType == textChatMessageChatActionTypeModule.Summary then
		p16 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(p18) .. " " .. p16, p15.Color.Content.Muted.Color3:ToHex(), p18)
	end
	return p16
end

local var52 = function(p19) --[[ line: 190 ]]
	-- upvalues: fFlagDebugMessageProfilingModule (ref), reactModule (ref), expChatPerfTracker (ref), localizationModule (ref), fFlagExpChatRewriteInlineModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), foundationModule (ref), getMessageSettingsModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), isExperienceChatUserProfileApiEnabledModule (ref), var48 (ref), getFFlagExpChatExcludeFOMORendersModule (ref), signalsModule (ref), playersService (ref), var51 (ref), signalsReactModule (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), fFlagExpChatUseChannelTabsStore (ref), useStore (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), var23 (ref), getChannelTabsStoreModule (ref), textChatService (ref), appendTrustedIndicator (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPolishSummaryMessageUIModule (ref), textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconRichText (ref), expChatTranslationToggleSpacingFix (ref), duplicateInvisibleTextModule (ref), useCursor (ref), fFlagEnableInExpChatRewriteModule (ref), useARButtonRightPadding (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), showChatEnabledUIModule (ref), isChatRegionLockedModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (ref)
	if fFlagDebugMessageProfilingModule then
		debug.profilebegin("TranslatedTextMessage")
	end
	local messageId = p19.message.messageId or "UNKNOWN_MESSAGE_ID"
	reactModule.useEffect(function() --[[ line: 195 ]]
		-- upvalues: expChatPerfTracker (copy), messageId (ref)
		expChatPerfTracker.finish(expChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = messageId })
		expChatPerfTracker.finish(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = messageId })
	end, { messageId })
	local isSpatialUIEnabled = p19.isSpatialUIEnabled
	local var60 = if isSpatialUIEnabled then p19.chatWindowSettings.SpatialPanelTextSize else p19.chatWindowSettings.TextSize
	local var61 = localizationModule.useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		rewrittenLabelText = if fFlagExpChatRewriteInlineModule then fStringInExpChatRewriteLabelKeyModule else nil,
		defaultRewrittenLabelText = if fFlagExpChatRewriteInlineModule then "CoreScripts.TextChat.ChatWindow.RewrittenLabel" else nil
	})
	local var62 = nil
	
	if fFlagExpChatRewriteInlineModule then
		var62 = if var61.rewrittenLabelText and var61.rewrittenLabelText ~= "" then var61.rewrittenLabelText else var61.defaultRewrittenLabelText
	end
	local var63 = foundationModule.Hooks.useTokens()
	local var64 = getMessageSettingsModule(p19.message, p19.chatWindowSettings)
	local showTranslationButton = p19.showTranslationButton
	local var65 = getMessageText(var64.useTranslation, var64.translation, var64.text)
	local prefixText = var64.prefixText or ""
	local var67 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() and p19.message.textChannel == nil then
		var67 = nil
	elseif isExperienceChatUserProfileApiEnabledModule() and p19.message.userId then
		if fFlagDebugMessageProfilingModule then
			debug.profilebegin("useCombinedName")
		end
		var67 = var48(p19.message)
		
		if fFlagDebugMessageProfilingModule then
			debug.profileend()
		end
	end
	local _ = nil
	local userId = p19.message.userId and tostring(p19.message.userId)
	local var69 = if getFFlagExpChatExcludeFOMORendersModule() then p19.message.isHiddenMessage else nil
	local var70 = signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 247 ]]
		-- upvalues: signalsModule (copy), userId (ref), playersService (copy), var69 (ref), var51 (copy)
		return signalsModule.createComputed(function(p20) --[[ line: 248 ]]
			-- upvalues: userId (copy), playersService (copy), var69 (copy), var51 (copy)
			local userId_1 = playersService.LocalPlayer and (playersService.LocalPlayer.UserId and tostring(playersService.LocalPlayer.UserId))
			
			return if userId and userId ~= "" and (not (userId_1 and userId_1 == userId) and not var69) then var51.getIsTrustedConnection(userId).data(p20) else nil
		end)
	end, { userId, var69 }))
	local var71 = if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule and not fFlagExpChatUseChannelTabsStore then useStore() else nil
	
	if getFFlagExpChatUseUpdatedMessageRenderedModule() then
		reactModule.useEffect(function() --[[ line: 269 ]]
			-- upvalues: p19 (ref), shouldSendHighFrequencyTelemetryModule (copy), var23 (copy), getFFlagExpChatExcludeFOMORendersModule (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), var71 (ref), textChatService (copy)
			if p19.message.textChatMessageInstance and shouldSendHighFrequencyTelemetryModule(var23) and (not getFFlagExpChatExcludeFOMORendersModule() or not p19.message.isHiddenMessage) then
				if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
					local var99 = -1
					
					if fFlagExpChatUseChannelTabsStore then
						local var100 = getChannelTabsStoreModule(false)
						local channelTabsState = var100.getChannelTabsState(false)
						local selectedTabName = var100.getSelectedTabName(false)
						
						if selectedTabName and channelTabsState.allChannelTabs[selectedTabName] then
							var99 = channelTabsState.allChannelTabs[selectedTabName].tabIndex
						end
					else
						local channelTabs = var71:getState().ChannelTabs
						local selectedTabName = channelTabs and channelTabs.selectedTabName
						
						if selectedTabName and channelTabs.allChannelTabs[selectedTabName] then
							var99 = channelTabs.allChannelTabs[selectedTabName].TabIndex
						end
					end
					textChatService:SendExpChatMessageClientRendered(p19.message.textChatMessageInstance, "chat_window", var99)
					
					return
				else
					textChatService:SendExpChatMessageClientRendered(p19.message.textChatMessageInstance, "chat_window")
				end
			end
		end, {})
	end
	local bodyTextProperties = var64.bodyTextProperties
	local prefixTextProperties = var64.prefixTextProperties
	local var72 = if isSpatialUIEnabled then var60 else bodyTextProperties.TextSize
	local var73 = var72 - 2
	local var74 = reactModule.joinBindings({
		reactModule.joinBindings(if var67 ~= nil then {} else { var67.displayName, var67.inExperienceCombinedName }):map(function(p22) --[[ line: 314 ]]
			-- upvalues: prefixText (ref), p19 (ref)
			local var107 = p22[1] or ""
			local var108 = p22[2] or ""
			local var109 = prefixText
			
			if string.len(var107) > 0 and string.len(var108) > 0 and var107 ~= var108 then
				var109 = string.gsub(var109, var107, var108)
			end
			if string.len(prefixText) > 0 and p19.isUserVerified then
				var109 = appendVerifiedBadge(var109)
			end
			return var109
		end),
		var70,
		p19.textTransparency
	}):map(function(p21) --[[ line: 335 ]]
		-- upvalues: prefixText (ref), appendTrustedIndicator (copy), var61 (ref), prefixTextProperties (ref), var63 (ref)
		local var104 = p21[1] or ""
		local var105 = p21[2] or false
		local var106 = p21[3]
		
		if var106 == nil then
			var106 = 1
		end
		if string.len(prefixText) == 0 then
			return var104
		elseif var105 then
			var104 = appendTrustedIndicator(var104, var61.trustedLabelText, var106, prefixTextProperties.TextSize, var63)
		end
		return var104
	end)
	var74 = var74:map(function(p23) --[[ line: 356 ]]
		-- upvalues: prefixText (ref)
		return if string.len(prefixText) == 0 then p23 else trim(p23)
	end)
	local var75 = var74:map(function(p24) --[[ line: 363 ]]
		-- upvalues: var65 (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPolishSummaryMessageUIModule (copy), var72 (ref), var63 (ref), p19 (ref), textChatMessageChatActionTypeModule (copy), summaryMessageRichTextModule (copy), fFlagExpChatPresetChatEnabled (copy), isPresetMessage (copy), getPresetIconRichText (copy), prefixText (ref), showTranslationButton (ref), expChatTranslationToggleSpacingFix (copy), duplicateInvisibleTextModule (copy), prefixTextProperties (ref)
		local var110 = var65
		
		if fFlagEnableInExpChatSummaryOnLuaModule then
			local var111 = if fFlagExpChatPolishSummaryMessageUIModule then var72 else nil
			local var112 = var63
			local var65_1 = var65 or ""
			
			if p19.message.chatActionType == textChatMessageChatActionTypeModule.Summary then
				var65_1 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(var111) .. " " .. var65_1, var112.Color.Content.Muted.Color3:ToHex(), var111)
			end
			var110 = var65_1
		end
		if fFlagExpChatPresetChatEnabled and isPresetMessage(p19.message) then
			var110 ..= ` {getPresetIconRichText(var72)}`
		end
		if string.len(prefixText) == 0 then
			return if fFlagEnableInExpChatSummaryOnLuaModule then var110 else var65
		elseif showTranslationButton then
			var110 = if expChatTranslationToggleSpacingFix then "     " .. var110 else "   " .. var110
		end
		return duplicateInvisibleTextModule(p24, prefixTextProperties.FontFace, prefixTextProperties.TextSize) .. " " .. var110
	end)
	
	if fFlagExpChatRewriteInlineModule then
		var75 = reactModule.joinBindings({ var75 }):map(function(p25) --[[ line: 388 ]]
			-- upvalues: p19 (ref), foundationModule (copy), prefixTextProperties (ref), var63 (ref), var62 (write)
			local var114 = p25[1] or ""
			
			return if p19.wasRewritten then `{var114} <font size='{prefixTextProperties.TextSize - 4}' color='#{var63.Color.Content.Muted.Color3:ToHex()}'>{`({var62})`}<font transparency='1'><stroke transparency='1'>_</stroke></font>{`<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{if p19.isRewriteMenuOpen then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown}</font>`}</font>` else var114
		end)
	end
	local UIPadding
	local var76 = useCursor()
	local _ = nil
	
	if fFlagEnableInExpChatRewriteModule then
		UIPadding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, useARButtonRightPadding()) })
	else
		local _ = nil
		local _ = nil
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, if not isChatRegionLockedModule() and (if fFlagAEGIS2EnableGatesForExpChatModule then showChatEnabledUIModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)) else true) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule)
		})
	end
	local var78 = nil
	
	if fFlagExpChatRewriteInlineModule and p19.wasRewritten then
		if p19.chatWindowTransparencyBindable == nil then
			var78 = true
		elseif typeof(p19.chatWindowTransparencyBindable) == "number" then
			var78 = p19.chatWindowTransparencyBindable < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
			var78 = nil
		else
			var78 = p19.chatWindowTransparencyBindable:map(function(p26) --[[ line: 445 ]]
				-- upvalues: fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (copy)
				return p26 < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
			end)
		end
	end
	local createElement = reactModule.createElement
	local var79 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p19.LayoutOrder
	}
	local t_1 = { UIPadding = UIPadding }
	local createElement_1 = reactModule.createElement
	local var82 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_3 = {}
	local var85 = false
	
	if string.len(prefixText) > 0 then
		var85 = reactModule.createElement
		local var86 = "TextLabel"
		local t_4 = {
			BackgroundTransparency = 1,
			RichText = true,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.XY,
			FontFace = prefixTextProperties.FontFace,
			Text = var74,
			TextColor3 = prefixTextProperties.TextColor3,
			TextSize = prefixTextProperties.TextSize,
			TextStrokeColor3 = prefixTextProperties.TextStrokeColor3
		}
		local textStrokeTransparency = prefixTextProperties.TextStrokeTransparency
		t_4.TextStrokeTransparency = p19.textTransparency:map(function(p27) --[[ line: 110 ]]
			-- upvalues: textStrokeTransparency (ref)
			return if textStrokeTransparency == nil then 1 else textStrokeTransparency + p27 * (1 - textStrokeTransparency)
		end)
		local var88 = 0
		t_4.TextTransparency = p19.textTransparency:map(function(p28) --[[ line: 110 ]]
			-- upvalues: var88 (ref)
			return if var88 == nil then 1 else var88 + p28 * (1 - var88)
		end)
		t_4.TextXAlignment = Enum.TextXAlignment.Left
		t_4.TextYAlignment = Enum.TextYAlignment.Top
		var85 = var85(var86, t_4, {
			UIGradient = prefixTextProperties.UIGradient ~= nil and reactModule.createElement("UIGradient", prefixTextProperties.UIGradient)
		})
	end
	local createElement_3
	t_3.PrefixText = var85
	local createElement_2 = reactModule.createElement
	local var89 = if fFlagExpChatRewriteInlineModule and p19.wasRewritten then "TextButton" else "TextLabel"
	local t_4 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		FontFace = bodyTextProperties.FontFace,
		RichText = true,
		Size = UDim2.new(1, 0, 0, 0),
		Text = var75,
		TextColor3 = bodyTextProperties.TextColor3,
		TextSize = var72,
		TextStrokeColor3 = bodyTextProperties.TextStrokeColor3
	}
	local textStrokeTransparency = bodyTextProperties.TextStrokeTransparency
	t_4.TextStrokeTransparency = p19.textTransparency:map(function(p29) --[[ line: 110 ]]
		-- upvalues: textStrokeTransparency (ref)
		return if textStrokeTransparency == nil then 1 else textStrokeTransparency + p29 * (1 - textStrokeTransparency)
	end)
	local var91 = 0
	t_4.TextTransparency = p19.textTransparency:map(function(p30) --[[ line: 110 ]]
		-- upvalues: var91 (ref)
		return if var91 == nil then 1 else var91 + p30 * (1 - var91)
	end)
	t_4.TextWrapped = true
	t_4.TextXAlignment = Enum.TextXAlignment.Left
	t_4.TextYAlignment = Enum.TextYAlignment.Top
	t_4[reactModule.Event.Activated] = if fFlagExpChatRewriteInlineModule and p19.wasRewritten then p19.onTextBodyActivated else nil
	t_4.Interactable = var78
	t_3.BodyText = createElement_2(var89, t_4)
	
	if string.len(prefixText) == 0 then
		createElement_3 = nil
	else
		local createElement_4
		createElement_3 = reactModule.createElement
		local var92 = "Frame"
		local t_5 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
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
				RichText = true,
				SelectionImageObject = var76,
				Size = UDim2.new(0, 0, 0, 0),
				Text = var74,
				TextSize = prefixTextProperties.TextSize,
				TextStrokeTransparency = 1,
				TextTransparency = 1,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 1,
				[reactModule.Event.Activated] = function() --[[ line: 538 ]]
					-- upvalues: p19 (ref)
					p19.onTextMessageLabelButtonActivated(p19.message)
				end
			})
		}
		
		if showTranslationButton then
			createElement_4 = reactModule.createElement
			local var95 = "ImageButton"
			local t_7 = {
				BackgroundTransparency = 1,
				HoverImage = "rbxasset://textures/translateIconDark.png",
				Image = "rbxasset://textures/translateIcon.png"
			}
			local var97 = 0
			t_7.ImageTransparency = p19.textTransparency:map(function(p31) --[[ line: 110 ]]
				-- upvalues: var97 (ref)
				return if var97 == nil then 1 else var97 + p31 * (1 - var97)
			end)
			t_7.LayoutOrder = 2
			t_7.PressedImage = "rbxasset://textures/translateIconDark.png"
			t_7.SelectionImageObject = var76
			t_7.Size = UDim2.new(0, var73, 0, var73)
			
			t_7[reactModule.Event.Activated] = function() --[[ line: 553 ]]
				-- upvalues: p19 (ref)
				p19.onToggle(not p19.message.useTranslation, p19.message.messageId)
			end
			
			createElement_4 = createElement_4(var95, t_7)
		else
			createElement_4 = nil
		end
		t_6.TranslationButton = createElement_4
		createElement_3 = createElement_3(var92, t_5, t_6)
	end
	t_3.TextMessageButton = createElement_3
	t_1.TextMessage = createElement_1(var82, t_2, t_3)
	createElement = createElement(var79, t, t_1)
	
	if fFlagDebugMessageProfilingModule then
		debug.profileend()
	end
	return createElement
end

local function TranslatedTextMessageWithToggle(_) --[[ line: 568 ]]
	-- upvalues: roactRoduxModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), var52 (ref)
	return roactRoduxModule.connect(function() --[[ line: 569 ]] end, function(p32) --[[ line: 569 ]]
		-- upvalues: fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy)
		return {
			onToggle = function(p33, p34) --[[ line: 571 ]]
				-- upvalues: fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), p32 (ref)
				if fFlagExpChatUseMessagesStore then
					getMessagesStoreModule(false).toggleMessageTranslation(p33, p34)
					
					return
				end
				p32({
					type = "ChatTranslationMessageToggled",
					useTranslation = p33,
					messageId = p34
				})
			end
		}
	end)(var52)
end

local function RewriteLabelWithButton(p35) --[[ line: 587 ]]
	-- upvalues: foundationModule (ref), localizationModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), reactModule (ref)
	local var115 = foundationModule.Hooks.useTokens()
	local var116 = localizationModule.useLocalization({
		defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel",
		rewrittenLabelText = fStringInExpChatRewriteLabelKeyModule
	})
	local var117 = if var116.rewrittenLabelText and var116.rewrittenLabelText ~= "" then var116.rewrittenLabelText else var116.defaultRewrittenLabelText
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "size-full-0 auto-y row align-y-center gap-xsmall",
		LayoutOrder = p35.LayoutOrder
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local text = foundationModule.Text
	local t_2 = {
		tag = "size-0-0 auto-xy text-caption-small text-align-x-left",
		LayoutOrder = 1,
		RichText = true,
		Text = "(" .. var117 .. ")"
	}
	local t_3 = { Color3 = var115.Color.Content.Muted.Color3 }
	local transparency = var115.Color.Content.Muted.Transparency
	t_3.Transparency = p35.textTransparency:map(function(p36) --[[ line: 110 ]]
		-- upvalues: transparency (ref)
		return if transparency == nil then 1 else transparency + p36 * (1 - transparency)
	end)
	t_2.textStyle = t_3
	local t_4 = { Color = Color3.fromRGB(0, 0, 0) }
	local var123 = 0.5
	t_4.Transparency = p35.textTransparency:map(function(p37) --[[ line: 110 ]]
		-- upvalues: var123 (ref)
		return if var123 == nil then 1 else var123 + p37 * (1 - var123)
	end)
	t_4.Thickness = var115.Stroke.Thin
	t_2.stroke = t_4
	t_1.Label = createElement_1(text, t_2)
	t_1.IconButton = reactModule.createElement(foundationModule.IconButton, {
		isCircular = true,
		LayoutOrder = 2,
		size = foundationModule.Enums.InputSize.XSmall,
		icon = if p35.isRewriteMenuOpen then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown,
		variant = foundationModule.Enums.ButtonVariant.Utility,
		Visible = p35.textTransparency:map(function(p38) --[[ line: 625 ]]
			return p38 < 1
		end),
		onActivated = p35.onActivated
	})
	
	return createElement(view, t, t_1)
end

return reactModule.memo(function(p39) --[[ line: 633 | named "TranslatedTextMessageWrapper" ]]
	-- upvalues: getMessageSettingsModule (ref), fFlagEnableInExpChatRewriteModule (ref), useARButtonRightPadding (ref), fIntExpChatDefaultARButtonPaddingModule (ref), localizationModule (ref), fStringInExpChatRewriteReasonKeyModule (ref), foundationModule (ref), reactModule (ref), fFlagExpChatRewriteToggleAnalyticsModule (ref), expChatSharedModule (ref), fFlagExpChatRewriteInlineIxpEnabledModule (ref), IXPService (ref), fStringExpChatRewriteInlineIxpLayerModule (ref), fFlagExpChatRewriteInlineModule (ref), dictionary (ref), TranslatedTextMessageWithToggle (ref), var52 (ref), RewriteLabelWithButton (ref)
	local var124 = getMessageSettingsModule(p39.message, p39.chatWindowSettings)
	local showTranslationButton = p39.showTranslationButton
	local var125 = nil
	local _ = nil
	local var126 = nil
	local _ = nil
	local var127 = nil
	local originalText = nil
	local var128 = false
	local wasRewritten = false
	local var129 = 0
	local var130 = ""
	
	if fFlagEnableInExpChatRewriteModule then
		var129 = math.max(useARButtonRightPadding() - fIntExpChatDefaultARButtonPaddingModule, 0)
		local var131 = localizationModule.useLocalization({
			defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel",
			rewrittenReasonLabelText = fStringInExpChatRewriteReasonKeyModule
		})
		var130 = if var131.rewrittenReasonLabelText and var131.rewrittenReasonLabelText ~= "" then var131.rewrittenReasonLabelText else var131.defaultRewrittenReasonLabelText
		var125 = foundationModule.Hooks.useTokens()
		local var132, var133 = reactModule.useState(false)
		var126 = var132
		local var134 = var133
		wasRewritten = var124.wasRewritten
		originalText = var124.originalText
		var128 = wasRewritten and (originalText ~= nil and originalText ~= "")
		var127 = reactModule.useCallback(function() --[[ line: 664 ]]
			-- upvalues: fFlagExpChatRewriteToggleAnalyticsModule (copy), expChatSharedModule (copy), p39 (ref), var126 (write), var128 (write), var134 (write)
			if fFlagExpChatRewriteToggleAnalyticsModule then
				expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.RewriteDropdownToggledConfig, {
					messageId = p39.message.messageId,
					isDropdownOpen = tostring(var126),
					showOriginalText = tostring(var128)
				}, expChatSharedModule.Analytics.DefaultStandardizedFields)
			end
			var134(function(p40) --[[ line: 672 ]]
				return not p40
			end)
		end, { var126, var128, p39.message.messageId })
		
		if fFlagExpChatRewriteInlineIxpEnabledModule then
			reactModule.useEffect(function() --[[ line: 678 ]]
				-- upvalues: wasRewritten (write), IXPService (copy), fStringExpChatRewriteInlineIxpLayerModule (copy)
				if wasRewritten then
					IXPService:LogFlagLinkedUserLayerExposure(fStringExpChatRewriteInlineIxpLayerModule)
				end
			end, { wasRewritten })
		end
	end
	local _ = nil
	local var135 = p39
	
	if fFlagExpChatRewriteInlineModule and wasRewritten then
		var135 = dictionary.join(var135, {
			LayoutOrder = 1,
			isRewriteMenuOpen = var126,
			wasRewritten = wasRewritten,
			onTextBodyActivated = var127
		})
	elseif fFlagEnableInExpChatRewriteModule and wasRewritten then
		var135 = dictionary.join(var135, { LayoutOrder = 1 })
	end
	local var137
	local var136 = if showTranslationButton then reactModule.createElement(TranslatedTextMessageWithToggle, var135) else reactModule.createElement(var52, var135)
	
	if fFlagEnableInExpChatRewriteModule and wasRewritten then
		local var140
		var137 = reactModule.createElement
		local view = foundationModule.View
		local t = {
			tag = `size-full-0 auto-y align-y-top col{if fFlagExpChatRewriteInlineModule then " gap-xsmall" else ""}`,
			LayoutOrder = p39.LayoutOrder
		}
		local t_1 = {
			UIPadding = if var126 then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 4) }) else nil,
			TranslatedTextMessage = var136,
			RewriteLabelWithButton = if wasRewritten and not fFlagExpChatRewriteInlineModule then reactModule.createElement(RewriteLabelWithButton, {
				LayoutOrder = 2,
				onActivated = var127,
				isRewriteMenuOpen = var126,
				transparencyValue = p39.transparencyValue,
				textTransparency = p39.textTransparency
			}) else nil
		}
		
		if var126 then
			local createElement
			var140 = reactModule.createElement
			local view_1 = foundationModule.View
			local t_2 = {
				tag = "align-x-left col radius-medium gap-xxsmall padding-small",
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -fIntExpChatDefaultARButtonPaddingModule, 0, 0)
			}
			local t_3 = { Color3 = var125.Color.Common.Scrim.Color3 }
			local var143 = 0.7
			t_3.Transparency = p39.transparencyValue:map(function(p41) --[[ line: 110 ]]
				-- upvalues: var143 (ref)
				return if var143 == nil then 1 else var143 + p41 * (1 - var143)
			end)
			t_2.backgroundStyle = t_3
			local t_4 = {}
			
			if var128 then
				createElement = reactModule.createElement
				local text = foundationModule.Text
				local t_5 = {
					tag = "text-body-small text-align-x-left",
					LayoutOrder = 1,
					RichText = true,
					TextWrapped = true,
					Text = originalText,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, -var129, 0, 0)
				}
				local t_6 = { Color3 = var125.Color.Content.Muted.Color3 }
				local transparency = var125.Color.Content.Muted.Transparency
				t_6.Transparency = p39.textTransparency:map(function(p42) --[[ line: 110 ]]
					-- upvalues: transparency (ref)
					return if transparency == nil then 1 else transparency + p42 * (1 - transparency)
				end)
				t_5.textStyle = t_6
				local t_7 = { Color = Color3.fromRGB(0, 0, 0) }
				local var148 = 0.5
				t_7.Transparency = p39.textTransparency:map(function(p43) --[[ line: 110 ]]
					-- upvalues: var148 (ref)
					return if var148 == nil then 1 else var148 + p43 * (1 - var148)
				end)
				t_7.Thickness = var125.Stroke.Thin
				t_5.stroke = t_7
				createElement = createElement(text, t_5)
			else
				createElement = nil
			end
			t_4.OriginalText = createElement
			t_4.Divider = if var128 then reactModule.createElement(foundationModule.Divider, {
				LayoutOrder = 2,
				orientation = foundationModule.Enums.Orientation.Horizontal,
				Visible = p39.textTransparency:map(function(p44) --[[ line: 766 ]]
					return p44 < 1
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
				Text = var130,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -var129, 0, 0)
			}
			local t_6 = { Color3 = var125.Color.Content.Default.Color3 }
			local transparency = var125.Color.Content.Default.Transparency
			t_6.Transparency = p39.textTransparency:map(function(p45) --[[ line: 110 ]]
				-- upvalues: transparency (ref)
				return if transparency == nil then 1 else transparency + p45 * (1 - transparency)
			end)
			t_5.textStyle = t_6
			local t_7 = { Color = Color3.fromRGB(0, 0, 0) }
			local var152 = 0.5
			t_7.Transparency = p39.textTransparency:map(function(p46) --[[ line: 110 ]]
				-- upvalues: var152 (ref)
				return if var152 == nil then 1 else var152 + p46 * (1 - var152)
			end)
			t_7.Thickness = var125.Stroke.Thin
			t_5.stroke = t_7
			t_4.ReasoningText = createElement_1(text, t_5)
			var140 = var140(view_1, t_2, t_4)
		else
			var140 = nil
		end
		t_1.DropdownMenu = var140
		var137 = var137(view, t, t_1)
	else
		var137 = var136
	end
	return var137
end, function(p47, p48) --[[ line: 806 | named "areEqual" ]]
	-- upvalues: fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagExpChatRewriteInlineModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPresetChatEnabled (ref)
	local var153 = false
	
	if p47.message.text == p48.message.text then
		var153 = false
		
		if p47.message.prefixText == p48.message.prefixText then
			var153 = false
			
			if p47.message.translation == p48.message.translation then
				var153 = false
				
				if p47.message.useTranslation == p48.message.useTranslation then
					var153 = false
					
					if p47.message.messageId == p48.message.messageId then
						if fFlagExpChatFixLocalUserVerifiedBadgeModule then
							var153 = false
							
							if p47.message.userId == p48.message.userId then
								local _ = p47.isUserVerified == p48.isUserVerified
							end
						else
							var153 = true
						end
						if var153 then
							var153 = false
							
							if p47.chatWindowSettings == p48.chatWindowSettings then
								if fFlagEnableInExpChatRewriteModule then
									var153 = false
									
									if p47.message.wasRewritten == p48.message.wasRewritten then
										var153 = p47.message.originalText == p48.message.originalText
										var153 = nil
									end
								else
									var153 = true
								end
								if var153 then
									if fFlagExpChatRewriteInlineModule then
										var153 = p47.chatWindowTransparencyBindable == p48.chatWindowTransparencyBindable
										var153 = nil
									else
										var153 = true
									end
									if var153 then
										if fFlagEnableInExpChatSummaryOnLuaModule then
											var153 = p47.message.chatActionType == p48.message.chatActionType
											var153 = nil
										else
											var153 = true
										end
										if var153 then
											if fFlagExpChatPresetChatEnabled then
												return p47.message.presetId == p48.message.presetId
											end
											var153 = true
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
	return var153
end)