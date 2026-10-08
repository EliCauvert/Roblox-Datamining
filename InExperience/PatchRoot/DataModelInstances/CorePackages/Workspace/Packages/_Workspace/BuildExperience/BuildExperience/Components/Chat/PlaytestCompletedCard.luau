local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local chatCardPriorityModule = require(script.Parent.ChatCardEmphasis.ChatCardPriority)
local useChatCardEmphasisModule = require(script.Parent.ChatCardEmphasis.useChatCardEmphasis)
local fFlagBuildExperienceChatCardEmphasisModule = require(buildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local fFlagBuildExperiencePlaytestCardPublishCtaModule = require(buildExperience.Flags.FFlagBuildExperiencePlaytestCardPublishCta)
local button = foundationModule.Button
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), fFlagBuildExperiencePlaytestCardPublishCtaModule (ref), fFlagBuildExperienceChatCardEmphasisModule (ref), useChatCardEmphasisModule (ref), chatCardPriorityModule (ref), reactModule (ref), view (ref), button (ref), iconName (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), text (ref)
	local var1 = useLocalization({
		description = localizationStringsModule.CHAT_COMPLETED_GAME_CREATION_DESCRIPTION,
		playtest = localizationStringsModule.CHAT_PLAYTEST,
		publish = if fFlagBuildExperiencePlaytestCardPublishCtaModule then localizationStringsModule.BUILD_MENU_PUBLISH else nil,
		title = localizationStringsModule.CHAT_COMPLETED_GAME_CREATION_TITLE
	})
	local var2 = p1.isLoading == true
	local var3 = if fFlagBuildExperienceChatCardEmphasisModule then useChatCardEmphasisModule(chatCardPriorityModule.PlaytestCompleted) else nil
	local onPublish = p1.onPublish
	local _ = nil
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-emphasis radius-medium clip",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId or "playtest-completed-card"
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = p1.title or var1.title
		}),
		Description = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p1.description or var1.description
		}),
		Actions = if fFlagBuildExperiencePlaytestCardPublishCtaModule and onPublish ~= nil then reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row gap-small size-full-0 auto-y",
			testId = "playtest-completed-card-actions"
		}, {
			Playtest = reactModule.createElement(button, {
				LayoutOrder = 1,
				testId = "playtest-completed-card-playtest-button",
				text = var1.playtest,
				icon = iconName.PlaySmall,
				size = inputSize.Small,
				variant = if var3 == false then buttonVariant.SoftEmphasis else buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isLoading = var2,
				onActivated = p1.onPlaytest
			}),
			Publish = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "playtest-completed-card-publish-button",
				text = var1.publish,
				size = inputSize.Small,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p1.isPublishDisabled == true,
				onActivated = onPublish
			})
		}) else reactModule.createElement(button, {
			LayoutOrder = 3,
			testId = "playtest-completed-card-playtest-button",
			text = var1.playtest,
			icon = iconName.PlaySmall,
			size = inputSize.Small,
			variant = if var3 == false then buttonVariant.SoftEmphasis else buttonVariant.Emphasis,
			width = UDim.new(1, 0),
			isLoading = var2,
			onActivated = p1.onPlaytest
		})
	})
end