local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local BubbleStyleContextModule = require(script.Parent.Parent.Parent.MessageList.Bubble.BubbleStyleContext)
local UseBubbleContentMaxWidthFunction = require(script.Parent.Parent.Parent.MessageList.Bubble.useBubbleMaxWidth).useBubbleContentMaxWidth
local _ = require(script.Parent.PlainTextTypes)

return function(Frame) --[[ Line: 19 | Named "PlainTextBubble" ]]
	-- upvalues: BubbleStyleContextModule (copy), SignalsReactModule (copy), UseBubbleContentMaxWidthFunction (copy), ReactModule (copy), FoundationModule (copy)
	local UseBubbleFontStyleResult, UseBubbleFontStyleResult2 = BubbleStyleContextModule.useBubbleFontStyle()
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(Frame.getContent)
	local UseBubbleContentMaxWidthResult = UseBubbleContentMaxWidthFunction()
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-wrap text-align-x-left text-align-y-top",
		Text = UseSignalBindingResult:map(function(p1) --[[ Line: 34 ]]
			return p1.displayText.text
		end),
		textStyle = UseBubbleFontStyleResult.textStyle,
		fontStyle = UseBubbleFontStyleResult2,
		sizeConstraint = ReactModule.useMemo(function() --[[ Line: 25 ]]
			-- upvalues: UseBubbleContentMaxWidthResult (copy)
			return {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(UseBubbleContentMaxWidthResult, 1e999)
			}
		end, { UseBubbleContentMaxWidthResult }),
		LayoutOrder = Frame.LayoutOrder
	})
end