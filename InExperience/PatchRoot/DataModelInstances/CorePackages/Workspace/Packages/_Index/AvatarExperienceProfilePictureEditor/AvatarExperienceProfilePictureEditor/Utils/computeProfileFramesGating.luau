local function _(p0, p1, p2) --[[ line: 18 | named "shouldShowProfileFrames" ]]
	return if p0 then if p1 then p2 else true else false
end

return function(p3, p4, p5, p6, p7) --[[ line: 34 | named "computeProfileFramesGating" ]]
	local var0 = if not p3 then false else not p4 or p5
	
	return {
		shouldShowFrames = var0,
		shouldShowUpsell = var0 and (p6 and not p7),
		canEquipFrame = var0 and (p5 and not p7),
		ampAccessError = p7
	}
end