local CorePackages = game:GetService("CorePackages")
local OtterModule = require(CorePackages.Packages.Otter)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local GetSizeSpringFromSettingsModule = require(Parent.Helpers.getSizeSpringFromSettings)
local GetTransparencySpringFromSettingsModule = require(Parent.Helpers.getTransparencySpringFromSettings)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local VoiceBubble = RoactModule.PureComponent:extend("VoiceBubble")
VoiceBubble.validateProps = TModule.strictInterface({
	fadingOut = TModule.optional(TModule.boolean),
	onFadeOut = TModule.optional(TModule.callback),
	chatSettings = require(Parent.Types).IChatSettings,
	renderInsert = TModule.optional(TModule.callback),
	insertSize = TModule.optional(TModule.Vector2),
	isDistant = TModule.optional(TModule.boolean)
})

function VoiceBubble.init(p1, p2)
	-- upvalues: RoactModule (copy), OtterModule (copy)
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
	
	if p2.fadingOut then
		p1:fadeOut()
	end
end

function VoiceBubble.getDerivedStateFromProps(p1, p2)
	local ChatSettings = p1.chatSettings
	local NewX = if p1.insertSize then p1.insertSize.X + ChatSettings.Padding * 2 else 0
	
	return if NewX == p2.fullWidth then nil else { fullWidth = NewX }
end

function VoiceBubble.render(p1)
	-- upvalues: RoactModule (copy), CryoModule (copy)
	local ChatSettings = p1.props.chatSettings
	local BackgroundImage = ChatSettings.BackgroundImage
	local BackgroundGradient = ChatSettings.BackgroundGradient
	
	return RoactModule.createElement("Frame", {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p1.state.fullWidth, if p1.props.insertSize then p1.props.insertSize.Y + ChatSettings.Padding * 2 else 0),
		Position = UDim2.new(0.5, 0, 1, -8)
	}, {
		Scale = RoactModule.createElement("UIScale", { Scale = if p1.props.isDistant then 0.75 else 1 }),
		Carat = ChatSettings.TailVisible and RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, -1),
			Size = UDim2.fromOffset(12, 8),
			ImageColor3 = ChatSettings.BackgroundColor3,
			ImageTransparency = p1.transparency
		}),
		RoundedFrame = RoactModule.createElement("ImageLabel", CryoModule.Dictionary.join(BackgroundImage, {
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = p1.frameSize,
			BackgroundColor3 = ChatSettings.BackgroundColor3,
			BackgroundTransparency = BackgroundImage.Image == "" and p1.transparency or 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			ImageTransparency = p1.transparency
		}), {
			UICorner = ChatSettings.CornerEnabled and RoactModule.createElement("UICorner", { CornerRadius = ChatSettings.CornerRadius }),
			Contents = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, ChatSettings.Padding),
					PaddingRight = UDim.new(0, ChatSettings.Padding),
					PaddingBottom = UDim.new(0, ChatSettings.Padding),
					PaddingLeft = UDim.new(0, ChatSettings.Padding)
				}),
				Insert = p1.props.renderInsert and p1.props.renderInsert()
			}),
			Gradient = BackgroundGradient.Enabled and RoactModule.createElement("UIGradient", BackgroundGradient)
		})
	})
end

function VoiceBubble.fadeOut(p1)
	-- upvalues: GetTransparencySpringFromSettingsModule (copy)
	if not p1.isFadingOut then
		p1.isFadingOut = true
		p1.transparencyMotor:onComplete(function()
			-- upvalues: p1 (copy)
			if p1.props.onFadeOut then
				p1.props.onFadeOut()
			end
		end)
		p1.transparencyMotor:setGoal(GetTransparencySpringFromSettingsModule(p1.props.chatSettings)(1))
	end
end

function VoiceBubble.didUpdate(p1, _, p2)
	-- upvalues: GetSizeSpringFromSettingsModule (copy)
	if p1.props.fadingOut then
		p1:fadeOut()
		
		return
	end
	if p1.state.fullWidth ~= p2.fullWidth then
		p1.widthMotor:setGoal(GetSizeSpringFromSettingsModule(p1.props.chatSettings)(p1.state.fullWidth))
	end
end

function VoiceBubble.didMount(p1)
	-- upvalues: GetSizeSpringFromSettingsModule (copy), GetTransparencySpringFromSettingsModule (copy)
	if not p1.props.fadingOut then
		local ChatSettings = p1.props.chatSettings
		local SizeSpringFromSettingsModule = GetSizeSpringFromSettingsModule(ChatSettings)
		p1.transparencyMotor:setGoal(GetTransparencySpringFromSettingsModule(ChatSettings)(p1.props.chatSettings.Transparency))
		p1.widthMotor:setGoal(SizeSpringFromSettingsModule(p1.state.fullWidth))
	end
end

function VoiceBubble.willUnmount(p1)
	p1.transparencyMotor:destroy()
	p1.widthMotor:destroy()
end

return VoiceBubble