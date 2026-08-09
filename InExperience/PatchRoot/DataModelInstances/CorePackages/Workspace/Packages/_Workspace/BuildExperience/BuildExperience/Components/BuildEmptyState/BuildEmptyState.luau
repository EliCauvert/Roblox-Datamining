local parent = script:FindFirstAncestor("BuildExperience").Parent
local playersService = game:GetService("Players")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 25 | named "BuildEmptyState" ]]
	-- upvalues: useTokens (ref), playersService (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref)
	local var3 = useTokens()
	local var4 = if playersService.LocalPlayer then playersService.LocalPlayer.Name else ""
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small auto-xy",
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId or "BuildEmptyState"
	}, {
		Nebula = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.Nebula,
			size = var3.Size.Size_1400,
			style = var3.Color.Content.Emphasis
		}),
		Headings = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall auto-xy"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = reactModule.useMemo(function() --[[ line: 30 ]]
					-- upvalues: var4 (ref)
					return if var4 == "" then "Hi" else `Hi, {var4}`
				end, { var4 })
			}),
			Subline = reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = "What do you want to build today?",
				tag = "auto-xy text-body-medium content-default"
			})
		})
	})
end