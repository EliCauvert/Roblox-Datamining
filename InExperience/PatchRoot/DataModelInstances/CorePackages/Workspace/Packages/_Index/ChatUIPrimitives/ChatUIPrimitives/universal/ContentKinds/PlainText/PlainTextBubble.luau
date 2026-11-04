local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local BubbleStyleContextModule = require(script.Parent.Parent.Parent.MessageList.Bubble.BubbleStyleContext)
local UseBubbleTextConstraintModule = require(script.Parent.Parent.useBubbleTextConstraint)
local _ = require(script.Parent.PlainTextTypes)

return function(Frame)
	-- upvalues: BubbleStyleContextModule (copy), SignalsReactModule (copy), UseBubbleTextConstraintModule (copy), ReactModule (copy), FoundationModule (copy)
	local UseBubbleFontStyleResult, UseBubbleFontStyleResult2 = BubbleStyleContextModule.useBubbleFontStyle()
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-wrap text-align-x-left text-align-y-top",
		Text = SignalsReactModule.useSignalBinding(Frame.getContent):map(function(p1)
			return p1.displayText.text
		end),
		textStyle = UseBubbleFontStyleResult.textStyle,
		fontStyle = UseBubbleFontStyleResult2,
		sizeConstraint = UseBubbleTextConstraintModule(),
		LayoutOrder = Frame.LayoutOrder
	})
end