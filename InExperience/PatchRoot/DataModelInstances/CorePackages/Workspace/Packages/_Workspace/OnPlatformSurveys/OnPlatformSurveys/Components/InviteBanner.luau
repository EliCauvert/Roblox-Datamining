local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local InlineSurveyLocalizationKeysModule = require(OnPlatformSurveys.Constants.InlineSurveyLocalizationKeys)

return ReactModule.memo(function(p1) --[[ Line: 21 | Named "InviteBanner" ]]
	-- upvalues: UseLocalizationFunction (copy), InlineSurveyLocalizationKeysModule (copy), ReactModule (copy), View (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = InlineSurveyLocalizationKeysModule.inviteTitle,
		body = InlineSurveyLocalizationKeysModule.inviteBody
	})
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium bg-surface-100",
		testId = "InlineSurveyInviteBanner",
		onActivated = p1.onAccept
	}, {
		Copy = ReactModule.createElement(View, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 1 }, {
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = UseLocalizationResult.title
			}),
			Body = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				LayoutOrder = 2,
				Text = UseLocalizationResult.body
			})
		}),
		Chevron = ReactModule.createElement(Icon, {
			LayoutOrder = 2,
			name = IconName.ChevronLargeRight,
			size = IconSize.Medium
		})
	})
end)