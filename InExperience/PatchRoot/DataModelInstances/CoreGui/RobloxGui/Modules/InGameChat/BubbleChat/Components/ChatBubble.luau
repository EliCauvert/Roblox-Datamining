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

local function _() --[[ line: 41 | named "initMockSizingLabel" ]]
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

function chatBubble.init(p0) --[[ line: 53 ]]
	-- upvalues: roactModule (ref), otterModule (ref), textChatService (ref)
	local var15, var16 = roactModule.createBinding(0)
	p0.width = var15
	p0.updateWidth = var16
	p0.widthMotor = otterModule.createSingleMotor(0)
	p0.widthMotor:onStep(function(p1) --[[ line: 56 ]]
		-- upvalues: p0 (ref)
		p0.updateWidth(math.round(p1))
	end)
	local var17, var18 = roactModule.createBinding(0)
	p0.height = var17
	p0.updateHeight = var18
	p0.heightMotor = otterModule.createSingleMotor(0)
	p0.heightMotor:onStep(function(p2) --[[ line: 62 ]]
		-- upvalues: p0 (ref)
		p0.updateHeight(math.round(p2))
	end)
	local var19, var20 = roactModule.createBinding(1)
	p0.transparency = var19
	p0.updateTransparency = var20
	p0.transparencyMotor = otterModule.createSingleMotor(1)
	p0.transparencyMotor:onStep(p0.updateTransparency)
	p0.size = roactModule.joinBindings({ p0.width, p0.height }):map(function(p3) --[[ line: 70 ]]
		return UDim2.fromOffset(p3[1], p3[2])
	end)
	p0.mockSizingLabel = nil
	p0.isRichTextEnabled = textChatService.ChatVersion == Enum.ChatVersion.TextChatService
end

function chatBubble.getBoundsFromSizingLabel(_, p4, p5, p6, p7) --[[ line: 79 ]]
	-- upvalues: coreGuiService (ref)
	local richTextSizingLabel = Instance.new("ScreenGui")
	richTextSizingLabel.Enabled = false
	richTextSizingLabel.Name = "RichTextSizingLabel"
	local textLabel = Instance.new("TextLabel")
	textLabel.TextWrapped = true
	textLabel.RichText = true
	textLabel.Parent = richTextSizingLabel
	richTextSizingLabel.Parent = coreGuiService
	textLabel.Text = p4
	textLabel.TextSize = p5
	textLabel.Font = p6
	textLabel.Size = UDim2.fromOffset(p7.X, p7.Y)
	local textBounds = textLabel.TextBounds
	textLabel.Parent:Destroy()
	
	return textBounds
end

function chatBubble.getTextBounds(p8) --[[ line: 92 ]]
	-- upvalues: textService (ref)
	local chatSettings = p8.props.chatSettings
	
	return (if p8.isRichTextEnabled then p8:getBoundsFromSizingLabel(p8.props.text, chatSettings.TextSize, chatSettings.Font, Vector2.new(chatSettings.MaxWidth, 10000)) else textService:GetTextSize(p8.props.text, chatSettings.TextSize, chatSettings.Font, Vector2.new(chatSettings.MaxWidth, 10000))) + Vector2.new(chatSettings.Padding * 4, chatSettings.Padding * 2)
end

