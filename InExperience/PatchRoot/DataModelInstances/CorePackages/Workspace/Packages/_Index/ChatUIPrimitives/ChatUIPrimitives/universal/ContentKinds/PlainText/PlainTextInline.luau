local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.PlainTextTypes)

return function(Frame)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "size-full-0 auto-y text-wrap text-align-x-left text-align-y-top",
		Text = SignalsReactModule.useSignalBinding(Frame.getContent):map(function(p1)
			return p1.displayText.text
		end),
		LayoutOrder = Frame.LayoutOrder
	})
end