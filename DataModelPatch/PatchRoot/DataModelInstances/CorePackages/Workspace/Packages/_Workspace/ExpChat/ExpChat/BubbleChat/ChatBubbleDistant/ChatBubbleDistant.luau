local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local OtterModule = require(Parent.Otter)
local Dictionary = require(Parent.llama).Dictionary
local ConfigModule = require(ExpChat.Config)
local Helpers = ExpChat.BubbleChat.Helpers
local GetSpringFromSettingsModule = require(Helpers.getSpringFromSettings)
local GetAbsolutePaddingbyDimensionModule = require(Helpers.getAbsolutePaddingbyDimension)
local ClientSettingsUtilityModule = require(ExpChat.ClientSettings.ClientSettingsUtility)
local ChatBubbleDistant = RoactModule.Component:extend("ChatBubbleDistant")
ChatBubbleDistant.defaultProps = { width = 32, height = 16 }

local function getFullHeight(Props)
	-- upvalues: GetAbsolutePaddingbyDimensionModule (copy)
	local Height = Props.height
	
	if Props.renderInsert then
		Height = math.max(Height, Props.insertSize.Y)
	end
	if Props.chatSettings.UIPadding then
		local UIPadding = Props.chatSettings.UIPadding
		local AbsolutePaddingbyDimensionModule = GetAbsolutePaddingbyDimensionModule(UIPadding.PaddingTop, Height)
		local AbsolutePaddingbyDimensionModule1 = GetAbsolutePaddingbyDimensionModule(UIPadding.PaddingBottom, Height)
		
		if Props.renderInsert then
			Height = math.max(Height, Props.insertSize.Y)
		end
		Height += AbsolutePaddingbyDimensionModule + AbsolutePaddingbyDimensionModule1
		
		return Height
	else
		if Props.renderInsert then
			Height = math.max(Height, Props.insertSize.Y)
		end
		return Height + Props.chatSettings.Padding * 2
	end
end

function ChatBubbleDistant.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy), getFullHeight (copy)
	p1.state = {}
	p1.width, p1.updateWidth = RoactModule.createBinding(0)
	p1.widthMotor = OtterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(Value: number)
		-- upvalues: p1 (copy)
		p1.updateWidth((math.round(Value)))
	end)
	p1.height, p1.updateHeight = RoactModule.createBinding((getFullHeight(p1.props)))
	p1.frameSize = RoactModule.joinBindings({ p1.width, p1.height }):map(function(Entry): UDim2
		return UDim2.fromOffset(Entry[1], Entry[2])
	end)
	p1.transparency, p1.updateTransparency = RoactModule.createBinding(1)
	p1.transparencyMotor = OtterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	p1.backgroundTransparency, p1.updateBackgroundTransparency = RoactModule.createBinding(1)
	p1.backgroundTransparencyMotor = OtterModule.createSingleMotor(1)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	
	if p1.props.fadingOut then
		p1:fadeOut()
	end
end

function ChatBubbleDistant.getDerivedStateFromProps(p1, p2)
	-- upvalues: GetAbsolutePaddingbyDimensionModule (copy), getFullHeight (copy)
	local NewWidth = nil
	if p1.chatSettings.UIPadding then
		local Width = p1.width
		
		if p1.renderInsert then
			Width += p1.insertSize.X
		end
		local UIPadding = p1.chatSettings.UIPadding
		NewWidth = Width + (GetAbsolutePaddingbyDimensionModule(UIPadding.PaddingLeft, Width) + GetAbsolutePaddingbyDimensionModule(UIPadding.PaddingRight, Width))
	else
		NewWidth = if p1.renderInsert then p1.width + p1.insertSize.X + p1.chatSettings.Padding * 2 else p1.width + p1.chatSettings.Padding * 2
	end
	local FullHeight = getFullHeight(p1)
	
	return if NewWidth == p2.fullWidth and FullHeight == p2.fullHeight then nil else { fullWidth = NewWidth, fullHeight = FullHeight }
end

