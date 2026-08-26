local corePackagesService = game:GetService("CorePackages")
local otterModule = require(corePackagesService.Packages.Otter)
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent
local typesModule = require(parent.Types)
local getSizeSpringFromSettingsModule = require(parent.Helpers.getSizeSpringFromSettings)
local getTransparencySpringFromSettingsModule = require(parent.Helpers.getTransparencySpringFromSettings)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local chatBubbleDistant = roactModule.PureComponent:extend("ChatBubbleDistant")
chatBubbleDistant.validateProps = tModule.strictInterface({
	width = tModule.optional(tModule.number),
	height = tModule.optional(tModule.number),
	fadingOut = tModule.optional(tModule.boolean),
	onFadeOut = tModule.optional(tModule.callback),
	chatSettings = typesModule.IChatSettings,
	renderInsert = tModule.optional(tModule.callback),
	insertSize = tModule.optional(tModule.Vector2)
})
chatBubbleDistant.defaultProps = { width = 32, height = 16 }

local function _(p1)
	local height = p1.height
	
	if p1.renderInsert then
		height = math.max(height, p1.insertSize.Y)
	end
	return height + p1.chatSettings.Padding * 2
end

function chatBubbleDistant.init(p1, p2)
	-- upvalues: roactModule (ref), otterModule (ref)
	local var1, var2 = roactModule.createBinding(0)
	p1.width = var1
	p1.updateWidth = var2
	p1.widthMotor = otterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(p3)
		-- upvalues: p1 (ref)
		p1.updateWidth(math.round(p3))
	end)
	local createBinding = roactModule.createBinding
	local height = p2.height
	
	if p2.renderInsert then
		height = math.max(height, p2.insertSize.Y)
	end
	createBinding, var11 = createBinding(height + p2.chatSettings.Padding * 2)
	p1.height = createBinding
	p1.updateHeight = var11
	p1.frameSize = roactModule.joinBindings({ p1.width, p1.height }):map(function(p3)
		return UDim2.fromOffset(p3[1], p3[2])
	end)
	local var3, var4 = roactModule.createBinding(1)
	p1.transparency = var3
	p1.updateTransparency = var4
	p1.transparencyMotor = otterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	
	if p2.fadingOut then
		p1:fadeOut()
	end
end

function chatBubbleDistant.getDerivedStateFromProps(p1, p2)
	local chatSettings = p1.chatSettings
	local var1 = if p1.renderInsert then p1.width + p1.insertSize.X + chatSettings.Padding * 2 else p1.width + chatSettings.Padding * 2
	local height = p1.height
	
	if p1.renderInsert then
		height = math.max(height, p1.insertSize.Y)
	end
	height += p1.chatSettings.Padding * 2
	
	return if var1 == p2.fullWidth and height == p2.fullHeight then nil else { fullWidth = var1, fullHeight = height }
end

function chatBubbleDistant.render(p1)
	-- upvalues: roactModule (ref), cryoModule (ref), appFonts (ref)
	local chatSettings = p1.props.chatSettings
	local backgroundImage = chatSettings.BackgroundImage
	local backgroundGradient = chatSettings.BackgroundGradient
	
	return roactModule.createElement("Frame", {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p1.state.fullWidth, p1.state.fullHeight),
		Position = UDim2.new(0.5, 0, 1, -8)
	}, {
		Scale = roactModule.createElement("UIScale", { Scale = 0.75 }),
		Carat = chatSettings.TailVisible and roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, -1),
			Size = UDim2.fromOffset(12, 8),
			ImageColor3 = chatSettings.BackgroundColor3,
			ImageTransparency = p1.transparency
		}),
		RoundedFrame = roactModule.createElement("ImageLabel", cryoModule.Dictionary.join(backgroundImage, {
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = p1.frameSize,
			BackgroundColor3 = chatSettings.BackgroundColor3,
			BackgroundTransparency = if backgroundImage.Image == "" then p1.transparency else 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			ImageTransparency = p1.transparency
		}), {
			UICorner = chatSettings.CornerEnabled and roactModule.createElement("UICorner", { CornerRadius = chatSettings.CornerRadius }),
			Contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, chatSettings.Padding),
					PaddingRight = UDim.new(0, chatSettings.Padding),
					PaddingBottom = UDim.new(0, chatSettings.Padding),
					PaddingLeft = UDim.new(0, chatSettings.Padding)
				}),
				UIListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Insert = p1.props.renderInsert and p1.props.renderInsert(),
				Ellipsis = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = "\226\128\166",
					TextScaled = true,
					LayoutOrder = 2,
					TextColor3 = chatSettings.TextColor3,
					TextTransparency = p1.transparency,
					Font = appFonts.default:getBlack(),
					Size = UDim2.new(1, -(if p1.props.renderInsert then p1.props.insertSize.X else 0), 1, 0)
				})
			}),
			Gradient = backgroundGradient.Enabled and roactModule.createElement("UIGradient", backgroundGradient)
		})
	})
end

function chatBubbleDistant.fadeOut(p1)
	-- upvalues: getTransparencySpringFromSettingsModule (ref)
	if not p1.isFadingOut then
		p1.isFadingOut = true
		p1.transparencyMotor:onComplete(function()
			-- upvalues: p1 (ref)
			if p1.props.onFadeOut then
				p1.props.onFadeOut()
			end
		end)
		p1.transparencyMotor:setGoal(getTransparencySpringFromSettingsModule(p1.props.chatSettings)(1))
	end
end

function chatBubbleDistant.didUpdate(p1, _, p2)
	-- upvalues: getSizeSpringFromSettingsModule (ref)
	if p1.props.fadingOut then
		p1:fadeOut()
		
		return
	elseif p1.state.fullHeight ~= p2.fullHeight then
		p1.updateHeight(p1.state.fullHeight)
	end
	if p1.state.fullWidth ~= p2.fullWidth then
		p1.widthMotor:setGoal(getSizeSpringFromSettingsModule(p1.props.chatSettings)(p1.state.fullWidth))
	end
end

function chatBubbleDistant.didMount(p1)
	-- upvalues: getSizeSpringFromSettingsModule (ref), getTransparencySpringFromSettingsModule (ref)
	if not p1.props.fadingOut then
		local chatSettings = p1.props.chatSettings
		local var1 = getSizeSpringFromSettingsModule(chatSettings)
		p1.transparencyMotor:setGoal(getTransparencySpringFromSettingsModule(chatSettings)(p1.props.chatSettings.Transparency))
		p1.widthMotor:setGoal(var1(p1.state.fullWidth))
	end
end

function chatBubbleDistant.willUnmount(p1)
	p1.transparencyMotor:destroy()
	p1.widthMotor:destroy()
end

return chatBubbleDistant