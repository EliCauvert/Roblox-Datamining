local constantsModule = require(script:FindFirstAncestor("VerifiedBadges").constants)

return function(p0) --[[ line: 10 | named "appendVerifiedBadge" ]]
	-- upvalues: constantsModule (ref)
	return p0 .. constantsModule.VERIFIED_EMOJI
end