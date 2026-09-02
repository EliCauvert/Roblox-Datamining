local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local button = foundationModule.Button
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), button (ref), iconName (ref), inputSize (ref), buttonVariant (ref)
	local var1 = if fFlagBuildLocalization then useLocalization({
		description = localizationStringsModule.CHAT_COMPLETED_GAME_CREATION_DESCRIPTION,
		playtest = localizationStringsModule.CHAT_PLAYTEST,
		title = localizationStringsModule.CHAT_COMPLETED_GAME_CREATION_TITLE
	}) else nil
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-medium stroke-standard stroke-emphasis radius-medium clip",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId or "playtest-completed-card"
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = p1.title or (if fFlagBuildLocalization then var1.title else localizationStringsModule.CHAT_COMPLETED_GAME_CREATION_TITLE)
		}),
		Description = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p1.description or (if fFlagBuildLocalization then var1.description else localizationStringsModule.CHAT_COMPLETED_GAME_CREATION_DESCRIPTION)
		}),
		Playtest = reactModule.createElement(button, {
			LayoutOrder = 3,
			testId = "playtest-completed-card-playtest-button",
			text = if fFlagBuildLocalization then var1.playtest else localizationStringsModule.CHAT_PLAYTEST,
			icon = iconName.PlaySmall,
			size = inputSize.Small,
			variant = buttonVariant.Emphasis,
			width = UDim.new(1, 0),
			isLoading = p1.isLoading == true,
			onActivated = p1.onPlaytest
		})
	})
end