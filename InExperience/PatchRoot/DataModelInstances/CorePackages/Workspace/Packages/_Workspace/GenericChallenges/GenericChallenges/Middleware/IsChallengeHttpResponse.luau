local constantsModule = require(script:FindFirstAncestor("GenericChallenges").Utils.constants)

return function(p1, p2)
	-- upvalues: constantsModule (ref)
	return p1 == constantsModule.forbiddenStatusCode and (p2[constantsModule.challengeTypeHeader] ~= nil and (p2[constantsModule.challengeIdHeader] ~= nil and p2[constantsModule.challengeMetadataHeader] ~= nil))
end