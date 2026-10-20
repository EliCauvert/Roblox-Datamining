local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)

return function(Frame: Frame)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), FoundationModule (copy)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(Frame.getIdentity)
	
	return if Frame.visible then ReactModule.createElement(FoundationModule.Image, {
		tag = "size-400-400 stroke-standard stroke-default radius-circle",
		Image = UseSignalBindingResult:map(function(p1)
			return if p1 and p1.avatarContent then p1.avatarContent else ""
		end),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = "size-400-400",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end