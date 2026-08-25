local constantsModule = require(script:FindFirstAncestor("VerifiedBadges").constants)

return function(p0)
	-- upvalues: constantsModule (ref)
	return p0 .. constantsModule.PREMIUM_EMOJI
end