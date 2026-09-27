local _ = require(script.Parent.Parent.Parent.Enums.BadgeType)
local _ = require(script.Parent.Parent.Parent.Enums.VirtualItemBadgeType)
local t = { PlusPromotion = "plusPromotion" }

return {
	ExperimentVariant = t,
	normalizeExperimentVariant = function(p1)
		-- upvalues: t (ref)
		return if p1 == t.PlusPromotion then "plusPromotion" else nil
	end
}