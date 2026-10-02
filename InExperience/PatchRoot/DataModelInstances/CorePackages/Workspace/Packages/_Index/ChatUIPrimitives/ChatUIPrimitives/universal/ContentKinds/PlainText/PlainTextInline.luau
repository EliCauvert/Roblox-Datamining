local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.PlainTextTypes)

return function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		tag = "size-full-0 auto-y text-wrap text-align-x-left text-align-y-top",
		Text = signalsReactModule.useSignalBinding(p1.getContent):map(function(p2)
			return p2.displayText.text
		end),
		LayoutOrder = p1.LayoutOrder
	})
end