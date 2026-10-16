local ConstantsModule = require(script.Parent.constants)
local Base64 = require(script:FindFirstAncestor("GenericChallenges").Parent.AuthCommon).Utils.Base64
local HttpService = game:GetService("HttpService")

return function(p1) --[[ Line: 11 ]]
	-- upvalues: ConstantsModule (copy), Base64 (copy), HttpService (copy)
	assert(p1.challengeId ~= nil, "challenge id must not be nil")
	assert(p1.challengeType ~= nil, "challenge type must not be nil")
	assert(p1.metadata ~= nil, "metadata must not be nil")
	
	return {
		[ConstantsModule.challengeIdHeader] = p1.challengeId,
		[ConstantsModule.challengeTypeHeader] = p1.challengeType,
		[ConstantsModule.challengeMetadataHeader] = Base64.Encode(HttpService:JSONEncode(p1.metadata))
	}
end