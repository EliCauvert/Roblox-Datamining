local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local testId = p1.testId or "version-history-card"
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y stroke-standard stroke-default radius-large clip bg-surface-100",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col size-full-0 auto-y padding-x-large padding-bottom-large padding-top-medium"
		}, {
			Header = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col align-x-left align-y-top gap-xxsmall size-full-0 auto-y",
				testId = `{testId}-header`
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
			Slot = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col gap-large size-full-0 auto-y"
			}, {
				Description = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis",
					Text = p1.description,
					testId = `{testId}-description`
				}),
				RestoreRow = reactModule.createElement(view, { tag = "row size-full-0 auto-y", LayoutOrder = 2 }, {
					Restore = reactModule.createElement(button, {
						text = useLocalization({
							autosaved = localizationStringsModule.VERSION_HISTORY_AUTOSAVED,
							previouslyPublished = localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED,
							published = localizationStringsModule.VERSION_HISTORY_PUBLISHED,
							restore = localizationStringsModule.VERSION_HISTORY_RESTORE
						}).restore,
						size = inputSize.Small,
						variant = buttonVariant.Standard,
						fillBehavior = fillBehavior.Fill,
						isDisabled = p1.isRestoreDisabled,
						onActivated = reactModule.useCallback(function()
							-- upvalues: p1 (ref)
							p1.onRestore()
						end, { p1.onRestore }),
						testId = `{testId}-restore`
					})
				})
			})
		})
	})
end