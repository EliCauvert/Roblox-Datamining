local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local playerBadgeGroupModule = require(parent.Components.Presentation.PlayerBadgeGroup)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), text (ref), playerBadgeGroupModule (ref), view (ref)
	local t = {
		NameText = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = p1.displayName,
			tag = p1.textTag or (if p1.truncate then "text-body-small text-align-x-left content-default text-truncate-end shrink auto-xy" else "auto-xy text-body-small text-align-x-left content-default")
		})
	}
	
	if p1.player then
		t.Badge = reactModule.createElement(playerBadgeGroupModule, { layoutOrder = 2, player = p1.player })
	end
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center fill size-0-full clip gap-medium",
		LayoutOrder = p1.layoutOrder
	}, t)
end)