local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local otterModule = require(parent.Otter)
local dictionary = require(parent.llama).Dictionary
local configModule = require(expChat.Config)
local helpers = expChat.BubbleChat.Helpers
local getSpringFromSettingsModule = require(helpers.getSpringFromSettings)
local getAbsolutePaddingbyDimensionModule = require(helpers.getAbsolutePaddingbyDimension)
local clientSettingsUtilityModule = require(expChat.ClientSettings.ClientSettingsUtility)
local chatBubbleDistant = roactModule.Component:extend("ChatBubbleDistant")
chatBubbleDistant.defaultProps = { width = 32, height = 16 }

local function getFullHeight(p0) --[[ line: 21 ]]
	-- upvalues: getAbsolutePaddingbyDimensionModule (ref)
	local height = p0.height
	
	if p0.renderInsert then
		height = math.max(height, p0.insertSize.Y)
	end
	if p0.chatSettings.UIPadding then
		local UIPadding = p0.chatSettings.UIPadding
		local var9 = getAbsolutePaddingbyDimensionModule(UIPadding.PaddingTop, height)
		local var10 = getAbsolutePaddingbyDimensionModule(UIPadding.PaddingBottom, height)
		
		if p0.renderInsert then
			height = math.max(height, p0.insertSize.Y)
		end
		height += var9 + var10
		
		return height
	elseif p0.renderInsert then
		height = math.max(height, p0.insertSize.Y)
	end
	return height + p0.chatSettings.Padding * 2
end

function chatBubbleDistant.init(p1) --[[ line: 49 ]]
	-- upvalues: roactModule (ref), otterModule (ref), getFullHeight (ref)
	p1.state = {}
	local var11, var12 = roactModule.createBinding(0)
	p1.width = var11
	p1.updateWidth = var12
	p1.widthMotor = otterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(p2) --[[ line: 54 ]]
		-- upvalues: p1 (ref)
		p1.updateWidth(math.round(p2))
	end)
	local var13, var14 = roactModule.createBinding(getFullHeight(p1.props))
	p1.height = var13
	p1.updateHeight = var14
	p1.frameSize = roactModule.joinBindings({ p1.width, p1.height }):map(function(p3) --[[ line: 60 ]]
		return UDim2.fromOffset(p3[1], p3[2])
	end)
	local var15, var16 = roactModule.createBinding(1)
	p1.transparency = var15
	p1.updateTransparency = var16
	p1.transparencyMotor = otterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	local var17, var18 = roactModule.createBinding(1)
	p1.backgroundTransparency = var17
	p1.updateBackgroundTransparency = var18
	p1.backgroundTransparencyMotor = otterModule.createSingleMotor(1)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	
	if p1.props.fadingOut then
		p1:fadeOut()
	end
end

function chatBubbleDistant.getDerivedStateFromProps(p4, p5) --[[ line: 79 ]]
	-- upvalues: getAbsolutePaddingbyDimensionModule (ref), getFullHeight (ref)
	local width
	local _ = nil
	
	if p4.chatSettings.UIPadding then
		width = p4.width
		
		if p4.renderInsert then
			width += p4.insertSize.X
		end
		local UIPadding = p4.chatSettings.UIPadding
		width += getAbsolutePaddingbyDimensionModule(UIPadding.PaddingLeft, width) + getAbsolutePaddingbyDimensionModule(UIPadding.PaddingRight, width)
	else
		width = if p4.renderInsert then p4.width + p4.insertSize.X + p4.chatSettings.Padding * 2 else p4.width + p4.chatSettings.Padding * 2
	end
	local var19 = getFullHeight(p4)
	
	return if width == p5.fullWidth and var19 == p5.fullHeight then nil else { fullWidth = width, fullHeight = var19 }
end

