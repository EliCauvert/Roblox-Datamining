local expChat = script:FindFirstAncestor("ExpChat")
local textChatService = game:GetService("TextChatService")
local getEnablePerBubbleCustomizationModule = require(expChat.Flags.getEnablePerBubbleCustomization)
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local otterModule = require(parent.Otter)
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
local configModule = require(expChat.Config)
local memoizeModule = require(expChat.memoize)
local helpers = expChat.BubbleChat.Helpers
local getSpringFromSettingsModule = require(helpers.getSpringFromSettings)
local getTextBoundsModule = require(helpers.getTextBounds)
local getDictFromBubbleChatMessagePropertiesModule = require(helpers.getDictFromBubbleChatMessageProperties)
local shouldSendHighFrequencyTelemetryModule = require(expChat.shouldSendHighFrequencyTelemetry)
local clientSettingsUtilityModule = require(expChat.ClientSettings.ClientSettingsUtility)
local getFFlagExpChatUseUpdatedMessageRenderedModule = require(expChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local var1 = require(expChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local getFFlagExpChatExcludeFOMORendersModule = require(expChat.Flags.getFFlagExpChatExcludeFOMORenders)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(expChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local getPresetIconRichText = expChatSharedModule.getPresetIconRichText
local getPresetIconSize = expChatSharedModule.getPresetIconSize
local isPresetMessage = expChatSharedModule.isPresetMessage
local chatBubble = roactModule.Component:extend("ChatBubble")
chatBubble.defaultProps = { isMostRecent = true, text = "", timestamp = 0 }
local var2 = memoizeModule(function(p1, p2)
	-- upvalues: dictionary (ref), getDictFromBubbleChatMessagePropertiesModule (ref)
	return if p2 then dictionary.join(p1, getDictFromBubbleChatMessagePropertiesModule(p2)) else p1
end)

function chatBubble.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref)
	local var3, var4 = roactModule.createBinding(0)
	p1.width = var3
	p1.updateWidth = var4
	p1.widthMotor = otterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateWidth(math.round(p2))
	end)
	local var5, var6 = roactModule.createBinding(0)
	p1.height = var5
	p1.updateHeight = var6
	p1.heightMotor = otterModule.createSingleMotor(0)
	p1.heightMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateHeight(math.round(p2))
	end)
	local var7, var8 = roactModule.createBinding(1)
	p1.transparency = var7
	p1.updateTransparency = var8
	p1.transparencyMotor = otterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	local var9, var10 = roactModule.createBinding(1)
	p1.backgroundTransparency = var9
	p1.updateBackgroundTransparency = var10
	p1.backgroundTransparencyMotor = otterModule.createSingleMotor(1)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	p1.size = roactModule.joinBindings({ p1.width, p1.height }):map(function(p2)
		return UDim2.fromOffset(p2[1], p2[2])
	end)
end

