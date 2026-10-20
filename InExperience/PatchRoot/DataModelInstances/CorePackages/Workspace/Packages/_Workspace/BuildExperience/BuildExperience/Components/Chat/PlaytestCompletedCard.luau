local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local ChatCardPriorityModule = require(script.Parent.ChatCardEmphasis.ChatCardPriority)
local UseChatCardEmphasisModule = require(script.Parent.ChatCardEmphasis.useChatCardEmphasis)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local FFlagBuildExperiencePlaytestCardPublishCtaModule = require(BuildExperience.Flags.FFlagBuildExperiencePlaytestCardPublishCta)
local Button = FoundationModule.Button
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperiencePlaytestCardPublishCtaModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), UseChatCardEmphasisModule (copy), ChatCardPriorityModule (copy), ReactModule (copy), View (copy), Button (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		description = LocalizationStringsModule.CHAT_COMPLETED_GAME_CREATION_DESCRIPTION,
		playtest = LocalizationStringsModule.CHAT_PLAYTEST,
		publish = if FFlagBuildExperiencePlaytestCardPublishCtaModule then LocalizationStringsModule.BUILD_MENU_PUBLISH else nil,
		title = LocalizationStringsModule.CHAT_COMPLETED_GAME_CREATION_TITLE
	})
	local IsIsLoading = Frame.isLoading == true
	local UseChatCardEmphasisModuleResult = if FFlagBuildExperienceChatCardEmphasisModule then UseChatCardEmphasisModule(ChatCardPriorityModule.PlaytestCompleted) else nil
	local OnPublish = Frame.onPublish
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-emphasis radius-medium clip",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "playtest-completed-card"
	}, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = Frame.title or UseLocalizationResult.title
		}),
		Description = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = Frame.description or UseLocalizationResult.description
		}),
		Actions = if FFlagBuildExperiencePlaytestCardPublishCtaModule and OnPublish ~= nil then ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row gap-small size-full-0 auto-y",
			testId = "playtest-completed-card-actions"
		}, {
			Playtest = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				testId = "playtest-completed-card-playtest-button",
				text = UseLocalizationResult.playtest,
				icon = IconName.PlaySmall,
				size = InputSize.Small,
				variant = if UseChatCardEmphasisModuleResult == false then ButtonVariant.SoftEmphasis else ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				isLoading = IsIsLoading,
				onActivated = Frame.onPlaytest
			}),
			Publish = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				testId = "playtest-completed-card-publish-button",
				text = UseLocalizationResult.publish,
				size = InputSize.Small,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				isDisabled = Frame.isPublishDisabled == true,
				onActivated = OnPublish
			})
		}) else ReactModule.createElement(Button, {
			LayoutOrder = 3,
			testId = "playtest-completed-card-playtest-button",
			text = UseLocalizationResult.playtest,
			icon = IconName.PlaySmall,
			size = InputSize.Small,
			variant = if UseChatCardEmphasisModuleResult == false then ButtonVariant.SoftEmphasis else ButtonVariant.Emphasis,
			width = UDim.new(1, 0),
			isLoading = IsIsLoading,
			onActivated = Frame.onPlaytest
		})
	})
end