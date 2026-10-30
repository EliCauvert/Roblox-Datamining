local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local SizingModule = require(script.Parent.Parent.Sizing)
local FlexItem = { ItemLineAlignment = Enum.ItemLineAlignment.Start }

return function(Frame)
	-- upvalues: SignalsReactModule (copy), SizingModule (copy), FoundationModule (copy), ReactModule (copy), FlexItem (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		tag = FoundationModule.Hooks.useDefaultTags(SizingModule.useSizing().username.tag, "auto-xy text-align-x-left"),
		flexItem = FlexItem,
		Text = SignalsReactModule.useSignalBinding(Frame.getIdentity):map(function(p1)
			return if p1 then p1.displayName else ""
		end),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end