function chatBubble.render(p1)
	-- upvalues: getEnablePerBubbleCustomizationModule (ref), var2 (ref), configModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), var1 (ref), getFFlagExpChatExcludeFOMORendersModule (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), textChatService (ref), getPresetIconRichText (ref), roactModule (ref), dictionary (ref)
	local backgroundImage, backgroundGradient, var3
	local var4 = if getEnablePerBubbleCustomizationModule() then var2(p1.props.chatSettings, p1.props.bubbleChatMessageProperties) else p1.props.chatSettings
	local _ = nil
	local _ = nil
	local t = nil
	local _ = nil
	local fontFace = nil
	
	if p1.props.isTextChatServiceOn then
		backgroundImage = var4.ImageLabel
		backgroundGradient = var4.UIGradient
		t = var4.UICorner
		var3 = var4.UIPadding
		fontFace = var4.FontFace
	else
		backgroundImage = var4.BackgroundImage
		backgroundGradient = var4.BackgroundGradient
		
		if var4.CornerEnabled then
			t = { CornerRadius = var4.CornerRadius }
		elseif var4.CornerEnabled == false then
			t = { CornerRadius = UDim.new(0, 0) }
		end
		var3 = if var4.Padding then {
			PaddingTop = UDim.new(0, var4.Padding),
			PaddingRight = UDim.new(0, var4.Padding),
			PaddingBottom = UDim.new(0, var4.Padding),
			PaddingLeft = UDim.new(0, var4.Padding)
		} else nil
	end
	local cornerRadius = configModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius
	local UIPadding = configModule.DefaultBubbleChatChildrenCustomizationProperties.UIPadding
	local var5 = if p1.props.renderInsert then p1.props.insertSize.X + var4.Padding else 0
	local isTextChatServiceOn = fFlagExpChatPresetChatEnabled and (isPresetMessage(p1.props) and p1.props.isTextChatServiceOn)
	local showCaret = p1.props.isMostRecent and (var4.TailVisible and p1.props.showCaret)
	
	if getFFlagExpChatUseUpdatedMessageRenderedModule() and p1.props.textChatMessageInstance and shouldSendHighFrequencyTelemetryModule(var1) and (not getFFlagExpChatExcludeFOMORendersModule() or not p1.props.isHiddenMessage) then
		if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
			textChatService:SendExpChatMessageClientRendered(p1.props.textChatMessageInstance, "bubble_chat", -1)
		else
			textChatService:SendExpChatMessageClientRendered(p1.props.textChatMessageInstance, "bubble_chat")
		end
	end
	local text = nil
	
	if fFlagExpChatPresetChatEnabled then
		text = if p1.props.useTranslation and p1.props.translation and p1.props.translation ~= "" then p1.props.translation else p1.props.text
		
		if isTextChatServiceOn then
			text ..= ` {getPresetIconRichText(var4.TextSize)}`
		end
	end
	local var6
	local createElement = roactModule.createElement
	local var7 = "Frame"
	local t_1 = {
		Transparency = 1,
		LayoutOrder = p1.props.timestamp,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = p1.size,
		Position = UDim2.fromScale(1, 0.5)
	}
	local t_2 = {
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, -1)
		})
	}
	local createElement_1 = roactModule.createElement
	local var8 = "ImageLabel"
	local join = dictionary.join
	join = join(backgroundImage, {
		LayoutOrder = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		BackgroundColor3 = var4.BackgroundColor3,
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundTransparency = if backgroundImage and backgroundImage.Image ~= "" then 1 else p1.backgroundTransparency or p1.transparency,
		ImageTransparency = p1.backgroundTransparency or p1.transparency
	})
	t_2.ChatBubbleFrame = createElement_1(var8, join, {
		UICorner = t and roactModule.createElement("UICorner", { CornerRadius = t.CornerRadius }) or roactModule.createElement("UICorner", { CornerRadius = cornerRadius }),
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, var4.Padding)
		}),
		Padding = var3 and roactModule.createElement("UIPadding", var3) or roactModule.createElement("UIPadding", UIPadding),
		Insert = p1.props.renderInsert and p1.props.renderInsert(),
		Text = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutoLocalize = false,
			LayoutOrder = 2,
			Text = if fFlagExpChatPresetChatEnabled then text elseif p1.props.useTranslation and p1.props.translation and p1.props.translation ~= "" then p1.props.translation else p1.props.text,
			Size = UDim2.new(1, -var5, 1, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			FontFace = fontFace or nil,
			Font = if not fontFace then var4.Font else nil,
			TextColor3 = var4.TextColor3,
			TextSize = var4.TextSize,
			TextTransparency = p1.transparency,
			RichText = p1.props.isTextChatServiceOn
		}),
		Gradient = backgroundGradient ~= nil and roactModule.createElement("UIGradient", backgroundGradient)
	})
	
	if showCaret then
		var6 = roactModule.createElement
		var6 = var6("ImageLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			Size = UDim2.fromOffset(9, 6),
			ImageColor3 = var4.BackgroundColor3,
			ImageTransparency = p1.backgroundTransparency
		}, {
			Gradient = backgroundGradient ~= nil and roactModule.createElement("UIGradient", backgroundGradient)
		})
	else
		var6 = nil
	end
	t_2.Caret = var6
	
	return createElement(var7, t_1, t_2)
end

function chatBubble.fadeOut(p1)
	-- upvalues: getEnablePerBubbleCustomizationModule (ref), var2 (ref), getSpringFromSettingsModule (ref)
	local var3 = if getEnablePerBubbleCustomizationModule() then var2(p1.props.chatSettings, p1.props.bubbleChatMessageProperties) else p1.props.chatSettings
	
	if not p1.isFadingOut then
		p1.isFadingOut = true
		p1.transparencyMotor:onComplete(function()
			-- upvalues: p1 (ref)
			if p1.props.onFadeOut then
				p1.props.onFadeOut(p1.props.messageId)
			end
		end)
		local var4 = getSpringFromSettingsModule(var3, "transparency")
		p1.transparencyMotor:setGoal(var4(1))
		p1.backgroundTransparencyMotor:setGoal(var4(1))
	end
