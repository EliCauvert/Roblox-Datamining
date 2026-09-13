local textService = game:GetService("TextService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local chatBubbleContainerAutomaticSizeModule = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize)
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local fFlagAppChatEnableAutotranslationModule = require(appChat.Flags.FFlagAppChatEnableAutotranslation)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local divider = foundationModule.Divider
local dividerVariant = foundationModule.Enums.DividerVariant
local t = {
	text = "",
	maxWidth = 0,
	innerPadding = 0,
	isIncoming = false,
	hasTail = false,
	LayoutOrder = 0,
	isPending = false,
	isUnfiltered = false,
	isRepliedTo = false,
	isPressed = false,
	isLastMessageInMessageGroup = false,
	[reactModule.Change.AbsoluteSize] = function() end
}

function PlainText(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useStyle (ref), textService (ref), fFlagAppChatEnableAutotranslationModule (ref), reactModule (ref), chatBubbleContainerAutomaticSizeModule (ref), view (ref), text (ref), divider (ref), dividerVariant (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useTokens()
	local var3 = useStyle()
	local maxWidth = var1.maxWidth
	local innerPadding = var1.innerPadding
	local maxValue = math.max(0, maxWidth - innerPadding)
	local body = var3.Font.Body
	local textSize = var1.textSize or var3.Font.BaseSize * body.RelativeSize
	local text_1 = var1.text
	local font = var1.font or body.Font
	local isRepliedTo = var1.isRepliedTo
	local var4 = textService:GetTextSize(text_1, textSize, font, Vector2.new(maxValue, if isRepliedTo then textSize * 3 else 1e999))
	local var5 = if var1.isRepliedTo then var3.Theme.TextDefault.Color elseif var1.isUnfiltered and not var1.isIncoming then Color3.new(1, 1, 1) elseif var1.isIncoming then var2.Color.Content.Emphasis.Color3 else var2.Color.ActionEmphasis.Foreground.Color3
	local var6 = if fFlagAppChatEnableAutotranslationModule then reactModule.useMemo(function()
		-- upvalues: isRepliedTo (ref), textSize (ref)
		return {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(1e999, if isRepliedTo then textSize * 3 else 1e999)
		}
	end, { isRepliedTo, var1.textSize }) else nil
	local var7 = if fFlagAppChatEnableAutotranslationModule then reactModule.useMemo(function()
		-- upvalues: maxValue (ref), maxWidth (ref)
		return {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(maxValue or maxWidth, 1e999)
		}
	end, { maxValue, maxWidth }) else nil
	
	if fFlagAppChatEnableAutotranslationModule and var1.translatedText then
		local t_1 = {
			TextColor3 = var5,
			Font = font,
			TextSize = textSize,
			TextTransparency = if var1.isPending then var3.Theme.TextMuted.Transparency else 0,
			sizeConstraint = var6
		}
		
		return reactModule.createElement(chatBubbleContainerAutomaticSizeModule, {
			isIncoming = var1.isIncoming,
			hasTail = var1.hasTail,
			isPending = var1.isPending,
			isUnfiltered = var1.isUnfiltered,
			padding = {
				top = UDim.new(0, innerPadding),
				bottom = UDim.new(0, innerPadding),
				left = UDim.new(0, innerPadding + 2),
				right = UDim.new(0, innerPadding + 2)
			},
			LayoutOrder = var1.LayoutOrder,
			isRepliedTo = var1.isRepliedTo,
			isPressed = var1.isPressed,
			[reactModule.Change.AbsoluteSize] = var1[reactModule.Change.AbsoluteSize],
			isLastMessageInMessageGroup = var1.isLastMessageInMessageGroup,
			bubbleRef = var1.bubbleRef
		}, {
			Wrapper = reactModule.createElement(view, { tag = "auto-xy col gap-xsmall", sizeConstraint = var7 }, {
				textContent = reactModule.createElement(text, cryoModule.Dictionary.union(t_1, {
					LayoutOrder = 1,
					Text = text_1,
					tag = {
						["text-align-x-left text-align-y-top auto-xy text-wrap content-muted text-body-small"] = true,
						["text-truncate-end"] = isRepliedTo,
						["text-truncate-none"] = not isRepliedTo
					}
				})),
				Divider = reactModule.createElement(view, { tag = "size-0 self-stretch auto-y", LayoutOrder = 2 }, reactModule.createElement(divider, { variant = dividerVariant.Default })),
				translatedTextContent = reactModule.createElement(text, cryoModule.Dictionary.union(t_1, {
					LayoutOrder = 3,
					Text = var1.translatedText,
					tag = {
						["text-align-x-left text-align-y-top auto-xy text-wrap"] = true,
						["text-truncate-none"] = not isRepliedTo,
						["text-truncate-end"] = isRepliedTo
					}
				}))
			})
		})
	end
	return reactModule.createElement(chatBubbleContainerAutomaticSizeModule, {
		isIncoming = var1.isIncoming,
		hasTail = var1.hasTail,
		isPending = var1.isPending,
		isUnfiltered = var1.isUnfiltered,
		padding = {
			top = UDim.new(0, innerPadding),
			bottom = UDim.new(0, innerPadding),
			left = UDim.new(0, innerPadding + 2),
			right = UDim.new(0, innerPadding + 2)
		},
		LayoutOrder = var1.LayoutOrder,
		isRepliedTo = var1.isRepliedTo,
		isPressed = var1.isPressed,
		[reactModule.Change.AbsoluteSize] = var1[reactModule.Change.AbsoluteSize],
		isLastMessageInMessageGroup = var1.isLastMessageInMessageGroup,
		bubbleRef = var1.bubbleRef
	}, {
		textContent = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = text_1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = var5,
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = font,
			TextSize = textSize,
			Size = UDim2.fromOffset(math.ceil(var4.X), math.ceil(var4.Y)),
			TextTransparency = if var1.isPending then var3.Theme.TextMuted.Transparency else 0,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextTruncate = if isRepliedTo then Enum.TextTruncate.AtEnd else nil
		}, {
			SizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(maxValue or maxWidth, if isRepliedTo then textSize * 3 else 1e999)
			})
		})
	})
end

return PlainText