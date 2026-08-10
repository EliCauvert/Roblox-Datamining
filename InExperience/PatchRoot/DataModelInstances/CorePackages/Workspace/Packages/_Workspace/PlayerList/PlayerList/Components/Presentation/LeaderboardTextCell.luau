local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text

return reactModule.memo(function(p0) --[[ line: 19 | named "LeaderboardTextCell" ]]
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "clip",
		Size = UDim2.fromOffset(p0.width, p0.rowHeight),
		LayoutOrder = p0.layoutOrder
	}, {
		Text = reactModule.createElement(text, {
			Text = p0.text,
			tag = p0.textTag or "size-full text-body-small text-align-x-left content-default"
		})
	})
end)