local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), button (ref), iconName (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local testId = p1.testId or "LatestVersionCardView"
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y padding-x-large padding-bottom-large padding-top-medium radius-large clip bg-shift-200",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y",
			testId = `{testId}-content`
		}, {
			Eyebrow = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col align-x-left align-y-top gap-xxsmall size-full-0 auto-y",
				testId = `{testId}-eyebrow`
			}, {
				Version = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-caption-medium text-align-x-left content-muted",
					Text = p1.versionLabel,
					testId = `{testId}-version`
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
					Text = p1.title,
					testId = `{testId}-title`
				})
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis",
				Text = p1.description,
				testId = `{testId}-description`
			})
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y",
			testId = `{testId}-actions`
		}, {
			Playtest = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = p1.playtestText,
				icon = iconName.PlaySmall,
				size = inputSize.Small,
				variant = buttonVariant.SoftEmphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p1.isPlaytestDisabled,
				onActivated = p1.onPlaytestActivated,
				testId = `{testId}-playtest`
			}),
			Publish = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = p1.publishText,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p1.isPublishDisabled,
				onActivated = p1.onPublishActivated,
				testId = `{testId}-publish`
			})
		})
	})
end