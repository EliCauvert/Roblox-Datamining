local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local playersService = game:GetService("Players")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: playersService (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref)
	local BUILD_SUBLINE, var1
	local localPlayer = playersService.LocalPlayer
	local var2 = if localPlayer then localPlayer.DisplayName else ""
	local var3 = if localPlayer then localPlayer.Name else ""
	local var4 = if fFlagBuildLocalization then useLocalization({
		subline = localizationStringsModule.BUILD_SUBLINE,
		title = if var2 ~= "" then localizationStringsModule.BUILD_GREETING else {
			localizationStringsModule.BUILD_GREETING_WITH_NAME,
			DISPLAY_NAME = var2
		}
	}) else nil
	local var5 = useTokens()
	local size1400 = var5.Size.Size_1400
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		BUILD_SUBLINE = var4.subline
		var1 = var4.title
	else
		BUILD_SUBLINE = localizationStringsModule.BUILD_SUBLINE
		var1 = reactModule.useMemo(function()
			-- upvalues: localizationStringsModule (copy), var3 (ref)
			return localizationStringsModule.formatBuildGreeting(var3)
		end, { var3 })
	end
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small auto-xy",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId or "BuildEmptyState"
	}, {
		Nebula = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.Nebula,
			size = size1400,
			style = var5.Color.Content.Emphasis
		}),
		Headings = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall auto-xy"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = var1
			}),
			Subline = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Text = BUILD_SUBLINE
			})
		})
	})
end