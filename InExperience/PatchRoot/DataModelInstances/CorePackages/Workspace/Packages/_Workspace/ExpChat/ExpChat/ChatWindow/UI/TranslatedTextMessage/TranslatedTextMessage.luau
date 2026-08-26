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

local function useARButtonRightPadding()
	-- upvalues: fFlagExpChatPresetChatEnabled (ref), fFlagExpChatTopBannerForPresetChatAccessModule (ref), useIsARButtonVisibleModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), signalsReactModule (ref), showChatEnabledUIModule (ref), isChatRegionLockedModule (ref)
	if fFlagExpChatPresetChatEnabled and fFlagExpChatTopBannerForPresetChatAccessModule then
		return if useIsARButtonVisibleModule() then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
	end
	local _ = 0
	local _ = nil
	local _ = nil
	
	return if not isChatRegionLockedModule() and (if fFlagAEGIS2EnableGatesForExpChatModule then showChatEnabledUIModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus)) else true) then fIntExpChatVisibleARButtonPaddingModule else fIntExpChatDefaultARButtonPaddingModule
end

local function appendTrustedIndicator(p1, p2, p3, p4, p5)
	local var3 = p5.Color.Shift.Shift_300.Color3:ToHex()
	local transparency = p5.Color.Shift.Shift_300.Transparency
	local transparency_1 = p5.Color.Content.Emphasis.Transparency
	local var4 = `{`{`{`{`<mark color='#{var56}' transparency='{transparency + p12 * (1 - transparency)}'>`}<font transparency='1' weight='{600}' size='{p13 - 4}'><stroke transparency='1'>_`}<font color='#{p14.Color.Content.Emphasis.Color3:ToHex()}' transparency='{transparency_1 + p12 * (1 - transparency_1)}'>{p2}</font>`}_</stroke></font>`}</mark>`
	
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
	-- upvalues: fFlagDebugMessageProfilingModule (ref), reactModule (ref), expChatPerfTracker (ref), localizationModule (ref), fFlagExpChatRewriteInlineModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), foundationModule (ref), getMessageSettingsModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), isExperienceChatUserProfileApiEnabledModule (ref), var2 (ref), getFFlagExpChatExcludeFOMORendersModule (ref), signalsModule (ref), playersService (ref), var3 (ref), signalsReactModule (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), fFlagExpChatUseChannelTabsStore (ref), useStore (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), var1 (ref), getChannelTabsStoreModule (ref), textChatService (ref), appendTrustedIndicator (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPolishSummaryMessageUIModule (ref), textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconRichText (ref), expChatTranslationToggleSpacingFix (ref), duplicateInvisibleTextModule (ref), useCursor (ref), fFlagEnableInExpChatRewriteModule (ref), useARButtonRightPadding (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), showChatEnabledUIModule (ref), isChatRegionLockedModule (ref), fIntExpChatVisibleARButtonPaddingModule (ref), fIntExpChatDefaultARButtonPaddingModule (ref), fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (ref)
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
		rewrittenLabelText = if fFlagExpChatRewriteInlineModule then fStringInExpChatRewriteLabelKeyModule else nil,
		defaultRewrittenLabelText = if fFlagExpChatRewriteInlineModule then "CoreScripts.TextChat.ChatWindow.RewrittenLabel" else nil
	})
	local var7 = nil
	
	if fFlagExpChatRewriteInlineModule then
		var7 = if var6.rewrittenLabelText and var6.rewrittenLabelText ~= "" then var6.rewrittenLabelText else var6.defaultRewrittenLabelText
	end
	local var8 = foundationModule.Hooks.useTokens()
	local var9 = getMessageSettingsModule(p1.message, p1.chatWindowSettings)
	local showTranslationButton = p1.showTranslationButton
	local var10 = getMessageText(var9.useTranslation, var9.translation, var9.text)
	local prefixText = var9.prefixText or ""
	local var11 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() and p1.message.textChannel == nil then
		var11 = nil
	elseif isExperienceChatUserProfileApiEnabledModule() and p1.message.userId then
		if fFlagDebugMessageProfilingModule then
			debug.profilebegin("useCombinedName")
		end
		var11 = var2(p1.message)
		
		if fFlagDebugMessageProfilingModule then
			debug.profileend()
		end
	end
	local _ = nil
	local userId = p1.message.userId and tostring(p1.message.userId)
	local var12 = if getFFlagExpChatExcludeFOMORendersModule() then p1.message.isHiddenMessage else nil
	local var13 = signalsReactModule.useSignalBinding(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), userId (ref), playersService (copy), var12 (ref), var3 (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: userId (copy), playersService (copy), var12 (copy), var3 (copy)
			local userId_1 = playersService.LocalPlayer and (playersService.LocalPlayer.UserId and tostring(playersService.LocalPlayer.UserId))
			
			return if userId and userId ~= "" and (not (userId_1 and userId_1 == userId) and not var12) then var3.getIsTrustedConnection(userId).data(p2) else nil
		end)
	end, { userId, var12 }))
	local var14 = if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule and not fFlagExpChatUseChannelTabsStore then useStore() else nil
	
	if getFFlagExpChatUseUpdatedMessageRenderedModule() then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), shouldSendHighFrequencyTelemetryModule (copy), var1 (copy), getFFlagExpChatExcludeFOMORendersModule (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), var14 (ref), textChatService (copy)
			if p1.message.textChatMessageInstance and shouldSendHighFrequencyTelemetryModule(var1) and (not getFFlagExpChatExcludeFOMORendersModule() or not p1.message.isHiddenMessage) then
				if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
					local var15 = -1
					
					if fFlagExpChatUseChannelTabsStore then
						local var16 = getChannelTabsStoreModule(false)
						local channelTabsState = var16.getChannelTabsState(false)
						local selectedTabName = var16.getSelectedTabName(false)
						
						if selectedTabName and channelTabsState.allChannelTabs[selectedTabName] then
							var15 = channelTabsState.allChannelTabs[selectedTabName].tabIndex
						end
					else
						local channelTabs = var14:getState().ChannelTabs
						local selectedTabName = channelTabs and channelTabs.selectedTabName
						
						if selectedTabName and channelTabs.allChannelTabs[selectedTabName] then
							var15 = channelTabs.allChannelTabs[selectedTabName].TabIndex
						end
					end
					textChatService:SendExpChatMessageClientRendered(p1.message.textChatMessageInstance, "chat_window", var15)
					
					return
				else
					textChatService:SendExpChatMessageClientRendered(p1.message.textChatMessageInstance, "chat_window")
				end
			end
		end, {})
	end
	local bodyTextProperties = var9.bodyTextProperties
	local prefixTextProperties = var9.prefixTextProperties
	local var15 = if isSpatialUIEnabled then var5 else bodyTextProperties.TextSize
	local var16 = var15 - 2
	local var17 = reactModule.joinBindings({
		reactModule.joinBindings(if var11 ~= nil then {} else { var11.displayName, var11.inExperienceCombinedName }):map(function(p2)
			-- upvalues: prefixText (ref), p1 (ref)
			local var18 = p2[1] or ""
			local var19 = p2[2] or ""
			local var20 = prefixText
			
			if string.len(var18) > 0 and string.len(var19) > 0 and var18 ~= var19 then
				var20 = string.gsub(var20, var18, var19)
			end
			if string.len(prefixText) > 0 and p1.isUserVerified then
				var20 = appendVerifiedBadge(var20)
			end
			return var20
		end),
		var13,
		p1.textTransparency
	}):map(function(p2)
		-- upvalues: prefixText (ref), appendTrustedIndicator (copy), var6 (ref), prefixTextProperties (ref), var8 (ref)
		local var18 = p2[1] or ""
		local var19 = p2[2] or false
		local var20 = p2[3]
		
		if var20 == nil then
			var20 = 1
		end
		if string.len(prefixText) == 0 then
			return var18
		elseif var19 then
			var18 = appendTrustedIndicator(var18, var6.trustedLabelText, var20, prefixTextProperties.TextSize, var8)
		end
		return var18
	end)
	var17 = var17:map(function(p2)
		-- upvalues: prefixText (ref)
		return if string.len(prefixText) == 0 then p2 else trim(p2)
	end)
	local var18 = var17:map(function(p2)
		-- upvalues: var10 (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagExpChatPolishSummaryMessageUIModule (copy), var15 (ref), var8 (ref), p1 (ref), textChatMessageChatActionTypeModule (copy), summaryMessageRichTextModule (copy), fFlagExpChatPresetChatEnabled (copy), isPresetMessage (copy), getPresetIconRichText (copy), prefixText (ref), showTranslationButton (ref), expChatTranslationToggleSpacingFix (copy), duplicateInvisibleTextModule (copy), prefixTextProperties (ref)
		local var19 = var10
		
		if fFlagEnableInExpChatSummaryOnLuaModule then
			local var20 = if fFlagExpChatPolishSummaryMessageUIModule then var15 else nil
			local var21 = var8
			local var22 = var10 or ""
			
			if p1.message.chatActionType == textChatMessageChatActionTypeModule.Summary then
				var22 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(var20) .. " " .. var65_1, var21.Color.Content.Muted.Color3:ToHex(), var20)
			end
			var19 = var22
		end
		if fFlagExpChatPresetChatEnabled and isPresetMessage(p1.message) then
			var19 ..= ` {getPresetIconRichText(var15)}`
		end
		if string.len(prefixText) == 0 then
			return if fFlagEnableInExpChatSummaryOnLuaModule then var19 else var10
		elseif showTranslationButton then
			var19 = if expChatTranslationToggleSpacingFix then "     " .. var110 else "   " .. var110
		end
		return duplicateInvisibleTextModule(p2, prefixTextProperties.FontFace, prefixTextProperties.TextSize) .. " " .. var110
	end)
	
	if fFlagExpChatRewriteInlineModule then
		var18 = reactModule.joinBindings({ var18 }):map(function(p2)
			-- upvalues: p1 (ref), foundationModule (copy), prefixTextProperties (ref), var8 (ref), var7 (write)
			local var19 = p2[1] or ""
			
			return if p1.wasRewritten then `{var19} <font size='{prefixTextProperties.TextSize - 4}' color='#{var63.Color.Content.Muted.Color3:ToHex()}'>{`({var7})`}<font transparency='1'><stroke transparency='1'>_</stroke></font>{`<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{if p1.isRewriteMenuOpen then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown}</font>`}</font>` else var19
		end)
	end
	local UIPadding
	local var19 = useCursor()
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
	local var20 = nil
	
	if fFlagExpChatRewriteInlineModule and p1.wasRewritten then
		if p1.chatWindowTransparencyBindable == nil then
			var20 = true
		elseif typeof(p1.chatWindowTransparencyBindable) == "number" then
			var20 = p1.chatWindowTransparencyBindable < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
			var20 = nil
		else
			var20 = p1.chatWindowTransparencyBindable:map(function(p2)
				-- upvalues: fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (copy)
				return p2 < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
			end)
		end
	end
	local createElement = reactModule.createElement
	local var21 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.LayoutOrder
	}
	local t_1 = { UIPadding = UIPadding }
	local createElement_1 = reactModule.createElement
	local var22 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_3 = {}
	local var23 = false
	
	if string.len(prefixText) > 0 then
		var23 = reactModule.createElement
		local var24 = "TextLabel"
		local t_4 = {
			BackgroundTransparency = 1,
			RichText = true,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.XY,
			FontFace = prefixTextProperties.FontFace,
			Text = var17,
			TextColor3 = prefixTextProperties.TextColor3,
			TextSize = prefixTextProperties.TextSize,
			TextStrokeColor3 = prefixTextProperties.TextStrokeColor3
		}
		local textStrokeTransparency = prefixTextProperties.TextStrokeTransparency
		t_4.TextStrokeTransparency = p1.textTransparency:map(function(p2)
			-- upvalues: textStrokeTransparency (ref)
			return if textStrokeTransparency == nil then 1 else textStrokeTransparency + p2 * (1 - textStrokeTransparency)
		end)
		local var25 = 0
		t_4.TextTransparency = p1.textTransparency:map(function(p2)
			-- upvalues: var25 (ref)
			return if var25 == nil then 1 else var25 + p2 * (1 - var25)
		end)
		t_4.TextXAlignment = Enum.TextXAlignment.Left
		t_4.TextYAlignment = Enum.TextYAlignment.Top
		var23 = var23(var24, t_4, {
			UIGradient = prefixTextProperties.UIGradient ~= nil and reactModule.createElement("UIGradient", prefixTextProperties.UIGradient)
		})
	end
	local createElement_3
	t_3.PrefixText = var23
	local createElement_2 = reactModule.createElement
	local var26 = if fFlagExpChatRewriteInlineModule and p1.wasRewritten then "TextButton" else "TextLabel"
	local t_4 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		FontFace = bodyTextProperties.FontFace,
		RichText = true,
		Size = UDim2.new(1, 0, 0, 0),
		Text = var18,
		TextColor3 = bodyTextProperties.TextColor3,
		TextSize = var15,
		TextStrokeColor3 = bodyTextProperties.TextStrokeColor3
	}
	local textStrokeTransparency = bodyTextProperties.TextStrokeTransparency
	t_4.TextStrokeTransparency = p1.textTransparency:map(function(p2)
		-- upvalues: textStrokeTransparency (ref)
		return if textStrokeTransparency == nil then 1 else textStrokeTransparency + p2 * (1 - textStrokeTransparency)
	end)
	local var27 = 0
	t_4.TextTransparency = p1.textTransparency:map(function(p2)
		-- upvalues: var27 (ref)
		return if var27 == nil then 1 else var27 + p2 * (1 - var27)
	end)
	t_4.TextWrapped = true
	t_4.TextXAlignment = Enum.TextXAlignment.Left
	t_4.TextYAlignment = Enum.TextYAlignment.Top
	t_4[reactModule.Event.Activated] = if fFlagExpChatRewriteInlineModule and p1.wasRewritten then p1.onTextBodyActivated else nil
	t_4.Interactable = var20
	t_3.BodyText = createElement_2(var26, t_4)
	
	if string.len(prefixText) == 0 then
		createElement_3 = nil
	else
		local createElement_4
		createElement_3 = reactModule.createElement
		local var28 = "Frame"
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
				SelectionImageObject = var19,
				Size = UDim2.new(0, 0, 0, 0),
				Text = var17,
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
			local var29 = "ImageButton"
			local t_7 = {
				BackgroundTransparency = 1,
				HoverImage = "rbxasset://textures/translateIconDark.png",
				Image = "rbxasset://textures/translateIcon.png"
			}
			local var30 = 0
			t_7.ImageTransparency = p1.textTransparency:map(function(p2)
				-- upvalues: var30 (ref)
				return if var30 == nil then 1 else var30 + p2 * (1 - var30)
			end)
			t_7.LayoutOrder = 2
			t_7.PressedImage = "rbxasset://textures/translateIconDark.png"
			t_7.SelectionImageObject = var19
			t_7.Size = UDim2.new(0, var16, 0, var16)
			
			t_7[reactModule.Event.Activated] = function()
				-- upvalues: p1 (ref)
				p1.onToggle(not p1.message.useTranslation, p1.message.messageId)
			end
			
			createElement_4 = createElement_4(var29, t_7)
		else
			createElement_4 = nil
		end
		t_6.TranslationButton = createElement_4
		createElement_3 = createElement_3(var28, t_5, t_6)
	end
	t_3.TextMessageButton = createElement_3
	t_1.TextMessage = createElement_1(var22, t_2, t_3)
	createElement = createElement(var21, t, t_1)
	
	if fFlagDebugMessageProfilingModule then
		debug.profileend()
	end
	return createElement
