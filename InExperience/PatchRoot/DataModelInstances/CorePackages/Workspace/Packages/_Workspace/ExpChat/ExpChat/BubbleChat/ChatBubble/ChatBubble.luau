local ExpChat = script:FindFirstAncestor("ExpChat")
local TextChatService = game:GetService("TextChatService")
local GetEnablePerBubbleCustomizationModule = require(ExpChat.Flags.getEnablePerBubbleCustomization)
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local OtterModule = require(Parent.Otter)
local Dictionary = require(Parent.llama).Dictionary
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ConfigModule = require(ExpChat.Config)
local MemoizeModule = require(ExpChat.memoize)
local Helpers = ExpChat.BubbleChat.Helpers
local GetSpringFromSettingsModule = require(Helpers.getSpringFromSettings)
local GetTextBoundsModule = require(Helpers.getTextBounds)
local GetDictFromBubbleChatMessagePropertiesModule = require(Helpers.getDictFromBubbleChatMessageProperties)
local ShouldSendHighFrequencyTelemetryModule = require(ExpChat.shouldSendHighFrequencyTelemetry)
local ClientSettingsUtilityModule = require(ExpChat.ClientSettings.ClientSettingsUtility)
local GetFFlagExpChatUseUpdatedMessageRenderedModule = require(ExpChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local v1 = require(ExpChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local GetFFlagExpChatExcludeFOMORendersModule = require(ExpChat.Flags.getFFlagExpChatExcludeFOMORenders)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(ExpChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local GetPresetIconRichTextFunction = ExpChatSharedModule.getPresetIconRichText
local GetPresetIconSizeFunction = ExpChatSharedModule.getPresetIconSize
local IsPresetMessageFunction = ExpChatSharedModule.isPresetMessage
local ChatBubble = RoactModule.Component:extend("ChatBubble")
ChatBubble.defaultProps = { isMostRecent = true, text = "", timestamp = 0 }
local Callback = MemoizeModule(function(p1, p2) --[[ Line: 43 ]]
	-- upvalues: Dictionary (copy), GetDictFromBubbleChatMessagePropertiesModule (copy)
	return if p2 then Dictionary.join(p1, GetDictFromBubbleChatMessagePropertiesModule(p2)) else p1
end)

function ChatBubble.init(p1) --[[ Line: 54 ]]
	-- upvalues: RoactModule (copy), OtterModule (copy)
	p1.width, p1.updateWidth = RoactModule.createBinding(0)
	p1.widthMotor = OtterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(Value: number) --[[ Line: 57 ]]
		-- upvalues: p1 (copy)
		p1.updateWidth((math.round(Value)))
	end)
	p1.height, p1.updateHeight = RoactModule.createBinding(0)
	p1.heightMotor = OtterModule.createSingleMotor(0)
	p1.heightMotor:onStep(function(Value: number) --[[ Line: 63 ]]
		-- upvalues: p1 (copy)
		p1.updateHeight((math.round(Value)))
	end)
	p1.transparency, p1.updateTransparency = RoactModule.createBinding(1)
	p1.transparencyMotor = OtterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	p1.backgroundTransparency, p1.updateBackgroundTransparency = RoactModule.createBinding(1)
	p1.backgroundTransparencyMotor = OtterModule.createSingleMotor(1)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	p1.size = RoactModule.joinBindings({ p1.width, p1.height }):map(function(Entry): UDim2 --[[ Line: 75 ]]
		return UDim2.fromOffset(Entry[1], Entry[2])
	end)
end

function ChatBubble.render(p1) --[[ Line: 80 ]]
	-- upvalues: GetEnablePerBubbleCustomizationModule (copy), Callback (copy), ConfigModule (copy), FFlagExpChatPresetChatEnabled (copy), IsPresetMessageFunction (copy), GetFFlagExpChatUseUpdatedMessageRenderedModule (copy), ShouldSendHighFrequencyTelemetryModule (copy), v1 (copy), GetFFlagExpChatExcludeFOMORendersModule (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), TextChatService (copy), GetPresetIconRichTextFunction (copy), RoactModule (copy), Dictionary (copy)
	local CallbackResult = if GetEnablePerBubbleCustomizationModule() then Callback(p1.props.chatSettings, p1.props.bubbleChatMessageProperties) else p1.props.chatSettings
	local UICorner = nil
	local FontFace = nil
	local ImageLabel = nil
	local UIGradient = nil
	local UIPadding = nil
	
	if p1.props.isTextChatServiceOn then
		ImageLabel = CallbackResult.ImageLabel
		UIGradient = CallbackResult.UIGradient
		UICorner = CallbackResult.UICorner
		UIPadding = CallbackResult.UIPadding
		FontFace = CallbackResult.FontFace
	else
		ImageLabel = CallbackResult.BackgroundImage
		UIGradient = CallbackResult.BackgroundGradient
		
		if CallbackResult.CornerEnabled then
			UICorner = { CornerRadius = CallbackResult.CornerRadius }
		elseif CallbackResult.CornerEnabled == false then
			UICorner = { CornerRadius = UDim.new(0, 0) }
		end
		UIPadding = CallbackResult.Padding and {
			PaddingTop = UDim.new(0, CallbackResult.Padding),
			PaddingRight = UDim.new(0, CallbackResult.Padding),
			PaddingBottom = UDim.new(0, CallbackResult.Padding),
			PaddingLeft = UDim.new(0, CallbackResult.Padding)
		} or nil
	end
	local CornerRadius = ConfigModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius
	local UIPadding1 = ConfigModule.DefaultBubbleChatChildrenCustomizationProperties.UIPadding
	local NewX = p1.props.renderInsert and p1.props.insertSize.X + CallbackResult.Padding or 0
	local IsTextChatServiceOn = FFlagExpChatPresetChatEnabled and (IsPresetMessageFunction(p1.props) and p1.props.isTextChatServiceOn)
	local ShowCaret = p1.props.isMostRecent and (CallbackResult.TailVisible and p1.props.showCaret)
	
	if GetFFlagExpChatUseUpdatedMessageRenderedModule() and p1.props.textChatMessageInstance and ShouldSendHighFrequencyTelemetryModule(v1) and (not GetFFlagExpChatExcludeFOMORendersModule() or not p1.props.isHiddenMessage) then
		if EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
			TextChatService:SendExpChatMessageClientRendered(p1.props.textChatMessageInstance, "bubble_chat", -1)
		else
			TextChatService:SendExpChatMessageClientRendered(p1.props.textChatMessageInstance, "bubble_chat")
		end
	end
	local Translation = nil
	
	if FFlagExpChatPresetChatEnabled then
		Translation = if p1.props.useTranslation and p1.props.translation and p1.props.translation ~= "" then p1.props.translation else p1.props.text
		
		if IsTextChatServiceOn then
			Translation ..= ` {GetPresetIconRichTextFunction(CallbackResult.TextSize)}`
		end
	end
	return RoactModule.createElement("Frame", {
		Transparency = 1,
		LayoutOrder = p1.props.timestamp,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = p1.size,
		Position = UDim2.fromScale(1, 0.5)
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, -1)
		}),
		ChatBubbleFrame = RoactModule.createElement("ImageLabel", Dictionary.join(ImageLabel, {
			LayoutOrder = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			BackgroundColor3 = CallbackResult.BackgroundColor3,
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.new(0.5, 0, 0, 0),
			BackgroundTransparency = if ImageLabel and ImageLabel.Image ~= "" then 1 else p1.backgroundTransparency or p1.transparency,
			ImageTransparency = p1.backgroundTransparency or p1.transparency
		}), {
			UICorner = UICorner and RoactModule.createElement("UICorner", { CornerRadius = UICorner.CornerRadius }) or RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }),
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, CallbackResult.Padding)
			}),
			Padding = UIPadding and RoactModule.createElement("UIPadding", UIPadding) or RoactModule.createElement("UIPadding", UIPadding1),
			Insert = p1.props.renderInsert and p1.props.renderInsert(),
			Text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutoLocalize = false,
				LayoutOrder = 2,
				Text = if FFlagExpChatPresetChatEnabled then Translation elseif p1.props.useTranslation and p1.props.translation and p1.props.translation ~= "" then p1.props.translation else p1.props.text,
				Size = UDim2.new(1, -NewX, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				FontFace = FontFace or nil,
				Font = if FontFace then nil else CallbackResult.Font,
				TextColor3 = CallbackResult.TextColor3,
				TextSize = CallbackResult.TextSize,
				TextTransparency = p1.transparency,
				RichText = p1.props.isTextChatServiceOn
			}),
			Gradient = UIGradient ~= nil and RoactModule.createElement("UIGradient", UIGradient)
		}),
		Caret = if ShowCaret then RoactModule.createElement("ImageLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			Size = UDim2.fromOffset(9, 6),
			ImageColor3 = CallbackResult.BackgroundColor3,
			ImageTransparency = p1.backgroundTransparency
		}, {
			Gradient = UIGradient ~= nil and RoactModule.createElement("UIGradient", UIGradient)
		}) else nil
	})
