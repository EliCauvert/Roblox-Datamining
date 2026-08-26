local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local textChatService = game:GetService("TextChatService")
local otterModule = require(corePackagesService.Packages.Otter)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent
local typesModule = require(parent.Types)
local getSizeSpringFromSettingsModule = require(parent.Helpers.getSizeSpringFromSettings)
local getTransparencySpringFromSettingsModule = require(parent.Helpers.getTransparencySpringFromSettings)
local coreGuiService = game:GetService("CoreGui")
local chatBubble = roactModule.PureComponent:extend("ChatBubble")
chatBubble.validateProps = tModule.strictInterface({
	messageId = tModule.string,
	fadingOut = tModule.optional(tModule.boolean),
	onFadeOut = tModule.optional(tModule.callback),
	isMostRecent = tModule.optional(tModule.boolean),
	theme = tModule.optional(tModule.string),
	renderInsert = tModule.optional(tModule.callback),
	insertSize = tModule.optional(tModule.Vector2),
	chatSettings = typesModule.IChatSettings,
	text = tModule.string,
	timestamp = tModule.number
})
chatBubble.defaultProps = { theme = "Light", isMostRecent = true }

local function _()
	-- upvalues: coreGuiService (ref)
	local richTextSizingLabel = Instance.new("ScreenGui")
	richTextSizingLabel.Enabled = false
	richTextSizingLabel.Name = "RichTextSizingLabel"
	local textLabel = Instance.new("TextLabel")
	textLabel.TextWrapped = true
	textLabel.RichText = true
	textLabel.Parent = richTextSizingLabel
	richTextSizingLabel.Parent = coreGuiService
	
	return textLabel
end

function chatBubble.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref), textChatService (ref)
	local var1, var2 = roactModule.createBinding(0)
	p1.width = var1
	p1.updateWidth = var2
	p1.widthMotor = otterModule.createSingleMotor(0)
	p1.widthMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateWidth(math.round(p2))
	end)
	local var3, var4 = roactModule.createBinding(0)
	p1.height = var3
	p1.updateHeight = var4
	p1.heightMotor = otterModule.createSingleMotor(0)
	p1.heightMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateHeight(math.round(p2))
	end)
	local var5, var6 = roactModule.createBinding(1)
	p1.transparency = var5
	p1.updateTransparency = var6
	p1.transparencyMotor = otterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
	p1.size = roactModule.joinBindings({ p1.width, p1.height }):map(function(p2)
		return UDim2.fromOffset(p2[1], p2[2])
	end)
	p1.mockSizingLabel = nil
	p1.isRichTextEnabled = textChatService.ChatVersion == Enum.ChatVersion.TextChatService
end

function chatBubble.getBoundsFromSizingLabel(_, p1, p2, p3, p4)
	-- upvalues: coreGuiService (ref)
	local richTextSizingLabel = Instance.new("ScreenGui")
	richTextSizingLabel.Enabled = false
	richTextSizingLabel.Name = "RichTextSizingLabel"
	local textLabel = Instance.new("TextLabel")
	textLabel.TextWrapped = true
	textLabel.RichText = true
	textLabel.Parent = richTextSizingLabel
	richTextSizingLabel.Parent = coreGuiService
	textLabel.Text = p1
	textLabel.TextSize = p2
	textLabel.Font = p3
	textLabel.Size = UDim2.fromOffset(p4.X, p4.Y)
	local textBounds = textLabel.TextBounds
	textLabel.Parent:Destroy()
	
	return textBounds
end

function chatBubble.getTextBounds(p1)
	-- upvalues: textService (ref)
	local chatSettings = p1.props.chatSettings
	
	return (if p1.isRichTextEnabled then p1:getBoundsFromSizingLabel(p1.props.text, chatSettings.TextSize, chatSettings.Font, Vector2.new(chatSettings.MaxWidth, 10000)) else textService:GetTextSize(p1.props.text, chatSettings.TextSize, chatSettings.Font, Vector2.new(chatSettings.MaxWidth, 10000))) + Vector2.new(chatSettings.Padding * 4, chatSettings.Padding * 2)
end

