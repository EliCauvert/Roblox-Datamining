local IXPService = game:GetService("IXPService")
local textChatService = game:GetService("TextChatService")
local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local parent_1 = expChat.Parent
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)
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
local var24 = require(expChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
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
local fFlagExpChatPerfTracking = require(parent.SharedFlags).FFlagExpChatPerfTracking
local fFlagExpChatTopBannerForPresetChatAccessModule = require(flags.FFlagExpChatTopBannerForPresetChatAccess)
local fFlagExpChatFixLocalUserVerifiedBadgeModule = require(flags.FFlagExpChatFixLocalUserVerifiedBadge)
local expChatSharedModule = require(parent_1.ExpChatShared)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getPresetIconRichText = expChatSharedModule.getPresetIconRichText
local useIsARButtonVisibleModule = require(expChat.useIsARButtonVisible)
local isPresetMessage = expChatSharedModule.isPresetMessage

function appendVerifiedBadge(p0) --[[ line: 81 ]]
	-- upvalues: configModule (ref)
	return string.gsub(p0, ":(%S-)$", configModule.VERIFIED_EMOJI .. ":%1")
end

local var49 = function(p1) --[[ line: 85 ]]
	-- upvalues: userProfileStore (ref), signalsReactModule (ref)
	local var56 = userProfileStore.get().fetchNamesByUserIds({ tostring(p1.userId) })(false).data[1]
	
	return {
		displayName = signalsReactModule.useSignalBinding(var56.names.getDisplayName),
		inExperienceCombinedName = signalsReactModule.useSignalBinding(var56.names.getInExperienceCombinedName)
	}
end

function trim(p2) --[[ line: 94 ]]
	return if p2:match("^()%s*$") then "" else p2:match("^%s*(.*%S)")
end

function getMessageText(p3, p4, p5) --[[ line: 98 ]]
	return if p4 == nil or p4 == "" then p5 or "" elseif p3 then p4 or "" else p5 or ""
end

local function _(p6, p7) --[[ line: 108 | named "calculateTransparency" ]]
	return p6 + p7 * (1 - p6)
end

local _ = function(value, p8) --[[ line: 112 | named "setTransparency" ]]
	return p8:map(function(p9) --[[ line: 113 ]]
		-- upvalues: value (ref)
		return if value == nil then 1 else value + p9 * (1 - value)
	end)
end

local function useARButtonRightPadding() --[[ line: 118 ]]
	-- upvalues: fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), useIsARButtonVisibleModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), showChatEnabledUIModule (ref), isChatRegionLockedModule (ref)
	if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
		return if useIsARButtonVisibleModule() then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
	end
	local _ = 0
	local _ = nil
	local _ = nil
	
	return if not isChatRegionLockedModule() and (if fFlagAEGIS2EnableGatesForExpChatModule then showChatEnabledUIModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)) else true) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
end

local function appendTrustedIndicator(p10, p11, p12, p13, p14) --[[ line: 143 ]]
	local var57 = p14.Color.Shift.Shift_300.Color3:ToHex()
	local transparency = p14.Color.Shift.Shift_300.Transparency
	local transparency_1 = p14.Color.Content.Emphasis.Transparency
	local var58 = `{`{`{`{`<mark color='#{var57}' transparency='{transparency + p12 * (1 - transparency)}'>`}<font transparency='1' weight='{600}' size='{p13 - 4}'><stroke transparency='1'>_`}<font color='#{p14.Color.Content.Emphasis.Color3:ToHex()}' transparency='{transparency_1 + p12 * (1 - transparency_1)}'>{p11}</font>`}_</stroke></font>`}</mark>`
	
	return if string.find(p10, ":([%S:]-)$") then string.gsub(p10, ":([%S:]-)$", ` {var58} :%1`) else `{p10} {var58}`
end

local var52 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

local _ = function(p15, p16, p17, p18) --[[ line: 180 | named "applyStyleToText" ]]
	-- upvalues: textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref)
	p16 = p16 or ""
	
	if p17.chatActionType == textChatMessageChatActionTypeModule.Summary then
		p16 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(p18) .. " " .. p16, p15.Color.Content.Muted.Color3:ToHex(), p18)
	end
	return p16
