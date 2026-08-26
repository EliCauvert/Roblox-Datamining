local constantsModule = require(script:FindFirstAncestor("VerifiedBadges").constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	return p1 .. constantsModule.VERIFIED_EMOJI
end