local function _(p1, p2, p3) --[[ Line: 18 | Named "shouldShowProfileFrames" ]]
	return if p1 then not p2 or p3 else false
end

return function(p1, p2, p3, p4, AmpAccessError) --[[ Line: 34 | Named "computeProfileFramesGating" ]]
	local NoP4 = if p1 then not p2 or p3 else false
	
	return {
		shouldShowFrames = NoP4,
		shouldShowUpsell = NoP4 and (p4 and not AmpAccessError),
		canEquipFrame = NoP4 and (p3 and not AmpAccessError),
		ampAccessError = AmpAccessError
	}
end