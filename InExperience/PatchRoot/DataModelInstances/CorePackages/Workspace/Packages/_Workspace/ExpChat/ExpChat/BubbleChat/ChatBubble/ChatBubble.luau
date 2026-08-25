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
local var14 = require(expChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local getFFlagExpChatExcludeFOMORendersModule = require(expChat.Flags.getFFlagExpChatExcludeFOMORenders)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(expChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local getPresetIconRichText = expChatSharedModule.getPresetIconRichText
local getPresetIconSize = expChatSharedModule.getPresetIconSize
local isPresetMessage = expChatSharedModule.isPresetMessage
local chatBubble = roactModule.Component:extend("ChatBubble")
chatBubble.defaultProps = { isMostRecent = true, text = "", timestamp = 0 }
local var18 = memoizeModule(function(p0, p1)
	-- upvalues: dictionary (ref), getDictFromBubbleChatMessagePropertiesModule (ref)
	return if p1 then dictionary.join(p0, getDictFromBubbleChatMessagePropertiesModule(p1)) else p0
end)

function chatBubble.init(p2)
	-- upvalues: roactModule (ref), otterModule (ref)
	local var19, var20 = roactModule.createBinding(0)
	p2.width = var19
	p2.updateWidth = var20
	p2.widthMotor = otterModule.createSingleMotor(0)
	p2.widthMotor:onStep(function(p3)
		-- upvalues: p2 (ref)
		p2.updateWidth(math.round(p3))
	end)
	local var21, var22 = roactModule.createBinding(0)
	p2.height = var21
	p2.updateHeight = var22
	p2.heightMotor = otterModule.createSingleMotor(0)
	p2.heightMotor:onStep(function(p4)
		-- upvalues: p2 (ref)
		p2.updateHeight(math.round(p4))
	end)
	local var23, var24 = roactModule.createBinding(1)
	p2.transparency = var23
	p2.updateTransparency = var24
	p2.transparencyMotor = otterModule.createSingleMotor(1)
	p2.transparencyMotor:onStep(p2.updateTransparency)
	local var25, var26 = roactModule.createBinding(1)
	p2.backgroundTransparency = var25
	p2.updateBackgroundTransparency = var26
	p2.backgroundTransparencyMotor = otterModule.createSingleMotor(1)
	p2.backgroundTransparencyMotor:onStep(p2.updateBackgroundTransparency)
	p2.size = roactModule.joinBindings({ p2.width, p2.height }):map(function(p5)
		return UDim2.fromOffset(p5[1], p5[2])
	end)
end

function chatBubble.render(p6)
	-- upvalues: getEnablePerBubbleCustomizationModule (ref), var18 (ref), configModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), var14 (ref), getFFlagExpChatExcludeFOMORendersModule (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), textChatService (ref), getPresetIconRichText (ref), roactModule (ref), dictionary (ref)
	local backgroundImage, backgroundGradient, var29
	local var27 = if getEnablePerBubbleCustomizationModule() then var18(p6.props.chatSettings, p6.props.bubbleChatMessageProperties) else p6.props.chatSettings
	local _ = nil
	local _ = nil
	local t = nil
	local _ = nil
	local fontFace = nil
	
	if p6.props.isTextChatServiceOn then
		backgroundImage = var27.ImageLabel
		backgroundGradient = var27.UIGradient
		t = var27.UICorner
		var29 = var27.UIPadding
		fontFace = var27.FontFace
	else
		backgroundImage = var27.BackgroundImage
		backgroundGradient = var27.BackgroundGradient
		
		if var27.CornerEnabled then
			t = { CornerRadius = var27.CornerRadius }
		elseif var27.CornerEnabled == false then
			t = { CornerRadius = UDim.new(0, 0) }
		end
		var29 = if var27.Padding then {
			PaddingTop = UDim.new(0, var27.Padding),
			PaddingRight = UDim.new(0, var27.Padding),
			PaddingBottom = UDim.new(0, var27.Padding),
			PaddingLeft = UDim.new(0, var27.Padding)
		} else nil
	end
	local cornerRadius = configModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius
	local UIPadding = configModule.DefaultBubbleChatChildrenCustomizationProperties.UIPadding
	local var30 = if p6.props.renderInsert then p6.props.insertSize.X + var27.Padding else 0
	local isTextChatServiceOn = fFlagExpChatPresetChatEnabled and (isPresetMessage(p6.props) and p6.props.isTextChatServiceOn)
	local showCaret = p6.props.isMostRecent and (var27.TailVisible and p6.props.showCaret)
	
	if getFFlagExpChatUseUpdatedMessageRenderedModule() and p6.props.textChatMessageInstance and shouldSendHighFrequencyTelemetryModule(var14) and (not getFFlagExpChatExcludeFOMORendersModule() or not p6.props.isHiddenMessage) then
		if engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
			textChatService:SendExpChatMessageClientRendered(p6.props.textChatMessageInstance, "bubble_chat", -1)
		else
			textChatService:SendExpChatMessageClientRendered(p6.props.textChatMessageInstance, "bubble_chat")
		end
	end
	local text = nil
	
	if fFlagExpChatPresetChatEnabled then
		text = if p6.props.useTranslation and p6.props.translation and p6.props.translation ~= "" then p6.props.translation else p6.props.text
		
		if isTextChatServiceOn then
			text ..= ` {getPresetIconRichText(var27.TextSize)}`
		end
	end
	local var38
	local createElement = roactModule.createElement
	local var34 = "Frame"
	local t_1 = {
		Transparency = 1,
		LayoutOrder = p6.props.timestamp,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = p6.size,
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
	local var37 = "ImageLabel"
	local join = dictionary.join
	join = join(backgroundImage, {
		LayoutOrder = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		BackgroundColor3 = var27.BackgroundColor3,
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundTransparency = if backgroundImage and backgroundImage.Image ~= "" then 1 else p6.backgroundTransparency or p6.transparency,
		ImageTransparency = p6.backgroundTransparency or p6.transparency
	})
	t_2.ChatBubbleFrame = createElement_1(var37, join, {
		UICorner = t and roactModule.createElement("UICorner", { CornerRadius = t.CornerRadius }) or roactModule.createElement("UICorner", { CornerRadius = cornerRadius }),
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, var27.Padding)
		}),
		Padding = var29 and roactModule.createElement("UIPadding", var29) or roactModule.createElement("UIPadding", UIPadding),
		Insert = p6.props.renderInsert and p6.props.renderInsert(),
		Text = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutoLocalize = false,
			LayoutOrder = 2,
			Text = if fFlagExpChatPresetChatEnabled then text elseif p6.props.useTranslation and p6.props.translation and p6.props.translation ~= "" then p6.props.translation else p6.props.text,
			Size = UDim2.new(1, -var30, 1, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			FontFace = fontFace or nil,
			Font = if not fontFace then var27.Font else nil,
			TextColor3 = var27.TextColor3,
			TextSize = var27.TextSize,
			TextTransparency = p6.transparency,
			RichText = p6.props.isTextChatServiceOn
		}),
		Gradient = backgroundGradient ~= nil and roactModule.createElement("UIGradient", backgroundGradient)
	})
	
	if showCaret then
		var38 = roactModule.createElement
		var38 = var38("ImageLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			Size = UDim2.fromOffset(9, 6),
			ImageColor3 = var27.BackgroundColor3,
			ImageTransparency = p6.backgroundTransparency
		}, {
			Gradient = backgroundGradient ~= nil and roactModule.createElement("UIGradient", backgroundGradient)
		})
	else
		var38 = nil
	end
	t_2.Caret = var38
	
	return createElement(var34, t_1, t_2)
