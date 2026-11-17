local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local SizingModule = require(script.Parent.Parent.Parent.Sizing)
local UseIdentityNameStyleModule = require(script.Parent.Parent.Parent.Identity.useIdentityNameStyle)
local FlexItem = { ItemLineAlignment = Enum.ItemLineAlignment.Start }

return function(Frame)
	-- upvalues: SignalsReactModule (copy), UseIdentityNameStyleModule (copy), SizingModule (copy), FoundationModule (copy), ReactModule (copy), FlexItem (copy)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(Frame.getIdentity)
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = FoundationModule.Hooks.useDefaultTags(SizingModule.useSizing().username.tag, "auto-xy text-align-x-left"),
		flexItem = FlexItem,
		Text = UseSignalBindingResult:map(function(p1)
			return if p1 then p1.displayName else ""
		end),
		textStyle = UseIdentityNameStyleModule(UseSignalBindingResult),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end