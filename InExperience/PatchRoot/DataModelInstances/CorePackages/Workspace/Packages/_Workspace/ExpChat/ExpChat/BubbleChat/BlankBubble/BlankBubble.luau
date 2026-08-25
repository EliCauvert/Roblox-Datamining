local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local dictionary = require(parent.llama).Dictionary
local roactModule = require(parent.Roact)
local otterModule = require(parent.Otter)
local configModule = require(expChat.Config)
local getSpringFromSettingsModule = require(script:FindFirstAncestor("BubbleChat").Helpers.getSpringFromSettings)
local clientSettingsUtilityModule = require(expChat.ClientSettings.ClientSettingsUtility)
local blankBubble = roactModule.PureComponent:extend("BlankBubble")

function blankBubble.init(p0, p1)
	-- upvalues: roactModule (ref), otterModule (ref)
	p0.state = {}
	local var7, var8 = roactModule.createBinding(0)
	p0.width = var7
	p0.updateWidth = var8
	p0.widthMotor = otterModule.createSingleMotor(0)
	p0.widthMotor:onStep(function(p2)
		-- upvalues: p0 (ref)
		p0.updateWidth(math.round(p2))
	end)
	p0.frameSize = p0.width:map(function(p3)
		-- upvalues: p0 (ref)
		return if p0.props.insertSize then UDim2.fromOffset(p3, p0.props.insertSize.Y + p0.props.chatSettings.Padding * 2) else UDim2.fromOffset(p3, 0)
	end)
	local var9, var10 = roactModule.createBinding(1)
	p0.transparency = var9
	p0.updateTransparency = var10
	p0.transparencyMotor = otterModule.createSingleMotor(1)
	p0.transparencyMotor:onStep(p0.updateTransparency)
	local var11, var12 = roactModule.createBinding(1)
	p0.backgroundTransparency = var11
	p0.updateBackgroundTransparency = var12
	p0.backgroundTransparencyMotor = otterModule.createSingleMotor(1)
	p0.backgroundTransparencyMotor:onStep(p0.updateBackgroundTransparency)
	
	if p1.fadingOut then
		p0:fadeOut()
	end
end

function blankBubble.getDerivedStateFromProps(p4, p5)
	local var13 = if p4.insertSize then p4.insertSize.X + p4.chatSettings.Padding * 2 else 0
	
	return if var13 == p5.fullWidth then nil else { fullWidth = var13 }
end

function blankBubble.render(p6)
	-- upvalues: configModule (ref), roactModule (ref), dictionary (ref)
	local chatSettings = p6.props.chatSettings
	local imageLabel = chatSettings.ImageLabel
	local UIGradient = chatSettings.UIGradient
	local UICorner = chatSettings.UICorner
	local cornerRadius = configModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius
	local var14 = if p6.props.insertSize then p6.props.insertSize.Y + p6.props.chatSettings.Padding * 2 else 0
	local createElement = roactModule.createElement
	local var15 = "Frame"
	local t = {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p6.state.fullWidth, var14),
		Position = UDim2.new(0.5, 0, 1, -8)
	}
	local t_1 = {
		Scale = roactModule.createElement("UIScale", { Scale = if p6.props.isDistant then 0.75 else 1 })
	}
	local tailVisible = p6.props.chatSettings.TailVisible
	
	if tailVisible then
		tailVisible = roactModule.createElement
		tailVisible = tailVisible("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, -1),
			Size = UDim2.fromOffset(12, 8),
			ImageColor3 = chatSettings.BackgroundColor3,
			ImageTransparency = p6.backgroundTransparency
		}, {
			Gradient = UIGradient ~= nil and roactModule.createElement("UIGradient", UIGradient)
		})
	end
	t_1.Caret = tailVisible
	local createElement_1 = roactModule.createElement
	local var18 = "ImageLabel"
	local join = dictionary.join
	join = join(imageLabel, {
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = p6.frameSize,
		BackgroundColor3 = chatSettings.BackgroundColor3,
		BackgroundTransparency = if imageLabel and imageLabel.Image ~= "" then 1 else p6.backgroundTransparency or p6.transparency,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		ImageTransparency = p6.backgroundTransparency or p6.transparency,
		Image = if imageLabel then imageLabel.Image else ""
	})
	t_1.RoundedFrame = createElement_1(var18, join, {
		UICorner = UICorner and roactModule.createElement("UICorner", { CornerRadius = UICorner.CornerRadius }) or roactModule.createElement("UICorner", { CornerRadius = cornerRadius }),
		Contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, p6.props.chatSettings.Padding),
				PaddingRight = UDim.new(0, p6.props.chatSettings.Padding),
				PaddingBottom = UDim.new(0, p6.props.chatSettings.Padding),
				PaddingLeft = UDim.new(0, p6.props.chatSettings.Padding)
			}),
			Insert = p6.props.renderInsert and p6.props.renderInsert()
		}),
		Gradient = UIGradient ~= nil and roactModule.createElement("UIGradient", UIGradient)
	})
	
	return createElement(var15, t, t_1)
end

function blankBubble.fadeIn(p7)
	-- upvalues: getSpringFromSettingsModule (ref), clientSettingsUtilityModule (ref)
	local var19 = getSpringFromSettingsModule(p7.props.chatSettings, "transparency")
	p7.transparencyMotor:setGoal(var19(p7.props.chatSettings.Transparency))
	p7.backgroundTransparencyMotor:setGoal(var19(clientSettingsUtilityModule.getBackgroundTransparency(p7.props.chatSettings, p7.props.clientSettings)))
	p7.widthMotor:setGoal(getSpringFromSettingsModule(p7.props.chatSettings, "size")(p7.state.fullWidth))
end

function blankBubble.fadeOut(p8)
	-- upvalues: getSpringFromSettingsModule (ref)
	p8.transparencyMotor:onComplete(function()
		-- upvalues: p8 (ref)
		if p8.props.onFadeOut then
			p8.props.onFadeOut()
		end
	end)
	local var20 = getSpringFromSettingsModule(p8.props.chatSettings, "transparency")
	p8.transparencyMotor:setGoal(var20(1))
	p8.backgroundTransparencyMotor:setGoal(var20(1))
end

function blankBubble.didUpdate(p9, p10, p11)
	-- upvalues: getSpringFromSettingsModule (ref)
	if p10.fadingOut ~= p9.props.fadingOut then
		if p9.props.fadingOut then
			p9:fadeOut()
		else
			p9:fadeIn()
		end
	end
	if p9.state.fullWidth ~= p11.fullWidth then
		p9.widthMotor:setGoal(getSpringFromSettingsModule(p9.props.chatSettings, "size")(p9.state.fullWidth))
	end
end

function blankBubble.didMount(p12)
	-- upvalues: getSpringFromSettingsModule (ref), clientSettingsUtilityModule (ref)
	if not p12.props.fadingOut then
		local var21 = getSpringFromSettingsModule(p12.props.chatSettings, "size")
		local var22 = getSpringFromSettingsModule(p12.props.chatSettings, "transparency")
		p12.transparencyMotor:setGoal(var22(p12.props.chatSettings.Transparency))
		p12.backgroundTransparencyMotor:setGoal(var22(clientSettingsUtilityModule.getBackgroundTransparency(p12.props.chatSettings, p12.props.clientSettings)))
		p12.widthMotor:setGoal(var21(p12.state.fullWidth))
	end
end

function blankBubble.willUnmount(p13)
	p13.transparencyMotor:destroy()
	p13.backgroundTransparencyMotor:destroy()
	p13.widthMotor:destroy()
end

return blankBubble