function chatBubble.render(p9) --[[ line: 116 ]]
	-- upvalues: roactModule (ref), cryoModule (ref)
	local chatSettings = p9.props.chatSettings
	local backgroundImage = chatSettings.BackgroundImage
	local backgroundGradient = chatSettings.BackgroundGradient
	
	return roactModule.createElement("Frame", {
		Transparency = 1,
		LayoutOrder = p9.props.timestamp,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = p9.size,
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
			BackgroundTransparency = if backgroundImage.Image ~= "" then p9.transparency else 1,
			ImageTransparency = p9.transparency
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
			Insert = p9.props.renderInsert and p9.props.renderInsert(),
			Text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutoLocalize = false,
				LayoutOrder = 2,
				Text = p9.props.text,
				Size = UDim2.new(1, -(if p9.props.renderInsert then p9.props.insertSize.X + chatSettings.Padding else 0), 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Font = chatSettings.Font,
				TextColor3 = chatSettings.TextColor3,
				TextSize = chatSettings.TextSize,
				TextTransparency = p9.transparency,
				RichText = p9.isRichTextEnabled
			}),
			Gradient = backgroundGradient.Enabled and roactModule.createElement("UIGradient", backgroundGradient)
		}),
		Carat = p9.props.isMostRecent and (chatSettings.TailVisible and (p9.props.showCarat and roactModule.createElement("ImageLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			Size = UDim2.fromOffset(9, 6),
			ImageColor3 = chatSettings.BackgroundColor3,
			ImageTransparency = p9.transparency
		})))
	})
end

function chatBubble.fadeOut(p10) --[[ line: 205 ]]
	-- upvalues: getTransparencySpringFromSettingsModule (ref)
	if not p10.isFadingOut then
		p10.isFadingOut = true
		p10.transparencyMotor:onComplete(function() --[[ line: 209 ]]
			-- upvalues: p10 (ref)
			if p10.props.onFadeOut then
				p10.props.onFadeOut(p10.props.messageId)
			end
		end)
		p10.transparencyMotor:setGoal(getTransparencySpringFromSettingsModule(p10.props.chatSettings)(1))
	end
end

function chatBubble.didUpdate(p11, p12) --[[ line: 220 ]]
	-- upvalues: getSizeSpringFromSettingsModule (ref)
	if p11.props.fadingOut then
		p11:fadeOut()
	end
	if p12.text ~= p11.props.text or p12.chatSettings ~= p11.props.chatSettings or (p12.renderInsert ~= p11.props.renderInsert or p12.insertSize ~= p11.props.insertSize) then
		local textBounds = p11:getTextBounds()
		local var24 = getSizeSpringFromSettingsModule(p11.props.chatSettings)
		local padding = p11.props.chatSettings.Padding
		local x = textBounds.X
		local y = textBounds.Y
		
		if p11.props.renderInsert then
			x += p11.props.insertSize.X + padding
			y = math.max(y, p11.props.insertSize.Y + padding * 2)
		end
		p11.heightMotor:setGoal(var24(y))
		p11.widthMotor:setGoal(var24(x))
	end
end

function chatBubble.didMount(p13) --[[ line: 247 ]]
	-- upvalues: getSizeSpringFromSettingsModule (ref), getTransparencySpringFromSettingsModule (ref), otterModule (ref)
	p13.isMounted = true
	local textBounds = p13:getTextBounds()
	local chatSettings = p13.props.chatSettings
	local var26 = getSizeSpringFromSettingsModule(chatSettings)
	local var27 = getTransparencySpringFromSettingsModule(chatSettings)
	local x = textBounds.X
	local y = textBounds.Y
	
	if p13.props.renderInsert then
		x += p13.props.insertSize.X + chatSettings.Padding
		y = math.max(y, p13.props.insertSize.Y + chatSettings.Padding * 2)
	end
	if p13.props.isMostRecent then
		p13.heightMotor:setGoal(var26(y))
		p13.widthMotor:setGoal(otterModule.instant(x))
	else
		p13.heightMotor:setGoal(var26(y))
		p13.widthMotor:setGoal(var26(x))
	end
	p13.transparencyMotor:setGoal(var27(chatSettings.Transparency))
end

function chatBubble.willUnmount(p14) --[[ line: 275 ]]
	p14.isMounted = false
	p14.transparencyMotor:destroy()
	p14.heightMotor:destroy()
	p14.widthMotor:destroy()
end

return roactRoduxModule.connect(function(p15, p16) --[[ line: 282 | named "mapStateToProps" ]]
	local messageId = p15.messages[p16.messageId]
	
	return {
		text = if messageId then messageId.text else "",
		timestamp = if messageId then messageId.timestamp else 0
	}
end)(chatBubble)