local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LocalizationModule = require(ExpChat.Localization)
local Flags = ExpChat.Flags
local FFlagDebugMessageProfilingModule = require(Flags.FFlagDebugMessageProfiling)
local FFlagEnableInExpChatRewriteModule = require(Flags.FFlagEnableInExpChatRewrite)
local FFlagExpChatRewriteInlineModule = require(Flags.FFlagExpChatRewriteInline)
local FFlagExpChatRewriteToggleAnalyticsModule = require(Flags.FFlagExpChatRewriteToggleAnalytics)
local FStringInExpChatRewriteLabelKeyModule = require(Flags.FStringInExpChatRewriteLabelKey)
local FIntExpChatWindowTransparencyRewriteInteractableThresholdModule = require(Flags.FIntExpChatWindowTransparencyRewriteInteractableThreshold)
local FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module = require(Flags.FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2)
local FFlagExpChatPolishSummaryMessageUIModule = require(Flags.FFlagExpChatPolishSummaryMessageUI)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local IsChatWindowEnlargeEnabledModule = require(ExpChat.isChatWindowEnlargeEnabled)
local FFlagExpChatMessageEffectChatWindowEnlargePaddingModule = require(Flags.FFlagExpChatMessageEffectChatWindowEnlargePadding)
local FFlagExpChatMessageEffectChatWindowEnlargeLineHeightModule = require(Flags.FFlagExpChatMessageEffectChatWindowEnlargeLineHeight)
local FIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule = require(Flags.FIntExpChatMessageEffectChatWindowEnlargePaddingPixels)
local GetPresetIconRichTextFunction = ExpChatSharedModule.getPresetIconRichText
local TextChatMessageChatActionTypeModule = require(ExpChat.TextChatMessageChatActionType)
local SummaryMessageRichTextModule = require(ExpChat.summaryMessageRichText)
local RewriteToggleModule = require(script.Parent.RewriteToggle)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetRewriteDropdownStoreModule = require(ExpChat.Stores.GetRewriteDropdownStore)
local MessageEffectModule = require(ExpChat.MessageEffects.MessageEffect)
local GetMessageTextSizeFunction = require(Parent.ChatUIPrimitives).Utils.getMessageTextSize
local UseFinishChatWindowMessageRenderIntervalsFunction = require(Parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals
local ApplyChatWindowMessageEffectsModule = require(ExpChat.MessageEffects.applyChatWindowMessageEffects)
local GetChatWindowPrefixOffsetModule = require(ExpChat.MessageEffects.getChatWindowPrefixOffset)
local GetChatWindowMessageLineHeightModule = require(ExpChat.MessageEffects.getChatWindowMessageLineHeight)
local UseCursorFunction = require(Parent.UIBlox).App.SelectionCursor.useCursor
local ConfigModule = require(ExpChat.Config)
local Helpers = ExpChat.ChatWindow.Helpers
local DuplicateInvisibleTextModule = require(Helpers.duplicateInvisibleText)
local MergeBindableScalarModule = require(Helpers.mergeBindableScalar)

local function _(p1: number, p2): number --[[ Line: 55 | Named "calculateTransparency" ]]
	return p1 + p2 * (1 - p1)
end

local _ = function(Text: string): string --[[ Line: 59 | Named "appendVerifiedBadge" ]]
	-- upvalues: ConfigModule (copy)
	return string.gsub(Text, ":(%S-)$", ConfigModule.VERIFIED_EMOJI .. ":%1")
end

local function trim(p1) --[[ Line: 63 ]]
	return if p1:match("^()%s*$") then "" else p1:match("^%s*(.*%S)")
end

local _ = function(p1, p2) --[[ Line: 67 | Named "getPropertyFromObjBinding" ]]
	return p1:map(function(p3) --[[ Line: 71 ]]
		-- upvalues: p2 (copy)
		return if p3 then p3[p2] else nil
	end)
end

local function appendTrustedIndicator(Text: string, TrustedLabelText, p1, TextSize: number, UseTokensResult): string --[[ Line: 76 ]]
	local Transparency: number = UseTokensResult.Color.Shift.Shift_300.Transparency
	local Transparency1: number = UseTokensResult.Color.Content.Emphasis.Transparency
	local MarkName: string = `{`{`{`{`<mark color='#{UseTokensResult.Color.Shift.Shift_300.Color3:ToHex()}' transparency='{Transparency + p7 * (1 - Transparency)}'>`}<font transparency='1' weight='{600}' size='{TextSize - 4}'><stroke transparency='1'>_`}<font color='#{UseTokensResult.Color.Content.Emphasis.Color3:ToHex()}' transparency='{Transparency1 + p7 * (1 - Transparency1)}'>{TrustedLabelText}</font>`}_</stroke></font>`}</mark>`
	
	return if string.find(Text, ":([%S:]-)$") then string.gsub(Text, ":([%S:]-)$", ` {MarkName} :%1`) else `{Text} {MarkName}`
end

return ReactModule.memo(function(p1) --[[ Line: 136 | Named "TranslatedTextMessage" ]]
	-- upvalues: FFlagDebugMessageProfilingModule (copy), GetMessageTextSizeFunction (copy), LocalizationModule (copy), FFlagExpChatRewriteInlineModule (copy), FFlagEnableInExpChatRewriteModule (copy), FStringInExpChatRewriteLabelKeyModule (copy), FoundationModule (copy), ReactModule (copy), UseFinishChatWindowMessageRenderIntervalsFunction (copy), GetMessagesStoreModule (copy), GetRewriteDropdownStoreModule (copy), FFlagExpChatRewriteToggleAnalyticsModule (copy), ExpChatSharedModule (copy), ConfigModule (copy), appendTrustedIndicator (copy), trim (copy), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (copy), FFlagExpChatPolishSummaryMessageUIModule (copy), FFlagExpChatPresetChatEnabled (copy), IsChatWindowEnlargeEnabledModule (copy), ApplyChatWindowMessageEffectsModule (copy), GetPresetIconRichTextFunction (copy), TextChatMessageChatActionTypeModule (copy), SummaryMessageRichTextModule (copy), DuplicateInvisibleTextModule (copy), GetChatWindowPrefixOffsetModule (copy), FFlagExpChatMessageEffectChatWindowEnlargeLineHeightModule (copy), GetChatWindowMessageLineHeightModule (copy), FIntExpChatWindowTransparencyRewriteInteractableThresholdModule (copy), UseCursorFunction (copy), FFlagExpChatMessageEffectChatWindowEnlargePaddingModule (copy), MessageEffectModule (copy), FIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule (copy), MergeBindableScalarModule (copy), RewriteToggleModule (copy)
	if FFlagDebugMessageProfilingModule then
		debug.profilebegin("TranslatedTextMessage")
	end
	local IsSpatialUIEnabled = p1.isSpatialUIEnabled
	local MessageTextSize = GetMessageTextSizeFunction(p1.chatWindowSettings, IsSpatialUIEnabled)
	local UseLocalizationResult = LocalizationModule.useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		rewrittenLabelText = if FFlagExpChatRewriteInlineModule and FFlagEnableInExpChatRewriteModule then FStringInExpChatRewriteLabelKeyModule else nil,
		defaultRewrittenLabelText = if FFlagExpChatRewriteInlineModule and FFlagEnableInExpChatRewriteModule then "CoreScripts.TextChat.ChatWindow.RewrittenLabel" else nil
	})
	local RewrittenLabelText = if FFlagExpChatRewriteInlineModule and FFlagEnableInExpChatRewriteModule then if UseLocalizationResult.rewrittenLabelText and UseLocalizationResult.rewrittenLabelText ~= "" then UseLocalizationResult.rewrittenLabelText else UseLocalizationResult.defaultRewrittenLabelText else nil
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseFinishChatWindowMessageRenderIntervalsResult = UseFinishChatWindowMessageRenderIntervalsFunction((ReactModule.useCallback(function() --[[ Line: 170 ]]
		-- upvalues: p1 (copy)
		return if p1.message and p1.message.current then p1.message.current.messageId else nil
	end, { p1.message })))
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 175 ]]
		-- upvalues: UseFinishChatWindowMessageRenderIntervalsResult (copy)
		if p2 and p2.Text and p2.Text ~= "" then
			UseFinishChatWindowMessageRenderIntervalsResult()
		end
	end, { UseFinishChatWindowMessageRenderIntervalsResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 181 ]]
		-- upvalues: p1 (copy)
		p1.onTextMessageLabelButtonActivated(p1.message.current)
	end, { p1.onTextMessageLabelButtonActivated })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 185 ]]
		-- upvalues: p1 (copy), GetMessagesStoreModule (upval)
		local Current = p1.message.current
		GetMessagesStoreModule(false).toggleMessageTranslation(not Current.useTranslation, Current.messageId)
	end, {})
	local UseResult3 = if FFlagEnableInExpChatRewriteModule then ReactModule.useCallback(function() --[[ Line: 193 ]]
		-- upvalues: p1 (copy), GetRewriteDropdownStoreModule (upval), FFlagExpChatRewriteToggleAnalyticsModule (upval), ExpChatSharedModule (upval)
		local Current = p1.message.current
		
		if Current and Current.messageId then
			local RewriteDropdownStoreModule = GetRewriteDropdownStoreModule(false)
			
			if FFlagExpChatRewriteToggleAnalyticsModule then
				ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.RewriteDropdownToggledConfig, {
					messageId = Current.messageId,
					isDropdownOpen = tostring(RewriteDropdownStoreModule.getOpenMessageId(false) == Current.messageId),
					showOriginalText = tostring(Current.wasRewritten and (Current.originalText ~= nil and Current.originalText ~= ""))
				}, ExpChatSharedModule.Analytics.DefaultStandardizedFields)
			end
			RewriteDropdownStoreModule.toggleDropdown(Current.messageId)
		end
	end, { p1.message }) else nil
	local List = { p1.originalPrefixText, p1.isUserVerified }
	table.insert(List, p1.isTrustedConnection)
	table.insert(List, p1.textTransparency)
	table.insert(List, p1.prefixTextProperties)
	local MapResult = ReactModule.joinBindings(List):map(function(Entry) --[[ Line: 218 ]]
		-- upvalues: ConfigModule (upval), appendTrustedIndicator (upval), UseLocalizationResult (copy), UseTokensResult (copy)
		local Entry1: string = Entry[1]
		local Entry2 = Entry[2]
		local Text = Entry1
		
		if string.len(Entry1) > 0 then
			if Entry2 then
				Text = string.gsub(Text, ":(%S-)$", ConfigModule.VERIFIED_EMOJI .. ":%1")
			end
			local Entry3 = if Entry[4] == nil then 1 else Entry[4]
			local Entry4 = Entry[5]
			
			if Entry[3] or false then
				Text = appendTrustedIndicator(Text, UseLocalizationResult.trustedLabelText, Entry3, Entry4.TextSize, UseTokensResult)
			end
		end
		return Text
	end)
	local MapResult1 = MapResult:map(trim)
	local MapResult2 = p1.bodyTextProperties:map(function(Label) --[[ Line: 247 ]]
		-- upvalues: IsSpatialUIEnabled (copy), MessageTextSize (copy)
		return if IsSpatialUIEnabled then MessageTextSize else Label.TextSize
	end)
	local List1 = {
		MapResult,
		p1.shouldShowTranslationToggle,
		p1.originalBodyText,
		p1.prefixTextProperties
	}
	
	if FFlagExpChatRewriteInlineModule and FFlagEnableInExpChatRewriteModule then
		table.insert(List1, p1.wasRewritten)
		table.insert(List1, p1.isRewriteWindowOpen)
	end
	local v1: number? = nil
	
	if FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module then
		v1 = #List1 + 1
		table.insert(List1, p1.chatActionType)
	end
	local v2: number? = nil
	
	if FFlagExpChatPolishSummaryMessageUIModule or FFlagExpChatPresetChatEnabled then
		v2 = #List1 + 1
		table.insert(List1, MapResult2)
	end
	local v3: number? = nil
	
	if FFlagExpChatPresetChatEnabled and p1.isPresetMessage ~= nil then
		v3 = #List1 + 1
		table.insert(List1, p1.isPresetMessage)
	end
	local v4: number? = nil
	
	if IsChatWindowEnlargeEnabledModule() and p1.effects ~= nil then
		v4 = #List1 + 1
		table.insert(List1, p1.effects)
	end
	local MapResult3 = ReactModule.joinBindings(List1):map(function(Entry) --[[ Line: 282 ]]
		-- upvalues: IsChatWindowEnlargeEnabledModule (upval), v4 (ref), ApplyChatWindowMessageEffectsModule (upval), FFlagExpChatPresetChatEnabled (upval), v3 (ref), GetPresetIconRichTextFunction (upval), v2 (ref), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module (upval), v1 (ref), TextChatMessageChatActionTypeModule (upval), FFlagExpChatPolishSummaryMessageUIModule (upval), SummaryMessageRichTextModule (upval), UseTokensResult (copy), DuplicateInvisibleTextModule (upval), FFlagExpChatRewriteInlineModule (upval), FFlagEnableInExpChatRewriteModule (upval), FoundationModule (upval), RewrittenLabelText (ref)
		local Entry1: string = Entry[1]
		local Entry2 = Entry[2]
		local Entry3 = Entry[4]
		local Entry4 = Entry[3]
		
		if IsChatWindowEnlargeEnabledModule() and v4 ~= nil then
			Entry4 = ApplyChatWindowMessageEffectsModule(Entry4, Entry[v4])
		end
		if FFlagExpChatPresetChatEnabled and v3 ~= nil and Entry[v3] then
			Entry4 ..= ` {GetPresetIconRichTextFunction(Entry[v2])}`
		end
		if FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2Module and Entry[v1] == TextChatMessageChatActionTypeModule.Summary then
			local Entry5 = if FFlagExpChatPolishSummaryMessageUIModule then Entry[v2] else nil
			Entry4 = SummaryMessageRichTextModule.wrapInSummaryMutedStyle(SummaryMessageRichTextModule.getSummaryIconPrefix(Entry5) .. " " .. Entry4, UseTokensResult.Color.Content.Muted.Color3:ToHex(), Entry5)
		end
		if string.len(Entry1) > 0 then
			if Entry2 then
				Entry4 = "     " .. Entry4
			end
			Entry4 = DuplicateInvisibleTextModule(Entry1, Entry3.FontFace, Entry3.TextSize) .. " " .. Entry4
		end
		if FFlagExpChatRewriteInlineModule and FFlagEnableInExpChatRewriteModule then
			local Entry6 = Entry[6]
			
			if Entry[5] then
				Entry4 = `{Entry4} <font size='{Entry3.TextSize - 4}' color='#{UseTokensResult.Color.Content.Muted.Color3:ToHex()}'>{`({RewrittenLabelText})`}<font transparency='1'><stroke transparency='1'>_</stroke></font>{`<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{if Entry6 then FoundationModule.Enums.IconName.ChevronLargeUp else FoundationModule.Enums.IconName.ChevronLargeDown}</font>`}</font>`
			end
		end
		return Entry4
	end)
	local MapResult4 = MapResult2:map(function(p2: number): UDim2 --[[ Line: 344 ]]
		return UDim2.new(0, p2 - 2, 0, p2 - 2)
	end)
	local MapResult5 = p1.originalPrefixText:map(function(Text: string): boolean --[[ Line: 347 ]]
		return string.len(Text) > 0
	end)
	local v5 = "UIGradient"
	local MapResult6 = p1.prefixTextProperties:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v5 (copy)
		return if p2 then p2[v5] else nil
	end)
	local MapResult7 = if IsChatWindowEnlargeEnabledModule() and p1.effects ~= nil then ReactModule.joinBindings({ p1.effects, p1.prefixTextProperties }):map(function(Entry): UDim2 --[[ Line: 354 ]]
		-- upvalues: GetChatWindowPrefixOffsetModule (upval)
		return UDim2.fromOffset(0, GetChatWindowPrefixOffsetModule(Entry[1], Entry[2].TextSize))
	end) else nil
	local MapResult8 = if FFlagExpChatMessageEffectChatWindowEnlargeLineHeightModule and IsChatWindowEnlargeEnabledModule() and p1.effects ~= nil then ReactModule.joinBindings({ p1.effects, MapResult2, p1.prefixTextProperties }):map(function(Entry) --[[ Line: 365 ]]
		-- upvalues: GetChatWindowMessageLineHeightModule (upval)
		return GetChatWindowMessageLineHeightModule(Entry[1], Entry[2], Entry[3].TextSize)
	end) else nil
	local MapResult9 = nil
	local MapResult10 = nil
	
	if FFlagEnableInExpChatRewriteModule then
		local WasRewritten = p1.wasRewritten
		MapResult9 = WasRewritten:map(function(p2): boolean --[[ Line: 375 ]]
			-- upvalues: FFlagExpChatRewriteInlineModule (upval)
			return p2 and not FFlagExpChatRewriteInlineModule
		end)
		
		if FFlagExpChatRewriteInlineModule then
			local ChatWindowTransparencyBindable = p1.chatWindowTransparencyBindable
			
			if ChatWindowTransparencyBindable == nil then
				MapResult10 = WasRewritten
			elseif typeof(ChatWindowTransparencyBindable) == "number" then
				local IsChatWindowTransparencyBindableBelow = ChatWindowTransparencyBindable < FIntExpChatWindowTransparencyRewriteInteractableThresholdModule
				MapResult10 = WasRewritten:map(function(p2) --[[ Line: 386 ]]
					-- upvalues: IsChatWindowTransparencyBindableBelow (copy)
					return p2 and IsChatWindowTransparencyBindableBelow
				end)
			else
				MapResult10 = ReactModule.joinBindings({ WasRewritten, ChatWindowTransparencyBindable }):map(function(Entry): boolean --[[ Line: 393 ]]
					-- upvalues: FIntExpChatWindowTransparencyRewriteInteractableThresholdModule (upval)
					return Entry[1] and Entry[2] < FIntExpChatWindowTransparencyRewriteInteractableThresholdModule
				end)
			end
		end
	end
	local UseCursorResult = UseCursorFunction()
	local MapResult11 = if FFlagExpChatMessageEffectChatWindowEnlargePaddingModule and IsChatWindowEnlargeEnabledModule() and p1.effects ~= nil then p1.effects:map(function(List): UDim --[[ Line: 403 ]]
		-- upvalues: MessageEffectModule (upval), FIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule (upval)
		return UDim.new(0, if List and table.find(List, MessageEffectModule.ChatWindowEnlarge) then FIntExpChatMessageEffectChatWindowEnlargePaddingPixelsModule else 0)
	end) else nil
	local v6 = "FontFace"
	local MapResult12 = p1.prefixTextProperties:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v6 (copy)
		return if p2 then p2[v6] else nil
	end)
	local v7 = "TextColor3"
	local MapResult13 = p1.prefixTextProperties:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v7 (copy)
		return if p2 then p2[v7] else nil
	end)
	local v8 = "TextSize"
	local MapResult14 = p1.prefixTextProperties:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v8 (copy)
		return if p2 then p2[v8] else nil
	end)
	local v9 = "TextStrokeColor3"
	local v10 = "TextStrokeTransparency"
	local v11 = "Enabled"
	local MapResult15 = MapResult6:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v11 (copy)
		return if p2 then p2[v11] else nil
	end)
	local v12 = "Color"
	local MapResult16 = MapResult6:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v12 (copy)
		return if p2 then p2[v12] else nil
	end)
	local v13 = "Offset"
	local MapResult17 = MapResult6:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v13 (copy)
		return if p2 then p2[v13] else nil
	end)
	local v14 = "Rotation"
	local MapResult18 = MapResult6:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v14 (copy)
		return if p2 then p2[v14] else nil
	end)
	local v15 = "Transparency"
	local v16 = "FontFace"
	local MapResult19 = p1.bodyTextProperties:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v16 (copy)
		return if p2 then p2[v16] else nil
	end)
	local v17 = "TextColor3"
	local MapResult20 = p1.bodyTextProperties:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v17 (copy)
		return if p2 then p2[v17] else nil
	end)
	local v18 = "TextStrokeColor3"
	local v19 = "TextStrokeTransparency"
	local v20 = "FontFace"
	local MapResult21 = p1.prefixTextProperties:map(function(p2) --[[ Line: 71 ]]
		-- upvalues: v20 (copy)
		return if p2 then p2[v20] else nil
	end)
	local v21 = "TextSize"
	local Frame = ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingRight = p1.arButtonPadding,
			PaddingTop = MapResult11,
			PaddingBottom = MapResult11
		}),
		ColumnLayout = if FFlagEnableInExpChatRewriteModule and not FFlagExpChatRewriteInlineModule then ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}) else nil,
		TextMessage = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new(1, 0, 0, 0),
			LayoutOrder = if FFlagEnableInExpChatRewriteModule then 1 else nil
		}, {
			PrefixText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				RichText = true,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.XY,
				FontFace = MapResult12,
				LineHeight = MapResult8,
				Position = MapResult7,
				Text = MapResult,
				TextColor3 = MapResult13,
				TextSize = MapResult14,
				TextStrokeColor3 = p1.prefixTextProperties:map(function(p2) --[[ Line: 71 ]]
					-- upvalues: v9 (copy)
					return if p2 then p2[v9] else nil
				end),
				TextStrokeTransparency = MergeBindableScalarModule(p1.prefixTextProperties:map(function(p2) --[[ Line: 71 ]]
					-- upvalues: v10 (copy)
					return if p2 then p2[v10] else nil
				end), p1.textTransparency),
				TextTransparency = MergeBindableScalarModule(0, p1.textTransparency),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				Visible = MapResult5
			}, {
				UIGradient = ReactModule.createElement("UIGradient", {
					Enabled = MapResult15,
					Color = MapResult16,
					Offset = MapResult17,
					Rotation = MapResult18,
					Transparency = MapResult6:map(function(p2) --[[ Line: 71 ]]
						-- upvalues: v15 (copy)
						return if p2 then p2[v15] else nil
					end)
				})
			}),
			BodyText = ReactModule.createElement(if FFlagExpChatRewriteInlineModule and FFlagEnableInExpChatRewriteModule then "TextButton" else "TextLabel", {
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				FontFace = MapResult19,
				LineHeight = MapResult8,
				RichText = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = MapResult3,
				TextColor3 = MapResult20,
				TextSize = MapResult2,
				TextStrokeColor3 = p1.bodyTextProperties:map(function(p2) --[[ Line: 71 ]]
					-- upvalues: v18 (copy)
					return if p2 then p2[v18] else nil
				end),
				TextStrokeTransparency = MergeBindableScalarModule(p1.bodyTextProperties:map(function(p2) --[[ Line: 71 ]]
					-- upvalues: v19 (copy)
					return if p2 then p2[v19] else nil
				end), p1.textTransparency),
				TextTransparency = MergeBindableScalarModule(0, p1.textTransparency),
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				[ReactModule.Change.Text] = UseResult,
				[ReactModule.Event.Activated] = if FFlagExpChatRewriteInlineModule and FFlagEnableInExpChatRewriteModule then UseResult3 else nil,
				Interactable = if FFlagExpChatRewriteInlineModule and FFlagEnableInExpChatRewriteModule then MapResult10 else nil
			}),
			TextMessageButton = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Position = MapResult7,
				Size = UDim2.new(1, 0, 0, 0),
				Visible = MapResult5
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				TextButton = ReactModule.createElement("TextButton", {
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					FontFace = MapResult21,
					LineHeight = MapResult8,
					RichText = true,
					SelectionImageObject = UseCursorResult,
					Size = UDim2.new(0, 0, 0, 0),
					Text = MapResult1,
					TextSize = p1.prefixTextProperties:map(function(p2) --[[ Line: 71 ]]
						-- upvalues: v21 (copy)
						return if p2 then p2[v21] else nil
					end),
					TextStrokeTransparency = 1,
					TextTransparency = 1,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					LayoutOrder = 1,
					[ReactModule.Event.Activated] = UseResult1
				}),
				TranslationButton = ReactModule.createElement("ImageButton", {
					BackgroundTransparency = 1,
					HoverImage = "rbxasset://textures/translateIconDark.png",
					Image = "rbxasset://textures/translateIcon.png",
					ImageTransparency = MergeBindableScalarModule(0, p1.textTransparency),
					LayoutOrder = 2,
					PressedImage = "rbxasset://textures/translateIconDark.png",
					SelectionImageObject = UseCursorResult,
					Size = MapResult4,
					Visible = p1.shouldShowTranslationToggle,
					[ReactModule.Event.Activated] = UseResult2
				})
			})
		}),
		RewriteToggle = if FFlagEnableInExpChatRewriteModule and not FFlagExpChatRewriteInlineModule then ReactModule.createElement(RewriteToggleModule, {
			LayoutOrder = 2,
			isRewriteMenuOpen = p1.isRewriteWindowOpen,
			textTransparency = p1.textTransparency,
			onActivated = UseResult3,
			Visible = MapResult9
		}) else nil
	})
	
	if FFlagDebugMessageProfilingModule then
		debug.profileend()
	end
	return Frame
end)