end

local var53 = function(p19) --[[ line: 193 ]]
	-- upvalues: fFlagDebugMessageProfilingModule (ref), fFlagExpChatPerfTracking (ref), reactModule (ref), expChatPerfTracker (ref), localizationModule (ref), fFlagExpChatRewriteInlineModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), foundationModule (ref), getMessageSettingsModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), isExperienceChatUserProfileApiEnabledModule (ref), var49 (ref), getFFlagExpChatExcludeFOMORendersModule (ref), signalsModule (ref), playersService (ref), var52 (ref), signalsReactModule (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), fFlagExpChatUseChannelTabsStore (ref), useStore (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), var24 (ref), getChannelTabsStoreModule (ref), textChatService (ref), appendTrustedIndicator (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPolishSummaryMessageUIModule (ref), textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconRichText (ref), expChatTranslationToggleSpacingFix (ref), duplicateInvisibleTextModule (ref), fFlagExpChatEnableFocusNavigationModule (ref), useCursor (ref), fFlagEnableInExpChatRewriteModule (ref), useARButtonRightPadding (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), showChatEnabledUIModule (ref), isChatRegionLockedModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (ref)
	if fFlagDebugMessageProfilingModule then
		debug.profilebegin("TranslatedTextMessage")
	end
	if fFlagExpChatPerfTracking then
		local messageId = p19.message.messageId or "UNKNOWN_MESSAGE_ID"
		reactModule.useEffect(function() --[[ line: 199 ]]
			-- upvalues: expChatPerfTracker (copy), messageId (ref)
			expChatPerfTracker.finish(expChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = messageId })
			expChatPerfTracker.finish(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = messageId })
		end, { messageId })
	end
	local isSpatialUIEnabled = p19.isSpatialUIEnabled
	local var61 = if isSpatialUIEnabled then p19.chatWindowSettings.SpatialPanelTextSize else p19.chatWindowSettings.TextSize
	local var62 = localizationModule.useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		rewrittenLabelText = if fFlagExpChatRewriteInlineModule then fStringInExpChatRewriteLabelKeyModule else nil,
		defaultRewrittenLabelText = if fFlagExpChatRewriteInlineModule then "CoreScripts.TextChat.ChatWindow.RewrittenLabel" else nil
	})
	local var63 = nil
	
	if fFlagExpChatRewriteInlineModule then
		var63 = if var62.rewrittenLabelText and var62.rewrittenLabelText ~= "" then var62.rewrittenLabelText else var62.defaultRewrittenLabelText
	end
	local var64 = foundationModule.Hooks.useTokens()
	local var65 = getMessageSettingsModule(p19.message, p19.chatWindowSettings)
	local showTranslationButton = p19.showTranslationButton
	local var66 = getMessageText(var65.useTranslation, var65.translation, var65.text)
	local prefixText = var65.prefixText or ""
	local var68 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() and p19.message.textChannel == nil then
		var68 = nil
	elseif isExperienceChatUserProfileApiEnabledModule() and p19.message.userId then
		if fFlagDebugMessageProfilingModule then
			debug.profilebegin("useCombinedName")
		end
		var68 = var49(p19.message)
		
		if fFlagDebugMessageProfilingModule then
			debug.profileend()
		end
	end
	local _ = nil
	local userId = p19.message.userId and tostring(p19.message.userId)
	local var70 = if getFFlagExpChatExcludeFOMORendersModule() then p19.message.isHiddenMessage else nil
	local var71 = signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 252 ]]
		-- upvalues: signalsModule (copy), userId (ref), playersService (copy), var70 (ref), var52 (copy)
		return signalsModule.createComputed(function(p20) --[[ line: 253 ]]
			-- upvalues: userId (copy), playersService (copy), var70 (copy), var52 (copy)
			local userId_1 = playersService.LocalPlayer and (playersService.LocalPlayer.UserId and tostring(playersService.LocalPlayer.UserId))
			
			return if userId and userId ~= "" and (not (userId_1 and userId_1 == userId) and not var70) then var52.getIsTrustedConnection(userId).data(p20) else nil
		end)
	end, { userId, var70 }))
	local var72 = if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule and not fFlagExpChatUseChannelTabsStore then useStore() else nil
	
	if getFFlagExpChatUseUpdatedMessageRenderedModule() then
		reactModule.useEffect(function() --[[ line: 274 ]]
			-- upvalues: p19 (ref), shouldSendHighFrequencyTelemetryModule (copy), var24 (copy), getFFlagExpChatExcludeFOMORendersModule (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), var72 (ref), textChatService (copy)
			if p19.message.textChatMessageInstance and shouldSendHighFrequencyTelemetryModule(var24) and (not getFFlagExpChatExcludeFOMORendersModule() or not p19.message.isHiddenMessage) then
				if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
					local var100 = -1
					
					if fFlagExpChatUseChannelTabsStore then
						local var101 = getChannelTabsStoreModule(false)
						local channelTabsState = var101.getChannelTabsState(false)
						local selectedTabName = var101.getSelectedTabName(false)
						
						if selectedTabName and channelTabsState.allChannelTabs[selectedTabName] then
							var100 = channelTabsState.allChannelTabs[selectedTabName].tabIndex
						end
					else
						local channelTabs = var72:getState().ChannelTabs
						local selectedTabName = channelTabs and channelTabs.selectedTabName
						
						if selectedTabName and channelTabs.allChannelTabs[selectedTabName] then
							var100 = channelTabs.allChannelTabs[selectedTabName].TabIndex
						end
					end
					textChatService:SendExpChatMessageClientRendered(p19.message.textChatMessageInstance, "chat_window", var100)
					
					return
				else
					textChatService:SendExpChatMessageClientRendered(p19.message.textChatMessageInstance, "chat_window")
				end
			end
		end, {})
	end
	local bodyTextProperties = var65.bodyTextProperties
	local prefixTextProperties = var65.prefixTextProperties
	local var73 = if isSpatialUIEnabled then var61 else bodyTextProperties.TextSize
	local var74 = var73 - 2
	local var75 = reactModule.joinBindings({
		reactModule.joinBindings(if var68 ~= nil then {} else { var68.displayName, var68.inExperienceCombinedName }):map(function(p22) --[[ line: 319 ]]
			-- upvalues: prefixText (ref), p19 (ref)
			local var108 = p22[1] or ""
			local var109 = p22[2] or ""
			local var110 = prefixText
			
			if string.len(var108) > 0 and string.len(var109) > 0 and var108 ~= var109 then
				var110 = string.gsub(var110, var108, var109)
			end
			if string.len(prefixText) > 0 and p19.isUserVerified then
				var110 = appendVerifiedBadge(var110)
			end
			return var110
		end),
		var71,
		p19.textTransparency
	}):map(function(p21) --[[ line: 340 ]]
		-- upvalues: prefixText (ref), appendTrustedIndicator (copy), var62 (ref), prefixTextProperties (ref), var64 (ref)
		local var105 = p21[1] or ""
		local var106 = p21[2] or false
		local var107 = p21[3]
		
		if var107 == nil then
			var107 = 1
		end
		if string.len(prefixText) == 0 then
			return var105
		elseif var106 then
			var105 = appendTrustedIndicator(var105, var62.trustedLabelText, var107, prefixTextProperties.TextSize, var64)
		end
		return var105
	end)
	var75 = var75:map(function(p23) --[[ line: 361 ]]
		-- upvalues: prefixText (ref)
		return if string.len(prefixText) == 0 then p23 else trim(p23)
	end)
	local var76 = var75:map(function(p24) --[[ line: 368 ]]
		-- upvalues: var66 (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPolishSummaryMessageUIModule (copy), var73 (ref), var64 (ref), p19 (ref), textChatMessageChatActionTypeModule (copy), summaryMessageRichTextModule (copy), fFlagExpChatPresetChatEnabled (copy), isPresetMessage (copy), getPresetIconRichText (copy), prefixText (ref), showTranslationButton (ref), expChatTranslationToggleSpacingFix (copy), duplicateInvisibleTextModule (copy), prefixTextProperties (ref)
		local var111 = var66
		
		if fFlagEnableInExpChatSummaryOnLuaModule then
			local var112 = if fFlagExpChatPolishSummaryMessageUIModule then var73 else nil
			local var113 = var64
			local var66_1 = var66 or ""
			
			if p19.message.chatActionType == textChatMessageChatActionTypeModule.Summary then
				var66_1 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(var112) .. " " .. var66_1, var113.Color.Content.Muted.Color3:ToHex(), var112)
			end
			var111 = var66_1
		end
		if fFlagExpChatPresetChatEnabled and isPresetMessage(p19.message) then
			var111 ..= ` {getPresetIconRichText(var73)}`
		end
		if string.len(prefixText) == 0 then
			return if fFlagEnableInExpChatSummaryOnLuaModule then var111 else var66
		elseif showTranslationButton then
			var111 = if expChatTranslationToggleSpacingFix then "     " .. var111 else "   " .. var111
		end
		return duplicateInvisibleTextModule(p24, prefixTextProperties.FontFace, prefixTextProperties.TextSize) .. " " .. var111
	end)
	
	if fFlagExpChatRewriteInlineModule then
		var76 = reactModule.joinBindings({ var76 }):map(function(p25) --[[ line: 393 ]]
			-- upvalues: p19 (ref), foundationModule (copy), prefixTextProperties (ref), var64 (ref), var63 (write)
			local var115 = p25[1] or ""
			
			return if p19.wasRewritten then `{var115} <font size='{prefixTextProperties.TextSize - 4}' color='#{var64.Color.Content.Muted.Color3:ToHex()}'>{`({var63})`}<font transparency='1'><stroke transparency='1'>_</stroke></font>{`<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{if p19.isRewriteMenuOpen then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown}</font>`}</font>` else var115
		end)
	end
	local UIPadding
	local var77 = if fFlagExpChatEnableFocusNavigationModule then useCursor() else nil
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
	local var79 = nil
	
	if fFlagExpChatRewriteInlineModule and p19.wasRewritten then
		if p19.chatWindowTransparencyBindable == nil then
			var79 = true
		elseif typeof(p19.chatWindowTransparencyBindable) == "number" then
			var79 = p19.chatWindowTransparencyBindable < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
			var79 = nil
		else
			var79 = p19.chatWindowTransparencyBindable:map(function(p26) --[[ line: 451 ]]
				-- upvalues: fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (copy)
				return p26 < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
			end)
		end
	end
	local createElement = reactModule.createElement
	local var80 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p19.LayoutOrder
	}
	local t_1 = { UIPadding = UIPadding }
	local createElement_1 = reactModule.createElement
	local var83 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_3 = {}
	local var86 = false
	
	if string.len(prefixText) > 0 then
		var86 = reactModule.createElement
		local var87 = "TextLabel"
		local t_4 = {
			BackgroundTransparency = 1,
			RichText = true,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.XY,
			FontFace = prefixTextProperties.FontFace,
			Text = var75,
			TextColor3 = prefixTextProperties.TextColor3,
			TextSize = prefixTextProperties.TextSize,
			TextStrokeColor3 = prefixTextProperties.TextStrokeColor3
		}
		local textStrokeTransparency = prefixTextProperties.TextStrokeTransparency
		t_4.TextStrokeTransparency = p19.textTransparency:map(function(p27) --[[ line: 113 ]]
			-- upvalues: textStrokeTransparency (ref)
			return if textStrokeTransparency == nil then 1 else textStrokeTransparency + p27 * (1 - textStrokeTransparency)
		end)
		local var89 = 0
		t_4.TextTransparency = p19.textTransparency:map(function(p28) --[[ line: 113 ]]
			-- upvalues: var89 (ref)
			return if var89 == nil then 1 else var89 + p28 * (1 - var89)
		end)
		t_4.TextXAlignment = Enum.TextXAlignment.Left
		t_4.TextYAlignment = Enum.TextYAlignment.Top
		var86 = var86(var87, t_4, {
			UIGradient = prefixTextProperties.UIGradient ~= nil and reactModule.createElement("UIGradient", prefixTextProperties.UIGradient)
		})
	end
	local createElement_3
	t_3.PrefixText = var86
	local createElement_2 = reactModule.createElement
	local var90 = if fFlagExpChatRewriteInlineModule and p19.wasRewritten then "TextButton" else "TextLabel"
	local t_4 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		FontFace = bodyTextProperties.FontFace,
		RichText = true,
		Size = UDim2.new(1, 0, 0, 0),
		Text = var76,
		TextColor3 = bodyTextProperties.TextColor3,
		TextSize = var73,
		TextStrokeColor3 = bodyTextProperties.TextStrokeColor3
	}
	local textStrokeTransparency = bodyTextProperties.TextStrokeTransparency
	t_4.TextStrokeTransparency = p19.textTransparency:map(function(p29) --[[ line: 113 ]]
		-- upvalues: textStrokeTransparency (ref)
		return if textStrokeTransparency == nil then 1 else textStrokeTransparency + p29 * (1 - textStrokeTransparency)
	end)
	local var92 = 0
	t_4.TextTransparency = p19.textTransparency:map(function(p30) --[[ line: 113 ]]
		-- upvalues: var92 (ref)
		return if var92 == nil then 1 else var92 + p30 * (1 - var92)
	end)
	t_4.TextWrapped = true
	t_4.TextXAlignment = Enum.TextXAlignment.Left
	t_4.TextYAlignment = Enum.TextYAlignment.Top
	t_4[reactModule.Event.Activated] = if fFlagExpChatRewriteInlineModule and p19.wasRewritten then p19.onTextBodyActivated else nil
	t_4.Interactable = var79
	t_3.BodyText = createElement_2(var90, t_4)
	
	if string.len(prefixText) == 0 then
		createElement_3 = nil
	else
		local createElement_4
		createElement_3 = reactModule.createElement
		local var93 = "Frame"
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
				SelectionImageObject = var77,
				Size = UDim2.new(0, 0, 0, 0),
				Text = var75,
				TextSize = prefixTextProperties.TextSize,
				TextStrokeTransparency = 1,
				TextTransparency = 1,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 1,
				[reactModule.Event.Activated] = function() --[[ line: 544 ]]
					-- upvalues: p19 (ref)
					p19.onTextMessageLabelButtonActivated(p19.message)
				end
			})
		}
		
		if showTranslationButton then
			createElement_4 = reactModule.createElement
			local var96 = "ImageButton"
			local t_7 = {
				BackgroundTransparency = 1,
				HoverImage = "rbxasset://textures/translateIconDark.png",
				Image = "rbxasset://textures/translateIcon.png"
			}
			local var98 = 0
			t_7.ImageTransparency = p19.textTransparency:map(function(p31) --[[ line: 113 ]]
				-- upvalues: var98 (ref)
				return if var98 == nil then 1 else var98 + p31 * (1 - var98)
			end)
			t_7.LayoutOrder = 2
			t_7.PressedImage = "rbxasset://textures/translateIconDark.png"
			t_7.SelectionImageObject = var77
			t_7.Size = UDim2.new(0, var74, 0, var74)
			
			t_7[reactModule.Event.Activated] = function() --[[ line: 559 ]]
				-- upvalues: p19 (ref)
				p19.onToggle(not p19.message.useTranslation, p19.message.messageId)
			end
			
			createElement_4 = createElement_4(var96, t_7)
		else
			createElement_4 = nil
		end
		t_6.TranslationButton = createElement_4
		createElement_3 = createElement_3(var93, t_5, t_6)
	end
	t_3.TextMessageButton = createElement_3
	t_1.TextMessage = createElement_1(var83, t_2, t_3)
	createElement = createElement(var80, t, t_1)
	
	if fFlagDebugMessageProfilingModule then
		debug.profileend()
	end
	return createElement
