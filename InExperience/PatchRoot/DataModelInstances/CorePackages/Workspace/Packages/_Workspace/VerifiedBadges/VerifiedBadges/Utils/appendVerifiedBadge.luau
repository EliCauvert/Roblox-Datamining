local ConstantsModule = require(script:FindFirstAncestor("VerifiedBadges").constants)

return function(Text): string --[[ Line: 10 | Named "appendVerifiedBadge" ]]
	-- upvalues: ConstantsModule (copy)
	return Text .. ConstantsModule.VERIFIED_EMOJI
end