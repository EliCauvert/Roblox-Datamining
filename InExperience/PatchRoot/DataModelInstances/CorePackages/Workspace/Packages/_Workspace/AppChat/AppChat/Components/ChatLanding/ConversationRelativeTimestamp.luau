local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function(p0) --[[ line: 12 | named "ConversationRelativeTimestamp" ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, { tag = "row auto-xy align-y-center gap-xsmall" }, {
		timestamp = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-body-small content-default",
			LayoutOrder = 1,
			Text = p0.timestampText
		}),
		unreadDot = if p0.hasUnreadMessages then reactModule.createElement(foundationModule.View, {
			tag = "size-200-200 radius-circle bg-action-emphasis",
			LayoutOrder = 2
		}) else nil
	})
end