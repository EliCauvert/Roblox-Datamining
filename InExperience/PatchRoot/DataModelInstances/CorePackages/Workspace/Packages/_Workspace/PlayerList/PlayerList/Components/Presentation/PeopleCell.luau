local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local playerBadgeModule = require(parent.Components.Presentation.PlayerBadge)

return reactModule.memo(function(p0) --[[ line: 22 | named "PeopleCell" ]]
	-- upvalues: reactModule (ref), text (ref), playerBadgeModule (ref), view (ref)
	local t = {
		NameText = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = p0.displayName,
			tag = p0.textTag or (if p0.truncate then "fill size-0-full text-body-small text-align-x-left content-default text-truncate-end" else "auto-xy text-body-small text-align-x-left content-default")
		})
	}
	
	if p0.player then
		t.Badge = reactModule.createElement(playerBadgeModule, { layoutOrder = 2, player = p0.player })
	end
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center fill gap-xsmall size-0-full clip",
		LayoutOrder = p0.layoutOrder
	}, t)
end)