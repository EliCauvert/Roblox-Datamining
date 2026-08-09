local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local badge = foundationModule.Badge
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeShape = foundationModule.Enums.BadgeShape
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 29 | named "VersionHistoryCard" ]]
	-- upvalues: reactModule (ref), view (ref), text (ref), badge (ref), badgeShape (ref), badgeVariant (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local testId = p0.testId or "version-history-card"
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y stroke-standard stroke-default radius-large clip bg-surface-100",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col size-full-0 auto-y padding-x-large padding-bottom-large padding-top-medium"
		}, {
			Header = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col gap-xxsmall size-full-0 auto-y"
			}, {
				Version = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-xxsmall text-caption-large text-align-x-left content-default",
					Text = p0.versionLabel
				}),
				TitleRow = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small size-full-0 auto-y"
				}, {
					Title = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "auto-xy text-title-medium text-align-x-left text-truncate-end content-emphasis",
						Text = p0.title
					}),
					Badge = if p0.badgeText then reactModule.createElement(badge, {
						LayoutOrder = 2,
						text = p0.badgeText,
						shape = badgeShape.Box,
						variant = badgeVariant.Neutral
					}) else nil
				})
			}),
			Slot = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col gap-large size-full-0 auto-y"
			}, {
				Description = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis",
					Text = p0.description,
					testId = `{testId}-description`
				}),
				RestoreRow = reactModule.createElement(view, { tag = "row size-full-0 auto-y", LayoutOrder = 2 }, {
					Restore = reactModule.createElement(button, {
						text = "Restore",
						size = inputSize.Small,
						variant = buttonVariant.Standard,
						fillBehavior = fillBehavior.Fill,
						isDisabled = p0.isRestoreDisabled,
						onActivated = reactModule.useCallback(function() --[[ line: 31 ]]
							-- upvalues: p0 (ref)
							p0.onRestore()
						end, { p0.onRestore }),
						testId = `{testId}-restore`
					})
				})
			})
		})
	})
end