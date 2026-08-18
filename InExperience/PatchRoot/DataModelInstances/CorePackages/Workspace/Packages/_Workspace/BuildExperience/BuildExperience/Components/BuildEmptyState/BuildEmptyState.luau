local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local playersService = game:GetService("Players")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 24 | named "BuildEmptyState" ]]
	-- upvalues: useTokens (ref), playersService (ref), reactModule (ref), localizationStringsModule (ref), view (ref), icon (ref), iconName (ref), text (ref)
	local var5 = useTokens()
	local var6 = if playersService.LocalPlayer then playersService.LocalPlayer.Name else ""
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small auto-xy",
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId or "BuildEmptyState"
	}, {
		Nebula = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.Nebula,
			size = var5.Size.Size_1400,
			style = var5.Color.Content.Emphasis
		}),
		Headings = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall auto-xy"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = reactModule.useMemo(function() --[[ line: 29 ]]
					-- upvalues: localizationStringsModule (copy), var6 (ref)
					return localizationStringsModule.formatBuildGreeting(var6)
				end, { var6 })
			}),
			Subline = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Text = localizationStringsModule.BUILD_SUBLINE
			})
		})
	})
end