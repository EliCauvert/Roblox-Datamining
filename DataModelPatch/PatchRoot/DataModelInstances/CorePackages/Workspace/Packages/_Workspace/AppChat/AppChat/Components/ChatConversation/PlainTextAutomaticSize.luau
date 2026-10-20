local TextService = game:GetService("TextService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ChatBubbleContainerAutomaticSizeModule = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize)
local ReactModule = require(Parent.React)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local CryoModule = require(Parent.Cryo)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FFlagAppChatEnableAutotranslationModule = require(AppChat.Flags.FFlagAppChatEnableAutotranslation)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Divider = FoundationModule.Divider
local DividerVariant = FoundationModule.Enums.DividerVariant
local config = {
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
	[ReactModule.Change.AbsoluteSize] = function() end
}

function PlainText(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), UseStyleFunction (copy), TextService (copy), FFlagAppChatEnableAutotranslationModule (copy), ReactModule (copy), ChatBubbleContainerAutomaticSizeModule (copy), View (copy), Text (copy), Divider (copy), DividerVariant (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTokensResult = UseTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local MaxWidth: number = JoinResult.maxWidth
	local InnerPadding: number = JoinResult.innerPadding
	local Largest = math.max(0, MaxWidth - InnerPadding)
	local Body = UseStyleResult.Font.Body
	local TextSize = JoinResult.textSize or UseStyleResult.Font.BaseSize * Body.RelativeSize
	local Text1 = JoinResult.text
	local _Font = JoinResult.font or Body.Font
	local IsRepliedTo = JoinResult.isRepliedTo
	local TextSize1 = TextService:GetTextSize(Text1, TextSize, _Font, (Vector2.new(Largest, if IsRepliedTo then TextSize * 3 else 1e999)))
	local IsRepliedTo1 = JoinResult.isRepliedTo
	local NoIsIncoming: boolean = JoinResult.isUnfiltered and not JoinResult.isIncoming
	local Color = if IsRepliedTo1 then UseStyleResult.Theme.TextDefault.Color elseif NoIsIncoming then Color3.new(1, 1, 1) elseif JoinResult.isIncoming then UseTokensResult.Color.Content.Emphasis.Color3 else UseTokensResult.Color.ActionEmphasis.Foreground.Color3
	local UseMemoResult = if FFlagAppChatEnableAutotranslationModule then ReactModule.useMemo(function()
		-- upvalues: IsRepliedTo (copy), TextSize (copy)
		return {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(1e999, if IsRepliedTo then TextSize * 3 else 1e999)
		}
	end, { IsRepliedTo, JoinResult.textSize }) else nil
	local UseMemoResult1 = if FFlagAppChatEnableAutotranslationModule then ReactModule.useMemo(function()
		-- upvalues: Largest (copy), MaxWidth (copy)
		return {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(Largest or MaxWidth, 1e999)
		}
	end, { Largest, MaxWidth }) else nil
	
	if FFlagAppChatEnableAutotranslationModule and JoinResult.translatedText then
		local config1 = {
			TextColor3 = Color,
			Font = _Font,
			TextSize = TextSize,
			TextTransparency = JoinResult.isPending and UseStyleResult.Theme.TextMuted.Transparency or 0,
			sizeConstraint = UseMemoResult
		}
		
		return ReactModule.createElement(ChatBubbleContainerAutomaticSizeModule, {
			isIncoming = JoinResult.isIncoming,
			hasTail = JoinResult.hasTail,
			isPending = JoinResult.isPending,
			isUnfiltered = JoinResult.isUnfiltered,
			padding = {
				top = UDim.new(0, InnerPadding),
				bottom = UDim.new(0, InnerPadding),
				left = UDim.new(0, InnerPadding + 2),
				right = UDim.new(0, InnerPadding + 2)
			},
			LayoutOrder = JoinResult.LayoutOrder,
			isRepliedTo = JoinResult.isRepliedTo,
			isPressed = JoinResult.isPressed,
			[ReactModule.Change.AbsoluteSize] = JoinResult[ReactModule.Change.AbsoluteSize],
			isLastMessageInMessageGroup = JoinResult.isLastMessageInMessageGroup
		}, {
			Wrapper = ReactModule.createElement(View, {
				tag = "auto-xy col gap-xsmall",
				sizeConstraint = UseMemoResult1
			}, {
				textContent = ReactModule.createElement(Text, CryoModule.Dictionary.union(config1, {
					LayoutOrder = 1,
					Text = Text1,
					tag = {
						["text-align-x-left text-align-y-top auto-xy text-wrap content-muted text-body-small"] = true,
						["text-truncate-end"] = IsRepliedTo,
						["text-truncate-none"] = not IsRepliedTo
					}
				})),
				Divider = ReactModule.createElement(View, { tag = "size-0 self-stretch auto-y", LayoutOrder = 2 }, ReactModule.createElement(Divider, { variant = DividerVariant.Default })),
				translatedTextContent = ReactModule.createElement(Text, CryoModule.Dictionary.union(config1, {
					LayoutOrder = 3,
					Text = JoinResult.translatedText,
					tag = {
						["text-align-x-left text-align-y-top auto-xy text-wrap"] = true,
						["text-truncate-none"] = not IsRepliedTo,
						["text-truncate-end"] = IsRepliedTo
					}
				}))
			})
		})
	else
		return ReactModule.createElement(ChatBubbleContainerAutomaticSizeModule, {
			isIncoming = JoinResult.isIncoming,
			hasTail = JoinResult.hasTail,
			isPending = JoinResult.isPending,
			isUnfiltered = JoinResult.isUnfiltered,
			padding = {
				top = UDim.new(0, InnerPadding),
				bottom = UDim.new(0, InnerPadding),
				left = UDim.new(0, InnerPadding + 2),
				right = UDim.new(0, InnerPadding + 2)
			},
			LayoutOrder = JoinResult.LayoutOrder,
			isRepliedTo = JoinResult.isRepliedTo,
			isPressed = JoinResult.isPressed,
			[ReactModule.Change.AbsoluteSize] = JoinResult[ReactModule.Change.AbsoluteSize],
			isLastMessageInMessageGroup = JoinResult.isLastMessageInMessageGroup
		}, {
			textContent = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = Text1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Color,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = _Font,
				TextSize = TextSize,
				Size = UDim2.fromOffset(math.ceil(TextSize1.X), (math.ceil(TextSize1.Y))),
				TextTransparency = JoinResult.isPending and UseStyleResult.Theme.TextMuted.Transparency or 0,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextTruncate = if IsRepliedTo then Enum.TextTruncate.AtEnd else nil
			}, {
				SizeConstraint = ReactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(Largest or MaxWidth, if IsRepliedTo then TextSize * 3 else 1e999)
				})
			})
		})
	end
end

return PlainText