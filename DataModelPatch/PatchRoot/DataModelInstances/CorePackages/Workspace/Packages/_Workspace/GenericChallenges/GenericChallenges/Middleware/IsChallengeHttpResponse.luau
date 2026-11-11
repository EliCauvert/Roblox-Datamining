local ConstantsModule = require(script:FindFirstAncestor("GenericChallenges").Utils.constants)

return function(ForbiddenStatusCode, p1): boolean
	-- upvalues: ConstantsModule (copy)
	return ForbiddenStatusCode == ConstantsModule.forbiddenStatusCode and (p1[ConstantsModule.challengeTypeHeader] ~= nil and (p1[ConstantsModule.challengeIdHeader] ~= nil and p1[ConstantsModule.challengeMetadataHeader] ~= nil))
end