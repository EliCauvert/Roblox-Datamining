local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceDontAskAgainPushUpsellModule = require(buildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p0)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref)
	local var6 = if fFlagBuildLocalization then useLocalization({
		disabledDescription = localizationStringsModule.CHAT_NOTIFICATION_DISABLED_DESCRIPTION,
		dontAskAgain = localizationStringsModule.CHAT_DONT_ASK_AGAIN,
		notNow = localizationStringsModule.CHAT_NOT_NOW,
		notifyMe = localizationStringsModule.CHAT_NOTIFY_ME,
		openSettings = localizationStringsModule.CHAT_OPEN_SETTINGS,
		promptDescription = localizationStringsModule.CHAT_NOTIFICATION_PROMPT_DESCRIPTION,
		promptTitle = localizationStringsModule.CHAT_NOTIFICATION_PROMPT_TITLE
	}) else nil
	local var7 = p0.shouldOpenSettings == true
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "PushNotificationsUpsellCard",
		LayoutOrder = p0.LayoutOrder
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = if fFlagBuildLocalization then var6.promptTitle else localizationStringsModule.CHAT_NOTIFICATION_PROMPT_TITLE
		}),
		Description = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = if var7 then if fFlagBuildLocalization then var6.disabledDescription else localizationStringsModule.CHAT_NOTIFICATION_DISABLED_DESCRIPTION elseif fFlagBuildLocalization then var6.promptDescription else localizationStringsModule.CHAT_NOTIFICATION_PROMPT_DESCRIPTION
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			PrimaryAction = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = if var7 then if fFlagBuildLocalization then var6.openSettings else localizationStringsModule.CHAT_OPEN_SETTINGS elseif fFlagBuildLocalization then var6.notifyMe else localizationStringsModule.CHAT_NOTIFY_ME,
				size = inputSize.Small,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isLoading = p0.isRequestPending == true,
				onActivated = if var7 then p0.onOpenSettings else p0.onNotifyMe,
				testId = if var7 then "PushNotificationsUpsellCard.OpenSettings" else "PushNotificationsUpsellCard.NotifyMe"
			}),
			NotNow = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "PushNotificationsUpsellCard.NotNow",
				text = if fFlagBuildExperienceDontAskAgainPushUpsellModule then if fFlagBuildLocalization then var6.dontAskAgain else localizationStringsModule.CHAT_DONT_ASK_AGAIN elseif fFlagBuildLocalization then var6.notNow else localizationStringsModule.CHAT_NOT_NOW,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				onActivated = p0.onNotNow
			})
		})
	})
end