local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local ChatCardPriorityModule = require(script.Parent.ChatCardEmphasis.ChatCardPriority)
local UseChatCardEmphasisModule = require(script.Parent.ChatCardEmphasis.useChatCardEmphasis)
local FFlagBuildExperienceDontAskAgainPushUpsellModule = require(BuildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(Frame) --[[ Line: 32 | Named "PushNotificationsUpsellCard" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), UseChatCardEmphasisModule (copy), ChatCardPriorityModule (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), FFlagBuildExperienceDontAskAgainPushUpsellModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		disabledDescription = LocalizationStringsModule.CHAT_NOTIFICATION_DISABLED_DESCRIPTION,
		dontAskAgain = LocalizationStringsModule.CHAT_DONT_ASK_AGAIN,
		notNow = LocalizationStringsModule.CHAT_NOT_NOW,
		notifyMe = LocalizationStringsModule.CHAT_NOTIFY_ME,
		openSettings = LocalizationStringsModule.CHAT_OPEN_SETTINGS,
		promptDescription = LocalizationStringsModule.CHAT_NOTIFICATION_PROMPT_DESCRIPTION,
		promptTitle = LocalizationStringsModule.CHAT_NOTIFICATION_PROMPT_TITLE
	})
	local IsShouldOpenSettings = Frame.shouldOpenSettings == true
	local UseChatCardEmphasisModuleResult = if FFlagBuildExperienceChatCardEmphasisModule then UseChatCardEmphasisModule(ChatCardPriorityModule.PushNotificationsUpsell) else nil
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "PushNotificationsUpsellCard",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = UseLocalizationResult.promptTitle
		}),
		Description = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = if IsShouldOpenSettings then UseLocalizationResult.disabledDescription else UseLocalizationResult.promptDescription
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			PrimaryAction = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = if IsShouldOpenSettings then UseLocalizationResult.openSettings else UseLocalizationResult.notifyMe,
				size = InputSize.Small,
				variant = if UseChatCardEmphasisModuleResult == false then ButtonVariant.SoftEmphasis else ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				isLoading = Frame.isRequestPending == true,
				onActivated = if IsShouldOpenSettings then Frame.onOpenSettings else Frame.onNotifyMe,
				testId = if IsShouldOpenSettings then "PushNotificationsUpsellCard.OpenSettings" else "PushNotificationsUpsellCard.NotifyMe"
			}),
			NotNow = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				testId = "PushNotificationsUpsellCard.NotNow",
				text = if FFlagBuildExperienceDontAskAgainPushUpsellModule then UseLocalizationResult.dontAskAgain else UseLocalizationResult.notNow,
				size = InputSize.Small,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				onActivated = Frame.onNotNow
			})
		})
	})
end