function ChatBubbleDistant.render(p1)
	-- upvalues: ConfigModule (copy), RoactModule (copy), Dictionary (copy)
	local ChatSettings = p1.props.chatSettings
	local UICorner = nil
	local ImageLabel = nil
	local UIPadding = nil
	local UIGradient = nil
	
	if p1.props.isTextChatServiceOn then
		ImageLabel = ChatSettings.ImageLabel
		UIGradient = ChatSettings.UIGradient
		UICorner = ChatSettings.UICorner
		UIPadding = ChatSettings.UIPadding
	else
		ImageLabel = ChatSettings.BackgroundImage
		UIGradient = ChatSettings.BackgroundGradient
		
		if ChatSettings.CornerEnabled then
			UICorner = { CornerRadius = ChatSettings.CornerRadius }
		elseif ChatSettings.CornerEnabled == false then
			UICorner = { CornerRadius = UDim.new(0, 0) }
		end
		UIPadding = ChatSettings.Padding and {
			PaddingTop = UDim.new(0, ChatSettings.Padding),
			PaddingRight = UDim.new(0, ChatSettings.Padding),
			PaddingBottom = UDim.new(0, ChatSettings.Padding),
			PaddingLeft = UDim.new(0, ChatSettings.Padding)
		} or nil
	end
	local CornerRadius = ConfigModule.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius
	local UIPadding1 = ConfigModule.DefaultBubbleChatChildrenCustomizationProperties.UIPadding
	local ShowCaret = p1.props.chatSettings.TailVisible and p1.props.showCaret
	
	return RoactModule.createElement("Frame", {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p1.state.fullWidth, p1.state.fullHeight),
		Position = UDim2.new(0.5, 0, 1, -8)
	}, {
		Scale = RoactModule.createElement("UIScale", { Scale = 0.75 }),
		Carat = p1.props.chatSettings.TailVisible and (ShowCaret and RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, -1),
			Size = UDim2.fromOffset(12, 8),
			ImageColor3 = ChatSettings.BackgroundColor3,
			ImageTransparency = p1.backgroundTransparency
		}, {
			Gradient = UIGradient ~= nil and RoactModule.createElement("UIGradient", UIGradient)
		})),
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
				Padding = UIPadding and RoactModule.createElement("UIPadding", UIPadding) or RoactModule.createElement("UIPadding", UIPadding1),
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Insert = p1.props.renderInsert and p1.props.renderInsert(),
				Ellipsis = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = "…",
					TextScaled = false,
					LayoutOrder = 2,
					TextColor3 = ChatSettings.TextColor3,
					TextTransparency = p1.transparency,
					Font = Enum.Font.BuilderSansExtraBold,
					TextSize = ChatSettings.TextSize,
					Size = UDim2.new(1, -(p1.props.renderInsert and p1.props.insertSize.X or 0), 1, 0)
				})
			}),
			Gradient = UIGradient ~= nil and RoactModule.createElement("UIGradient", UIGradient)
		})
	})
end

function ChatBubbleDistant.fadeIn(p1)
	-- upvalues: GetSpringFromSettingsModule (copy), ClientSettingsUtilityModule (copy)
	local Transparency = GetSpringFromSettingsModule(p1.props.chatSettings, "transparency")
	p1.transparencyMotor:setGoal(Transparency(p1.props.chatSettings.Transparency))
	p1.backgroundTransparencyMotor:setGoal(Transparency((ClientSettingsUtilityModule.getBackgroundTransparency(p1.props.chatSettings, p1.props.clientSettings))))
	p1.widthMotor:setGoal(GetSpringFromSettingsModule(p1.props.chatSettings, "size")(p1.state.fullWidth))
end

function ChatBubbleDistant.fadeOut(p1)
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

function ChatBubbleDistant.didUpdate(p1, p2, p3)
	-- upvalues: GetSpringFromSettingsModule (copy)
	if p2.fadingOut == p1.props.fadingOut then
		if p1.state.fullHeight ~= p3.fullHeight then
			p1.updateHeight(p1.state.fullHeight)
		end
		if p1.state.fullWidth ~= p3.fullWidth then
			p1.widthMotor:setGoal(GetSpringFromSettingsModule(p1.props.chatSettings, "size")(p1.state.fullWidth))
		end
		return
	elseif p1.props.fadingOut then
		p1:fadeOut()
		
		return
	else
		p1:fadeIn()
	end
end

function ChatBubbleDistant.didMount(p1)
	-- upvalues: GetSpringFromSettingsModule (copy), ClientSettingsUtilityModule (copy)
	if not p1.props.fadingOut then
		local Size = GetSpringFromSettingsModule(p1.props.chatSettings, "size")
		local Transparency = GetSpringFromSettingsModule(p1.props.chatSettings, "transparency")
		p1.transparencyMotor:setGoal(Transparency(p1.props.chatSettings.Transparency))
		p1.backgroundTransparencyMotor:setGoal(Transparency((ClientSettingsUtilityModule.getBackgroundTransparency(p1.props.chatSettings, p1.props.clientSettings))))
		p1.widthMotor:setGoal(Size(p1.state.fullWidth))
	end
end

function ChatBubbleDistant.willUnmount(p1)
	p1.transparencyMotor:destroy()
	p1.backgroundTransparencyMotor:destroy()
	p1.widthMotor:destroy()
end

return ChatBubbleDistant