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

local function getFullHeight(p1)
	-- upvalues: getAbsolutePaddingbyDimensionModule (ref)
	local height = p1.height
	
	if p1.renderInsert then
		height = math.max(height, p1.insertSize.Y)
	end
	if p1.chatSettings.UIPadding then
		local UIPadding = p1.chatSettings.UIPadding
		local var1 = getAbsolutePaddingbyDimensionModule(UIPadding.PaddingTop, height)
		local var2 = getAbsolutePaddingbyDimensionModule(UIPadding.PaddingBottom, height)
		
		if p1.renderInsert then
			height = math.max(height, p1.insertSize.Y)
		end
		height += var1 + var2
		
		return height
	elseif p1.renderInsert then
		height = math.max(height, p1.insertSize.Y)
	end
	return height + p1.chatSettings.Padding * 2
end

function chatBubbleDistant.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref), getFullHeight (ref)
	p1.state = {}
	local var1, var2 = roactModule.createBinding(0)
	p1.width = var1
	p1.updateWidth = var2
	p1.widthMotor = otterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateWidth(math.round(p2))
	end)
	local var3, var4 = roactModule.createBinding(getFullHeight(p1.props))
	p1.height = var3
	p1.updateHeight = var4
	p1.frameSize = roactModule.joinBindings({ p1.width, p1.height }):map(function(p2)
		return UDim2.fromOffset(p2[1], p2[2])
	end)
	local var5, var6 = roactModule.createBinding(1)
	p1.transparency = var5
	p1.updateTransparency = var6
	p1.transparencyMotor = otterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	local var7, var8 = roactModule.createBinding(1)
	p1.backgroundTransparency = var7
	p1.updateBackgroundTransparency = var8
	p1.backgroundTransparencyMotor = otterModule.createSingleMotor(1)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	
	if p1.props.fadingOut then
		p1:fadeOut()
	end
end

function chatBubbleDistant.getDerivedStateFromProps(p1, p2)
	-- upvalues: getAbsolutePaddingbyDimensionModule (ref), getFullHeight (ref)
	local width
	local _ = nil
	
	if p1.chatSettings.UIPadding then
		width = p1.width
		
		if p1.renderInsert then
			width += p1.insertSize.X
		end
		local UIPadding = p1.chatSettings.UIPadding
		width += getAbsolutePaddingbyDimensionModule(UIPadding.PaddingLeft, width) + getAbsolutePaddingbyDimensionModule(UIPadding.PaddingRight, width)
	else
		width = if p1.renderInsert then p1.width + p1.insertSize.X + p1.chatSettings.Padding * 2 else p1.width + p1.chatSettings.Padding * 2
	end
	local var1 = getFullHeight(p1)
	
	return if width == p2.fullWidth and var1 == p2.fullHeight then nil else { fullWidth = width, fullHeight = var1 }
end

function chatBubbleDistant.render(p1)
	-- upvalues: configModule (ref), roactModule (ref), dictionary (ref)
	local imageLabel, UIGradient, UIPadding
	local chatSettings = p1.props.chatSettings
	local _ = nil
	local _ = nil
	local t = nil
	local _ = nil
	
	if p1.props.isTextChatServiceOn then
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
	local var1 = if p1.props.renderInsert then p1.props.insertSize.X else 0
	local showCaret = p1.props.chatSettings.TailVisible and p1.props.showCaret
	local createElement = roactModule.createElement
	local var2 = "Frame"
	local t_1 = {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p1.state.fullWidth, p1.state.fullHeight),
		Position = UDim2.new(0.5, 0, 1, -8)
	}
	local t_2 = {
		Scale = roactModule.createElement("UIScale", { Scale = 0.75 })
	}
	local tailVisible = p1.props.chatSettings.TailVisible
	
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
				ImageTransparency = p1.backgroundTransparency
			}, {
				Gradient = UIGradient ~= nil and roactModule.createElement("UIGradient", UIGradient)
			})
		end
	end
	t_2.Carat = tailVisible
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
	t_2.RoundedFrame = createElement_1(var3, join, {
		UICorner = t and roactModule.createElement("UICorner", { CornerRadius = t.CornerRadius }) or roactModule.createElement("UICorner", { CornerRadius = cornerRadius }),
		Contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Padding = UIPadding and roactModule.createElement("UIPadding", UIPadding) or roactModule.createElement("UIPadding", UIPadding_1),
			UIListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Insert = p1.props.renderInsert and p1.props.renderInsert(),
			Ellipsis = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = "\226\128\166",
				TextScaled = false,
				LayoutOrder = 2,
				TextColor3 = chatSettings.TextColor3,
				TextTransparency = p1.transparency,
				Font = Enum.Font.BuilderSansExtraBold,
				TextSize = chatSettings.TextSize,
				Size = UDim2.new(1, -var1, 1, 0)
			})
		}),
		Gradient = UIGradient ~= nil and roactModule.createElement("UIGradient", UIGradient)
	})
	
	return createElement(var2, t_1, t_2)
end

function chatBubbleDistant.fadeIn(p1)
	-- upvalues: getSpringFromSettingsModule (ref), clientSettingsUtilityModule (ref)
	local var1 = getSpringFromSettingsModule(p1.props.chatSettings, "transparency")
	p1.transparencyMotor:setGoal(var1(p1.props.chatSettings.Transparency))
	p1.backgroundTransparencyMotor:setGoal(var1(clientSettingsUtilityModule.getBackgroundTransparency(p1.props.chatSettings, p1.props.clientSettings)))
	p1.widthMotor:setGoal(getSpringFromSettingsModule(p1.props.chatSettings, "size")(p1.state.fullWidth))
end

function chatBubbleDistant.fadeOut(p1)
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

function chatBubbleDistant.didUpdate(p1, p2, p3)
	-- upvalues: getSpringFromSettingsModule (ref)
	if p2.fadingOut == p1.props.fadingOut then
		if p1.state.fullHeight ~= p3.fullHeight then
			p1.updateHeight(p1.state.fullHeight)
		end
		if p1.state.fullWidth ~= p3.fullWidth then
			p1.widthMotor:setGoal(getSpringFromSettingsModule(p1.props.chatSettings, "size")(p1.state.fullWidth))
		end
		return
	elseif p1.props.fadingOut then
		p1:fadeOut()
		
		return
	end
	p1:fadeIn()
end

function chatBubbleDistant.didMount(p1)
	-- upvalues: getSpringFromSettingsModule (ref), clientSettingsUtilityModule (ref)
	if not p1.props.fadingOut then
		local var1 = getSpringFromSettingsModule(p1.props.chatSettings, "size")
		local var2 = getSpringFromSettingsModule(p1.props.chatSettings, "transparency")
		p1.transparencyMotor:setGoal(var2(p1.props.chatSettings.Transparency))
		p1.backgroundTransparencyMotor:setGoal(var2(clientSettingsUtilityModule.getBackgroundTransparency(p1.props.chatSettings, p1.props.clientSettings)))
		p1.widthMotor:setGoal(var1(p1.state.fullWidth))
	end
end

function chatBubbleDistant.willUnmount(p1)
	p1.transparencyMotor:destroy()
	p1.backgroundTransparencyMotor:destroy()
	p1.widthMotor:destroy()
end

return chatBubbleDistant