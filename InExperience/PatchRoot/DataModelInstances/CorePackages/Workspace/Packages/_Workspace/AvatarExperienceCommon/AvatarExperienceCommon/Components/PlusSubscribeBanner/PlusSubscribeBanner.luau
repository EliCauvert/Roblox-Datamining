local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local testId = p0.testId or "PlusSubscribeBanner"
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium",
		LayoutOrder = p0.LayoutOrder,
		testId = testId
	}, {
		Content = reactModule.createElement(view, {
			tag = "row flex-between align-y-center gap-small size-full-0 auto-y"
		}, {
			Leading = reactModule.createElement(view, {
				tag = "row align-y-center fill gap-small auto-xy",
				LayoutOrder = 1
			}, {
				PlusIcon = if p0.showPlusIcon then reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = iconName.RobloxPlus,
					size = iconSize.Medium,
					style = useTokens().Color.Content.Emphasis,
					testId = `{testId}PlusIcon`
				}) else nil,
				Message = reactModule.createElement(text, {
					tag = "fill text-body-small text-align-x-left content-emphasis",
					LayoutOrder = 2,
					Text = p0.message
				})
			}),
			Subscribe = reactModule.createElement(view, {
				tag = "auto-xy",
				LayoutOrder = 2,
				onActivated = p0.onActivated,
				testId = `{testId}Action`
			}, {
				Label = reactModule.createElement(text, {
					tag = "auto-xy text-body-small content-default",
					RichText = true,
					Text = `<u>{p0.actionText}</u>`
				})
			})
		})
	})
end)