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

local function _(p0) --[[ line: 41 | named "getFullHeight" ]]
	local height = p0.height
	
	if p0.renderInsert then
		height = math.max(height, p0.insertSize.Y)
	end
	return height + p0.chatSettings.Padding * 2
end

function chatBubbleDistant.init(p1, p2) --[[ line: 50 ]]
	-- upvalues: roactModule (ref), otterModule (ref)
	local var9, var10 = roactModule.createBinding(0)
	p1.width = var9
	p1.updateWidth = var10
	p1.widthMotor = otterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(p3) --[[ line: 53 ]]
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
	p1.frameSize = roactModule.joinBindings({ p1.width, p1.height }):map(function(p4) --[[ line: 59 ]]
		return UDim2.fromOffset(p4[1], p4[2])
	end)
	local var12, var13 = roactModule.createBinding(1)
	p1.transparency = var12
	p1.updateTransparency = var13
	p1.transparencyMotor = otterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	
	if p2.fadingOut then
		p1:fadeOut()
	end
end

function chatBubbleDistant.getDerivedStateFromProps(p5, p6) --[[ line: 74 ]]
	local chatSettings = p5.chatSettings
	local var14 = if p5.renderInsert then p5.width + p5.insertSize.X + chatSettings.Padding * 2 else p5.width + chatSettings.Padding * 2
	local height = p5.height
	
	if p5.renderInsert then
		height = math.max(height, p5.insertSize.Y)
	end
	height += p5.chatSettings.Padding * 2
	
	return if var14 == p6.fullWidth and height == p6.fullHeight then nil else { fullWidth = var14, fullHeight = height }
end

function chatBubbleDistant.render(p7) --[[ line: 96 ]]
	-- upvalues: roactModule (ref), cryoModule (ref), appFonts (ref)
	local chatSettings = p7.props.chatSettings
	local backgroundImage = chatSettings.BackgroundImage
	local backgroundGradient = chatSettings.BackgroundGradient
	
	return roactModule.createElement("Frame", {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p7.state.fullWidth, p7.state.fullHeight),
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
			ImageTransparency = p7.transparency
		}),
		RoundedFrame = roactModule.createElement("ImageLabel", cryoModule.Dictionary.join(backgroundImage, {
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = p7.frameSize,
			BackgroundColor3 = chatSettings.BackgroundColor3,
			BackgroundTransparency = if backgroundImage.Image == "" then p7.transparency else 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			ImageTransparency = p7.transparency
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
				Insert = p7.props.renderInsert and p7.props.renderInsert(),
				Ellipsis = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = "\226\128\166",
					TextScaled = true,
					LayoutOrder = 2,
					TextColor3 = chatSettings.TextColor3,
					TextTransparency = p7.transparency,
					Font = appFonts.default:getBlack(),
					Size = UDim2.new(1, -(if p7.props.renderInsert then p7.props.insertSize.X else 0), 1, 0)
				})
			}),
			Gradient = backgroundGradient.Enabled and roactModule.createElement("UIGradient", backgroundGradient)
		})
	})
end

function chatBubbleDistant.fadeOut(p8) --[[ line: 175 ]]
	-- upvalues: getTransparencySpringFromSettingsModule (ref)
	if not p8.isFadingOut then
		p8.isFadingOut = true
		p8.transparencyMotor:onComplete(function() --[[ line: 179 ]]
			-- upvalues: p8 (ref)
			if p8.props.onFadeOut then
				p8.props.onFadeOut()
			end
		end)
		p8.transparencyMotor:setGoal(getTransparencySpringFromSettingsModule(p8.props.chatSettings)(1))
	end
end

function chatBubbleDistant.didUpdate(p9, _, p10) --[[ line: 190 ]]
	-- upvalues: getSizeSpringFromSettingsModule (ref)
	if p9.props.fadingOut then
		p9:fadeOut()
		
		return
	elseif p9.state.fullHeight ~= p10.fullHeight then
		p9.updateHeight(p9.state.fullHeight)
	end
	if p9.state.fullWidth ~= p10.fullWidth then
		p9.widthMotor:setGoal(getSizeSpringFromSettingsModule(p9.props.chatSettings)(p9.state.fullWidth))
	end
end

function chatBubbleDistant.didMount(p11) --[[ line: 205 ]]
	-- upvalues: getSizeSpringFromSettingsModule (ref), getTransparencySpringFromSettingsModule (ref)
	if not p11.props.fadingOut then
		local chatSettings = p11.props.chatSettings
		local var15 = getSizeSpringFromSettingsModule(chatSettings)
		p11.transparencyMotor:setGoal(getTransparencySpringFromSettingsModule(chatSettings)(p11.props.chatSettings.Transparency))
		p11.widthMotor:setGoal(var15(p11.state.fullWidth))
	end
end

function chatBubbleDistant.willUnmount(p12) --[[ line: 216 ]]
	p12.transparencyMotor:destroy()
	p12.widthMotor:destroy()
end

return chatBubbleDistant