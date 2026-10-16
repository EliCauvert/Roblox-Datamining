local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local _ = require(script.Parent.Parent.Types)

return function(Frame) --[[ Line: 17 | Named "IdentityInline" ]]
	-- upvalues: CreateNextOrderFunction (copy), SignalsReactModule (copy), ReactModule (copy), FoundationModule (copy)
	local NextOrder = CreateNextOrderFunction()
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(Frame.getIdentity)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-x-left align-y-center gap-xsmall auto-xy",
		LayoutOrder = Frame.LayoutOrder
	}, {
		avatar = ReactModule.createElement(FoundationModule.Image, {
			tag = "size-400-400 stroke-standard stroke-default radius-circle",
			Image = UseSignalBindingResult:map(function(p1) --[[ Line: 27 ]]
				return if p1 and p1.avatarContent then p1.avatarContent else ""
			end),
			LayoutOrder = NextOrder()
		}),
		displayName = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy",
			Text = UseSignalBindingResult:map(function(p1): string --[[ Line: 36 ]]
				return if p1 then `{p1.displayName}:` else ""
			end),
			LayoutOrder = NextOrder()
		})
	})
end