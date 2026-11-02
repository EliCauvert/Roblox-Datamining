local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local Text = require(Parent.Foundation).Text

return function(Frame)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-default",
		Text = Frame.text,
		LayoutOrder = Frame.LayoutOrder
	})
end