function chatBubbleDistant.render(p6) --[[ line: 112 ]]
	-- upvalues: configModule (ref), roactModule (ref), dictionary (ref)
	local imageLabel, UIGradient, UIPadding
	local chatSettings = p6.props.chatSettings
	local _ = nil
	local _ = nil
	local t = nil
	local _ = nil
	
	if p6.props.isTextChatServiceOn then
		imageLabel = chatSettings.ImageLabel
		UIGradient = chatSettings.UIGradient
		t = chatSettings.UICorner
		UIPadding = chatSettings.UIPadding
	else
		imageLabel = chatSettings.BackgroundImage
		UIGradient = chatSettings.BackgroundGradient
		
		if chatSettings.CornerEnabled then
			t = { CornerRadius = chatSettings.CornerRadius }
		elseif chatSettings.CornerEnabled == false then
			t = { CornerRadius = UDim.new(0, 0) }
		end
		UIPadding = if chatSettings.Padding then {
			PaddingTop = UDim.new(0, chatSettings.Padding),
			PaddingRight = UDim.new(0, chatSettings.Padding),
			PaddingBottom = UDim.new(0, chatSettings.Padding),
			PaddingLeft = UDim.new(0, chatSettings.Padding)
		} else nil
	end
	local cornerRadius = configModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius
	local UIPadding_1 = configModule.DefaultBubbleChatChildrenCustomizationProperties.UIPadding
	local var21 = if p6.props.renderInsert then p6.props.insertSize.X else 0
	local showCaret = p6.props.chatSettings.TailVisible and p6.props.showCaret
	local createElement = roactModule.createElement
	local var23 = "Frame"
	local t_1 = {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p6.state.fullWidth, p6.state.fullHeight),
		Position = UDim2.new(0.5, 0, 1, -8)
	}
	local t_2 = {
		Scale = roactModule.createElement("UIScale", { Scale = 0.75 })
	}
	local tailVisible = p6.props.chatSettings.TailVisible
	
	if tailVisible then
		tailVisible = showCaret
		
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
	end
	t_2.Carat = tailVisible
	local createElement_1 = roactModule.createElement
	local var26 = "ImageLabel"
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
	t_2.RoundedFrame = createElement_1(var26, join, {
		UICorner = t and roactModule.createElement("UICorner", { CornerRadius = t.CornerRadius }) or roactModule.createElement("UICorner", { CornerRadius = cornerRadius }),
		Contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Padding = UIPadding and roactModule.createElement("UIPadding", UIPadding) or roactModule.createElement("UIPadding", UIPadding_1),
			UIListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Insert = p6.props.renderInsert and p6.props.renderInsert(),
			Ellipsis = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = "\226\128\166",
				TextScaled = false,
				LayoutOrder = 2,
				TextColor3 = chatSettings.TextColor3,
				TextTransparency = p6.transparency,
				Font = Enum.Font.BuilderSansExtraBold,
				TextSize = chatSettings.TextSize,
				Size = UDim2.new(1, -var21, 1, 0)
			})
		}),
		Gradient = UIGradient ~= nil and roactModule.createElement("UIGradient", UIGradient)
	})
	
	return createElement(var23, t_1, t_2)
end

function chatBubbleDistant.fadeIn(p7) --[[ line: 229 ]]
	-- upvalues: getSpringFromSettingsModule (ref), clientSettingsUtilityModule (ref)
	local var27 = getSpringFromSettingsModule(p7.props.chatSettings, "transparency")
	p7.transparencyMotor:setGoal(var27(p7.props.chatSettings.Transparency))
	p7.backgroundTransparencyMotor:setGoal(var27(clientSettingsUtilityModule.getBackgroundTransparency(p7.props.chatSettings, p7.props.clientSettings)))
	p7.widthMotor:setGoal(getSpringFromSettingsModule(p7.props.chatSettings, "size")(p7.state.fullWidth))
end

function chatBubbleDistant.fadeOut(p8) --[[ line: 243 ]]
	-- upvalues: getSpringFromSettingsModule (ref)
	p8.transparencyMotor:onComplete(function() --[[ line: 244 ]]
		-- upvalues: p8 (ref)
		if p8.props.onFadeOut then
			p8.props.onFadeOut()
		end
	end)
	local var28 = getSpringFromSettingsModule(p8.props.chatSettings, "transparency")
	p8.transparencyMotor:setGoal(var28(1))
	p8.backgroundTransparencyMotor:setGoal(var28(1))
end

function chatBubbleDistant.didUpdate(p9, p10, p11) --[[ line: 255 ]]
	-- upvalues: getSpringFromSettingsModule (ref)
	if p10.fadingOut == p9.props.fadingOut then
		if p9.state.fullHeight ~= p11.fullHeight then
			p9.updateHeight(p9.state.fullHeight)
		end
		if p9.state.fullWidth ~= p11.fullWidth then
			p9.widthMotor:setGoal(getSpringFromSettingsModule(p9.props.chatSettings, "size")(p9.state.fullWidth))
		end
		return
	elseif p9.props.fadingOut then
		p9:fadeOut()
		
		return
	end
	p9:fadeIn()
end

function chatBubbleDistant.didMount(p12) --[[ line: 273 ]]
	-- upvalues: getSpringFromSettingsModule (ref), clientSettingsUtilityModule (ref)
	if not p12.props.fadingOut then
		local var29 = getSpringFromSettingsModule(p12.props.chatSettings, "size")
		local var30 = getSpringFromSettingsModule(p12.props.chatSettings, "transparency")
		p12.transparencyMotor:setGoal(var30(p12.props.chatSettings.Transparency))
		p12.backgroundTransparencyMotor:setGoal(var30(clientSettingsUtilityModule.getBackgroundTransparency(p12.props.chatSettings, p12.props.clientSettings)))
		p12.widthMotor:setGoal(var29(p12.state.fullWidth))
	end
end

function chatBubbleDistant.willUnmount(p13) --[[ line: 289 ]]
	p13.transparencyMotor:destroy()
	p13.backgroundTransparencyMotor:destroy()
	p13.widthMotor:destroy()
end

return chatBubbleDistant