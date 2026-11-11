local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = "row auto-xy align-y-center gap-xsmall" }, {
		timestamp = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-body-small content-default",
			LayoutOrder = 1,
			Text = p1.timestampText
		}),
		unreadDot = if p1.hasUnreadMessages then ReactModule.createElement(FoundationModule.View, {
			tag = "size-200-200 radius-circle bg-action-emphasis",
			LayoutOrder = 2
		}) else nil
	})
end