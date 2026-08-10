local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local localizationModule = require(expChat.Localization)
local flags = expChat.Flags
local fFlagDebugMessageProfilingModule = require(flags.FFlagDebugMessageProfiling)
local fFlagEnableInExpChatRewriteModule = require(flags.FFlagEnableInExpChatRewrite)
local fFlagExpChatRewriteInlineModule = require(flags.FFlagExpChatRewriteInline)
local fFlagExpChatRewriteToggleAnalyticsModule = require(flags.FFlagExpChatRewriteToggleAnalytics)
local fStringInExpChatRewriteLabelKeyModule = require(flags.FStringInExpChatRewriteLabelKey)
local fIntExpChatWindowTransparencyRewriteInteractableThresholdModule = require(flags.FIntExpChatWindowTransparencyRewriteInteractableThreshold)
local fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module = require(flags.FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2)
local fFlagExpChatPolishSummaryMessageUIModule = require(flags.FFlagExpChatPolishSummaryMessageUI)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getPresetIconRichText = expChatSharedModule.getPresetIconRichText
local textChatMessageChatActionTypeModule = require(expChat.TextChatMessageChatActionType)
local summaryMessageRichTextModule = require(expChat.summaryMessageRichText)
local rewriteToggleModule = require(script.Parent.RewriteToggle)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getRewriteDropdownStoreModule = require(expChat.Stores.GetRewriteDropdownStore)
local fFlagLuaAppPerfTrackerUseLogger = game:DefineFastFlag("ExpChatMessageV2PerfTracking3", false) and require(parent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger
local getMessageTextSize = require(parent.ChatUIPrimitives).Utils.getMessageTextSize
local useFinishChatWindowMessageRenderIntervals = require(parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local configModule = require(expChat.Config)
local helpers = expChat.ChatWindow.Helpers
local duplicateInvisibleTextModule = require(helpers.duplicateInvisibleText)
local mergeBindableScalarModule = require(helpers.mergeBindableScalar)

local function _(p0, p1) --[[ line: 47 | named "calculateTransparency" ]]
	return p0 + p1 * (1 - p0)
end

local _ = function(p2) --[[ line: 51 | named "appendVerifiedBadge" ]]
	-- upvalues: configModule (ref)
	return string.gsub(p2, ":(%S-)$", configModule.VERIFIED_EMOJI .. ":%1")
end

local function trim(p3) --[[ line: 55 ]]
	return if p3:match("^()%s*$") then "" else p3:match("^%s*(.*%S)")
end

local _ = function(p4, p5) --[[ line: 59 | named "getPropertyFromObjBinding" ]]
	return p4:map(function(p6) --[[ line: 63 ]]
		-- upvalues: p5 (ref)
		return if p6 then p6[p5] else nil
	end)
end

local function appendTrustedIndicator(p7, p8, p9, p10, p11) --[[ line: 68 ]]
	local var25 = p11.Color.Shift.Shift_300.Color3:ToHex()
	local transparency = p11.Color.Shift.Shift_300.Transparency
	local transparency_1 = p11.Color.Content.Emphasis.Transparency
	local var26 = `{`{`{`{`<mark color='#{var25}' transparency='{transparency + p9 * (1 - transparency)}'>`}<font transparency='1' weight='{600}' size='{p10 - 4}'><stroke transparency='1'>_`}<font color='#{p11.Color.Content.Emphasis.Color3:ToHex()}' transparency='{transparency_1 + p9 * (1 - transparency_1)}'>{p8}</font>`}_</stroke></font>`}</mark>`
	
	return if string.find(p7, ":([%S:]-)$") then string.gsub(p7, ":([%S:]-)$", ` {var26} :%1`) else `{p7} {var26}`
end

return reactModule.memo(function(p12) --[[ line: 127 | named "TranslatedTextMessage" ]]
	-- upvalues: fFlagDebugMessageProfilingModule (ref), getMessageTextSize (ref), localizationModule (ref), fFlagExpChatRewriteInlineModule (ref), fFlagEnableInExpChatRewriteModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), foundationModule (ref), reactModule (ref), fFlagLuaAppPerfTrackerUseLogger (ref), useFinishChatWindowMessageRenderIntervals (ref), getMessagesStoreModule (ref), getRewriteDropdownStoreModule (ref), fFlagExpChatRewriteToggleAnalyticsModule (ref), expChatSharedModule (ref), configModule (ref), appendTrustedIndicator (ref), trim (ref), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (ref), fFlagExpChatPolishSummaryMessageUIModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetIconRichText (ref), textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref), duplicateInvisibleTextModule (ref), fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (ref), useCursor (ref), mergeBindableScalarModule (ref), rewriteToggleModule (ref)
	if fFlagDebugMessageProfilingModule then
		debug.profilebegin("TranslatedTextMessage")
	end
	local isSpatialUIEnabled = p12.isSpatialUIEnabled
	local var27 = getMessageTextSize(p12.chatWindowSettings, isSpatialUIEnabled)
	local useLocalization = localizationModule.useLocalization
	useLocalization = useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		rewrittenLabelText = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then fStringInExpChatRewriteLabelKeyModule else nil,
		defaultRewrittenLabelText = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then "CoreScripts.TextChat.ChatWindow.RewrittenLabel" else nil
	})
	local var28 = nil
	
	if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then
		var28 = if useLocalization.rewrittenLabelText and useLocalization.rewrittenLabelText ~= "" then useLocalization.rewrittenLabelText else useLocalization.defaultRewrittenLabelText
	end
	local var29 = foundationModule.Hooks.useTokens()
	local var30 = if fFlagLuaAppPerfTrackerUseLogger then useFinishChatWindowMessageRenderIntervals(reactModule.useCallback(function() --[[ line: 161 ]]
		-- upvalues: p12 (ref)
		return if p12.message and p12.message.current then p12.message.current.messageId else nil
	end, { p12.message })) else nil
	local var31 = if fFlagLuaAppPerfTrackerUseLogger then reactModule.useCallback(function(p13) --[[ line: 170 ]]
		-- upvalues: var30 (ref)
		if p13 and p13.Text and p13.Text ~= "" then
			var30()
		end
	end, { var30 }) else nil
	local var32 = reactModule.useCallback(function() --[[ line: 177 ]]
		-- upvalues: p12 (ref)
		p12.onTextMessageLabelButtonActivated(p12.message.current)
	end, { p12.onTextMessageLabelButtonActivated })
	local var33 = reactModule.useCallback(function() --[[ line: 181 ]]
		-- upvalues: p12 (ref), getMessagesStoreModule (copy)
		local current = p12.message.current
		getMessagesStoreModule(false).toggleMessageTranslation(not current.useTranslation, current.messageId)
	end, {})
	local var34 = if fFlagEnableInExpChatRewriteModule then reactModule.useCallback(function() --[[ line: 189 ]]
		-- upvalues: p12 (ref), getRewriteDropdownStoreModule (copy), fFlagExpChatRewriteToggleAnalyticsModule (copy), expChatSharedModule (copy)
		local current = p12.message.current
		
		if current and current.messageId then
			local var86 = getRewriteDropdownStoreModule(false)
			
			if fFlagExpChatRewriteToggleAnalyticsModule then
				expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.RewriteDropdownToggledConfig, {
					messageId = current.messageId,
					isDropdownOpen = tostring(var86.getOpenMessageId(false) == current.messageId),
					showOriginalText = tostring(current.wasRewritten and (current.originalText ~= nil and current.originalText ~= ""))
				}, expChatSharedModule.Analytics.DefaultStandardizedFields)
			end
			var86.toggleDropdown(current.messageId)
		end
	end, { p12.message }) else nil
	local list = { p12.originalPrefixText, p12.isUserVerified }
	table.insert(list, p12.isTrustedConnection)
	table.insert(list, p12.textTransparency)
	table.insert(list, p12.prefixTextProperties)
	local var36 = reactModule.joinBindings(list):map(function(p14) --[[ line: 214 ]]
		-- upvalues: configModule (copy), appendTrustedIndicator (copy), useLocalization (ref), var29 (ref)
		local var87 = p14[1]
		local var88 = p14[2]
		local var89 = var87
		
		if string.len(var87) > 0 then
			if var88 then
				var89 = string.gsub(var89, ":(%S-)$", configModule.VERIFIED_EMOJI .. ":%1")
			end
			local var90 = p14[3] or false
			local var91 = if p14[4] == nil then 1 else p14[4]
			local var92 = p14[5]
			
			if var90 then
				var89 = appendTrustedIndicator(var89, useLocalization.trustedLabelText, var91, var92.TextSize, var29)
			end
		end
		return var89
	end)
	local var37 = var36:map(trim)
	local var38 = p12.bodyTextProperties:map(function(p15) --[[ line: 243 ]]
		-- upvalues: isSpatialUIEnabled (ref), var27 (ref)
		return if isSpatialUIEnabled then var27 else p15.TextSize
	end)
	local list_1 = {
		var36,
		p12.shouldShowTranslationToggle,
		p12.originalBodyText,
		p12.prefixTextProperties
	}
	
	if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then
		table.insert(list_1, p12.wasRewritten)
		table.insert(list_1, p12.isRewriteWindowOpen)
	end
	local var40 = nil
	
	if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
		var40 = #list_1 + 1
		table.insert(list_1, p12.chatActionType)
	end
	local var41 = nil
	
	if fFlagExpChatPolishSummaryMessageUIModule or fFlagExpChatPresetChatEnabled then
		var41 = #list_1 + 1
		table.insert(list_1, var38)
	end
	local var42 = nil
	
	if fFlagExpChatPresetChatEnabled and p12.isPresetMessage ~= nil then
		var42 = #list_1 + 1
		table.insert(list_1, p12.isPresetMessage)
	end
	local var43 = reactModule.joinBindings(list_1):map(function(p16) --[[ line: 273 ]]
		-- upvalues: fFlagExpChatPresetChatEnabled (copy), var42 (write), getPresetIconRichText (copy), var41 (write), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), var40 (write), textChatMessageChatActionTypeModule (copy), fFlagExpChatPolishSummaryMessageUIModule (copy), summaryMessageRichTextModule (copy), var29 (ref), duplicateInvisibleTextModule (copy), fFlagExpChatRewriteInlineModule (copy), fFlagEnableInExpChatRewriteModule (copy), foundationModule (copy), var28 (write)
		local var93 = p16[1]
		local var94 = p16[2]
		local var95 = p16[4]
		local var96 = p16[3]
		
		if fFlagExpChatPresetChatEnabled and var42 ~= nil and p16[var42] then
			var96 ..= ` {getPresetIconRichText(p16[var41])}`
		end
		if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module and p16[var40] == textChatMessageChatActionTypeModule.Summary then
			local var97 = if fFlagExpChatPolishSummaryMessageUIModule then p16[var41] else nil
			var96 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(var97) .. " " .. var96, var29.Color.Content.Muted.Color3:ToHex(), var97)
		end
		if string.len(var93) > 0 then
			if var94 then
				var96 = "     " .. var96
			end
			var96 = duplicateInvisibleTextModule(var93, var95.FontFace, var95.TextSize) .. " " .. var96
		end
		if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then
			local var98 = p16[6]
			
			if p16[5] then
				var96 = `{var96} <font size='{var95.TextSize - 4}' color='#{var29.Color.Content.Muted.Color3:ToHex()}'>{`({var28})`}<font transparency='1'><stroke transparency='1'>_</stroke></font>{`<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{if var98 then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown}</font>`}</font>`
			end
		end
		return var96
	end)
	local var44 = var38:map(function(p17) --[[ line: 332 ]]
		return UDim2.new(0, p17 - 2, 0, p17 - 2)
	end)
	local var45 = p12.originalPrefixText:map(function(p18) --[[ line: 335 ]]
		return string.len(p18) > 0
	end)
	local var46 = "UIGradient"
	local var47 = p12.prefixTextProperties:map(function(p19) --[[ line: 63 ]]
		-- upvalues: var46 (ref)
		return if p19 then p19[var46] else nil
	end)
	local var48 = nil
	local var49 = nil
	
	if fFlagEnableInExpChatRewriteModule then
		local wasRewritten = p12.wasRewritten
		var48 = wasRewritten:map(function(p20) --[[ line: 345 ]]
			-- upvalues: fFlagExpChatRewriteInlineModule (copy)
			return p20 and not fFlagExpChatRewriteInlineModule
		end)
		
		if fFlagExpChatRewriteInlineModule then
			local chatWindowTransparencyBindable = p12.chatWindowTransparencyBindable
			
			if chatWindowTransparencyBindable == nil then
				var49 = wasRewritten
			elseif typeof(chatWindowTransparencyBindable) == "number" then
				local var50 = chatWindowTransparencyBindable < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
				var49 = wasRewritten:map(function(p21) --[[ line: 356 ]]
					-- upvalues: var50 (ref)
					return p21 and var50
				end)
			else
				var49 = reactModule.joinBindings({ wasRewritten, chatWindowTransparencyBindable }):map(function(p22) --[[ line: 363 ]]
					-- upvalues: fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (copy)
					return p22[1] and p22[2] < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
				end)
			end
		end
	end
	local var51 = useCursor()
	local createElement = reactModule.createElement
	local var52 = "Frame"
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
	local var55 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = if fFlagEnableInExpChatRewriteModule then 1 else nil
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var58 = "TextLabel"
	local t_4 = {
		BackgroundTransparency = 1,
		RichText = true,
		TextWrapped = true,
		AutomaticSize = Enum.AutomaticSize.XY
	}
	local var60 = "FontFace"
	t_4.FontFace = p12.prefixTextProperties:map(function(p23) --[[ line: 63 ]]
		-- upvalues: var60 (ref)
		return if p23 then p23[var60] else nil
	end)
	t_4.Text = var36
	local var61 = "TextColor3"
	t_4.TextColor3 = p12.prefixTextProperties:map(function(p24) --[[ line: 63 ]]
		-- upvalues: var61 (ref)
		return if p24 then p24[var61] else nil
	end)
	local var62 = "TextSize"
	t_4.TextSize = p12.prefixTextProperties:map(function(p25) --[[ line: 63 ]]
		-- upvalues: var62 (ref)
		return if p25 then p25[var62] else nil
	end)
	local var63 = "TextStrokeColor3"
	t_4.TextStrokeColor3 = p12.prefixTextProperties:map(function(p26) --[[ line: 63 ]]
		-- upvalues: var63 (ref)
		return if p26 then p26[var63] else nil
	end)
	local var64 = "TextStrokeTransparency"
	t_4.TextStrokeTransparency = mergeBindableScalarModule(p12.prefixTextProperties:map(function(p27) --[[ line: 63 ]]
		-- upvalues: var64 (ref)
		return if p27 then p27[var64] else nil
	end), p12.textTransparency)
	t_4.TextTransparency = mergeBindableScalarModule(0, p12.textTransparency)
	t_4.TextXAlignment = Enum.TextXAlignment.Left
	t_4.TextYAlignment = Enum.TextYAlignment.Top
	t_4.Visible = var45
	local t_5 = {}
	local createElement_3 = reactModule.createElement
	local var66 = "UIGradient"
	local t_6 = {}
	local var68 = "Enabled"
	t_6.Enabled = var47:map(function(p28) --[[ line: 63 ]]
		-- upvalues: var68 (ref)
		return if p28 then p28[var68] else nil
	end)
	local var69 = "Color"
	t_6.Color = var47:map(function(p29) --[[ line: 63 ]]
		-- upvalues: var69 (ref)
		return if p29 then p29[var69] else nil
	end)
	local var70 = "Offset"
	t_6.Offset = var47:map(function(p30) --[[ line: 63 ]]
		-- upvalues: var70 (ref)
		return if p30 then p30[var70] else nil
	end)
	local var71 = "Rotation"
	t_6.Rotation = var47:map(function(p31) --[[ line: 63 ]]
		-- upvalues: var71 (ref)
		return if p31 then p31[var71] else nil
	end)
	local var72 = "Transparency"
	t_6.Transparency = var47:map(function(p32) --[[ line: 63 ]]
		-- upvalues: var72 (ref)
		return if p32 then p32[var72] else nil
	end)
	t_5.UIGradient = createElement_3(var66, t_6)
	t_3.PrefixText = createElement_2(var58, t_4, t_5)
	local createElement_4 = reactModule.createElement
	local var73 = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then "TextButton" else "TextLabel"
	local t_7 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1
	}
	local var75 = "FontFace"
	t_7.FontFace = p12.bodyTextProperties:map(function(p33) --[[ line: 63 ]]
		-- upvalues: var75 (ref)
		return if p33 then p33[var75] else nil
	end)
	t_7.RichText = true
	t_7.Size = UDim2.new(1, 0, 0, 0)
	t_7.Text = var43
	local var76 = "TextColor3"
	t_7.TextColor3 = p12.bodyTextProperties:map(function(p34) --[[ line: 63 ]]
		-- upvalues: var76 (ref)
		return if p34 then p34[var76] else nil
	end)
	t_7.TextSize = var38
	local var77 = "TextStrokeColor3"
	t_7.TextStrokeColor3 = p12.bodyTextProperties:map(function(p35) --[[ line: 63 ]]
		-- upvalues: var77 (ref)
		return if p35 then p35[var77] else nil
	end)
	local var78 = "TextStrokeTransparency"
	t_7.TextStrokeTransparency = mergeBindableScalarModule(p12.bodyTextProperties:map(function(p36) --[[ line: 63 ]]
		-- upvalues: var78 (ref)
		return if p36 then p36[var78] else nil
	end), p12.textTransparency)
	t_7.TextTransparency = mergeBindableScalarModule(0, p12.textTransparency)
	t_7.TextWrapped = true
	t_7.TextXAlignment = Enum.TextXAlignment.Left
	t_7.TextYAlignment = Enum.TextYAlignment.Top
	t_7[reactModule.Change.Text] = if fFlagLuaAppPerfTrackerUseLogger then var31 else nil
	t_7[reactModule.Event.Activated] = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then var34 else nil
	t_7.Interactable = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then var49 else nil
	t_3.BodyText = createElement_4(var73, t_7)
	local createElement_5 = reactModule.createElement
	local var79 = "Frame"
	local t_8 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		Visible = var45
	}
	local t_9 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		})
	}
	local createElement_6 = reactModule.createElement
	local var82 = "TextButton"
	local t_10 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1
	}
	local var84 = "FontFace"
	t_10.FontFace = p12.prefixTextProperties:map(function(p37) --[[ line: 63 ]]
		-- upvalues: var84 (ref)
		return if p37 then p37[var84] else nil
	end)
	t_10.RichText = true
	t_10.SelectionImageObject = var51
	t_10.Size = UDim2.new(0, 0, 0, 0)
	t_10.Text = var37
	local var85 = "TextSize"
	t_10.TextSize = p12.prefixTextProperties:map(function(p38) --[[ line: 63 ]]
		-- upvalues: var85 (ref)
		return if p38 then p38[var85] else nil
	end)
	t_10.TextStrokeTransparency = 1
	t_10.TextTransparency = 1
	t_10.TextWrapped = true
	t_10.TextXAlignment = Enum.TextXAlignment.Left
	t_10.TextYAlignment = Enum.TextYAlignment.Top
	t_10.LayoutOrder = 1
	t_10[reactModule.Event.Activated] = var32
	t_9.TextButton = createElement_6(var82, t_10)
	t_9.TranslationButton = reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		HoverImage = "rbxasset://textures/translateIconDark.png",
		Image = "rbxasset://textures/translateIcon.png",
		ImageTransparency = mergeBindableScalarModule(0, p12.textTransparency),
		LayoutOrder = 2,
		PressedImage = "rbxasset://textures/translateIconDark.png",
		SelectionImageObject = var51,
		Size = var44,
		Visible = p12.shouldShowTranslationToggle,
		[reactModule.Event.Activated] = var33
	})
	t_3.TextMessageButton = createElement_5(var79, t_8, t_9)
	t_1.TextMessage = createElement_1(var55, t_2, t_3)
	t_1.RewriteToggle = if fFlagEnableInExpChatRewriteModule and not fFlagExpChatRewriteInlineModule then reactModule.createElement(rewriteToggleModule, {
		LayoutOrder = 2,
		isRewriteMenuOpen = p12.isRewriteWindowOpen,
		textTransparency = p12.textTransparency,
		onActivated = var34,
		Visible = var48
	}) else nil
	createElement = createElement(var52, t, t_1)
	
	if fFlagDebugMessageProfilingModule then
		debug.profileend()
	end
	return createElement
end)