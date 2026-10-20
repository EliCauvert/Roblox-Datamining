local ConstantsModule = require(script:FindFirstAncestor("VerifiedBadges").constants)

return function(Text): string
	-- upvalues: ConstantsModule (copy)
	return Text .. ConstantsModule.PREMIUM_EMOJI
end