end

function chatBubble.fadeOut(p7)
	-- upvalues: getEnablePerBubbleCustomizationModule (ref), var18 (ref), getSpringFromSettingsModule (ref)
	local var39 = if getEnablePerBubbleCustomizationModule() then var18(p7.props.chatSettings, p7.props.bubbleChatMessageProperties) else p7.props.chatSettings
	
	if not p7.isFadingOut then
		p7.isFadingOut = true
		p7.transparencyMotor:onComplete(function()
			-- upvalues: p7 (ref)
			if p7.props.onFadeOut then
				p7.props.onFadeOut(p7.props.messageId)
			end
		end)
		local var40 = getSpringFromSettingsModule(var39, "transparency")
		p7.transparencyMotor:setGoal(var40(1))
		p7.backgroundTransparencyMotor:setGoal(var40(1))
	end
end

function chatBubble.didUpdate(p8, p9)
	-- upvalues: getEnablePerBubbleCustomizationModule (ref), var18 (ref), getTextBoundsModule (ref), getSpringFromSettingsModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconSize (ref)
	if p8.props.fadingOut then
		p8:fadeOut()
	end
	local var41 = if getEnablePerBubbleCustomizationModule() then var18(p8.props.chatSettings, p8.props.bubbleChatMessageProperties) else p8.props.chatSettings
	
	if p9.text ~= p8.props.text or p9.useTranslation ~= p8.props.useTranslation or (p9.translation ~= p8.props.translation or p9.chatSettings ~= p8.props.chatSettings) or (p9.renderInsert ~= p8.props.renderInsert or p9.insertSize ~= p8.props.insertSize) then
		local var42 = if p8.props.useTranslation and p8.props.translation and p8.props.translation ~= "" then getTextBoundsModule(p8.props.translation, var41) else getTextBoundsModule(p8.props.text, var41)
		local var43 = getSpringFromSettingsModule(var41, "size")
		local padding = var41.Padding
		local x = var42.X
		local y = var42.Y
		
		if p8.props.renderInsert then
			x += p8.props.insertSize.X + padding
			y = math.max(y, p8.props.insertSize.Y + padding * 2)
		end
		if fFlagExpChatPresetChatEnabled and (fFlagExpChatPresetChatEnabled and (isPresetMessage(p8.props) and p8.props.isTextChatServiceOn)) then
			local var44 = getPresetIconSize(var41.TextSize)
			x += var44 + padding
			y = math.max(y, var44)
		end
		p8.heightMotor:setGoal(var43(y))
		p8.widthMotor:setGoal(var43(x))
	end
