local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local text = foundationModule.Text
local view = foundationModule.View
local inlineSurveyLocalizationKeysModule = require(onPlatformSurveys.Constants.InlineSurveyLocalizationKeys)

return reactModule.memo(function(p0)
	-- upvalues: useLocalization (ref), inlineSurveyLocalizationKeysModule (ref), reactModule (ref), view (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	local var4 = useLocalization({
		title = inlineSurveyLocalizationKeysModule.inviteTitle,
		body = inlineSurveyLocalizationKeysModule.inviteBody
	})
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium bg-surface-100",
		testId = "InlineSurveyInviteBanner",
		onActivated = p0.onAccept
	}, {
		Copy = reactModule.createElement(view, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 1 }, {
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = var4.title
			}),
			Body = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				LayoutOrder = 2,
				Text = var4.body
			})
		}),
		Chevron = reactModule.createElement(icon, {
			LayoutOrder = 2,
			name = iconName.ChevronLargeRight,
			size = iconSize.Medium
		})
	})
end)