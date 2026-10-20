local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
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
				tag = "col align-x-left align-y-top gap-xxsmall size-full-0 auto-y",
				testId = `{TestId}-header`
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
						text = UseLocalizationFunction({
							autosaved = LocalizationStringsModule.VERSION_HISTORY_AUTOSAVED,
							previouslyPublished = LocalizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED,
							published = LocalizationStringsModule.VERSION_HISTORY_PUBLISHED,
							restore = LocalizationStringsModule.VERSION_HISTORY_RESTORE
						}).restore,
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