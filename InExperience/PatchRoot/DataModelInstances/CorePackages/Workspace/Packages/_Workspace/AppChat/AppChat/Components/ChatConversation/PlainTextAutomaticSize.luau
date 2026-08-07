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
	[reactModule.Change.AbsoluteSize] = function() --[[ line: 51 ]] end
}

function PlainText(p0) --[[ line: 58 ]]
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useStyle (ref), textService (ref), fFlagAppChatEnableAutotranslationModule (ref), reactModule (ref), chatBubbleContainerAutomaticSizeModule (ref), view (ref), text (ref), divider (ref), dividerVariant (ref)
	local var8 = cryoModule.Dictionary.join(t, p0)
	local var9 = useTokens()
	local var10 = useStyle()
	local maxWidth = var8.maxWidth
	local innerPadding = var8.innerPadding
	local maxValue = math.max(0, maxWidth - innerPadding)
	local body = var10.Font.Body
	local textSize = var8.textSize or var10.Font.BaseSize * body.RelativeSize
	local text_1 = var8.text
	local font = var8.font or body.Font
	local isRepliedTo = var8.isRepliedTo
	local var14 = textService:GetTextSize(text_1, textSize, font, Vector2.new(maxValue, if isRepliedTo then textSize * 3 else 1e999))
	local var15 = if var8.isRepliedTo then var10.Theme.TextDefault.Color elseif var8.isUnfiltered and not var8.isIncoming then Color3.new(1, 1, 1) elseif var8.isIncoming then var9.Color.Content.Emphasis.Color3 else var9.Color.ActionEmphasis.Foreground.Color3
	local var16 = if fFlagAppChatEnableAutotranslationModule then reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: isRepliedTo (ref), textSize (ref)
		return {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(1e999, if isRepliedTo then textSize * 3 else 1e999)
		}
	end, { isRepliedTo, var8.textSize }) else nil
	local var17 = if fFlagAppChatEnableAutotranslationModule then reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: maxValue (ref), maxWidth (ref)
		return {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(maxValue or maxWidth, 1e999)
		}
	end, { maxValue, maxWidth }) else nil
	
	if fFlagAppChatEnableAutotranslationModule and var8.translatedText then
		local t_1 = {
			TextColor3 = var15,
			Font = font,
			TextSize = textSize,
			TextTransparency = if var8.isPending then var10.Theme.TextMuted.Transparency else 0,
			sizeConstraint = var16
		}
		
		return reactModule.createElement(chatBubbleContainerAutomaticSizeModule, {
			isIncoming = var8.isIncoming,
			hasTail = var8.hasTail,
			isPending = var8.isPending,
			isUnfiltered = var8.isUnfiltered,
			padding = {
				top = UDim.new(0, innerPadding),
				bottom = UDim.new(0, innerPadding),
				left = UDim.new(0, innerPadding + 2),
				right = UDim.new(0, innerPadding + 2)
			},
			LayoutOrder = var8.LayoutOrder,
			isRepliedTo = var8.isRepliedTo,
			isPressed = var8.isPressed,
			[reactModule.Change.AbsoluteSize] = var8[reactModule.Change.AbsoluteSize],
			isLastMessageInMessageGroup = var8.isLastMessageInMessageGroup
		}, {
			Wrapper = reactModule.createElement(view, { tag = "auto-xy col gap-xsmall", sizeConstraint = var17 }, {
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
					Text = var8.translatedText,
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
		isIncoming = var8.isIncoming,
		hasTail = var8.hasTail,
		isPending = var8.isPending,
		isUnfiltered = var8.isUnfiltered,
		padding = {
			top = UDim.new(0, innerPadding),
			bottom = UDim.new(0, innerPadding),
			left = UDim.new(0, innerPadding + 2),
			right = UDim.new(0, innerPadding + 2)
		},
		LayoutOrder = var8.LayoutOrder,
		isRepliedTo = var8.isRepliedTo,
		isPressed = var8.isPressed,
		[reactModule.Change.AbsoluteSize] = var8[reactModule.Change.AbsoluteSize],
		isLastMessageInMessageGroup = var8.isLastMessageInMessageGroup
	}, {
		textContent = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = text_1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = var15,
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = font,
			TextSize = textSize,
			Size = UDim2.fromOffset(math.ceil(var14.X), math.ceil(var14.Y)),
			TextTransparency = if var8.isPending then var10.Theme.TextMuted.Transparency else 0,
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