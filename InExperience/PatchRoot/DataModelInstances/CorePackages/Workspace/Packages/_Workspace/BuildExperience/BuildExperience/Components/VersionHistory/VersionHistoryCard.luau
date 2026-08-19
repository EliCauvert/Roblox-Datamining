local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local badge = foundationModule.Badge
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeShape = foundationModule.Enums.BadgeShape
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

local function _(p0, p1, p2, p3) --[[ line: 33 | named "localizeBadgeText" ]]
	-- upvalues: localizationStringsModule (ref)
	return if p0 == localizationStringsModule.VERSION_HISTORY_AUTOSAVED then p1 elseif p0 == localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED then p2 elseif p0 == localizationStringsModule.VERSION_HISTORY_PUBLISHED then p3 else p0
end

return function(p4) --[[ line: 49 | named "VersionHistoryCard" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), badge (ref), badgeShape (ref), badgeVariant (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local badgeText
	local testId = p4.testId or "version-history-card"
	local var6 = if fFlagBuildLocalization then useLocalization({
		autosaved = localizationStringsModule.VERSION_HISTORY_AUTOSAVED,
		previouslyPublished = localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED,
		published = localizationStringsModule.VERSION_HISTORY_PUBLISHED,
		restore = localizationStringsModule.VERSION_HISTORY_RESTORE
	}) else nil
	local var7 = if fFlagBuildLocalization then var6.restore else localizationStringsModule.VERSION_HISTORY_RESTORE
	
	if fFlagBuildLocalization then
		local badgeText_1 = p4.badgeText
		badgeText = if badgeText_1 == localizationStringsModule.VERSION_HISTORY_AUTOSAVED then var6.autosaved elseif badgeText_1 == localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED then var6.previouslyPublished elseif badgeText_1 == localizationStringsModule.VERSION_HISTORY_PUBLISHED then var6.published else badgeText_1
	else
		badgeText = p4.badgeText
	end
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y stroke-standard stroke-default radius-large clip bg-surface-100",
		LayoutOrder = p4.layoutOrder,
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
					Text = p4.versionLabel
				}),
				TitleRow = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center gap-small size-full-0 auto-y"
				}, {
					Title = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "shrink auto-xy text-title-medium text-wrap text-align-x-left text-truncate-none content-emphasis",
						Text = p4.title
					}),
					Badge = if badgeText then reactModule.createElement(badge, {
						LayoutOrder = 2,
						text = badgeText,
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
					Text = p4.description,
					testId = `{testId}-description`
				}),
				RestoreRow = reactModule.createElement(view, { tag = "row size-full-0 auto-y", LayoutOrder = 2 }, {
					Restore = reactModule.createElement(button, {
						text = var7,
						size = inputSize.Small,
						variant = buttonVariant.Standard,
						fillBehavior = fillBehavior.Fill,
						isDisabled = p4.isRestoreDisabled,
						onActivated = reactModule.useCallback(function() --[[ line: 68 ]]
							-- upvalues: p4 (ref)
							p4.onRestore()
						end, { p4.onRestore }),
						testId = `{testId}-restore`
					})
				})
			})
		})
	})
end