local CorePackages = game:GetService("CorePackages")
local OtterModule = require(CorePackages.Packages.Otter)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local GetSizeSpringFromSettingsModule = require(Parent.Helpers.getSizeSpringFromSettings)
local GetTransparencySpringFromSettingsModule = require(Parent.Helpers.getTransparencySpringFromSettings)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ChatBubbleDistant = RoactModule.PureComponent:extend("ChatBubbleDistant")
ChatBubbleDistant.validateProps = TModule.strictInterface({
	width = TModule.optional(TModule.number),
	height = TModule.optional(TModule.number),
	fadingOut = TModule.optional(TModule.boolean),
	onFadeOut = TModule.optional(TModule.callback),
	chatSettings = require(Parent.Types).IChatSettings,
	renderInsert = TModule.optional(TModule.callback),
	insertSize = TModule.optional(TModule.Vector2)
})
ChatBubbleDistant.defaultProps = { width = 32, height = 16 }

local function _(p1)
	local Height = p1.height
	
	if p1.renderInsert then
		Height = math.max(Height, p1.insertSize.Y)
	end
	return Height + p1.chatSettings.Padding * 2
end

function ChatBubbleDistant.init(p1, p2)
	-- upvalues: RoactModule (copy), OtterModule (copy)
	p1.width, p1.updateWidth = RoactModule.createBinding(0)
	p1.widthMotor = OtterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(Value: number)
		-- upvalues: p1 (copy)
		p1.updateWidth((math.round(Value)))
	end)
	local CreateBindingFunction = RoactModule.createBinding
	local Height = p2.height
	
	if p2.renderInsert then
		Height = math.max(Height, p2.insertSize.Y)
	end
	p1.height, p1.updateHeight = CreateBindingFunction(Height + p2.chatSettings.Padding * 2)
	p1.frameSize = RoactModule.joinBindings({ p1.width, p1.height }):map(function(Entry): UDim2
		return UDim2.fromOffset(Entry[1], Entry[2])
	end)
	p1.transparency, p1.updateTransparency = RoactModule.createBinding(1)
	p1.transparencyMotor = OtterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	
	if p2.fadingOut then
		p1:fadeOut()
	end
end

function ChatBubbleDistant.getDerivedStateFromProps(p1, p2)
	local ChatSettings = p1.chatSettings
	local NewWidth = if p1.renderInsert then p1.width + p1.insertSize.X + ChatSettings.Padding * 2 else p1.width + ChatSettings.Padding * 2
	local Height = p1.height
	
	if p1.renderInsert then
		Height = math.max(Height, p1.insertSize.Y)
	end
	local NewHeight = Height + p1.chatSettings.Padding * 2
	
	return if NewWidth == p2.fullWidth and NewHeight == p2.fullHeight then nil else { fullWidth = NewWidth, fullHeight = NewHeight }
end

function ChatBubbleDistant.render(p1)
	-- upvalues: RoactModule (copy), CryoModule (copy), AppFonts (copy)
	local ChatSettings = p1.props.chatSettings
	local BackgroundImage = ChatSettings.BackgroundImage
	local BackgroundGradient = ChatSettings.BackgroundGradient
	
	return RoactModule.createElement("Frame", {
		Transparency = 1,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(p1.state.fullWidth, p1.state.fullHeight),
		Position = UDim2.new(0.5, 0, 1, -8)
	}, {
		Scale = RoactModule.createElement("UIScale", { Scale = 0.75 }),
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
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Insert = p1.props.renderInsert and p1.props.renderInsert(),
				Ellipsis = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = "…",
					TextScaled = true,
					LayoutOrder = 2,
					TextColor3 = ChatSettings.TextColor3,
					TextTransparency = p1.transparency,
					Font = AppFonts.default:getBlack(),
					Size = UDim2.new(1, -(p1.props.renderInsert and p1.props.insertSize.X or 0), 1, 0)
				})
			}),
			Gradient = BackgroundGradient.Enabled and RoactModule.createElement("UIGradient", BackgroundGradient)
		})
	})
end

function ChatBubbleDistant.fadeOut(p1)
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

function ChatBubbleDistant.didUpdate(p1, _, p2)
	-- upvalues: GetSizeSpringFromSettingsModule (copy)
	if p1.props.fadingOut then
		p1:fadeOut()
		
		return
	end
	if p1.state.fullHeight ~= p2.fullHeight then
		p1.updateHeight(p1.state.fullHeight)
	end
	if p1.state.fullWidth ~= p2.fullWidth then
		p1.widthMotor:setGoal(GetSizeSpringFromSettingsModule(p1.props.chatSettings)(p1.state.fullWidth))
	end
end

function ChatBubbleDistant.didMount(p1)
	-- upvalues: GetSizeSpringFromSettingsModule (copy), GetTransparencySpringFromSettingsModule (copy)
	if not p1.props.fadingOut then
		local ChatSettings = p1.props.chatSettings
		local SizeSpringFromSettingsModule = GetSizeSpringFromSettingsModule(ChatSettings)
		p1.transparencyMotor:setGoal(GetTransparencySpringFromSettingsModule(ChatSettings)(p1.props.chatSettings.Transparency))
		p1.widthMotor:setGoal(SizeSpringFromSettingsModule(p1.state.fullWidth))
	end
end

function ChatBubbleDistant.willUnmount(p1)
	p1.transparencyMotor:destroy()
	p1.widthMotor:destroy()
end

return ChatBubbleDistant