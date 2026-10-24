local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local EmojiContentModelModule = require(script.Parent.EmojiContentModel)
local _ = require(script.Parent.EmojiTypes)

return function(Frame)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), FoundationModule (copy), EmojiContentModelModule (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left text-align-y-top",
		Text = SignalsReactModule.useSignalBinding(Frame.getContent):map(EmojiContentModelModule.getDisplayText),
		LayoutOrder = Frame.LayoutOrder
	})
end