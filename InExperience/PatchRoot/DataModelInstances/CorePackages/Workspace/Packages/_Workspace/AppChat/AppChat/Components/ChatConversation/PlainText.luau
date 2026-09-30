local textService = game:GetService("TextService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local chatBubbleContainerModule = require(script.Parent.Bubble.ChatBubbleContainer)
local reactModule = require(parent.React)
local getTextSize = require(parent.Style).GetTextSize
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local fFlagAppChatEnableAutotranslationModule = require(appChat.Flags.FFlagAppChatEnableAutotranslation)
local fFlagAppChatBlueSentBubblesModule = require(appChat.Flags.FFlagAppChatBlueSentBubbles)
local foundationModule = require(parent.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local view = foundationModule.View
local text = foundationModule.Text
local divider = foundationModule.Divider
local dividerVariant = foundationModule.Enums.DividerVariant
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
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
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useStyle (ref), foundationFontFaceMigration (ref), getTextSize (ref), textService (ref), fFlagAppChatBlueSentBubblesModule (ref), fFlagAppChatEnableAutotranslationModule (ref), reactModule (ref), normalizeFontFace (ref), chatBubbleContainerModule (ref), view (ref), text (ref), divider (ref), dividerVariant (ref)
	local var1
	local var2 = cryoModule.Dictionary.join(t, p1)
	local var3 = useTokens()
	local var4 = useStyle()
	local maxWidth = var2.maxWidth
	local innerPadding = var2.innerPadding
	local maxValue = math.max(0, maxWidth - innerPadding)
	local body = var4.Font.Body
	local textSize = var2.textSize or var4.Font.BaseSize * body.RelativeSize
	local text_1 = var2.text
	local font = var2.font or body.Font
	local isRepliedTo = var2.isRepliedTo
	local vector2 = Vector2.new(maxValue, if isRepliedTo then textSize * 3 else 1e999)
	local var5 = if foundationFontFaceMigration then getTextSize(text_1, textSize, font, vector2, { addTemporaryPadding = false }) else textService:GetTextSize(text_1, textSize, font, vector2)
	local isRepliedTo_1 = var2.isRepliedTo
	
	if not var2.isUnfiltered then
		var1 = fFlagAppChatBlueSentBubblesModule and not var2.isIncoming
	end
	local var6 = if isRepliedTo_1 then var4.Theme.TextDefault.Color elseif var1 then Color3.new(1, 1, 1) elseif var2.isIncoming then var3.Color.Content.Emphasis.Color3 else var3.Color.ActionEmphasis.Foreground.Color3
	local var7 = if fFlagAppChatEnableAutotranslationModule then reactModule.useMemo(function()
		-- upvalues: isRepliedTo (ref), textSize (ref)
		return {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(1e999, if isRepliedTo then textSize * 3 else 1e999)
		}
	end, { isRepliedTo, var2.textSize }) else nil
	local var8 = if fFlagAppChatEnableAutotranslationModule then reactModule.useMemo(function()
		-- upvalues: maxValue (ref), maxWidth (ref)
		return {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(maxValue or maxWidth, 1e999)
		}
	end, { maxValue, maxWidth }) else nil
	
	if fFlagAppChatEnableAutotranslationModule and var2.translatedText then
		local t_1 = {
			TextColor3 = var6,
			Font = if foundationFontFaceMigration then nil else font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(font) else nil,
			TextSize = textSize,
			TextTransparency = if var2.isPending then var4.Theme.TextMuted.Transparency else 0,
			sizeConstraint = var7
		}
		
		return reactModule.createElement(chatBubbleContainerModule, {
			isIncoming = var2.isIncoming,
			hasTail = var2.hasTail,
			isPending = var2.isPending,
			isUnfiltered = var2.isUnfiltered,
			padding = {
				top = UDim.new(0, innerPadding),
				bottom = UDim.new(0, innerPadding),
				left = UDim.new(0, innerPadding + 2),
				right = UDim.new(0, innerPadding + 2)
			},
			LayoutOrder = var2.LayoutOrder,
			isRepliedTo = var2.isRepliedTo,
			isPressed = var2.isPressed,
			[reactModule.Change.AbsoluteSize] = var2[reactModule.Change.AbsoluteSize],
			isLastMessageInMessageGroup = var2.isLastMessageInMessageGroup,
			bubbleRef = var2.bubbleRef
		}, {
			Wrapper = reactModule.createElement(view, { tag = "auto-xy col gap-xsmall", sizeConstraint = var8 }, {
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
					Text = var2.translatedText,
					tag = {
						["text-align-x-left text-align-y-top auto-xy text-wrap"] = true,
						["text-truncate-none"] = not isRepliedTo,
						["text-truncate-end"] = isRepliedTo
					}
				}))
			})
		})
	end
	return reactModule.createElement(chatBubbleContainerModule, {
		isIncoming = var2.isIncoming,
		hasTail = var2.hasTail,
		isPending = var2.isPending,
		isUnfiltered = var2.isUnfiltered,
		padding = {
			top = UDim.new(0, innerPadding),
			bottom = UDim.new(0, innerPadding),
			left = UDim.new(0, innerPadding + 2),
			right = UDim.new(0, innerPadding + 2)
		},
		LayoutOrder = var2.LayoutOrder,
		isRepliedTo = var2.isRepliedTo,
		isPressed = var2.isPressed,
		[reactModule.Change.AbsoluteSize] = var2[reactModule.Change.AbsoluteSize],
		isLastMessageInMessageGroup = var2.isLastMessageInMessageGroup,
		bubbleRef = var2.bubbleRef
	}, {
		textContent = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = text_1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = var6,
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = if foundationFontFaceMigration then nil else font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(font) else nil,
			TextSize = textSize,
			Size = UDim2.fromOffset(math.ceil(var5.X), math.ceil(var5.Y)),
			TextTransparency = if var2.isPending then var4.Theme.TextMuted.Transparency else 0,
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