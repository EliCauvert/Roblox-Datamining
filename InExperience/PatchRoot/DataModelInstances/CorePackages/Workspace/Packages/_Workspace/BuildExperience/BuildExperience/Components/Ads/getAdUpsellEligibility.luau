local t = { isEligible = false, freePromotionsRemaining = 0 }

return function(_)
	-- upvalues: t (ref)
	return t
end