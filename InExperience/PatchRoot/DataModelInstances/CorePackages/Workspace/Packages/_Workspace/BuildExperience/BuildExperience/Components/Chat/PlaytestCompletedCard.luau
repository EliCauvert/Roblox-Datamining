local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local button = foundationModule.Button
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 25 | named "PlaytestCompletedCard" ]]
	-- upvalues: reactModule (ref), view (ref), text (ref), localizationStringsModule (ref), button (ref), iconName (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-emphasis radius-medium clip",
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId or "playtest-completed-card"
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = p0.title or localizationStringsModule.CHAT_COMPLETED_GAME_CREATION_TITLE
		}),
		Description = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p0.description or localizationStringsModule.CHAT_COMPLETED_GAME_CREATION_DESCRIPTION
		}),
		Playtest = reactModule.createElement(button, {
			LayoutOrder = 3,
			testId = "playtest-completed-card-playtest-button",
			text = localizationStringsModule.CHAT_PLAYTEST,
			icon = iconName.PlaySmall,
			size = inputSize.Small,
			variant = buttonVariant.Emphasis,
			width = UDim.new(1, 0),
			isLoading = p0.isLoading == true,
			onActivated = p0.onPlaytest
		})
	})
end