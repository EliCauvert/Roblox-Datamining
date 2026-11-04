local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local BubbleStyleContextModule = require(script.Parent.Parent.Parent.MessageList.Bubble.BubbleStyleContext)
local UseBubbleTextConstraintModule = require(script.Parent.Parent.useBubbleTextConstraint)
local EmojiContentModelModule = require(script.Parent.EmojiContentModel)
local _ = require(script.Parent.EmojiTypes)

return function(Frame)
	-- upvalues: FoundationModule (copy), BubbleStyleContextModule (copy), SignalsReactModule (copy), ReactModule (copy), UseBubbleTextConstraintModule (copy), EmojiContentModelModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-wrap text-align-x-left text-align-y-top",
		Text = SignalsReactModule.useSignalBinding(Frame.getContent):map(EmojiContentModelModule.getDisplayText),
		textStyle = BubbleStyleContextModule.useBubbleStyle().textStyle,
		fontStyle = ReactModule.useMemo(function()
			-- upvalues: UseTokensResult (copy)
			local HeadingSmall = UseTokensResult.Typography.HeadingSmall
			
			return {
				Font = HeadingSmall.Font,
				FontSize = HeadingSmall.FontSize,
				LineHeight = HeadingSmall.LineHeight
			}
		end, { UseTokensResult }),
		sizeConstraint = UseBubbleTextConstraintModule(),
		LayoutOrder = Frame.LayoutOrder
	})
end