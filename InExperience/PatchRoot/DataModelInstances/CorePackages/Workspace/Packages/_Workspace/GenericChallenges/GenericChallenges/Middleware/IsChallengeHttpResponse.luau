local constantsModule = require(script:FindFirstAncestor("GenericChallenges").Utils.constants)

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: constantsModule (ref)
	return p0 == constantsModule.forbiddenStatusCode and (p1[constantsModule.challengeTypeHeader] ~= nil and (p1[constantsModule.challengeIdHeader] ~= nil and p1[constantsModule.challengeMetadataHeader] ~= nil))
end