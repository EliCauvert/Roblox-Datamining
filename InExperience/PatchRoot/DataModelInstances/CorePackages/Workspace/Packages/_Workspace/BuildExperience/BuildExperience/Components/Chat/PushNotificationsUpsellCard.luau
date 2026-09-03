local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceDontAskAgainPushUpsellModule = require(buildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref)
	local var1 = useLocalization({
		disabledDescription = localizationStringsModule.CHAT_NOTIFICATION_DISABLED_DESCRIPTION,
		dontAskAgain = localizationStringsModule.CHAT_DONT_ASK_AGAIN,
		notNow = localizationStringsModule.CHAT_NOT_NOW,
		notifyMe = localizationStringsModule.CHAT_NOTIFY_ME,
		openSettings = localizationStringsModule.CHAT_OPEN_SETTINGS,
		promptDescription = localizationStringsModule.CHAT_NOTIFICATION_PROMPT_DESCRIPTION,
		promptTitle = localizationStringsModule.CHAT_NOTIFICATION_PROMPT_TITLE
	})
	local var2 = p1.shouldOpenSettings == true
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "PushNotificationsUpsellCard",
		LayoutOrder = p1.LayoutOrder
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = var1.promptTitle
		}),
		Description = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = if var2 then var1.disabledDescription else var1.promptDescription
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			PrimaryAction = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = if var2 then var1.openSettings else var1.notifyMe,
				size = inputSize.Small,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isLoading = p1.isRequestPending == true,
				onActivated = if var2 then p1.onOpenSettings else p1.onNotifyMe,
				testId = if var2 then "PushNotificationsUpsellCard.OpenSettings" else "PushNotificationsUpsellCard.NotifyMe"
			}),
			NotNow = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "PushNotificationsUpsellCard.NotNow",
				text = if fFlagBuildExperienceDontAskAgainPushUpsellModule then var1.dontAskAgain else var1.notNow,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				onActivated = p1.onNotNow
			})
		})
	})
end