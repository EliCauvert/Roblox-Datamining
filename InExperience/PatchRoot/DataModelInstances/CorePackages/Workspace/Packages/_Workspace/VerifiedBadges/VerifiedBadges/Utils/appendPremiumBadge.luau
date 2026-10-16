local ConstantsModule = require(script:FindFirstAncestor("VerifiedBadges").constants)

return function(Text): string --[[ Line: 9 | Named "appendPremiumBadge" ]]
	-- upvalues: ConstantsModule (copy)
	return Text .. ConstantsModule.PREMIUM_EMOJI
end