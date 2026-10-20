local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Button (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local TestId = p1.testId or "LatestVersionCardView"
	
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y padding-x-large padding-bottom-large padding-top-medium radius-large clip bg-shift-200",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Content = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y",
			testId = `{TestId}-content`
		}, {
			Eyebrow = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col align-x-left align-y-top gap-xxsmall size-full-0 auto-y",
				testId = `{TestId}-eyebrow`
			}, {
				Version = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-caption-medium text-align-x-left content-muted",
					Text = p1.versionLabel,
					testId = `{TestId}-version`
				}),
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
					Text = p1.title,
					testId = `{TestId}-title`
				})
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis",
				Text = p1.description,
				testId = `{TestId}-description`
			})
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y",
			testId = `{TestId}-actions`
		}, {
			Playtest = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = p1.playtestText,
				icon = IconName.PlaySmall,
				size = InputSize.Small,
				variant = ButtonVariant.SoftEmphasis,
				fillBehavior = FillBehavior.Fill,
				isDisabled = p1.isPlaytestDisabled,
				onActivated = p1.onPlaytestActivated,
				testId = `{TestId}-playtest`
			}),
			Publish = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = p1.publishText,
				size = InputSize.Small,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				isDisabled = p1.isPublishDisabled,
				onActivated = p1.onPublishActivated,
				testId = `{TestId}-publish`
			})
		})
	})
end