function chatBubble.render(p1)
	-- upvalues: roactModule (ref), cryoModule (ref)
	local chatSettings = p1.props.chatSettings
	local backgroundImage = chatSettings.BackgroundImage
	local backgroundGradient = chatSettings.BackgroundGradient
	
	return roactModule.createElement("Frame", {
		Transparency = 1,
		LayoutOrder = p1.props.timestamp,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = p1.size,
		Position = UDim2.fromScale(1, 0.5)
	}, {
		Layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, -1)
		}),
		Frame = roactModule.createElement("ImageLabel", cryoModule.Dictionary.join(backgroundImage, {
			LayoutOrder = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			BackgroundColor3 = chatSettings.BackgroundColor3,
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.new(0.5, 0, 0, 0),
			BackgroundTransparency = if backgroundImage.Image ~= "" then p1.transparency else 1,
			ImageTransparency = p1.transparency
		}), {
			UICorner = chatSettings.CornerEnabled and roactModule.createElement("UICorner", { CornerRadius = chatSettings.CornerRadius }),
			UIListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, chatSettings.Padding)
			}),
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, chatSettings.Padding),
				PaddingRight = UDim.new(0, chatSettings.Padding),
				PaddingBottom = UDim.new(0, chatSettings.Padding),
				PaddingLeft = UDim.new(0, chatSettings.Padding)
			}),
			Insert = p1.props.renderInsert and p1.props.renderInsert(),
			Text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutoLocalize = false,
				LayoutOrder = 2,
				Text = p1.props.text,
				Size = UDim2.new(1, -(if p1.props.renderInsert then p1.props.insertSize.X + chatSettings.Padding else 0), 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Font = chatSettings.Font,
				TextColor3 = chatSettings.TextColor3,
				TextSize = chatSettings.TextSize,
				TextTransparency = p1.transparency,
				RichText = p1.isRichTextEnabled
			}),
			Gradient = backgroundGradient.Enabled and roactModule.createElement("UIGradient", backgroundGradient)
		}),
		Carat = p1.props.isMostRecent and (chatSettings.TailVisible and (p1.props.showCarat and roactModule.createElement("ImageLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			Size = UDim2.fromOffset(9, 6),
			ImageColor3 = chatSettings.BackgroundColor3,
			ImageTransparency = p1.transparency
		})))
	})
end

function chatBubble.fadeOut(p1)
	-- upvalues: getTransparencySpringFromSettingsModule (ref)
	if not p1.isFadingOut then
		p1.isFadingOut = true
		p1.transparencyMotor:onComplete(function()
			-- upvalues: p1 (ref)
			if p1.props.onFadeOut then
				p1.props.onFadeOut(p1.props.messageId)
			end
		end)
		p1.transparencyMotor:setGoal(getTransparencySpringFromSettingsModule(p1.props.chatSettings)(1))
	end
end

function chatBubble.didUpdate(p1, p2)
	-- upvalues: getSizeSpringFromSettingsModule (ref)
	if p1.props.fadingOut then
		p1:fadeOut()
	end
	if p2.text ~= p1.props.text or p2.chatSettings ~= p1.props.chatSettings or (p2.renderInsert ~= p1.props.renderInsert or p2.insertSize ~= p1.props.insertSize) then
		local textBounds = p1:getTextBounds()
		local var1 = getSizeSpringFromSettingsModule(p1.props.chatSettings)
		local padding = p1.props.chatSettings.Padding
		local x = textBounds.X
		local y = textBounds.Y
		
		if p1.props.renderInsert then
			x += p1.props.insertSize.X + padding
			y = math.max(y, p1.props.insertSize.Y + padding * 2)
		end
		p1.heightMotor:setGoal(var1(y))
		p1.widthMotor:setGoal(var1(x))
	end
end

function chatBubble.didMount(p1)
	-- upvalues: getSizeSpringFromSettingsModule (ref), getTransparencySpringFromSettingsModule (ref), otterModule (ref)
	p1.isMounted = true
	local textBounds = p1:getTextBounds()
	local chatSettings = p1.props.chatSettings
	local var1 = getSizeSpringFromSettingsModule(chatSettings)
	local var2 = getTransparencySpringFromSettingsModule(chatSettings)
	local x = textBounds.X
	local y = textBounds.Y
	
	if p1.props.renderInsert then
		x += p1.props.insertSize.X + chatSettings.Padding
		y = math.max(y, p1.props.insertSize.Y + chatSettings.Padding * 2)
	end
	if p1.props.isMostRecent then
		p1.heightMotor:setGoal(var1(y))
		p1.widthMotor:setGoal(otterModule.instant(x))
	else
		p1.heightMotor:setGoal(var1(y))
		p1.widthMotor:setGoal(var1(x))
	end
	p1.transparencyMotor:setGoal(var2(chatSettings.Transparency))
end

function chatBubble.willUnmount(p1)
	p1.isMounted = false
	p1.transparencyMotor:destroy()
	p1.heightMotor:destroy()
	p1.widthMotor:destroy()
end

return roactRoduxModule.connect(function(p1, p2)
	local messageId = p1.messages[p2.messageId]
	
	return {
		text = if messageId then messageId.text else "",
		timestamp = if messageId then messageId.timestamp else 0
	}
end)(chatBubble)