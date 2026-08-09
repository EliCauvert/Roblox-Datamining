local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local localizationModule = require(expChat.Localization)
local flags = expChat.Flags
local fFlagExpChatEnableFocusNavigationModule = require(flags.FFlagExpChatEnableFocusNavigation)
local fFlagDebugMessageProfilingModule = require(flags.FFlagDebugMessageProfiling)
local fFlagEnableInExpChatRewriteModule = require(flags.FFlagEnableInExpChatRewrite)
local fFlagExpChatRewriteInlineModule = require(flags.FFlagExpChatRewriteInline)
local fFlagExpChatRewriteToggleAnalyticsModule = require(flags.FFlagExpChatRewriteToggleAnalytics)
local fStringInExpChatRewriteLabelKeyModule = require(flags.FStringInExpChatRewriteLabelKey)
local fIntExpChatWindowTransparencyRewriteInteractableThresholdModule = require(flags.FIntExpChatWindowTransparencyRewriteInteractableThreshold)
local fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module = require(flags.FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2)
local fFlagExpChatPolishSummaryMessageUIModule = require(flags.FFlagExpChatPolishSummaryMessageUI)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatLiftMessageV2UtilsModule = require(flags.FFlagExpChatLiftMessageV2Utils)
local getPresetIconRichText = expChatSharedModule.getPresetIconRichText
local textChatMessageChatActionTypeModule = require(expChat.TextChatMessageChatActionType)
local summaryMessageRichTextModule = require(expChat.summaryMessageRichText)
local rewriteToggleModule = require(script.Parent.RewriteToggle)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getRewriteDropdownStoreModule = require(expChat.Stores.GetRewriteDropdownStore)
local fFlagLuaAppPerfTrackerUseLogger = game:DefineFastFlag("ExpChatMessageV2PerfTracking3", false) and require(parent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local getMessageTextSize = require(parent.ChatUIPrimitives).Utils.getMessageTextSize
local useFinishChatWindowMessageRenderIntervals = require(parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local configModule = require(expChat.Config)
local helpers = expChat.ChatWindow.Helpers
local duplicateInvisibleTextModule = require(helpers.duplicateInvisibleText)
local mergeBindableScalarModule = require(helpers.mergeBindableScalar)

local function _(p0, p1) --[[ line: 50 | named "calculateTransparency" ]]
	return p0 + p1 * (1 - p0)
end

local _ = function(p2) --[[ line: 54 | named "appendVerifiedBadge" ]]
	-- upvalues: configModule (ref)
	return string.gsub(p2, ":(%S-)$", configModule.VERIFIED_EMOJI .. ":%1")
end

local function trim(p3) --[[ line: 58 ]]
	return if p3:match("^()%s*$") then "" else p3:match("^%s*(.*%S)")
end

local _ = function(p4, p5) --[[ line: 62 | named "getPropertyFromObjBinding" ]]
	return p4:map(function(p6) --[[ line: 66 ]]
		-- upvalues: p5 (ref)
		return if p6 then p6[p5] else nil
	end)
end

local function appendTrustedIndicator(p7, p8, p9, p10, p11) --[[ line: 71 ]]
	local var27 = p11.Color.Shift.Shift_300.Color3:ToHex()
	local transparency = p11.Color.Shift.Shift_300.Transparency
	local transparency_1 = p11.Color.Content.Emphasis.Transparency
	local var28 = `{`{`{`{`<mark color='#{var27}' transparency='{transparency + p9 * (1 - transparency)}'>`}<font transparency='1' weight='{600}' size='{p10 - 4}'><stroke transparency='1'>_`}<font color='#{p11.Color.Content.Emphasis.Color3:ToHex()}' transparency='{transparency_1 + p9 * (1 - transparency_1)}'>{p8}</font>`}_</stroke></font>`}</mark>`
	
	return if string.find(p7, ":([%S:]-)$") then string.gsub(p7, ":([%S:]-)$", ` {var28} :%1`) else `{p7} {var28}`
end

return reactModule.memo(function(p12) --[[ line: 130 | named "TranslatedTextMessage" ]]
	-- upvalues: fFlagDebugMessageProfilingModule (ref), fFlagExpChatLiftMessageV2UtilsModule (ref), getMessageTextSize (ref), localizationModule (ref), fFlagExpChatRewriteInlineModule (ref), fFlagEnableInExpChatRewriteModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), foundationModule (ref), reactModule (ref), fFlagLuaAppPerfTrackerUseLogger (ref), useFinishChatWindowMessageRenderIntervals (ref), expChatPerfTracker (ref), getMessagesStoreModule (ref), getRewriteDropdownStoreModule (ref), fFlagExpChatRewriteToggleAnalyticsModule (ref), expChatSharedModule (ref), configModule (ref), appendTrustedIndicator (ref), trim (ref), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (ref), fFlagExpChatPolishSummaryMessageUIModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetIconRichText (ref), textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref), duplicateInvisibleTextModule (ref), fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (ref), fFlagExpChatEnableFocusNavigationModule (ref), useCursor (ref), mergeBindableScalarModule (ref), rewriteToggleModule (ref)
	if fFlagDebugMessageProfilingModule then
		debug.profilebegin("TranslatedTextMessage")
	end
	local isSpatialUIEnabled = p12.isSpatialUIEnabled
	local var29 = if fFlagExpChatLiftMessageV2UtilsModule then getMessageTextSize(p12.chatWindowSettings, isSpatialUIEnabled) elseif isSpatialUIEnabled then p12.chatWindowSettings.SpatialPanelTextSize else p12.chatWindowSettings.TextSize
	local useLocalization = localizationModule.useLocalization
	useLocalization = useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		rewrittenLabelText = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then fStringInExpChatRewriteLabelKeyModule else nil,
		defaultRewrittenLabelText = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then "CoreScripts.TextChat.ChatWindow.RewrittenLabel" else nil
	})
	local var30 = nil
	
	if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then
		var30 = if useLocalization.rewrittenLabelText and useLocalization.rewrittenLabelText ~= "" then useLocalization.rewrittenLabelText else useLocalization.defaultRewrittenLabelText
	end
	local var31 = foundationModule.Hooks.useTokens()
	local var32 = if fFlagLuaAppPerfTrackerUseLogger then if fFlagExpChatLiftMessageV2UtilsModule then useFinishChatWindowMessageRenderIntervals(if fFlagExpChatLiftMessageV2UtilsModule then reactModule.useCallback(function() --[[ line: 169 ]]
		-- upvalues: p12 (ref)
		return if p12.message and p12.message.current then p12.message.current.messageId else nil
	end, { p12.message }) else nil) else reactModule.useCallback(function() --[[ line: 179 ]]
		-- upvalues: p12 (ref), expChatPerfTracker (copy)
		local messageId = p12.message.current.messageId or "UNKNOWN_MESSAGE_ID"
		expChatPerfTracker.finish(expChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = messageId })
		expChatPerfTracker.finish(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = messageId })
	end, { p12.message }) else nil
	local var33 = if fFlagLuaAppPerfTrackerUseLogger then reactModule.useCallback(function(p13) --[[ line: 192 ]]
		-- upvalues: var32 (ref)
		if p13 and p13.Text and p13.Text ~= "" then
			var32()
		end
	end, { var32 }) else nil
	local var34 = reactModule.useCallback(function() --[[ line: 199 ]]
		-- upvalues: p12 (ref)
		p12.onTextMessageLabelButtonActivated(p12.message.current)
	end, { p12.onTextMessageLabelButtonActivated })
	local var35 = reactModule.useCallback(function() --[[ line: 203 ]]
		-- upvalues: p12 (ref), getMessagesStoreModule (copy)
		local current = p12.message.current
		getMessagesStoreModule(false).toggleMessageTranslation(not current.useTranslation, current.messageId)
	end, {})
	local var36 = if fFlagEnableInExpChatRewriteModule then reactModule.useCallback(function() --[[ line: 211 ]]
		-- upvalues: p12 (ref), getRewriteDropdownStoreModule (copy), fFlagExpChatRewriteToggleAnalyticsModule (copy), expChatSharedModule (copy)
		local current = p12.message.current
		
		if current and current.messageId then
			local var89 = getRewriteDropdownStoreModule(false)
			
			if fFlagExpChatRewriteToggleAnalyticsModule then
				expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.RewriteDropdownToggledConfig, {
					messageId = current.messageId,
					isDropdownOpen = tostring(var89.getOpenMessageId(false) == current.messageId),
					showOriginalText = tostring(current.wasRewritten and (current.originalText ~= nil and current.originalText ~= ""))
				}, expChatSharedModule.Analytics.DefaultStandardizedFields)
			end
			var89.toggleDropdown(current.messageId)
		end
	end, { p12.message }) else nil
	local list = { p12.originalPrefixText, p12.isUserVerified }
	table.insert(list, p12.isTrustedConnection)
	table.insert(list, p12.textTransparency)
	table.insert(list, p12.prefixTextProperties)
	local var38 = reactModule.joinBindings(list):map(function(p14) --[[ line: 236 ]]
		-- upvalues: configModule (copy), appendTrustedIndicator (copy), useLocalization (ref), var31 (ref)
		local var90 = p14[1]
		local var91 = p14[2]
		local var92 = var90
		
		if string.len(var90) > 0 then
			if var91 then
				var92 = string.gsub(var92, ":(%S-)$", configModule.VERIFIED_EMOJI .. ":%1")
			end
			local var93 = p14[3] or false
			local var94 = if p14[4] == nil then 1 else p14[4]
			local var95 = p14[5]
			
			if var93 then
				var92 = appendTrustedIndicator(var92, useLocalization.trustedLabelText, var94, var95.TextSize, var31)
			end
		end
		return var92
	end)
	local var39 = var38:map(trim)
	local var40 = p12.bodyTextProperties:map(function(p15) --[[ line: 265 ]]
		-- upvalues: isSpatialUIEnabled (ref), var29 (ref)
		return if isSpatialUIEnabled then var29 else p15.TextSize
	end)
	local list_1 = {
		var38,
		p12.shouldShowTranslationToggle,
		p12.originalBodyText,
		p12.prefixTextProperties
	}
	
	if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then
		table.insert(list_1, p12.wasRewritten)
		table.insert(list_1, p12.isRewriteWindowOpen)
	end
	local var42 = nil
	
	if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
		var42 = #list_1 + 1
		table.insert(list_1, p12.chatActionType)
	end
	local var43 = nil
	
	if fFlagExpChatPolishSummaryMessageUIModule or fFlagExpChatPresetChatEnabled then
		var43 = #list_1 + 1
		table.insert(list_1, var40)
	end
	local var44 = nil
	
	if fFlagExpChatPresetChatEnabled and p12.isPresetMessage ~= nil then
		var44 = #list_1 + 1
		table.insert(list_1, p12.isPresetMessage)
	end
	local var45 = reactModule.joinBindings(list_1):map(function(p16) --[[ line: 295 ]]
		-- upvalues: fFlagExpChatPresetChatEnabled (copy), var44 (write), getPresetIconRichText (copy), var43 (write), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), var42 (write), textChatMessageChatActionTypeModule (copy), fFlagExpChatPolishSummaryMessageUIModule (copy), summaryMessageRichTextModule (copy), var31 (ref), duplicateInvisibleTextModule (copy), fFlagExpChatRewriteInlineModule (copy), fFlagEnableInExpChatRewriteModule (copy), foundationModule (copy), var30 (write)
		local var96 = p16[1]
		local var97 = p16[2]
		local var98 = p16[4]
		local var99 = p16[3]
		
		if fFlagExpChatPresetChatEnabled and var44 ~= nil and p16[var44] then
			var99 ..= ` {getPresetIconRichText(p16[var43])}`
		end
		if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module and p16[var42] == textChatMessageChatActionTypeModule.Summary then
			local var100 = if fFlagExpChatPolishSummaryMessageUIModule then p16[var43] else nil
			var99 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(var100) .. " " .. var99, var31.Color.Content.Muted.Color3:ToHex(), var100)
		end
		if string.len(var96) > 0 then
			if var97 then
				var99 = "     " .. var99
			end
			var99 = duplicateInvisibleTextModule(var96, var98.FontFace, var98.TextSize) .. " " .. var99
		end
		if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then
			local var101 = p16[6]
			
			if p16[5] then
				var99 = `{var99} <font size='{var98.TextSize - 4}' color='#{var31.Color.Content.Muted.Color3:ToHex()}'>{`({var30})`}<font transparency='1'><stroke transparency='1'>_</stroke></font>{`<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{if var101 then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown}</font>`}</font>`
			end
		end
		return var99
	end)
	local var46 = var40:map(function(p17) --[[ line: 354 ]]
		return UDim2.new(0, p17 - 2, 0, p17 - 2)
	end)
	local var47 = p12.originalPrefixText:map(function(p18) --[[ line: 357 ]]
		return string.len(p18) > 0
	end)
	local var48 = "UIGradient"
	local var49 = p12.prefixTextProperties:map(function(p19) --[[ line: 66 ]]
		-- upvalues: var48 (ref)
		return if p19 then p19[var48] else nil
	end)
	local var50 = nil
	local var51 = nil
	
	if fFlagEnableInExpChatRewriteModule then
		local wasRewritten = p12.wasRewritten
		var50 = wasRewritten:map(function(p20) --[[ line: 367 ]]
			-- upvalues: fFlagExpChatRewriteInlineModule (copy)
			return p20 and not fFlagExpChatRewriteInlineModule
		end)
		
		if fFlagExpChatRewriteInlineModule then
			local chatWindowTransparencyBindable = p12.chatWindowTransparencyBindable
			
			if chatWindowTransparencyBindable == nil then
				var51 = wasRewritten
			elseif typeof(chatWindowTransparencyBindable) == "number" then
				local var52 = chatWindowTransparencyBindable < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
				var51 = wasRewritten:map(function(p21) --[[ line: 378 ]]
					-- upvalues: var52 (ref)
					return p21 and var52
				end)
			else
				var51 = reactModule.joinBindings({ wasRewritten, chatWindowTransparencyBindable }):map(function(p22) --[[ line: 385 ]]
					-- upvalues: fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (copy)
					return p22[1] and p22[2] < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
				end)
			end
		end
	end
	local var53 = if fFlagExpChatEnableFocusNavigationModule then useCursor() else nil
	local createElement = reactModule.createElement
	local var54 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p12.layoutOrder,
		Visible = p12.visible
	}
	local t_1 = {
		UIPadding = reactModule.createElement("UIPadding", { PaddingRight = p12.arButtonPadding }),
		ColumnLayout = if fFlagEnableInExpChatRewriteModule and not fFlagExpChatRewriteInlineModule then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}) else nil
	}
	local createElement_1 = reactModule.createElement
	local var57 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = if fFlagEnableInExpChatRewriteModule then 1 else nil
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var60 = "TextLabel"
	local t_4 = {
		BackgroundTransparency = 1,
		RichText = true,
		TextWrapped = true,
		AutomaticSize = Enum.AutomaticSize.XY
	}
	local var62 = "FontFace"
	t_4.FontFace = p12.prefixTextProperties:map(function(p23) --[[ line: 66 ]]
		-- upvalues: var62 (ref)
		return if p23 then p23[var62] else nil
	end)
	t_4.Text = var38
	local var63 = "TextColor3"
	t_4.TextColor3 = p12.prefixTextProperties:map(function(p24) --[[ line: 66 ]]
		-- upvalues: var63 (ref)
		return if p24 then p24[var63] else nil
	end)
	local var64 = "TextSize"
	t_4.TextSize = p12.prefixTextProperties:map(function(p25) --[[ line: 66 ]]
		-- upvalues: var64 (ref)
		return if p25 then p25[var64] else nil
	end)
	local var65 = "TextStrokeColor3"
	t_4.TextStrokeColor3 = p12.prefixTextProperties:map(function(p26) --[[ line: 66 ]]
		-- upvalues: var65 (ref)
		return if p26 then p26[var65] else nil
	end)
	local var66 = "TextStrokeTransparency"
	t_4.TextStrokeTransparency = mergeBindableScalarModule(p12.prefixTextProperties:map(function(p27) --[[ line: 66 ]]
		-- upvalues: var66 (ref)
		return if p27 then p27[var66] else nil
	end), p12.textTransparency)
	t_4.TextTransparency = mergeBindableScalarModule(0, p12.textTransparency)
	t_4.TextXAlignment = Enum.TextXAlignment.Left
	t_4.TextYAlignment = Enum.TextYAlignment.Top
	t_4.Visible = var47
	local t_5 = {}
	local createElement_3 = reactModule.createElement
	local var68 = "UIGradient"
	local t_6 = {}
	local var70 = "Enabled"
	t_6.Enabled = var49:map(function(p28) --[[ line: 66 ]]
		-- upvalues: var70 (ref)
		return if p28 then p28[var70] else nil
	end)
	local var71 = "Color"
	t_6.Color = var49:map(function(p29) --[[ line: 66 ]]
		-- upvalues: var71 (ref)
		return if p29 then p29[var71] else nil
	end)
	local var72 = "Offset"
	t_6.Offset = var49:map(function(p30) --[[ line: 66 ]]
		-- upvalues: var72 (ref)
		return if p30 then p30[var72] else nil
	end)
	local var73 = "Rotation"
	t_6.Rotation = var49:map(function(p31) --[[ line: 66 ]]
		-- upvalues: var73 (ref)
		return if p31 then p31[var73] else nil
	end)
	local var74 = "Transparency"
	t_6.Transparency = var49:map(function(p32) --[[ line: 66 ]]
		-- upvalues: var74 (ref)
		return if p32 then p32[var74] else nil
	end)
	t_5.UIGradient = createElement_3(var68, t_6)
	t_3.PrefixText = createElement_2(var60, t_4, t_5)
	local createElement_4 = reactModule.createElement
	local var75 = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then "TextButton" else "TextLabel"
	local t_7 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1
	}
	local var77 = "FontFace"
	t_7.FontFace = p12.bodyTextProperties:map(function(p33) --[[ line: 66 ]]
		-- upvalues: var77 (ref)
		return if p33 then p33[var77] else nil
	end)
	t_7.RichText = true
	t_7.Size = UDim2.new(1, 0, 0, 0)
	t_7.Text = var45
	local var78 = "TextColor3"
	t_7.TextColor3 = p12.bodyTextProperties:map(function(p34) --[[ line: 66 ]]
		-- upvalues: var78 (ref)
		return if p34 then p34[var78] else nil
	end)
	t_7.TextSize = var40
	local var79 = "TextStrokeColor3"
	t_7.TextStrokeColor3 = p12.bodyTextProperties:map(function(p35) --[[ line: 66 ]]
		-- upvalues: var79 (ref)
		return if p35 then p35[var79] else nil
	end)
	local var80 = "TextStrokeTransparency"
	t_7.TextStrokeTransparency = mergeBindableScalarModule(p12.bodyTextProperties:map(function(p36) --[[ line: 66 ]]
		-- upvalues: var80 (ref)
		return if p36 then p36[var80] else nil
	end), p12.textTransparency)
	t_7.TextTransparency = mergeBindableScalarModule(0, p12.textTransparency)
	t_7.TextWrapped = true
	t_7.TextXAlignment = Enum.TextXAlignment.Left
	t_7.TextYAlignment = Enum.TextYAlignment.Top
	t_7[reactModule.Change.Text] = if fFlagLuaAppPerfTrackerUseLogger then var33 else nil
	t_7[reactModule.Event.Activated] = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then var36 else nil
	t_7.Interactable = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then var51 else nil
	t_3.BodyText = createElement_4(var75, t_7)
	local createElement_5 = reactModule.createElement
	local var81 = "Frame"
	local t_8 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		Visible = var47
	}
	local t_9 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		})
	}
	local createElement_6 = reactModule.createElement
	local var84 = "TextButton"
	local t_10 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1
	}
	local var86 = "FontFace"
	t_10.FontFace = p12.prefixTextProperties:map(function(p37) --[[ line: 66 ]]
		-- upvalues: var86 (ref)
		return if p37 then p37[var86] else nil
	end)
	t_10.RichText = true
	t_10.SelectionImageObject = var53
	t_10.Size = UDim2.new(0, 0, 0, 0)
	t_10.Text = var39
	local var87 = "TextSize"
	t_10.TextSize = p12.prefixTextProperties:map(function(p38) --[[ line: 66 ]]
		-- upvalues: var87 (ref)
		return if p38 then p38[var87] else nil
	end)
	t_10.TextStrokeTransparency = 1
	t_10.TextTransparency = 1
	t_10.TextWrapped = true
	t_10.TextXAlignment = Enum.TextXAlignment.Left
	t_10.TextYAlignment = Enum.TextYAlignment.Top
	t_10.LayoutOrder = 1
	t_10[reactModule.Event.Activated] = var34
	t_9.TextButton = createElement_6(var84, t_10)
	t_9.TranslationButton = reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		HoverImage = "rbxasset://textures/translateIconDark.png",
		Image = "rbxasset://textures/translateIcon.png",
		ImageTransparency = mergeBindableScalarModule(0, p12.textTransparency),
		LayoutOrder = 2,
		PressedImage = "rbxasset://textures/translateIconDark.png",
		SelectionImageObject = var53,
		Size = var46,
		Visible = p12.shouldShowTranslationToggle,
		[reactModule.Event.Activated] = var35
	})
	t_3.TextMessageButton = createElement_5(var81, t_8, t_9)
	t_1.TextMessage = createElement_1(var57, t_2, t_3)
	t_1.RewriteToggle = if fFlagEnableInExpChatRewriteModule and not fFlagExpChatRewriteInlineModule then reactModule.createElement(rewriteToggleModule, {
		LayoutOrder = 2,
		isRewriteMenuOpen = p12.isRewriteWindowOpen,
		textTransparency = p12.textTransparency,
		onActivated = var36,
		Visible = var50
	}) else nil
	createElement = createElement(var54, t, t_1)
	
	if fFlagDebugMessageProfilingModule then
		debug.profileend()
	end
	return createElement
end)