end

function chatBubble.didMount(p10)
	-- upvalues: getEnablePerBubbleCustomizationModule (ref), var18 (ref), getTextBoundsModule (ref), getSpringFromSettingsModule (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconSize (ref), otterModule (ref), clientSettingsUtilityModule (ref)
	p10.isMounted = true
	local var45 = if getEnablePerBubbleCustomizationModule() then var18(p10.props.chatSettings, p10.props.bubbleChatMessageProperties) else p10.props.chatSettings
	local var46 = if p10.props.useTranslation and p10.props.translation and p10.props.translation ~= "" then getTextBoundsModule(p10.props.translation, var45) else getTextBoundsModule(p10.props.text, var45)
	local var47 = getSpringFromSettingsModule(var45, "size")
	local var48 = getSpringFromSettingsModule(var45, "transparency")
	local x = var46.X
	local y = var46.Y
	
	if p10.props.renderInsert then
		x += p10.props.insertSize.X + var45.Padding
		y = math.max(y, p10.props.insertSize.Y + var45.Padding * 2)
	end
	if fFlagExpChatPresetChatEnabled and (fFlagExpChatPresetChatEnabled and (isPresetMessage(p10.props) and p10.props.isTextChatServiceOn)) then
		local var49 = getPresetIconSize(var45.TextSize)
		x += var49 + var45.Padding
		y = math.max(y, var49)
	end
	if p10.props.isMostRecent then
		p10.heightMotor:setGoal(var47(y))
		p10.widthMotor:setGoal(otterModule.instant(x))
	else
		p10.heightMotor:setGoal(var47(y))
		p10.widthMotor:setGoal(var47(x))
	end
	p10.transparencyMotor:setGoal(var48(var45.Transparency))
	local backgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(var45, p10.props.clientSettings)
	
	if getEnablePerBubbleCustomizationModule() then
		local bubbleChatMessageProperties = p10.props.bubbleChatMessageProperties
		
		if bubbleChatMessageProperties and bubbleChatMessageProperties.BackgroundTransparency then
			backgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency({
				BackgroundTransparency = bubbleChatMessageProperties.BackgroundTransparency
			}, p10.props.clientSettings)
		end
	end
	p10.backgroundTransparencyMotor:setGoal(var48(backgroundTransparency))
end

function chatBubble.willUnmount(p11)
	p11.isMounted = false
	p11.transparencyMotor:destroy()
	p11.backgroundTransparencyMotor:destroy()
	p11.heightMotor:destroy()
	p11.widthMotor:destroy()
end

return chatBubble