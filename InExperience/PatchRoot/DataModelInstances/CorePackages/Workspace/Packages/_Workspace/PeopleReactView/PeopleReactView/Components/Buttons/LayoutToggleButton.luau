local parent = script:FindFirstAncestor("PeopleReactView").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local icon = foundationModule.Icon
local view = foundationModule.View
local gameSettings = UserSettings().GameSettings

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), gameSettings (ref), view (ref), icon (ref), iconName (ref), inputSize (ref)
	local var1 = reactModule.useCallback(function(p2)
		-- upvalues: gameSettings (copy), p1 (ref)
		return function()
			-- upvalues: gameSettings (copy), p2 (ref), p1 (copy)
			gameSettings.PeoplePageLayout = p2
			p1.setLayout(p2)
		end
	end, {})
	
	return reactModule.createElement(view, {
		tag = "row auto-xy bg-shift-100 radius-medium gap-xxsmall padding-xsmall",
		LayoutOrder = p1.LayoutOrder
	}, {
		CardLayoutButton = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["row align-x-center align-y-center size-1000-1000 radius-medium"] = true,
				["bg-shift-300"] = p1.layout == Enum.PeoplePageLayout.Card
			},
			onActivated = var1(Enum.PeoplePageLayout.Card)
		}, {
			Icon = reactModule.createElement(icon, { name = iconName.Grid, size = inputSize.Medium })
		}),
		ListLayoutButton = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["row align-x-center align-y-center size-1000-1000 radius-medium"] = true,
				["bg-shift-300"] = p1.layout == Enum.PeoplePageLayout.List
			},
			onActivated = var1(Enum.PeoplePageLayout.List)
		}, {
			Icon = reactModule.createElement(icon, { name = iconName.ListBulleted, size = inputSize.Medium })
		})
	})
end)