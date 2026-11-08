local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Types)

local function toAvatarImage(p1)
	return if p1 and p1.avatarContent then p1.avatarContent else ""
end

local function AvatarImage(Frame)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), toAvatarImage (copy), FoundationModule (copy)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(Frame.getIdentity)
	
	return ReactModule.createElement(FoundationModule.Image, {
		tag = FoundationModule.Hooks.useDefaultTags(Frame.sizeTag, "stroke-standard stroke-default radius-circle"),
		Image = ReactModule.useMemo(function()
			-- upvalues: UseSignalBindingResult (copy), toAvatarImage (upval)
			return UseSignalBindingResult:map(toAvatarImage)
		end, { UseSignalBindingResult }),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), AvatarImage (copy)
	return if Frame.visible then ReactModule.createElement(AvatarImage, {
		getIdentity = Frame.getIdentity,
		sizeTag = Frame.sizeTag,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = Frame.gutterTag or Frame.sizeTag,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end)