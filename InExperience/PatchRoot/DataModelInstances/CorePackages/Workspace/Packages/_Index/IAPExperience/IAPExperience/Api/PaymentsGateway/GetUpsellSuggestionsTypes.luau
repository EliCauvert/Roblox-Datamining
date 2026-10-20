local _ = require(script.Parent.Parent.Parent.Enums.BadgeType)
local _ = require(script.Parent.Parent.Parent.Enums.VirtualItemBadgeType)
local ExperimentVariant = { PlusPromotion = "plusPromotion" }

return {
	ExperimentVariant = ExperimentVariant,
	normalizeExperimentVariant = function(PlusPromotion)
		-- upvalues: ExperimentVariant (copy)
		return if PlusPromotion == ExperimentVariant.PlusPromotion then "plusPromotion" else nil
	end
}