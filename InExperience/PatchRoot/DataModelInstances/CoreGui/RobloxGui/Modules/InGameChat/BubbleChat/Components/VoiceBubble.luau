local corePackagesService = game:GetService("CorePackages")
local otterModule = require(corePackagesService.Packages.Otter)
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent
local typesModule = require(parent.Types)
local getSizeSpringFromSettingsModule = require(parent.Helpers.getSizeSpringFromSettings)
local getTransparencySpringFromSettingsModule = require(parent.Helpers.getTransparencySpringFromSettings)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local voiceBubble = roactModule.PureComponent:extend("VoiceBubble")
voiceBubble.validateProps = tModule.strictInterface({
	fadingOut = tModule.optional(tModule.boolean),
	onFadeOut = tModule.optional(tModule.callback),
	chatSettings = typesModule.IChatSettings,
	renderInsert = tModule.optional(tModule.callback),
	insertSize = tModule.optional(tModule.Vector2),
	isDistant = tModule.optional(tModule.boolean)
})

function voiceBubble.init(p0, p1)
	-- upvalues: roactModule (ref), otterModule (ref)
	local var9, var10 = roactModule.createBinding(0)
	p0.width = var9
	p0.updateWidth = var10
	p0.widthMotor = otterModule.createSingleMotor(0)
	p0.widthMotor:onStep(function(p2)
		-- upvalues: p0 (ref)
		p0.updateWidth(math.round(p2))
	end)
	p0.frameSize = p0.width:map(function(p3)
		-- upvalues: p0 (ref)
		return if p0.props.insertSize then UDim2.fromOffset(p3, p0.props.insertSize.Y + p0.props.chatSettings.Padding * 2) else UDim2.fromOffset(p3, 0)
	end)
	local var11, var12 = roactModule.createBinding(1)
	p0.transparency = var11
	p0.updateTransparency = var12
	p0.transparencyMotor = otterModule.createSingleMotor(1)
	p0.transparencyMotor:onStep(p0.updateTransparency)
	
	if p1.fadingOut then
		p0:fadeOut()
	end
end

function voiceBubble.getDerivedStateFromProps(p4, p5)
	local var13 = if p4.insertSize then p4.insertSize.X + p4.chatSettings.Padding * 2 else 0
	
	return if var13 == p5.fullWidth then nil else { fullWidth = var13 }
end

function voiceBubble.render(p6)
	-- upvalues: roactModule (ref), cryoModule (ref)
	local chatSettings = p6.props.chatSettings
	local backgroundImage = chatSettings.BackgroundImage
	local backgroundGradient = chatSettings.BackgroundGradient
	
	return roactModule.createElement("Frame", {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p6.state.fullWidth, if p6.props.insertSize then p6.props.insertSize.Y + chatSettings.Padding * 2 else 0),
		Position = UDim2.new(0.5, 0, 1, -8)
	}, {
		Scale = roactModule.createElement("UIScale", { Scale = if p6.props.isDistant then 0.75 else 1 }),
		Carat = chatSettings.TailVisible and roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, -1),
			Size = UDim2.fromOffset(12, 8),
			ImageColor3 = chatSettings.BackgroundColor3,
			ImageTransparency = p6.transparency
		}),
		RoundedFrame = roactModule.createElement("ImageLabel", cryoModule.Dictionary.join(backgroundImage, {
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = p6.frameSize,
			BackgroundColor3 = chatSettings.BackgroundColor3,
			BackgroundTransparency = if backgroundImage.Image == "" then p6.transparency else 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			ImageTransparency = p6.transparency
		}), {
			UICorner = chatSettings.CornerEnabled and roactModule.createElement("UICorner", { CornerRadius = chatSettings.CornerRadius }),
			Contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, chatSettings.Padding),
					PaddingRight = UDim.new(0, chatSettings.Padding),
					PaddingBottom = UDim.new(0, chatSettings.Padding),
					PaddingLeft = UDim.new(0, chatSettings.Padding)
				}),
				Insert = p6.props.renderInsert and p6.props.renderInsert()
			}),
			Gradient = backgroundGradient.Enabled and roactModule.createElement("UIGradient", backgroundGradient)
		})
	})
end

function voiceBubble.fadeOut(p7)
	-- upvalues: getTransparencySpringFromSettingsModule (ref)
	if not p7.isFadingOut then
		p7.isFadingOut = true
		p7.transparencyMotor:onComplete(function()
			-- upvalues: p7 (ref)
			if p7.props.onFadeOut then
				p7.props.onFadeOut()
			end
		end)
		p7.transparencyMotor:setGoal(getTransparencySpringFromSettingsModule(p7.props.chatSettings)(1))
	end
end

function voiceBubble.didUpdate(p8, _, p9)
	-- upvalues: getSizeSpringFromSettingsModule (ref)
	if p8.props.fadingOut then
		p8:fadeOut()
		
		return
	elseif p8.state.fullWidth ~= p9.fullWidth then
		p8.widthMotor:setGoal(getSizeSpringFromSettingsModule(p8.props.chatSettings)(p8.state.fullWidth))
	end
end

function voiceBubble.didMount(p10)
	-- upvalues: getSizeSpringFromSettingsModule (ref), getTransparencySpringFromSettingsModule (ref)
	if not p10.props.fadingOut then
		local chatSettings = p10.props.chatSettings
		local var14 = getSizeSpringFromSettingsModule(chatSettings)
		p10.transparencyMotor:setGoal(getTransparencySpringFromSettingsModule(chatSettings)(p10.props.chatSettings.Transparency))
		p10.widthMotor:setGoal(var14(p10.state.fullWidth))
	end
end

function voiceBubble.willUnmount(p11)
	p11.transparencyMotor:destroy()
	p11.widthMotor:destroy()
end

return voiceBubble