end

local function TranslatedTextMessageWithToggle(_)
	-- upvalues: roactRoduxModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), var4 (ref)
	return roactRoduxModule.connect(function() end, function(p2)
		-- upvalues: fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy)
		return {
			onToggle = function(p3, p4)
				-- upvalues: fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), p2 (ref)
				if fFlagExpChatUseMessagesStore then
					getMessagesStoreModule(false).toggleMessageTranslation(p3, p4)
					
					return
				end
				p2({
					type = "ChatTranslationMessageToggled",
					useTranslation = p3,
					messageId = p4
				})
			end
		}
	end)(var4)
end

local function RewriteLabelWithButton(p2)
	-- upvalues: foundationModule (ref), localizationModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), reactModule (ref)
	local var31 = foundationModule.Hooks.useTokens()
	local var32 = localizationModule.useLocalization({
		defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel",
		rewrittenLabelText = fStringInExpChatRewriteLabelKeyModule
	})
	local var33 = if var32.rewrittenLabelText and var32.rewrittenLabelText ~= "" then var32.rewrittenLabelText else var32.defaultRewrittenLabelText
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
		Text = "(" .. var117 .. ")"
	}
	local t_3 = { Color3 = var31.Color.Content.Muted.Color3 }
	local transparency = var31.Color.Content.Muted.Transparency
	t_3.Transparency = p2.textTransparency:map(function(p3)
		-- upvalues: transparency (ref)
		return if transparency == nil then 1 else transparency + p3 * (1 - transparency)
	end)
	t_2.textStyle = t_3
	local t_4 = { Color = Color3.fromRGB(0, 0, 0) }
	local var34 = 0.5
	t_4.Transparency = p2.textTransparency:map(function(p3)
		-- upvalues: var34 (ref)
		return if var34 == nil then 1 else var34 + p3 * (1 - var34)
	end)
	t_4.Thickness = var31.Stroke.Thin
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
	-- upvalues: getMessageSettingsModule (ref), fFlagEnableInExpChatRewriteModule (ref), useARButtonRightPadding (ref), fIntExpChatDefaultARButtonPaddingModule (ref), localizationModule (ref), fStringInExpChatRewriteReasonKeyModule (ref), foundationModule (ref), reactModule (ref), fFlagExpChatRewriteToggleAnalyticsModule (ref), expChatSharedModule (ref), fFlagExpChatRewriteInlineIxpEnabledModule (ref), IXPService (ref), fStringExpChatRewriteInlineIxpLayerModule (ref), fFlagExpChatRewriteInlineModule (ref), dictionary (ref), TranslatedTextMessageWithToggle (ref), var4 (ref), RewriteLabelWithButton (ref)
	local var31 = getMessageSettingsModule(p2.message, p2.chatWindowSettings)
	local showTranslationButton = p2.showTranslationButton
	local var32 = nil
	local _ = nil
	local var33 = nil
	local _ = nil
	local var34 = nil
	local originalText = nil
	local var35 = false
	local wasRewritten = false
	local var36 = 0
	local var37 = ""
	
	if fFlagEnableInExpChatRewriteModule then
		var36 = math.max(useARButtonRightPadding() - fIntExpChatDefaultARButtonPaddingModule, 0)
		local var38 = localizationModule.useLocalization({
			defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel",
			rewrittenReasonLabelText = fStringInExpChatRewriteReasonKeyModule
		})
		var37 = if var38.rewrittenReasonLabelText and var38.rewrittenReasonLabelText ~= "" then var38.rewrittenReasonLabelText else var38.defaultRewrittenReasonLabelText
		var32 = foundationModule.Hooks.useTokens()
		local var39, var40 = reactModule.useState(false)
		var33 = var39
		local var41 = var40
		wasRewritten = var31.wasRewritten
		originalText = var31.originalText
		var35 = wasRewritten and (originalText ~= nil and originalText ~= "")
		var34 = reactModule.useCallback(function()
			-- upvalues: fFlagExpChatRewriteToggleAnalyticsModule (copy), expChatSharedModule (copy), p2 (ref), var33 (write), var35 (write), var41 (write)
			if fFlagExpChatRewriteToggleAnalyticsModule then
				expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.RewriteDropdownToggledConfig, {
					messageId = p2.message.messageId,
					isDropdownOpen = tostring(var33),
					showOriginalText = tostring(var35)
				}, expChatSharedModule.Analytics.DefaultStandardizedFields)
			end
			var41(function(p3)
				return not p3
			end)
		end, { var33, var35, p2.message.messageId })
		
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
	local var42 = p2
	
	if fFlagExpChatRewriteInlineModule and wasRewritten then
		var42 = dictionary.join(var42, {
			LayoutOrder = 1,
			isRewriteMenuOpen = var33,
			wasRewritten = wasRewritten,
			onTextBodyActivated = var34
		})
	elseif fFlagEnableInExpChatRewriteModule and wasRewritten then
		var42 = dictionary.join(var42, { LayoutOrder = 1 })
	end
	local var43
	local var44 = if showTranslationButton then reactModule.createElement(TranslatedTextMessageWithToggle, var42) else reactModule.createElement(var4, var42)
	
	if fFlagEnableInExpChatRewriteModule and wasRewritten then
		local var45
		var43 = reactModule.createElement
		local view = foundationModule.View
		local t = {
			tag = `size-full-0 auto-y align-y-top col{if fFlagExpChatRewriteInlineModule then " gap-xsmall" else ""}`,
			LayoutOrder = p2.LayoutOrder
		}
		local t_1 = {
			UIPadding = if var33 then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 4) }) else nil,
			TranslatedTextMessage = var44,
			RewriteLabelWithButton = if wasRewritten and not fFlagExpChatRewriteInlineModule then reactModule.createElement(RewriteLabelWithButton, {
				LayoutOrder = 2,
				onActivated = var34,
				isRewriteMenuOpen = var33,
				transparencyValue = p2.transparencyValue,
				textTransparency = p2.textTransparency
			}) else nil
		}
		
		if var33 then
			local createElement
			var45 = reactModule.createElement
			local view_1 = foundationModule.View
			local t_2 = {
				tag = "align-x-left col radius-medium gap-xxsmall padding-small",
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -fIntExpChatDefaultARButtonPaddingModule, 0, 0)
			}
			local t_3 = { Color3 = var32.Color.Common.Scrim.Color3 }
			local var46 = 0.7
			t_3.Transparency = p2.transparencyValue:map(function(p3)
				-- upvalues: var46 (ref)
				return if var46 == nil then 1 else var46 + p3 * (1 - var46)
			end)
			t_2.backgroundStyle = t_3
			local t_4 = {}
			
			if var35 then
				createElement = reactModule.createElement
				local text = foundationModule.Text
				local t_5 = {
					tag = "text-body-small text-align-x-left",
					LayoutOrder = 1,
					RichText = true,
					TextWrapped = true,
					Text = originalText,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, -var36, 0, 0)
				}
				local t_6 = { Color3 = var32.Color.Content.Muted.Color3 }
				local transparency = var32.Color.Content.Muted.Transparency
				t_6.Transparency = p2.textTransparency:map(function(p3)
					-- upvalues: transparency (ref)
					return if transparency == nil then 1 else transparency + p3 * (1 - transparency)
				end)
				t_5.textStyle = t_6
				local t_7 = { Color = Color3.fromRGB(0, 0, 0) }
				local var47 = 0.5
				t_7.Transparency = p2.textTransparency:map(function(p3)
					-- upvalues: var47 (ref)
					return if var47 == nil then 1 else var47 + p3 * (1 - var47)
				end)
				t_7.Thickness = var32.Stroke.Thin
				t_5.stroke = t_7
				createElement = createElement(text, t_5)
			else
				createElement = nil
			end
			t_4.OriginalText = createElement
			t_4.Divider = if var35 then reactModule.createElement(foundationModule.Divider, {
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
				Text = var37,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -var36, 0, 0)
			}
			local t_6 = { Color3 = var32.Color.Content.Default.Color3 }
			local transparency = var32.Color.Content.Default.Transparency
			t_6.Transparency = p2.textTransparency:map(function(p3)
				-- upvalues: transparency (ref)
				return if transparency == nil then 1 else transparency + p3 * (1 - transparency)
			end)
			t_5.textStyle = t_6
			local t_7 = { Color = Color3.fromRGB(0, 0, 0) }
			local var48 = 0.5
			t_7.Transparency = p2.textTransparency:map(function(p3)
				-- upvalues: var48 (ref)
				return if var48 == nil then 1 else var48 + p3 * (1 - var48)
			end)
			t_7.Thickness = var32.Stroke.Thin
			t_5.stroke = t_7
			t_4.ReasoningText = createElement_1(text, t_5)
			var45 = var45(view_1, t_2, t_4)
		else
			var45 = nil
		end
		t_1.DropdownMenu = var45
		var43 = var43(view, t, t_1)
	else
		var43 = var44
	end
	return var43
