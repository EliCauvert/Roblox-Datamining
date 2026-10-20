local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(script.Parent.useTimeoutBannerProps)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return if p1.shouldShow then ReactModule.createElement(FoundationModule.View, {
		tag = "auto-y size-full-0 padding-x-medium padding-y-small row align-x-center align-y-center gap-small",
		onActivated = p1.onBannerActivated or nil
	}, {
		WarningIcon = ReactModule.createElement(FoundationModule.Image, {
			tag = "content-system-warning size-600",
			Image = "icons/status/alert",
			LayoutOrder = 1
		}),
		Text = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-title-large text-wrap content-emphasis",
			LayoutOrder = 2,
			Text = p1.messageText
		})
	}) else nil
end