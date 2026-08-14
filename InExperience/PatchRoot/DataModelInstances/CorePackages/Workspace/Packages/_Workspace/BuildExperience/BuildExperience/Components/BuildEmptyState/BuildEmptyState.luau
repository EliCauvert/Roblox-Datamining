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
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), playersService (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref)
	local var6 = if fFlagBuildLocalization then useLocalization({ subline = localizationStringsModule.BUILD_SUBLINE }) else nil
	local var7 = useTokens()
	local var8 = if playersService.LocalPlayer then playersService.LocalPlayer.Name else ""
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small auto-xy",
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId or "BuildEmptyState"
	}, {
		Nebula = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.Nebula,
			size = var7.Size.Size_1400,
			style = var7.Color.Content.Emphasis
		}),
		Headings = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall auto-xy"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = reactModule.useMemo(function() --[[ line: 38 ]]
					-- upvalues: localizationStringsModule (copy), var8 (ref)
					return localizationStringsModule.formatBuildGreeting(var8)
				end, { var8 })
			}),
			Subline = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Text = if fFlagBuildLocalization then var6.subline else localizationStringsModule.BUILD_SUBLINE
			})
		})
	})
end