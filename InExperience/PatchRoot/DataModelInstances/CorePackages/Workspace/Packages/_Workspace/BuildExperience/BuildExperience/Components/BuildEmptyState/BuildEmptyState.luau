local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local playersService = game:GetService("Players")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: playersService (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref)
	local localPlayer = playersService.LocalPlayer
	local var1 = if localPlayer then localPlayer.DisplayName else ""
	local var2 = useLocalization({
		subline = localizationStringsModule.BUILD_SUBLINE,
		title = if var1 ~= "" then localizationStringsModule.BUILD_GREETING else {
			localizationStringsModule.BUILD_GREETING_WITH_NAME,
			DISPLAY_NAME = var1
		}
	})
	local var3 = useTokens()
	local size1400 = var3.Size.Size_1400
	local _ = nil
	local _ = nil
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small auto-xy",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId or "BuildEmptyState"
	}, {
		Nebula = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.Nebula,
			size = size1400,
			style = var3.Color.Content.Emphasis
		}),
		Headings = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall auto-xy"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = var2.title
			}),
			Subline = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Text = var2.subline
			})
		})
	})
end