end

function ChatBubble.fadeOut(p1) --[[ Line: 246 ]]
	-- upvalues: GetEnablePerBubbleCustomizationModule (copy), Callback (copy), GetSpringFromSettingsModule (copy)
	local CallbackResult = if GetEnablePerBubbleCustomizationModule() then Callback(p1.props.chatSettings, p1.props.bubbleChatMessageProperties) else p1.props.chatSettings
	
	if not p1.isFadingOut then
		p1.isFadingOut = true
		p1.transparencyMotor:onComplete(function() --[[ Line: 254 ]]
			-- upvalues: p1 (copy)
			if p1.props.onFadeOut then
				p1.props.onFadeOut(p1.props.messageId)
			end
		end)
		local Transparency = GetSpringFromSettingsModule(CallbackResult, "transparency")
		p1.transparencyMotor:setGoal(Transparency(1))
		p1.backgroundTransparencyMotor:setGoal(Transparency(1))
	end
end

function ChatBubble.didUpdate(p1, p2) --[[ Line: 266 ]]
	-- upvalues: GetEnablePerBubbleCustomizationModule (copy), Callback (copy), GetTextBoundsModule (copy), GetSpringFromSettingsModule (copy), FFlagExpChatPresetChatEnabled (copy), IsPresetMessageFunction (copy), GetPresetIconSizeFunction (copy)
	if p1.props.fadingOut then
		p1:fadeOut()
	end
	local CallbackResult = if GetEnablePerBubbleCustomizationModule() then Callback(p1.props.chatSettings, p1.props.bubbleChatMessageProperties) else p1.props.chatSettings
	
	if p2.text ~= p1.props.text or p2.useTranslation ~= p1.props.useTranslation or p2.translation ~= p1.props.translation or p2.chatSettings ~= p1.props.chatSettings or p2.renderInsert ~= p1.props.renderInsert or p2.insertSize ~= p1.props.insertSize then
		local TextBoundsModule = if p1.props.useTranslation and p1.props.translation and p1.props.translation ~= "" then GetTextBoundsModule(p1.props.translation, CallbackResult) else GetTextBoundsModule(p1.props.text, CallbackResult)
		local Size = GetSpringFromSettingsModule(CallbackResult, "size")
		local Padding: number = CallbackResult.Padding
		local X = TextBoundsModule.X
		local Y = TextBoundsModule.Y
		
		if p1.props.renderInsert then
			X += p1.props.insertSize.X + Padding
			Y = math.max(Y, p1.props.insertSize.Y + Padding * 2)
		end
		local IsTextChatServiceOn = FFlagExpChatPresetChatEnabled and (IsPresetMessageFunction(p1.props) and p1.props.isTextChatServiceOn)
		
		if FFlagExpChatPresetChatEnabled and IsTextChatServiceOn then
			local PresetIconSize: number = GetPresetIconSizeFunction(CallbackResult.TextSize)
			X += PresetIconSize + Padding
			Y = math.max(Y, PresetIconSize)
		end
		p1.heightMotor:setGoal(Size(Y))
		p1.widthMotor:setGoal(Size(X))
	end
