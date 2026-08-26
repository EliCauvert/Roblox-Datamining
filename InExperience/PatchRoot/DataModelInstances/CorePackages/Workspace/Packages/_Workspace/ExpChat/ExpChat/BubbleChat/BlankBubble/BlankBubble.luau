local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local dictionary = require(parent.llama).Dictionary
local roactModule = require(parent.Roact)
local otterModule = require(parent.Otter)
local configModule = require(expChat.Config)
local getSpringFromSettingsModule = require(script:FindFirstAncestor("BubbleChat").Helpers.getSpringFromSettings)
local clientSettingsUtilityModule = require(expChat.ClientSettings.ClientSettingsUtility)
local blankBubble = roactModule.PureComponent:extend("BlankBubble")

function blankBubble.init(p1, p2)
	-- upvalues: roactModule (ref), otterModule (ref)
	p1.state = {}
	local var1, var2 = roactModule.createBinding(0)
	p1.width = var1
	p1.updateWidth = var2
	p1.widthMotor = otterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(p3)
		-- upvalues: p1 (ref)
		p1.updateWidth(math.round(p3))
	end)
	p1.frameSize = p1.width:map(function(p3)
		-- upvalues: p1 (ref)
		return if p1.props.insertSize then UDim2.fromOffset(p3, p1.props.insertSize.Y + p1.props.chatSettings.Padding * 2) else UDim2.fromOffset(p3, 0)
	end)
	local var3, var4 = roactModule.createBinding(1)
	p1.transparency = var3
	p1.updateTransparency = var4
	p1.transparencyMotor = otterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	local var5, var6 = roactModule.createBinding(1)
	p1.backgroundTransparency = var5
	p1.updateBackgroundTransparency = var6
	p1.backgroundTransparencyMotor = otterModule.createSingleMotor(1)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	
	if p2.fadingOut then
		p1:fadeOut()
	end
end

function blankBubble.getDerivedStateFromProps(p1, p2)
	local var1 = if p1.insertSize then p1.insertSize.X + p1.chatSettings.Padding * 2 else 0
	
	return if var1 == p2.fullWidth then nil else { fullWidth = var1 }
end

function blankBubble.render(p1)
	-- upvalues: configModule (ref), roactModule (ref), dictionary (ref)
	local chatSettings = p1.props.chatSettings
	local imageLabel = chatSettings.ImageLabel
	local UIGradient = chatSettings.UIGradient
	local UICorner = chatSettings.UICorner
	local cornerRadius = configModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius
	local var1 = if p1.props.insertSize then p1.props.insertSize.Y + p1.props.chatSettings.Padding * 2 else 0
	local createElement = roactModule.createElement
	local var2 = "Frame"
	local t = {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p1.state.fullWidth, var1),
		Position = UDim2.new(0.5, 0, 1, -8)
	}
	local t_1 = {
		Scale = roactModule.createElement("UIScale", { Scale = if p1.props.isDistant then 0.75 else 1 })
	}
	local tailVisible = p1.props.chatSettings.TailVisible
	
	if tailVisible then
		tailVisible = roactModule.createElement
		tailVisible = tailVisible("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, -1),
			Size = UDim2.fromOffset(12, 8),
			ImageColor3 = chatSettings.BackgroundColor3,
			ImageTransparency = p1.backgroundTransparency
		}, {
			Gradient = UIGradient ~= nil and roactModule.createElement("UIGradient", UIGradient)
		})
	end
	t_1.Caret = tailVisible
	local createElement_1 = roactModule.createElement
	local var3 = "ImageLabel"
	local join = dictionary.join
	join = join(imageLabel, {
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = p1.frameSize,
		BackgroundColor3 = chatSettings.BackgroundColor3,
		BackgroundTransparency = if imageLabel and imageLabel.Image ~= "" then 1 else p1.backgroundTransparency or p1.transparency,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		ImageTransparency = p1.backgroundTransparency or p1.transparency,
		Image = if imageLabel then imageLabel.Image else ""
	})
	t_1.RoundedFrame = createElement_1(var3, join, {
		UICorner = UICorner and roactModule.createElement("UICorner", { CornerRadius = UICorner.CornerRadius }) or roactModule.createElement("UICorner", { CornerRadius = cornerRadius }),
		Contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, p1.props.chatSettings.Padding),
				PaddingRight = UDim.new(0, p1.props.chatSettings.Padding),
				PaddingBottom = UDim.new(0, p1.props.chatSettings.Padding),
				PaddingLeft = UDim.new(0, p1.props.chatSettings.Padding)
			}),
			Insert = p1.props.renderInsert and p1.props.renderInsert()
		}),
		Gradient = UIGradient ~= nil and roactModule.createElement("UIGradient", UIGradient)
	})
	
	return createElement(var2, t, t_1)
end

function blankBubble.fadeIn(p1)
	-- upvalues: getSpringFromSettingsModule (ref), clientSettingsUtilityModule (ref)
	local var1 = getSpringFromSettingsModule(p1.props.chatSettings, "transparency")
	p1.transparencyMotor:setGoal(var1(p1.props.chatSettings.Transparency))
	p1.backgroundTransparencyMotor:setGoal(var1(clientSettingsUtilityModule.getBackgroundTransparency(p1.props.chatSettings, p1.props.clientSettings)))
	p1.widthMotor:setGoal(getSpringFromSettingsModule(p1.props.chatSettings, "size")(p1.state.fullWidth))
end

function blankBubble.fadeOut(p1)
	-- upvalues: getSpringFromSettingsModule (ref)
	p1.transparencyMotor:onComplete(function()
		-- upvalues: p1 (ref)
		if p1.props.onFadeOut then
			p1.props.onFadeOut()
		end
	end)
	local var1 = getSpringFromSettingsModule(p1.props.chatSettings, "transparency")
	p1.transparencyMotor:setGoal(var1(1))
	p1.backgroundTransparencyMotor:setGoal(var1(1))
end

function blankBubble.didUpdate(p1, p2, p3)
	-- upvalues: getSpringFromSettingsModule (ref)
	if p2.fadingOut ~= p1.props.fadingOut then
		if p1.props.fadingOut then
			p1:fadeOut()
		else
			p1:fadeIn()
		end
	end
	if p1.state.fullWidth ~= p3.fullWidth then
		p1.widthMotor:setGoal(getSpringFromSettingsModule(p1.props.chatSettings, "size")(p1.state.fullWidth))
	end
end

function blankBubble.didMount(p1)
	-- upvalues: getSpringFromSettingsModule (ref), clientSettingsUtilityModule (ref)
	if not p1.props.fadingOut then
		local var1 = getSpringFromSettingsModule(p1.props.chatSettings, "size")
		local var2 = getSpringFromSettingsModule(p1.props.chatSettings, "transparency")
		p1.transparencyMotor:setGoal(var2(p1.props.chatSettings.Transparency))
		p1.backgroundTransparencyMotor:setGoal(var2(clientSettingsUtilityModule.getBackgroundTransparency(p1.props.chatSettings, p1.props.clientSettings)))
		p1.widthMotor:setGoal(var1(p1.state.fullWidth))
	end
end

function blankBubble.willUnmount(p1)
	p1.transparencyMotor:destroy()
	p1.backgroundTransparencyMotor:destroy()
	p1.widthMotor:destroy()
end

return blankBubble