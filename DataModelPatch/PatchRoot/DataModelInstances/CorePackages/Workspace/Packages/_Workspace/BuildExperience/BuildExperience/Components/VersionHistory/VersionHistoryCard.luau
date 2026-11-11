local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Badge = FoundationModule.Badge
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local BadgeShape = FoundationModule.Enums.BadgeShape
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Badge (copy), BadgeShape (copy), BadgeVariant (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local TestId = p1.testId or "version-history-card"
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y stroke-standard stroke-default radius-large clip bg-surface-100",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Content = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col size-full-0 auto-y padding-x-large padding-bottom-large padding-top-medium"
		}, {
			Header = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col gap-xxsmall size-full-0 auto-y"
			}, {
				Version = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-xxsmall text-caption-large text-align-x-left content-default",
					Text = p1.versionLabel
				}),
				TitleRow = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small size-full-0 auto-y"
				}, {
					Title = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "shrink auto-xy text-title-medium text-wrap text-align-x-left text-truncate-none content-emphasis",
						Text = p1.title
					}),
					Badge = if p1.badgeText then ReactModule.createElement(Badge, {
						LayoutOrder = 2,
						text = p1.badgeText,
						shape = BadgeShape.Box,
						variant = BadgeVariant.Neutral
					}) else nil
				})
			}),
			Slot = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col gap-large size-full-0 auto-y"
			}, {
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis",
					Text = p1.description,
					testId = `{TestId}-description`
				}),
				RestoreRow = ReactModule.createElement(View, { tag = "row size-full-0 auto-y", LayoutOrder = 2 }, {
					Restore = ReactModule.createElement(Button, {
						text = "Restore",
						size = InputSize.Small,
						variant = ButtonVariant.Standard,
						fillBehavior = FillBehavior.Fill,
						isDisabled = p1.isRestoreDisabled,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: p1 (copy)
							p1.onRestore()
						end, { p1.onRestore }),
						testId = `{TestId}-restore`
					})
				})
			})
		})
	})
end