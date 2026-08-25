local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local view = require(parent_1.Foundation).View
local playerBadgeModule = require(parent.Components.Presentation.PlayerBadge)
local playerVerifiedBadgeModule = require(parent.Components.Presentation.PlayerVerifiedBadge)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), view (ref), playerBadgeModule (ref), playerVerifiedBadgeModule (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall auto-xy",
		LayoutOrder = p0.layoutOrder
	}, {
		Badge = reactModule.createElement(playerBadgeModule, { layoutOrder = 1, player = p0.player }),
		VerifiedBadge = reactModule.createElement(playerVerifiedBadgeModule, { layoutOrder = 2, player = p0.player })
	})
end)