local constantsModule = require(script.Parent.constants)
local base64 = require(script:FindFirstAncestor("GenericChallenges").Parent.AuthCommon).Utils.Base64
local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: constantsModule (ref), base64 (ref), httpService (ref)
	assert(p1.challengeId ~= nil, "challenge id must not be nil")
	assert(p1.challengeType ~= nil, "challenge type must not be nil")
	assert(p1.metadata ~= nil, "metadata must not be nil")
	
	return {
		[constantsModule.challengeIdHeader] = p1.challengeId,
		[constantsModule.challengeTypeHeader] = p1.challengeType,
		[constantsModule.challengeMetadataHeader] = base64.Encode(httpService:JSONEncode(p1.metadata))
	}
end