local parent = script:FindFirstAncestor("PeopleReactView").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local icon = foundationModule.Icon
local view = foundationModule.View
local gameSettings = UserSettings().GameSettings

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), gameSettings (ref), view (ref), icon (ref), iconName (ref), inputSize (ref)
	local var2 = reactModule.useCallback(function(p1)
		-- upvalues: gameSettings (copy), p0 (ref)
		return function()
			-- upvalues: gameSettings (copy), p1 (ref), p0 (copy)
			gameSettings.PeoplePageLayout = p1
			p0.setLayout(p1)
		end
	end, {})
	
	return reactModule.createElement(view, {
		tag = "row auto-xy bg-shift-100 radius-medium gap-xxsmall padding-xsmall",
		LayoutOrder = p0.LayoutOrder
	}, {
		CardLayoutButton = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["row align-x-center align-y-center size-1000-1000 radius-medium"] = true,
				["bg-shift-300"] = p0.layout == Enum.PeoplePageLayout.Card
			},
			onActivated = var2(Enum.PeoplePageLayout.Card)
		}, {
			Icon = reactModule.createElement(icon, { name = iconName.Grid, size = inputSize.Medium })
		}),
		ListLayoutButton = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["row align-x-center align-y-center size-1000-1000 radius-medium"] = true,
				["bg-shift-300"] = p0.layout == Enum.PeoplePageLayout.List
			},
			onActivated = var2(Enum.PeoplePageLayout.List)
		}, {
			Icon = reactModule.createElement(icon, { name = iconName.ListBulleted, size = inputSize.Medium })
		})
	})
end)