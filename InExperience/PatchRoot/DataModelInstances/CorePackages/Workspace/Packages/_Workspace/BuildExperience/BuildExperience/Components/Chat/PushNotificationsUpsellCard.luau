local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 25 | named "PushNotificationsUpsellCard" ]]
	-- upvalues: reactModule (ref), view (ref), text (ref), localizationStringsModule (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var4 = p0.shouldOpenSettings == true
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "PushNotificationsUpsellCard",
		LayoutOrder = p0.LayoutOrder
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = localizationStringsModule.CHAT_NOTIFICATION_PROMPT_TITLE
		}),
		Description = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = if var4 then localizationStringsModule.CHAT_NOTIFICATION_DISABLED_DESCRIPTION else localizationStringsModule.CHAT_NOTIFICATION_PROMPT_DESCRIPTION
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			PrimaryAction = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = if var4 then localizationStringsModule.CHAT_OPEN_SETTINGS else localizationStringsModule.CHAT_NOTIFY_ME,
				size = inputSize.Small,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isLoading = p0.isRequestPending == true,
				onActivated = if var4 then p0.onOpenSettings else p0.onNotifyMe,
				testId = if var4 then "PushNotificationsUpsellCard.OpenSettings" else "PushNotificationsUpsellCard.NotifyMe"
			}),
			NotNow = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "PushNotificationsUpsellCard.NotNow",
				text = localizationStringsModule.CHAT_NOT_NOW,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				onActivated = p0.onNotNow
			})
		})
	})
end