end

local function TranslatedTextMessageWithToggle(_) --[[ line: 574 ]]
	-- upvalues: roactRoduxModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), var53 (ref)
	return roactRoduxModule.connect(function() --[[ line: 575 ]] end, function(p32) --[[ line: 575 ]]
		-- upvalues: fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy)
		return {
			onToggle = function(p33, p34) --[[ line: 577 ]]
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
	end)(var53)
end

local function RewriteLabelWithButton(p35) --[[ line: 593 ]]
	-- upvalues: foundationModule (ref), localizationModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), reactModule (ref)
	local var116 = foundationModule.Hooks.useTokens()
	local var117 = localizationModule.useLocalization({
		defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel",
		rewrittenLabelText = fStringInExpChatRewriteLabelKeyModule
	})
	local var118 = if var117.rewrittenLabelText and var117.rewrittenLabelText ~= "" then var117.rewrittenLabelText else var117.defaultRewrittenLabelText
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
		Text = "(" .. var118 .. ")"
	}
	local t_3 = { Color3 = var116.Color.Content.Muted.Color3 }
	local transparency = var116.Color.Content.Muted.Transparency
	t_3.Transparency = p35.textTransparency:map(function(p36) --[[ line: 113 ]]
		-- upvalues: transparency (ref)
		return if transparency == nil then 1 else transparency + p36 * (1 - transparency)
	end)
	t_2.textStyle = t_3
	local t_4 = { Color = Color3.fromRGB(0, 0, 0) }
	local var124 = 0.5
	t_4.Transparency = p35.textTransparency:map(function(p37) --[[ line: 113 ]]
		-- upvalues: var124 (ref)
		return if var124 == nil then 1 else var124 + p37 * (1 - var124)
	end)
	t_4.Thickness = var116.Stroke.Thin
	t_2.stroke = t_4
	t_1.Label = createElement_1(text, t_2)
	t_1.IconButton = reactModule.createElement(foundationModule.IconButton, {
		isCircular = true,
		LayoutOrder = 2,
		size = foundationModule.Enums.InputSize.XSmall,
		icon = if p35.isRewriteMenuOpen then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown,
		variant = foundationModule.Enums.ButtonVariant.Utility,
		Visible = p35.textTransparency:map(function(p38) --[[ line: 631 ]]
			return p38 < 1
		end),
		onActivated = p35.onActivated
	})
	
	return createElement(view, t, t_1)