end

function ChatBubble.didMount(p1) --[[ Line: 311 ]]
	-- upvalues: GetEnablePerBubbleCustomizationModule (copy), Callback (copy), GetTextBoundsModule (copy), GetSpringFromSettingsModule (copy), FFlagExpChatPresetChatEnabled (copy), IsPresetMessageFunction (copy), GetPresetIconSizeFunction (copy), OtterModule (copy), ClientSettingsUtilityModule (copy)
	p1.isMounted = true
	local CallbackResult = if GetEnablePerBubbleCustomizationModule() then Callback(p1.props.chatSettings, p1.props.bubbleChatMessageProperties) else p1.props.chatSettings
	local TextBoundsModule = if p1.props.useTranslation and p1.props.translation and p1.props.translation ~= "" then GetTextBoundsModule(p1.props.translation, CallbackResult) else GetTextBoundsModule(p1.props.text, CallbackResult)
	local Size = GetSpringFromSettingsModule(CallbackResult, "size")
	local Transparency = GetSpringFromSettingsModule(CallbackResult, "transparency")
	local X = TextBoundsModule.X
	local Y = TextBoundsModule.Y
	
	if p1.props.renderInsert then
		X += p1.props.insertSize.X + CallbackResult.Padding
		Y = math.max(Y, p1.props.insertSize.Y + CallbackResult.Padding * 2)
	end
	local IsTextChatServiceOn = FFlagExpChatPresetChatEnabled and (IsPresetMessageFunction(p1.props) and p1.props.isTextChatServiceOn)
	
	if FFlagExpChatPresetChatEnabled and IsTextChatServiceOn then
		local PresetIconSize: number = GetPresetIconSizeFunction(CallbackResult.TextSize)
		X += PresetIconSize + CallbackResult.Padding
		Y = math.max(Y, PresetIconSize)
	end
	if p1.props.isMostRecent then
		p1.heightMotor:setGoal(Size(Y))
		p1.widthMotor:setGoal(OtterModule.instant(X))
	else
		p1.heightMotor:setGoal(Size(Y))
		p1.widthMotor:setGoal(Size(X))
	end
	p1.transparencyMotor:setGoal(Transparency(CallbackResult.Transparency))
	local BackgroundTransparency = ClientSettingsUtilityModule.getBackgroundTransparency(CallbackResult, p1.props.clientSettings)
	
	if GetEnablePerBubbleCustomizationModule() then
		local BubbleChatMessageProperties = p1.props.bubbleChatMessageProperties
		
		if BubbleChatMessageProperties and BubbleChatMessageProperties.BackgroundTransparency then
			BackgroundTransparency = ClientSettingsUtilityModule.getBackgroundTransparency({
				BackgroundTransparency = BubbleChatMessageProperties.BackgroundTransparency
			}, p1.props.clientSettings)
		end
	end
	p1.backgroundTransparencyMotor:setGoal(Transparency(BackgroundTransparency))
end

function ChatBubble.willUnmount(p1) --[[ Line: 370 ]]
	p1.isMounted = false
	p1.transparencyMotor:destroy()
	p1.backgroundTransparencyMotor:destroy()
	p1.heightMotor:destroy()
	p1.widthMotor:destroy()
end

return ChatBubble