local AXHeadRefinementTooltipExpirationDurationDays = game:DefineFastInt("AXHeadRefinementTooltipExpirationDurationDays", 7)

return function(p1): boolean
	-- upvalues: AXHeadRefinementTooltipExpirationDurationDays (copy)
	return not p1.prevTime or (p1.expirationDurationSeconds or AXHeadRefinementTooltipExpirationDurationDays * 24 * 60 * 60) <= os.difftime(p1.currentTime, p1.prevTime)
end