end

return reactModule.memo(function(p39) --[[ line: 639 | named "TranslatedTextMessageWrapper" ]]
	-- upvalues: getMessageSettingsModule (ref), fFlagEnableInExpChatRewriteModule (ref), useARButtonRightPadding (ref), fIntExpChatDefaultARButtonPaddingModule (ref), localizationModule (ref), fStringInExpChatRewriteReasonKeyModule (ref), foundationModule (ref), reactModule (ref), fFlagExpChatRewriteToggleAnalyticsModule (ref), expChatSharedModule (ref), fFlagExpChatRewriteInlineIxpEnabledModule (ref), IXPService (ref), fStringExpChatRewriteInlineIxpLayerModule (ref), fFlagExpChatRewriteInlineModule (ref), dictionary (ref), TranslatedTextMessageWithToggle (ref), var53 (ref), RewriteLabelWithButton (ref)
	local var125 = getMessageSettingsModule(p39.message, p39.chatWindowSettings)
	local showTranslationButton = p39.showTranslationButton
	local var126 = nil
	local _ = nil
	local var127 = nil
	local _ = nil
	local var128 = nil
	local originalText = nil
	local var129 = false
	local wasRewritten = false
	local var130 = 0
	local var131 = ""
	
	if fFlagEnableInExpChatRewriteModule then
		var130 = math.max(useARButtonRightPadding() - fIntExpChatDefaultARButtonPaddingModule, 0)
		local var132 = localizationModule.useLocalization({
			defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel",
			rewrittenReasonLabelText = fStringInExpChatRewriteReasonKeyModule
		})
		var131 = if var132.rewrittenReasonLabelText and var132.rewrittenReasonLabelText ~= "" then var132.rewrittenReasonLabelText else var132.defaultRewrittenReasonLabelText
		var126 = foundationModule.Hooks.useTokens()
		local var133, var134 = reactModule.useState(false)
		var127 = var133
		local var135 = var134
		wasRewritten = var125.wasRewritten
		originalText = var125.originalText
		var129 = wasRewritten and (originalText ~= nil and originalText ~= "")
		var128 = reactModule.useCallback(function() --[[ line: 670 ]]
			-- upvalues: fFlagExpChatRewriteToggleAnalyticsModule (copy), expChatSharedModule (copy), p39 (ref), var127 (write), var129 (write), var135 (write)
			if fFlagExpChatRewriteToggleAnalyticsModule then
				expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.RewriteDropdownToggledConfig, {
					messageId = p39.message.messageId,
					isDropdownOpen = tostring(var127),
					showOriginalText = tostring(var129)
				}, expChatSharedModule.Analytics.DefaultStandardizedFields)
			end
			var135(function(p40) --[[ line: 678 ]]
				return not p40
			end)
		end, { var127, var129, p39.message.messageId })
		
		if fFlagExpChatRewriteInlineIxpEnabledModule then
			reactModule.useEffect(function() --[[ line: 684 ]]
				-- upvalues: wasRewritten (write), IXPService (copy), fStringExpChatRewriteInlineIxpLayerModule (copy)
				if wasRewritten then
					IXPService:LogFlagLinkedUserLayerExposure(fStringExpChatRewriteInlineIxpLayerModule)
				end
			end, { wasRewritten })
		end
	end
	local _ = nil
	local var136 = p39
	
	if fFlagExpChatRewriteInlineModule and wasRewritten then
		var136 = dictionary.join(var136, {
			LayoutOrder = 1,
			isRewriteMenuOpen = var127,
			wasRewritten = wasRewritten,
			onTextBodyActivated = var128
		})
	elseif fFlagEnableInExpChatRewriteModule and wasRewritten then
		var136 = dictionary.join(var136, { LayoutOrder = 1 })
	end
	local var138
	local var137 = if showTranslationButton then reactModule.createElement(TranslatedTextMessageWithToggle, var136) else reactModule.createElement(var53, var136)
	
	if fFlagEnableInExpChatRewriteModule and wasRewritten then
		local var141
		var138 = reactModule.createElement
		local view = foundationModule.View
		local t = {
			tag = `size-full-0 auto-y align-y-top col{if fFlagExpChatRewriteInlineModule then " gap-xsmall" else ""}`,
			LayoutOrder = p39.LayoutOrder
		}
		local t_1 = {
			UIPadding = if var127 then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 4) }) else nil,
			TranslatedTextMessage = var137,
			RewriteLabelWithButton = if wasRewritten and not fFlagExpChatRewriteInlineModule then reactModule.createElement(RewriteLabelWithButton, {
				LayoutOrder = 2,
				onActivated = var128,
				isRewriteMenuOpen = var127,
				transparencyValue = p39.transparencyValue,
				textTransparency = p39.textTransparency
			}) else nil
		}
		
		if var127 then
			local createElement
			var141 = reactModule.createElement
			local view_1 = foundationModule.View
			local t_2 = {
				tag = "align-x-left col radius-medium gap-xxsmall padding-small",
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -fIntExpChatDefaultARButtonPaddingModule, 0, 0)
			}
			local t_3 = { Color3 = var126.Color.Common.Scrim.Color3 }
			local var144 = 0.7
			t_3.Transparency = p39.transparencyValue:map(function(p41) --[[ line: 113 ]]
				-- upvalues: var144 (ref)
				return if var144 == nil then 1 else var144 + p41 * (1 - var144)
			end)
			t_2.backgroundStyle = t_3
			local t_4 = {}
			
			if var129 then
				createElement = reactModule.createElement
				local text = foundationModule.Text
				local t_5 = {
					tag = "text-body-small text-align-x-left",
					LayoutOrder = 1,
					RichText = true,
					TextWrapped = true,
					Text = originalText,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, -var130, 0, 0)
				}
				local t_6 = { Color3 = var126.Color.Content.Muted.Color3 }
				local transparency = var126.Color.Content.Muted.Transparency
				t_6.Transparency = p39.textTransparency:map(function(p42) --[[ line: 113 ]]
					-- upvalues: transparency (ref)
					return if transparency == nil then 1 else transparency + p42 * (1 - transparency)
				end)
				t_5.textStyle = t_6
				local t_7 = { Color = Color3.fromRGB(0, 0, 0) }
				local var149 = 0.5
				t_7.Transparency = p39.textTransparency:map(function(p43) --[[ line: 113 ]]
					-- upvalues: var149 (ref)
					return if var149 == nil then 1 else var149 + p43 * (1 - var149)
				end)
				t_7.Thickness = var126.Stroke.Thin
				t_5.stroke = t_7
				createElement = createElement(text, t_5)
			else
				createElement = nil
			end
			t_4.OriginalText = createElement
			t_4.Divider = if var129 then reactModule.createElement(foundationModule.Divider, {
				LayoutOrder = 2,
				orientation = foundationModule.Enums.Orientation.Horizontal,
				Visible = p39.textTransparency:map(function(p44) --[[ line: 772 ]]
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
				Text = var131,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -var130, 0, 0)
			}
			local t_6 = { Color3 = var126.Color.Content.Default.Color3 }
			local transparency = var126.Color.Content.Default.Transparency
			t_6.Transparency = p39.textTransparency:map(function(p45) --[[ line: 113 ]]
				-- upvalues: transparency (ref)
				return if transparency == nil then 1 else transparency + p45 * (1 - transparency)
			end)
			t_5.textStyle = t_6
			local t_7 = { Color = Color3.fromRGB(0, 0, 0) }
			local var153 = 0.5
			t_7.Transparency = p39.textTransparency:map(function(p46) --[[ line: 113 ]]
				-- upvalues: var153 (ref)
				return if var153 == nil then 1 else var153 + p46 * (1 - var153)
			end)
			t_7.Thickness = var126.Stroke.Thin
			t_5.stroke = t_7
			t_4.ReasoningText = createElement_1(text, t_5)
			var141 = var141(view_1, t_2, t_4)
		else
			var141 = nil
		end
		t_1.DropdownMenu = var141
		var138 = var138(view, t, t_1)
	else
		var138 = var137
	end
	return var138
end, function(p47, p48) --[[ line: 812 | named "areEqual" ]]
	-- upvalues: fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagExpChatRewriteInlineModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPresetChatEnabled (ref)
	local var154 = false
	
	if p47.message.text == p48.message.text then
		var154 = false
		
		if p47.message.prefixText == p48.message.prefixText then
			var154 = false
			
			if p47.message.translation == p48.message.translation then
				var154 = false
				
				if p47.message.useTranslation == p48.message.useTranslation then
					var154 = false
					
					if p47.message.messageId == p48.message.messageId then
						if fFlagExpChatFixLocalUserVerifiedBadgeModule then
							var154 = false
							
							if p47.message.userId == p48.message.userId then
								local _ = p47.isUserVerified == p48.isUserVerified
							end
						else
							var154 = true
						end
						if var154 then
							var154 = false
							
							if p47.chatWindowSettings == p48.chatWindowSettings then
								if fFlagEnableInExpChatRewriteModule then
									var154 = false
									
									if p47.message.wasRewritten == p48.message.wasRewritten then
										var154 = p47.message.originalText == p48.message.originalText
										var154 = nil
									end
								else
									var154 = true
								end
								if var154 then
									if fFlagExpChatRewriteInlineModule then
										var154 = p47.chatWindowTransparencyBindable == p48.chatWindowTransparencyBindable
										var154 = nil
									else
										var154 = true
									end
									if var154 then
										if fFlagEnableInExpChatSummaryOnLuaModule then
											var154 = p47.message.chatActionType == p48.message.chatActionType
											var154 = nil
										else
											var154 = true
										end
										if var154 then
											if fFlagExpChatPresetChatEnabled then
												return p47.message.presetId == p48.message.presetId
											end
											var154 = true
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
	return var154
end)