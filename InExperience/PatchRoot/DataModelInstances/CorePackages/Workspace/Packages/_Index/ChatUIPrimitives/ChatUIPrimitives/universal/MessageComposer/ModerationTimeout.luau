local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local countdownModule = require(script.Parent.Countdown)

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), countdownModule (ref)
	local untilTimestamp = p1.state.untilTimestamp
	
	return if p1.state.status == "loading" then reactModule.createElement(foundationModule.View, {
		tag = "row align-x-center align-y-center size-full",
		testId = "moderationTimeoutLoading",
		GroupTransparency = p1.transparency
	}, {
		Spinner = reactModule.createElement(foundationModule.Loading, { size = foundationModule.Enums.IconSize.Medium })
	}) else reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-small size-full padding-left-large padding-right-medium",
		testId = "moderationTimeout",
		GroupTransparency = p1.transparency
	}, {
		Copy = reactModule.createElement(foundationModule.Text, {
			tag = "fill auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-system-alert",
			LayoutOrder = 1,
			Text = p1.state.text or ""
		}),
		Trailing = reactModule.createElement(foundationModule.View, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 2
		}, {
			Countdown = if untilTimestamp ~= nil then nil else reactModule.createElement(countdownModule, { LayoutOrder = 1, untilTimestamp = untilTimestamp }),
			AlertIcon = reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 2,
				name = foundationModule.Enums.IconName.TriangleExclamation,
				size = foundationModule.Enums.IconSize.Medium,
				style = foundationModule.Hooks.useTokens().Color.System.Alert
			})
		})
	})
end