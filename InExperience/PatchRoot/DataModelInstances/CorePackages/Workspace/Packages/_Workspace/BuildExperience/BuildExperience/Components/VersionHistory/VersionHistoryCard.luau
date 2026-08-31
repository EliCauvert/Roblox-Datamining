local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildVersionHistoryUpdatesModule = require(buildExperience.Flags.FFlagBuildVersionHistoryUpdates)
local badge = foundationModule.Badge
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeShape = foundationModule.Enums.BadgeShape
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

local function _(p1, p2, p3, p4)
	-- upvalues: localizationStringsModule (ref)
	return if p1 == localizationStringsModule.VERSION_HISTORY_AUTOSAVED then p2 elseif p1 == localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED then p3 elseif p1 == localizationStringsModule.VERSION_HISTORY_PUBLISHED then p4 else p1
end

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fFlagBuildVersionHistoryUpdatesModule (ref), badge (ref), badgeShape (ref), badgeVariant (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local testId = p1.testId or "version-history-card"
	local var1 = if fFlagBuildLocalization then useLocalization({
		autosaved = localizationStringsModule.VERSION_HISTORY_AUTOSAVED,
		previouslyPublished = localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED,
		published = localizationStringsModule.VERSION_HISTORY_PUBLISHED,
		restore = localizationStringsModule.VERSION_HISTORY_RESTORE
	}) else nil
	local var2 = if fFlagBuildLocalization then var1.restore else localizationStringsModule.VERSION_HISTORY_RESTORE
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onRestore()
	end, { p1.onRestore })
	local var4 = nil
	
	if not fFlagBuildVersionHistoryUpdatesModule then
		local var5
		if fFlagBuildLocalization then
			local badgeText = p1.badgeText
			var5 = if badgeText == localizationStringsModule.VERSION_HISTORY_AUTOSAVED then var1.autosaved elseif badgeText == localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED then var1.previouslyPublished elseif badgeText == localizationStringsModule.VERSION_HISTORY_PUBLISHED then var1.published else badgeText
		else
			var5 = p1.badgeText
		end
		var4 = if var5 then reactModule.createElement(badge, {
			LayoutOrder = 2,
			text = var5,
			shape = badgeShape.Box,
			variant = badgeVariant.Neutral
		}) else nil
	end
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y stroke-standard stroke-default radius-large clip bg-surface-100",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col size-full-0 auto-y padding-x-large padding-bottom-large padding-top-medium"
		}, {
			Header = if fFlagBuildVersionHistoryUpdatesModule then reactModule.createElement(view, {
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
			}) else reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col gap-xxsmall size-full-0 auto-y"
			}, {
				Version = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-xxsmall text-caption-large text-align-x-left content-default",
					Text = p1.versionLabel
				}),
				TitleRow = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small size-full-0 auto-y"
				}, {
					Title = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "shrink auto-xy text-title-medium text-wrap text-align-x-left text-truncate-none content-emphasis",
						Text = p1.title
					}),
					Badge = var4
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
						text = var2,
						size = inputSize.Small,
						variant = buttonVariant.Standard,
						fillBehavior = fillBehavior.Fill,
						isDisabled = p1.isRestoreDisabled,
						onActivated = var3,
						testId = `{testId}-restore`
					})
				})
			})
		})
	})
end