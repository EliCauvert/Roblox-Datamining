local function _(p1, p2, p3)
	return if p1 then if p2 then p3 else true else false
end

return function(p1, p2, p3, p4, p5)
	local var1 = if not p1 then false else not p2 or p3
	
	return {
		shouldShowFrames = var1,
		shouldShowUpsell = var1 and (p4 and not p5),
		canEquipFrame = var1 and (p3 and not p5),
		ampAccessError = p5
	}
end