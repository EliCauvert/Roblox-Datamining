local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local iconButton = foundationModule.IconButton

return reactModule.memo(function(p0) --[[ line: 10 | named "PanelHeader" ]]
	-- upvalues: reactModule (ref), view (ref), text (ref), iconButton (ref), foundationModule (ref)
	return reactModule.createElement(view, {
		tag = "row flex-x-between align-y-center auto-y padding-x-large",
		Size = UDim2.new(1, 0, 0, p0.height),
		LayoutOrder = p0.layoutOrder
	}, {
		Title = reactModule.createElement(text, {
			tag = "auto-xy text-label-medium content-emphasis",
			LayoutOrder = 1,
			Text = p0.title or "Leaderboard"
		}),
		CloseButton = reactModule.createElement(iconButton, {
			LayoutOrder = 2,
			icon = { name = foundationModule.Enums.IconName.X },
			size = foundationModule.Enums.InputSize.XSmall,
			onActivated = p0.onClose
		})
	})
end)