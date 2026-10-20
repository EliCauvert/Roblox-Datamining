local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local View = require(Parent1.Foundation).View
local PlayerBadgeModule = require(Parent.Components.Presentation.PlayerBadge)
local PlayerVerifiedBadgeModule = require(Parent.Components.Presentation.PlayerVerifiedBadge)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), PlayerBadgeModule (copy), PlayerVerifiedBadgeModule (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-xsmall auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		Badge = ReactModule.createElement(PlayerBadgeModule, { layoutOrder = 1, player = p1.player }),
		VerifiedBadge = ReactModule.createElement(PlayerVerifiedBadgeModule, { layoutOrder = 2, player = p1.player })
	})
end)