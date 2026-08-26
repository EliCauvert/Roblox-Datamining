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
local getMessageTextSize = require(parent.ChatUIPrimitives).Utils.getMessageTextSize
local useFinishChatWindowMessageRenderIntervals = require(parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local configModule = require(expChat.Config)
local helpers = expChat.ChatWindow.Helpers
local duplicateInvisibleTextModule = require(helpers.duplicateInvisibleText)
local mergeBindableScalarModule = require(helpers.mergeBindableScalar)

local function _(p1, p2)
	return p1 + p2 * (1 - p1)
end

local _ = function(p1)
	-- upvalues: configModule (ref)
	return string.gsub(p1, ":(%S-)$", configModule.VERIFIED_EMOJI .. ":%1")
end

local function trim(p1)
	return if p1:match("^()%s*$") then "" else p1:match("^%s*(.*%S)")
end

local _ = function(p1, p2)
	return p1:map(function(p3)
		-- upvalues: p2 (ref)
		return if p3 then p3[p2] else nil
	end)
end

local function appendTrustedIndicator(p1, p2, p3, p4, p5)
	local var1 = p5.Color.Shift.Shift_300.Color3:ToHex()
	local transparency = p5.Color.Shift.Shift_300.Transparency
	local transparency_1 = p5.Color.Content.Emphasis.Transparency
	local var2 = `{`{`{`{`<mark color='#{var24}' transparency='{transparency + p9 * (1 - transparency)}'>`}<font transparency='1' weight='{600}' size='{p10 - 4}'><stroke transparency='1'>_`}<font color='#{p11.Color.Content.Emphasis.Color3:ToHex()}' transparency='{transparency_1 + p9 * (1 - transparency_1)}'>{p2}</font>`}_</stroke></font>`}</mark>`
	
	return if string.find(p1, ":([%S:]-)$") then string.gsub(p1, ":([%S:]-)$", ` {var2} :%1`) else `{p1} {var2}`
end

return reactModule.memo(function(p1)
	-- upvalues: fFlagDebugMessageProfilingModule (ref), getMessageTextSize (ref), localizationModule (ref), fFlagExpChatRewriteInlineModule (ref), fFlagEnableInExpChatRewriteModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), foundationModule (ref), reactModule (ref), useFinishChatWindowMessageRenderIntervals (ref), getMessagesStoreModule (ref), getRewriteDropdownStoreModule (ref), fFlagExpChatRewriteToggleAnalyticsModule (ref), expChatSharedModule (ref), configModule (ref), appendTrustedIndicator (ref), trim (ref), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (ref), fFlagExpChatPolishSummaryMessageUIModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetIconRichText (ref), textChatMessageChatActionTypeModule (ref), summaryMessageRichTextModule (ref), duplicateInvisibleTextModule (ref), fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (ref), useCursor (ref), mergeBindableScalarModule (ref), rewriteToggleModule (ref)
	if fFlagDebugMessageProfilingModule then
		debug.profilebegin("TranslatedTextMessage")
	end
	local isSpatialUIEnabled = p1.isSpatialUIEnabled
	local var1 = getMessageTextSize(p1.chatWindowSettings, isSpatialUIEnabled)
	local useLocalization = localizationModule.useLocalization
	useLocalization = useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		rewrittenLabelText = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then fStringInExpChatRewriteLabelKeyModule else nil,
		defaultRewrittenLabelText = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then "CoreScripts.TextChat.ChatWindow.RewrittenLabel" else nil
	})
	local var2 = nil
	
	if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then
		var2 = if useLocalization.rewrittenLabelText and useLocalization.rewrittenLabelText ~= "" then useLocalization.rewrittenLabelText else useLocalization.defaultRewrittenLabelText
	end
	local var3 = foundationModule.Hooks.useTokens()
	local var4 = useFinishChatWindowMessageRenderIntervals(reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		return if p1.message and p1.message.current then p1.message.current.messageId else nil
	end, { p1.message }))
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref)
		if p2 and p2.Text and p2.Text ~= "" then
			var4()
		end
	end, { var4 })
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onTextMessageLabelButtonActivated(p1.message.current)
	end, { p1.onTextMessageLabelButtonActivated })
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), getMessagesStoreModule (copy)
		local current = p1.message.current
		getMessagesStoreModule(false).toggleMessageTranslation(not current.useTranslation, current.messageId)
	end, {})
	local var8 = if fFlagEnableInExpChatRewriteModule then reactModule.useCallback(function()
		-- upvalues: p1 (ref), getRewriteDropdownStoreModule (copy), fFlagExpChatRewriteToggleAnalyticsModule (copy), expChatSharedModule (copy)
		local current = p1.message.current
		
		if current and current.messageId then
			local var9 = getRewriteDropdownStoreModule(false)
			
			if fFlagExpChatRewriteToggleAnalyticsModule then
				expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.RewriteDropdownToggledConfig, {
					messageId = current.messageId,
					isDropdownOpen = tostring(var9.getOpenMessageId(false) == current.messageId),
					showOriginalText = tostring(current.wasRewritten and (current.originalText ~= nil and current.originalText ~= ""))
				}, expChatSharedModule.Analytics.DefaultStandardizedFields)
			end
			var9.toggleDropdown(current.messageId)
		end
	end, { p1.message }) else nil
	local list = { p1.originalPrefixText, p1.isUserVerified }
	table.insert(list, p1.isTrustedConnection)
	table.insert(list, p1.textTransparency)
	table.insert(list, p1.prefixTextProperties)
	local var9 = reactModule.joinBindings(list):map(function(p2)
		-- upvalues: configModule (copy), appendTrustedIndicator (copy), useLocalization (ref), var3 (ref)
		local var10 = p2[1]
		local var11 = p2[2]
		local var12 = var10
		
		if string.len(var10) > 0 then
			if var11 then
				var12 = string.gsub(var12, ":(%S-)$", configModule.VERIFIED_EMOJI .. ":%1")
			end
			local var13 = p2[3] or false
			local var14 = if p2[4] == nil then 1 else p2[4]
			local var15 = p2[5]
			
			if var13 then
				var12 = appendTrustedIndicator(var12, useLocalization.trustedLabelText, var14, var15.TextSize, var3)
			end
		end
		return var12
	end)
	local var10 = var9:map(trim)
	local var11 = p1.bodyTextProperties:map(function(p2)
		-- upvalues: isSpatialUIEnabled (ref), var1 (ref)
		return if isSpatialUIEnabled then var1 else p2.TextSize
	end)
	local list_1 = {
		var9,
		p1.shouldShowTranslationToggle,
		p1.originalBodyText,
		p1.prefixTextProperties
	}
	
	if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then
		table.insert(list_1, p1.wasRewritten)
		table.insert(list_1, p1.isRewriteWindowOpen)
	end
	local var12 = nil
	
	if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
		var12 = #list_1 + 1
		table.insert(list_1, p1.chatActionType)
	end
	local var13 = nil
	
	if fFlagExpChatPolishSummaryMessageUIModule or fFlagExpChatPresetChatEnabled then
		var13 = #list_1 + 1
		table.insert(list_1, var11)
	end
	local var14 = nil
	
	if fFlagExpChatPresetChatEnabled and p1.isPresetMessage ~= nil then
		var14 = #list_1 + 1
		table.insert(list_1, p1.isPresetMessage)
	end
	local var15 = reactModule.joinBindings(list_1):map(function(p2)
		-- upvalues: fFlagExpChatPresetChatEnabled (copy), var14 (write), getPresetIconRichText (copy), var13 (write), fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), var12 (write), textChatMessageChatActionTypeModule (copy), fFlagExpChatPolishSummaryMessageUIModule (copy), summaryMessageRichTextModule (copy), var3 (ref), duplicateInvisibleTextModule (copy), fFlagExpChatRewriteInlineModule (copy), fFlagEnableInExpChatRewriteModule (copy), foundationModule (copy), var2 (write)
		local var16 = p2[1]
		local var17 = p2[2]
		local var18 = p2[4]
		local var19 = p2[3]
		
		if fFlagExpChatPresetChatEnabled and var14 ~= nil and p2[var14] then
			var19 ..= ` {getPresetIconRichText(p2[var13])}`
		end
		if fFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module and p2[var12] == textChatMessageChatActionTypeModule.Summary then
			local var20 = if fFlagExpChatPolishSummaryMessageUIModule then p2[var13] else nil
			var19 = summaryMessageRichTextModule.wrapInSummaryMutedStyle(summaryMessageRichTextModule.getSummaryIconPrefix(var20) .. " " .. var95, var3.Color.Content.Muted.Color3:ToHex(), var20)
		end
		if string.len(var16) > 0 then
			if var17 then
				var19 = "     " .. var95
			end
			var19 = duplicateInvisibleTextModule(var16, var18.FontFace, var18.TextSize) .. " " .. var95
		end
		if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then
			local var21 = p2[6]
			
			if p2[5] then
				var19 = `{var19} <font size='{var94.TextSize - 4}' color='#{var28.Color.Content.Muted.Color3:ToHex()}'>{`({var2})`}<font transparency='1'><stroke transparency='1'>_</stroke></font>{`<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{if var21 then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown}</font>`}</font>`
			end
		end
		return var19
	end)
	local var22 = var11:map(function(p3)
		return UDim2.new(0, p3 - 2, 0, p3 - 2)
	end)
	local var23 = p1.originalPrefixText:map(function(p3)
		return string.len(p3) > 0
	end)
	local var24 = "UIGradient"
	local var25 = p1.prefixTextProperties:map(function(p3)
		-- upvalues: var24 (ref)
		return if p3 then p3[var24] else nil
	end)
	local var26 = nil
	local var27 = nil
	
	if fFlagEnableInExpChatRewriteModule then
		local wasRewritten = p1.wasRewritten
		var26 = wasRewritten:map(function(p3)
			-- upvalues: fFlagExpChatRewriteInlineModule (copy)
			return p3 and not fFlagExpChatRewriteInlineModule
		end)
		
		if fFlagExpChatRewriteInlineModule then
			local chatWindowTransparencyBindable = p1.chatWindowTransparencyBindable
			
			if chatWindowTransparencyBindable == nil then
				var27 = wasRewritten
			elseif typeof(chatWindowTransparencyBindable) == "number" then
				local var28 = chatWindowTransparencyBindable < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
				var27 = wasRewritten:map(function(p3)
					-- upvalues: var28 (ref)
					return p3 and var28
				end)
			else
				var27 = reactModule.joinBindings({ wasRewritten, chatWindowTransparencyBindable }):map(function(p3)
					-- upvalues: fIntExpChatWindowTransparencyRewriteInteractableThresholdModule (copy)
					return p3[1] and p3[2] < fIntExpChatWindowTransparencyRewriteInteractableThresholdModule
				end)
			end
		end
	end
	local var29 = useCursor()
	local createElement = reactModule.createElement
	local var30 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible
	}
	local t_1 = {
		UIPadding = reactModule.createElement("UIPadding", { PaddingRight = p1.arButtonPadding }),
		ColumnLayout = if fFlagEnableInExpChatRewriteModule and not fFlagExpChatRewriteInlineModule then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}) else nil
	}
	local createElement_1 = reactModule.createElement
	local var31 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = if fFlagEnableInExpChatRewriteModule then 1 else nil
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var32 = "TextLabel"
	local t_4 = {
		BackgroundTransparency = 1,
		RichText = true,
		TextWrapped = true,
		AutomaticSize = Enum.AutomaticSize.XY
	}
	local var33 = "FontFace"
	t_4.FontFace = p1.prefixTextProperties:map(function(p3)
		-- upvalues: var33 (ref)
		return if p3 then p3[var33] else nil
	end)
	t_4.Text = var9
	local var34 = "TextColor3"
	t_4.TextColor3 = p1.prefixTextProperties:map(function(p3)
		-- upvalues: var34 (ref)
		return if p3 then p3[var34] else nil
	end)
	local var35 = "TextSize"
	t_4.TextSize = p1.prefixTextProperties:map(function(p3)
		-- upvalues: var35 (ref)
		return if p3 then p3[var35] else nil
	end)
	local var36 = "TextStrokeColor3"
	t_4.TextStrokeColor3 = p1.prefixTextProperties:map(function(p3)
		-- upvalues: var36 (ref)
		return if p3 then p3[var36] else nil
	end)
	local var37 = "TextStrokeTransparency"
	t_4.TextStrokeTransparency = mergeBindableScalarModule(p1.prefixTextProperties:map(function(p3)
		-- upvalues: var37 (ref)
		return if p3 then p3[var37] else nil
	end), p1.textTransparency)
	t_4.TextTransparency = mergeBindableScalarModule(0, p1.textTransparency)
	t_4.TextXAlignment = Enum.TextXAlignment.Left
	t_4.TextYAlignment = Enum.TextYAlignment.Top
	t_4.Visible = var23
	local t_5 = {}
	local createElement_3 = reactModule.createElement
	local var38 = "UIGradient"
	local t_6 = {}
	local var39 = "Enabled"
	t_6.Enabled = var25:map(function(p3)
		-- upvalues: var39 (ref)
		return if p3 then p3[var39] else nil
	end)
	local var40 = "Color"
	t_6.Color = var25:map(function(p3)
		-- upvalues: var40 (ref)
		return if p3 then p3[var40] else nil
	end)
	local var41 = "Offset"
	t_6.Offset = var25:map(function(p3)
		-- upvalues: var41 (ref)
		return if p3 then p3[var41] else nil
	end)
	local var42 = "Rotation"
	t_6.Rotation = var25:map(function(p3)
		-- upvalues: var42 (ref)
		return if p3 then p3[var42] else nil
	end)
	local var43 = "Transparency"
	t_6.Transparency = var25:map(function(p3)
		-- upvalues: var43 (ref)
		return if p3 then p3[var43] else nil
	end)
	t_5.UIGradient = createElement_3(var38, t_6)
	t_3.PrefixText = createElement_2(var32, t_4, t_5)
	local createElement_4 = reactModule.createElement
	local var44 = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then "TextButton" else "TextLabel"
	local t_7 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1
	}
	local var45 = "FontFace"
	t_7.FontFace = p1.bodyTextProperties:map(function(p3)
		-- upvalues: var45 (ref)
		return if p3 then p3[var45] else nil
	end)
	t_7.RichText = true
	t_7.Size = UDim2.new(1, 0, 0, 0)
	t_7.Text = var15
	local var46 = "TextColor3"
	t_7.TextColor3 = p1.bodyTextProperties:map(function(p3)
		-- upvalues: var46 (ref)
		return if p3 then p3[var46] else nil
	end)
	t_7.TextSize = var11
	local var47 = "TextStrokeColor3"
	t_7.TextStrokeColor3 = p1.bodyTextProperties:map(function(p3)
		-- upvalues: var47 (ref)
		return if p3 then p3[var47] else nil
	end)
	local var48 = "TextStrokeTransparency"
	t_7.TextStrokeTransparency = mergeBindableScalarModule(p1.bodyTextProperties:map(function(p3)
		-- upvalues: var48 (ref)
		return if p3 then p3[var48] else nil
	end), p1.textTransparency)
	t_7.TextTransparency = mergeBindableScalarModule(0, p1.textTransparency)
	t_7.TextWrapped = true
	t_7.TextXAlignment = Enum.TextXAlignment.Left
	t_7.TextYAlignment = Enum.TextYAlignment.Top
	t_7[reactModule.Change.Text] = var5
	t_7[reactModule.Event.Activated] = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then var8 else nil
	t_7.Interactable = if fFlagExpChatRewriteInlineModule and fFlagEnableInExpChatRewriteModule then var27 else nil
	t_3.BodyText = createElement_4(var44, t_7)
	local createElement_5 = reactModule.createElement
	local var49 = "Frame"
	local t_8 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		Visible = var23
	}
	local t_9 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		})
	}
	local createElement_6 = reactModule.createElement
	local var50 = "TextButton"
	local t_10 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1
	}
	local var51 = "FontFace"
	t_10.FontFace = p1.prefixTextProperties:map(function(p3)
		-- upvalues: var51 (ref)
		return if p3 then p3[var51] else nil
	end)
	t_10.RichText = true
	t_10.SelectionImageObject = var29
	t_10.Size = UDim2.new(0, 0, 0, 0)
	t_10.Text = var10
	local var52 = "TextSize"
	t_10.TextSize = p1.prefixTextProperties:map(function(p3)
		-- upvalues: var52 (ref)
		return if p3 then p3[var52] else nil
	end)
	t_10.TextStrokeTransparency = 1
	t_10.TextTransparency = 1
	t_10.TextWrapped = true
	t_10.TextXAlignment = Enum.TextXAlignment.Left
	t_10.TextYAlignment = Enum.TextYAlignment.Top
	t_10.LayoutOrder = 1
	t_10[reactModule.Event.Activated] = var6
	t_9.TextButton = createElement_6(var50, t_10)
	t_9.TranslationButton = reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		HoverImage = "rbxasset://textures/translateIconDark.png",
		Image = "rbxasset://textures/translateIcon.png",
		ImageTransparency = mergeBindableScalarModule(0, p1.textTransparency),
		LayoutOrder = 2,
		PressedImage = "rbxasset://textures/translateIconDark.png",
		SelectionImageObject = var29,
		Size = var22,
		Visible = p1.shouldShowTranslationToggle,
		[reactModule.Event.Activated] = var7
	})
	t_3.TextMessageButton = createElement_5(var49, t_8, t_9)
	t_1.TextMessage = createElement_1(var31, t_2, t_3)
	t_1.RewriteToggle = if fFlagEnableInExpChatRewriteModule and not fFlagExpChatRewriteInlineModule then reactModule.createElement(rewriteToggleModule, {
		LayoutOrder = 2,
		isRewriteMenuOpen = p1.isRewriteWindowOpen,
		textTransparency = p1.textTransparency,
		onActivated = var8,
		Visible = var26
	}) else nil
	createElement = createElement(var30, t, t_1)
	
	if fFlagDebugMessageProfilingModule then
		debug.profileend()
	end
	return createElement
end)