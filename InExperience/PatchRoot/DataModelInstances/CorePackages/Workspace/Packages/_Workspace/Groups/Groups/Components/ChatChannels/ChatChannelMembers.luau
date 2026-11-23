local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-2400 stroke-default radius-large",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "--chat-channel-members"
	})
end