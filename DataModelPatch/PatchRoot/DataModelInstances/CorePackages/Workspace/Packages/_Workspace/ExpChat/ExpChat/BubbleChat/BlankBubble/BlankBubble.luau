local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local RoactModule = require(Parent.Roact)
local OtterModule = require(Parent.Otter)
local ConfigModule = require(ExpChat.Config)
local GetSpringFromSettingsModule = require(script:FindFirstAncestor("BubbleChat").Helpers.getSpringFromSettings)
local ClientSettingsUtilityModule = require(ExpChat.ClientSettings.ClientSettingsUtility)
local BlankBubble = RoactModule.PureComponent:extend("BlankBubble")

function BlankBubble.init(p1, p2)
	-- upvalues: RoactModule (copy), OtterModule (copy)
	p1.state = {}
	p1.width, p1.updateWidth = RoactModule.createBinding(0)
	p1.widthMotor = OtterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(Value: number)
		-- upvalues: p1 (copy)
		p1.updateWidth((math.round(Value)))
	end)
	p1.frameSize = p1.width:map(function(XOffset): UDim2
		-- upvalues: p1 (copy)
		return if p1.props.insertSize then UDim2.fromOffset(XOffset, p1.props.insertSize.Y + p1.props.chatSettings.Padding * 2) else UDim2.fromOffset(XOffset, 0)
	end)
	p1.transparency, p1.updateTransparency = RoactModule.createBinding(1)
	p1.transparencyMotor = OtterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	p1.backgroundTransparency, p1.updateBackgroundTransparency = RoactModule.createBinding(1)
	p1.backgroundTransparencyMotor = OtterModule.createSingleMotor(1)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	
	if p2.fadingOut then
		p1:fadeOut()
	end
end

function BlankBubble.getDerivedStateFromProps(p1, p2)
	local NewX = if p1.insertSize then p1.insertSize.X + p1.chatSettings.Padding * 2 else 0
	
	return if NewX == p2.fullWidth then nil else { fullWidth = NewX }
end

function BlankBubble.render(p1)
	-- upvalues: ConfigModule (copy), RoactModule (copy), Dictionary (copy)
	local ChatSettings = p1.props.chatSettings
	local ImageLabel = ChatSettings.ImageLabel
	local UIGradient = ChatSettings.UIGradient
	local UICorner = ChatSettings.UICorner
	local CornerRadius = ConfigModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius
	
	return RoactModule.createElement("Frame", {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p1.state.fullWidth, if p1.props.insertSize then p1.props.insertSize.Y + p1.props.chatSettings.Padding * 2 else 0),
		Position = UDim2.new(0.5, 0, 1, -8)
	}, {
		Scale = RoactModule.createElement("UIScale", { Scale = if p1.props.isDistant then 0.75 else 1 }),
		Caret = p1.props.chatSettings.TailVisible and RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, -1),
			Size = UDim2.fromOffset(12, 8),
			ImageColor3 = ChatSettings.BackgroundColor3,
			ImageTransparency = p1.backgroundTransparency
		}, {
			Gradient = UIGradient ~= nil and RoactModule.createElement("UIGradient", UIGradient)
		}),
		RoundedFrame = RoactModule.createElement("ImageLabel", Dictionary.join(ImageLabel, {
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = p1.frameSize,
			BackgroundColor3 = ChatSettings.BackgroundColor3,
			BackgroundTransparency = if ImageLabel and ImageLabel.Image ~= "" then 1 else p1.backgroundTransparency or p1.transparency,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			ImageTransparency = p1.backgroundTransparency or p1.transparency,
			Image = ImageLabel and ImageLabel.Image or ""
		}), {
			UICorner = UICorner and RoactModule.createElement("UICorner", { CornerRadius = UICorner.CornerRadius }) or RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }),
			Contents = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p1.props.chatSettings.Padding),
					PaddingRight = UDim.new(0, p1.props.chatSettings.Padding),
					PaddingBottom = UDim.new(0, p1.props.chatSettings.Padding),
					PaddingLeft = UDim.new(0, p1.props.chatSettings.Padding)
				}),
				Insert = p1.props.renderInsert and p1.props.renderInsert()
			}),
			Gradient = UIGradient ~= nil and RoactModule.createElement("UIGradient", UIGradient)
		})
	})
end

function BlankBubble.fadeIn(p1)
	-- upvalues: GetSpringFromSettingsModule (copy), ClientSettingsUtilityModule (copy)
	local Transparency = GetSpringFromSettingsModule(p1.props.chatSettings, "transparency")
	p1.transparencyMotor:setGoal(Transparency(p1.props.chatSettings.Transparency))
	p1.backgroundTransparencyMotor:setGoal(Transparency((ClientSettingsUtilityModule.getBackgroundTransparency(p1.props.chatSettings, p1.props.clientSettings))))
	p1.widthMotor:setGoal(GetSpringFromSettingsModule(p1.props.chatSettings, "size")(p1.state.fullWidth))
end

function BlankBubble.fadeOut(p1)
	-- upvalues: GetSpringFromSettingsModule (copy)
	p1.transparencyMotor:onComplete(function()
		-- upvalues: p1 (copy)
		if p1.props.onFadeOut then
			p1.props.onFadeOut()
		end
	end)
	local Transparency = GetSpringFromSettingsModule(p1.props.chatSettings, "transparency")
	p1.transparencyMotor:setGoal(Transparency(1))
	p1.backgroundTransparencyMotor:setGoal(Transparency(1))
end

function BlankBubble.didUpdate(p1, p2, p3)
	-- upvalues: GetSpringFromSettingsModule (copy)
	if p2.fadingOut ~= p1.props.fadingOut then
		if p1.props.fadingOut then
			p1:fadeOut()
		else
			p1:fadeIn()
		end
	end
	if p1.state.fullWidth ~= p3.fullWidth then
		p1.widthMotor:setGoal(GetSpringFromSettingsModule(p1.props.chatSettings, "size")(p1.state.fullWidth))
	end
end

function BlankBubble.didMount(p1)
	-- upvalues: GetSpringFromSettingsModule (copy), ClientSettingsUtilityModule (copy)
	if not p1.props.fadingOut then
		local Size = GetSpringFromSettingsModule(p1.props.chatSettings, "size")
		local Transparency = GetSpringFromSettingsModule(p1.props.chatSettings, "transparency")
		p1.transparencyMotor:setGoal(Transparency(p1.props.chatSettings.Transparency))
		p1.backgroundTransparencyMotor:setGoal(Transparency((ClientSettingsUtilityModule.getBackgroundTransparency(p1.props.chatSettings, p1.props.clientSettings))))
		p1.widthMotor:setGoal(Size(p1.state.fullWidth))
	end
end

function BlankBubble.willUnmount(p1)
	p1.transparencyMotor:destroy()
	p1.backgroundTransparencyMotor:destroy()
	p1.widthMotor:destroy()
end

return BlankBubble