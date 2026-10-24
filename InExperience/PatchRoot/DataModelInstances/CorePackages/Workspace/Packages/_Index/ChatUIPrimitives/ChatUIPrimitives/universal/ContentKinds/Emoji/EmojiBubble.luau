local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local BubbleStyleContextModule = require(script.Parent.Parent.Parent.MessageList.Bubble.BubbleStyleContext)
local UseBubbleContentMaxWidthFunction = require(script.Parent.Parent.Parent.MessageList.Bubble.useBubbleMaxWidth).useBubbleContentMaxWidth
local EmojiContentModelModule = require(script.Parent.EmojiContentModel)
local _ = require(script.Parent.EmojiTypes)

return function(Frame)
	-- upvalues: FoundationModule (copy), BubbleStyleContextModule (copy), SignalsReactModule (copy), ReactModule (copy), UseBubbleContentMaxWidthFunction (copy), EmojiContentModelModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseBubbleStyleResult = BubbleStyleContextModule.useBubbleStyle()
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(Frame.getContent)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy)
		local HeadingSmall = UseTokensResult.Typography.HeadingSmall
		
		return {
			Font = HeadingSmall.Font,
			FontSize = HeadingSmall.FontSize,
			LineHeight = HeadingSmall.LineHeight
		}
	end, { UseTokensResult })
	local UseBubbleContentMaxWidthResult = UseBubbleContentMaxWidthFunction()
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-wrap text-align-x-left text-align-y-top",
		Text = UseSignalBindingResult:map(EmojiContentModelModule.getDisplayText),
		textStyle = UseBubbleStyleResult.textStyle,
		fontStyle = UseMemoResult,
		sizeConstraint = ReactModule.useMemo(function()
			-- upvalues: UseBubbleContentMaxWidthResult (copy)
			return {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(UseBubbleContentMaxWidthResult, 1e999)
			}
		end, { UseBubbleContentMaxWidthResult }),
		LayoutOrder = Frame.LayoutOrder
	})
end