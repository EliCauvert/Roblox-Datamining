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

return function(p0) --[[ line: 28 | named "BuildEmptyState" ]]
	-- upvalues: playersService (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref)
	local BUILD_SUBLINE, var10
	local localPlayer = playersService.LocalPlayer
	local var6 = if localPlayer then localPlayer.DisplayName else ""
	local var7 = if localPlayer then localPlayer.Name else ""
	local var8 = if fFlagBuildLocalization then useLocalization({
		subline = localizationStringsModule.BUILD_SUBLINE,
		title = if var6 ~= "" then localizationStringsModule.BUILD_GREETING else {
			localizationStringsModule.BUILD_GREETING_WITH_NAME,
			DISPLAY_NAME = var6
		}
	}) else nil
	local var9 = useTokens()
	local size1400 = var9.Size.Size_1400
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		BUILD_SUBLINE = var8.subline
		var10 = var8.title
	else
		BUILD_SUBLINE = localizationStringsModule.BUILD_SUBLINE
		var10 = reactModule.useMemo(function() --[[ line: 53 ]]
			-- upvalues: localizationStringsModule (copy), var7 (ref)
			return localizationStringsModule.formatBuildGreeting(var7)
		end, { var7 })
	end
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small auto-xy",
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId or "BuildEmptyState"
	}, {
		Nebula = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.Nebula,
			size = size1400,
			style = var9.Color.Content.Emphasis
		}),
		Headings = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall auto-xy"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = var10
			}),
			Subline = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Text = BUILD_SUBLINE
			})
		})
	})
end