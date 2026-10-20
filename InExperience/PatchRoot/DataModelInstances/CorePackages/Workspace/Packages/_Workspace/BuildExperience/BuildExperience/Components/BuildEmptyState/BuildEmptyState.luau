local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local Players = game:GetService("Players")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: Players (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), Text (copy)
	local LocalPlayer = Players.LocalPlayer
	local DisplayName = if LocalPlayer then LocalPlayer.DisplayName else ""
	local UseLocalizationResult = UseLocalizationFunction({
		subline = LocalizationStringsModule.BUILD_SUBLINE,
		title = if DisplayName == "" then LocalizationStringsModule.BUILD_GREETING else {
			LocalizationStringsModule.BUILD_GREETING_WITH_NAME,
			DISPLAY_NAME = DisplayName
		}
	})
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-small auto-xy",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "BuildEmptyState"
	}, {
		Nebula = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = IconName.Nebula,
			size = UseTokensResult.Size.Size_1400,
			style = UseTokensResult.Color.Content.Emphasis
		}),
		Headings = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall auto-xy"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = UseLocalizationResult.title
			}),
			Subline = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Text = UseLocalizationResult.subline
			})
		})
	})
end