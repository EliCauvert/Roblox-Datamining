local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local BubbleStyleContextModule = require(script.Parent.Parent.Parent.MessageList.Bubble.BubbleStyleContext)
local SizingModule = require(script.Parent.Parent.Parent.MessageList.Sizing)
local _ = require(script.Parent.PlainTextTypes)

return function(Frame)
	-- upvalues: BubbleStyleContextModule (copy), SignalsReactModule (copy), SizingModule (copy), ReactModule (copy), FoundationModule (copy)
	local UseBubbleFontStyleResult, UseBubbleFontStyleResult2 = BubbleStyleContextModule.useBubbleFontStyle()
	local ContentMaxWidth = SizingModule.useSizing().bubble.contentMaxWidth
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-wrap text-align-x-left text-align-y-top",
		Text = SignalsReactModule.useSignalBinding(Frame.getContent):map(function(p1)
			return p1.displayText.text
		end),
		textStyle = UseBubbleFontStyleResult.textStyle,
		fontStyle = UseBubbleFontStyleResult2,
		sizeConstraint = ReactModule.useMemo(function()
			-- upvalues: ContentMaxWidth (copy)
			return {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(ContentMaxWidth, 1e999)
			}
		end, { ContentMaxWidth }),
		LayoutOrder = Frame.LayoutOrder
	})
end