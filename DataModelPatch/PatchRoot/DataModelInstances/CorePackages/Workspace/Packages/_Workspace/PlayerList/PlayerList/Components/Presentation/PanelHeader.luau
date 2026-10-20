local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), IconButton (copy), FoundationModule (copy)
	return ReactModule.createElement(View, {
		tag = "row flex-x-between align-y-center padding-x-large",
		Size = UDim2.new(1, 0, 0, p1.height),
		LayoutOrder = p1.layoutOrder
	}, {
		Title = ReactModule.createElement(Text, {
			tag = "auto-xy text-label-medium content-emphasis",
			LayoutOrder = 1,
			Text = p1.title or "Leaderboard"
		}),
		CloseButton = ReactModule.createElement(IconButton, {
			LayoutOrder = 2,
			icon = { name = FoundationModule.Enums.IconName.X },
			size = FoundationModule.Enums.InputSize.XSmall,
			onActivated = p1.onClose
		})
	})
end)