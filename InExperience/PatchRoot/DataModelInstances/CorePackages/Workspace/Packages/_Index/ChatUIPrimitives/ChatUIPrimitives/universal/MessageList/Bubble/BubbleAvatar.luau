local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local SizingModule = require(script.Parent.Parent.Sizing)

return function(Frame: Frame)
	-- upvalues: SignalsReactModule (copy), SizingModule (copy), FoundationModule (copy), ReactModule (copy)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(Frame.getIdentity)
	local Tag = SizingModule.useSizing().avatar.tag
	local StrokeStandardStrokeDefaultRadiusCircle = FoundationModule.Hooks.useDefaultTags(Tag, "stroke-standard stroke-default radius-circle")
	
	return if Frame.visible then ReactModule.createElement(FoundationModule.Image, {
		tag = StrokeStandardStrokeDefaultRadiusCircle,
		Image = UseSignalBindingResult:map(function(p1)
			return if p1 and p1.avatarContent then p1.avatarContent else ""
		end),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = Tag,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end