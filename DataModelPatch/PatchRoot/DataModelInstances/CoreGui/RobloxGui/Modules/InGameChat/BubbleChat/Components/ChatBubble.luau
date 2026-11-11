local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local TextChatService = game:GetService("TextChatService")
local OtterModule = require(CorePackages.Packages.Otter)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local GetSizeSpringFromSettingsModule = require(Parent.Helpers.getSizeSpringFromSettings)
local GetTransparencySpringFromSettingsModule = require(Parent.Helpers.getTransparencySpringFromSettings)
local CoreGui = game:GetService("CoreGui")
local ChatBubble = RoactModule.PureComponent:extend("ChatBubble")
ChatBubble.validateProps = TModule.strictInterface({
	messageId = TModule.string,
	fadingOut = TModule.optional(TModule.boolean),
	onFadeOut = TModule.optional(TModule.callback),
	isMostRecent = TModule.optional(TModule.boolean),
	theme = TModule.optional(TModule.string),
	renderInsert = TModule.optional(TModule.callback),
	insertSize = TModule.optional(TModule.Vector2),
	chatSettings = require(Parent.Types).IChatSettings,
	text = TModule.string,
	timestamp = TModule.number
})
ChatBubble.defaultProps = { theme = "Light", isMostRecent = true }

local function _()
	-- upvalues: CoreGui (copy)
	local RichTextSizingLabel = Instance.new("ScreenGui")
	RichTextSizingLabel.Enabled = false
	RichTextSizingLabel.Name = "RichTextSizingLabel"
	local Label = Instance.new("TextLabel")
	Label.TextWrapped = true
	Label.RichText = true
	Label.Parent = RichTextSizingLabel
	RichTextSizingLabel.Parent = CoreGui
	
	return Label
end

function ChatBubble.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy), TextChatService (copy)
	p1.width, p1.updateWidth = RoactModule.createBinding(0)
	p1.widthMotor = OtterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(Value: number)
		-- upvalues: p1 (copy)
		p1.updateWidth((math.round(Value)))
	end)
	p1.height, p1.updateHeight = RoactModule.createBinding(0)
	p1.heightMotor = OtterModule.createSingleMotor(0)
	p1.heightMotor:onStep(function(Value: number)
		-- upvalues: p1 (copy)
		p1.updateHeight((math.round(Value)))
	end)
	p1.transparency, p1.updateTransparency = RoactModule.createBinding(1)
	p1.transparencyMotor = OtterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	p1.size = RoactModule.joinBindings({ p1.width, p1.height }):map(function(Entry): UDim2
		return UDim2.fromOffset(Entry[1], Entry[2])
	end)
	p1.mockSizingLabel = nil
	p1.isRichTextEnabled = TextChatService.ChatVersion == Enum.ChatVersion.TextChatService
end

function ChatBubble:getBoundsFromSizingLabel(Text, TextSize, p1, Vector)
	-- upvalues: CoreGui (copy)
	local RichTextSizingLabel = Instance.new("ScreenGui")
	RichTextSizingLabel.Enabled = false
	RichTextSizingLabel.Name = "RichTextSizingLabel"
	local Label = Instance.new("TextLabel")
	Label.TextWrapped = true
	Label.RichText = true
	Label.Parent = RichTextSizingLabel
	RichTextSizingLabel.Parent = CoreGui
	Label.Text = Text
	Label.TextSize = TextSize
	Label.Font = p1
	Label.Size = UDim2.fromOffset(Vector.X, Vector.Y)
	local TextBounds = Label.TextBounds
	Label.Parent:Destroy()
	
	return TextBounds
end

function ChatBubble.getTextBounds(p1): Vector2
	-- upvalues: TextService (copy)
	local ChatSettings = p1.props.chatSettings
	local _ = Vector2.new(0, 0)
	
	return (if p1.isRichTextEnabled then p1:getBoundsFromSizingLabel(p1.props.text, ChatSettings.TextSize, ChatSettings.Font, Vector2.new(ChatSettings.MaxWidth, 10000)) else TextService:GetTextSize(p1.props.text, ChatSettings.TextSize, ChatSettings.Font, Vector2.new(ChatSettings.MaxWidth, 10000))) + Vector2.new(ChatSettings.Padding * 4, ChatSettings.Padding * 2)
end