end, function(p3, p4)
	-- upvalues: fFlagExpChatFixLocalUserVerifiedBadgeModule (ref), fFlagEnableInExpChatRewriteModule (ref), fFlagExpChatRewriteInlineModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagExpChatPresetChatEnabled (ref)
	local var49 = false
	
	if p3.message.text == p4.message.text then
		var49 = false
		
		if p3.message.prefixText == p4.message.prefixText then
			var49 = false
			
			if p3.message.translation == p4.message.translation then
				var49 = false
				
				if p3.message.useTranslation == p4.message.useTranslation then
					var49 = false
					
					if p3.message.messageId == p4.message.messageId then
						if fFlagExpChatFixLocalUserVerifiedBadgeModule then
							var49 = false
							
							if p3.message.userId == p4.message.userId then
								local _ = p3.isUserVerified == p4.isUserVerified
							end
						else
							var49 = true
						end
						if var49 then
							var49 = false
							
							if p3.chatWindowSettings == p4.chatWindowSettings then
								if fFlagEnableInExpChatRewriteModule then
									var49 = false
									
									if p3.message.wasRewritten == p4.message.wasRewritten then
										var49 = p3.message.originalText == p4.message.originalText
										var49 = nil
									end
								else
									var49 = true
								end
								if var49 then
									if fFlagExpChatRewriteInlineModule then
										var49 = p3.chatWindowTransparencyBindable == p4.chatWindowTransparencyBindable
										var49 = nil
									else
										var49 = true
									end
									if var49 then
										if fFlagEnableInExpChatSummaryOnLuaModule then
											var49 = p3.message.chatActionType == p4.message.chatActionType
											var49 = nil
										else
											var49 = true
										end
										if var49 then
											if fFlagExpChatPresetChatEnabled then
												return p3.message.presetId == p4.message.presetId
											end
											var49 = true
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
	return var49
end)