local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CountdownModule = require(script.Parent.Countdown)

return function(p1) --[[ Line: 20 | Named "ModerationTimeout" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), CountdownModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UntilTimestamp = p1.state.untilTimestamp
	
	return if p1.state.status == "loading" then ReactModule.createElement(FoundationModule.View, {
		tag = "row align-x-center align-y-center size-full",
		testId = "moderationTimeoutLoading",
		GroupTransparency = p1.transparency
	}, {
		Spinner = ReactModule.createElement(FoundationModule.Loading, { size = FoundationModule.Enums.IconSize.Medium })
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-small size-full padding-left-large padding-right-medium",
		testId = "moderationTimeout",
		GroupTransparency = p1.transparency
	}, {
		Copy = ReactModule.createElement(FoundationModule.Text, {
			tag = "fill auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-system-alert",
			LayoutOrder = 1,
			Text = p1.state.text or ""
		}),
		Trailing = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 2
		}, {
			Countdown = if UntilTimestamp == nil then nil else ReactModule.createElement(CountdownModule, { LayoutOrder = 1, untilTimestamp = UntilTimestamp }),
			AlertIcon = ReactModule.createElement(FoundationModule.Icon, {
				LayoutOrder = 2,
				name = FoundationModule.Enums.IconName.TriangleExclamation,
				size = FoundationModule.Enums.IconSize.Medium,
				style = UseTokensResult.Color.System.Alert
			})
		})
	})
end