end

function chatBubble.didUpdate(p1, p2)
	-- upvalues: getEnablePerBubbleCustomizationModule (ref), var2 (ref), getTextBoundsModule (ref), getSpringFromSettingsModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconSize (ref)
	if p1.props.fadingOut then
		p1:fadeOut()
	end
	local var3 = if getEnablePerBubbleCustomizationModule() then var2(p1.props.chatSettings, p1.props.bubbleChatMessageProperties) else p1.props.chatSettings
	
	if p2.text ~= p1.props.text or p2.useTranslation ~= p1.props.useTranslation or (p2.translation ~= p1.props.translation or p2.chatSettings ~= p1.props.chatSettings) or (p2.renderInsert ~= p1.props.renderInsert or p2.insertSize ~= p1.props.insertSize) then
		local var4 = if p1.props.useTranslation and p1.props.translation and p1.props.translation ~= "" then getTextBoundsModule(p1.props.translation, var3) else getTextBoundsModule(p1.props.text, var3)
		local var5 = getSpringFromSettingsModule(var3, "size")
		local padding = var3.Padding
		local x = var4.X
		local y = var4.Y
		
		if p1.props.renderInsert then
			x += p1.props.insertSize.X + padding
			y = math.max(y, p1.props.insertSize.Y + padding * 2)
		end
		if fFlagExpChatPresetChatEnabled and (fFlagExpChatPresetChatEnabled and (isPresetMessage(p1.props) and p1.props.isTextChatServiceOn)) then
			local var6 = getPresetIconSize(var3.TextSize)
			x += var6 + padding
			y = math.max(y, var6)
		end
		p1.heightMotor:setGoal(var5(y))
		p1.widthMotor:setGoal(var5(x))
	end
end

function chatBubble.didMount(p1)
	-- upvalues: getEnablePerBubbleCustomizationModule (ref), var2 (ref), getTextBoundsModule (ref), getSpringFromSettingsModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconSize (ref), otterModule (ref), clientSettingsUtilityModule (ref)
	p1.isMounted = true
	local var3 = if getEnablePerBubbleCustomizationModule() then var2(p1.props.chatSettings, p1.props.bubbleChatMessageProperties) else p1.props.chatSettings
	local var4 = if p1.props.useTranslation and p1.props.translation and p1.props.translation ~= "" then getTextBoundsModule(p1.props.translation, var3) else getTextBoundsModule(p1.props.text, var3)
	local var5 = getSpringFromSettingsModule(var3, "size")
	local var6 = getSpringFromSettingsModule(var3, "transparency")
	local x = var4.X
	local y = var4.Y
	
	if p1.props.renderInsert then
		x += p1.props.insertSize.X + var3.Padding
		y = math.max(y, p1.props.insertSize.Y + var3.Padding * 2)
	end
	if fFlagExpChatPresetChatEnabled and (fFlagExpChatPresetChatEnabled and (isPresetMessage(p1.props) and p1.props.isTextChatServiceOn)) then
		local var7 = getPresetIconSize(var3.TextSize)
		x += var7 + var3.Padding
		y = math.max(y, var7)
	end
	if p1.props.isMostRecent then
		p1.heightMotor:setGoal(var5(y))
		p1.widthMotor:setGoal(otterModule.instant(x))
	else
		p1.heightMotor:setGoal(var5(y))
		p1.widthMotor:setGoal(var5(x))
	end
	p1.transparencyMotor:setGoal(var6(var3.Transparency))
	local backgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(var3, p1.props.clientSettings)
	
	if getEnablePerBubbleCustomizationModule() then
		local bubbleChatMessageProperties = p1.props.bubbleChatMessageProperties
		
		if bubbleChatMessageProperties and bubbleChatMessageProperties.BackgroundTransparency then
			backgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency({
				BackgroundTransparency = bubbleChatMessageProperties.BackgroundTransparency
			}, p1.props.clientSettings)
		end
	end
	p1.backgroundTransparencyMotor:setGoal(var6(backgroundTransparency))
end

function chatBubble.willUnmount(p1)
	p1.isMounted = false
	p1.transparencyMotor:destroy()
	p1.backgroundTransparencyMotor:destroy()
	p1.heightMotor:destroy()
	p1.widthMotor:destroy()
end

return chatBubble