function ChatBubble.render(p1)
	-- upvalues: RoactModule (copy), CryoModule (copy)
	local ChatSettings = p1.props.chatSettings
	local BackgroundImage = ChatSettings.BackgroundImage
	local BackgroundGradient = ChatSettings.BackgroundGradient
	
	return RoactModule.createElement("Frame", {
		Transparency = 1,
		LayoutOrder = p1.props.timestamp,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = p1.size,
		Position = UDim2.fromScale(1, 0.5)
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, -1)
		}),
		Frame = RoactModule.createElement("ImageLabel", CryoModule.Dictionary.join(BackgroundImage, {
			LayoutOrder = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			BackgroundColor3 = ChatSettings.BackgroundColor3,
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.new(0.5, 0, 0, 0),
			BackgroundTransparency = if BackgroundImage.Image == "" then p1.transparency else 1,
			ImageTransparency = p1.transparency
		}), {
			UICorner = ChatSettings.CornerEnabled and RoactModule.createElement("UICorner", { CornerRadius = ChatSettings.CornerRadius }),
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, ChatSettings.Padding)
			}),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, ChatSettings.Padding),
				PaddingRight = UDim.new(0, ChatSettings.Padding),
				PaddingBottom = UDim.new(0, ChatSettings.Padding),
				PaddingLeft = UDim.new(0, ChatSettings.Padding)
			}),
			Insert = p1.props.renderInsert and p1.props.renderInsert(),
			Text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutoLocalize = false,
				LayoutOrder = 2,
				Text = p1.props.text,
				Size = UDim2.new(1, -(p1.props.renderInsert and p1.props.insertSize.X + ChatSettings.Padding or 0), 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Font = ChatSettings.Font,
				TextColor3 = ChatSettings.TextColor3,
				TextSize = ChatSettings.TextSize,
				TextTransparency = p1.transparency,
				RichText = p1.isRichTextEnabled
			}),
			Gradient = BackgroundGradient.Enabled and RoactModule.createElement("UIGradient", BackgroundGradient)
		}),
		Carat = p1.props.isMostRecent and (ChatSettings.TailVisible and (p1.props.showCarat and RoactModule.createElement("ImageLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			Size = UDim2.fromOffset(9, 6),
			ImageColor3 = ChatSettings.BackgroundColor3,
			ImageTransparency = p1.transparency
		})))
	})
end

function ChatBubble.fadeOut(p1)
	-- upvalues: GetTransparencySpringFromSettingsModule (copy)
	if not p1.isFadingOut then
		p1.isFadingOut = true
		p1.transparencyMotor:onComplete(function()
			-- upvalues: p1 (copy)
			if p1.props.onFadeOut then
				p1.props.onFadeOut(p1.props.messageId)
			end
		end)
		p1.transparencyMotor:setGoal(GetTransparencySpringFromSettingsModule(p1.props.chatSettings)(1))
	end
end

function ChatBubble.didUpdate(p1, p2)
	-- upvalues: GetSizeSpringFromSettingsModule (copy)
	if p1.props.fadingOut then
		p1:fadeOut()
	end
	if p2.text ~= p1.props.text or p2.chatSettings ~= p1.props.chatSettings or p2.renderInsert ~= p1.props.renderInsert or p2.insertSize ~= p1.props.insertSize then
		local TextBounds = p1:getTextBounds()
		local SizeSpringFromSettingsModule = GetSizeSpringFromSettingsModule(p1.props.chatSettings)
		local Padding: number = p1.props.chatSettings.Padding
		local X = TextBounds.X
		local Y = TextBounds.Y
		
		if p1.props.renderInsert then
			X += p1.props.insertSize.X + Padding
			Y = math.max(Y, p1.props.insertSize.Y + Padding * 2)
		end
		p1.heightMotor:setGoal(SizeSpringFromSettingsModule(Y))
		p1.widthMotor:setGoal(SizeSpringFromSettingsModule(X))
	end
end

function ChatBubble.didMount(p1)
	-- upvalues: GetSizeSpringFromSettingsModule (copy), GetTransparencySpringFromSettingsModule (copy), OtterModule (copy)
	p1.isMounted = true
	local TextBounds = p1:getTextBounds()
	local ChatSettings = p1.props.chatSettings
	local SizeSpringFromSettingsModule = GetSizeSpringFromSettingsModule(ChatSettings)
	local TransparencySpringFromSettingsModule = GetTransparencySpringFromSettingsModule(ChatSettings)
	local X = TextBounds.X
	local Y = TextBounds.Y
	
	if p1.props.renderInsert then
		X += p1.props.insertSize.X + ChatSettings.Padding
		Y = math.max(Y, p1.props.insertSize.Y + ChatSettings.Padding * 2)
	end
	if p1.props.isMostRecent then
		p1.heightMotor:setGoal(SizeSpringFromSettingsModule(Y))
		p1.widthMotor:setGoal(OtterModule.instant(X))
	else
		p1.heightMotor:setGoal(SizeSpringFromSettingsModule(Y))
		p1.widthMotor:setGoal(SizeSpringFromSettingsModule(X))
	end
	p1.transparencyMotor:setGoal(TransparencySpringFromSettingsModule(ChatSettings.Transparency))
end

function ChatBubble.willUnmount(p1)
	p1.isMounted = false
	p1.transparencyMotor:destroy()
	p1.heightMotor:destroy()
	p1.widthMotor:destroy()
end

return RoactRoduxModule.connect(function(p1, p2)
	local Message = p1.messages[p2.messageId]
	
	return {
		text = Message and Message.text or "",
		timestamp = Message and Message.timestamp or 0
	}
end)(ChatBubble)