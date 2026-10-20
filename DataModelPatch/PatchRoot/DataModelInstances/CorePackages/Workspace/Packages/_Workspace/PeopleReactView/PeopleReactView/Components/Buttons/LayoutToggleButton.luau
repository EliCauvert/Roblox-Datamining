local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local GameSettings = UserSettings().GameSettings

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), GameSettings (copy), View (copy), Icon (copy), IconName (copy), InputSize (copy)
	local UseResult = ReactModule.useCallback(function(PeoplePageLayout)
		-- upvalues: GameSettings (upval), Frame (copy)
		return function()
			-- upvalues: GameSettings (upval), PeoplePageLayout (copy), Frame (upval)
			GameSettings.PeoplePageLayout = PeoplePageLayout
			Frame.setLayout(PeoplePageLayout)
		end
	end, {})
	
	return ReactModule.createElement(View, {
		tag = "row auto-xy bg-shift-100 radius-medium gap-xxsmall padding-xsmall",
		LayoutOrder = Frame.LayoutOrder
	}, {
		CardLayoutButton = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["row align-x-center align-y-center size-1000-1000 radius-medium"] = true,
				["bg-shift-300"] = Frame.layout == Enum.PeoplePageLayout.Card
			},
			onActivated = UseResult(Enum.PeoplePageLayout.Card)
		}, {
			Icon = ReactModule.createElement(Icon, { name = IconName.Grid, size = InputSize.Medium })
		}),
		ListLayoutButton = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["row align-x-center align-y-center size-1000-1000 radius-medium"] = true,
				["bg-shift-300"] = Frame.layout == Enum.PeoplePageLayout.List
			},
			onActivated = UseResult(Enum.PeoplePageLayout.List)
		}, {
			Icon = ReactModule.createElement(Icon, { name = IconName.ListBulleted, size = InputSize.Medium })
		})
	})
end)