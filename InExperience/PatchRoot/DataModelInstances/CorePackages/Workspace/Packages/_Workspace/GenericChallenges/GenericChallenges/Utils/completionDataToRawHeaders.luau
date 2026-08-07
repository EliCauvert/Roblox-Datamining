local constantsModule = require(script.Parent.constants)
local base64 = require(script:FindFirstAncestor("GenericChallenges").Parent.AuthCommon).Utils.Base64
local httpService = game:GetService("HttpService")

return function(p0) --[[ line: 11 ]]
	-- upvalues: constantsModule (ref), base64 (ref), httpService (ref)
	assert(p0.challengeId ~= nil, "challenge id must not be nil")
	assert(p0.challengeType ~= nil, "challenge type must not be nil")
	assert(p0.metadata ~= nil, "metadata must not be nil")
	
	return {
		[constantsModule.challengeIdHeader] = p0.challengeId,
		[constantsModule.challengeTypeHeader] = p0.challengeType,
		[constantsModule.challengeMetadataHeader] = base64.Encode(httpService:JSONEncode(p0.metadata))
	}
end