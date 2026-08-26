local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(script.Parent.useTimeoutBannerProps)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return if p1.shouldShow then reactModule.createElement(foundationModule.View, {
		tag = "auto-y size-full-0 padding-x-medium padding-y-small row align-x-center align-y-center gap-small",
		onActivated = p1.onBannerActivated or nil
	}, {
		WarningIcon = reactModule.createElement(foundationModule.Image, {
			tag = "content-system-warning size-600",
			Image = "icons/status/alert",
			LayoutOrder = 1
		}),
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-title-large text-wrap content-emphasis",
			LayoutOrder = 2,
			Text = p1.messageText
		})
	}) else nil
end