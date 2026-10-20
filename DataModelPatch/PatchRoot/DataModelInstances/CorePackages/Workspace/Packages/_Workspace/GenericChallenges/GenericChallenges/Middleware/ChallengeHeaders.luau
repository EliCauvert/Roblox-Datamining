local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local ConstantsModule = require(GenericChallenges.Utils.constants)
local GenericTypeModule = require(GenericChallenges.Types.GenericType)
local Base64 = require(GenericChallenges.Parent.AuthCommon).Utils.Base64
local HttpService = game:GetService("HttpService")
local ChallengeHeadersModule = {}
ChallengeHeadersModule.__index = ChallengeHeadersModule

function ChallengeHeadersModule.new(p1)
	-- upvalues: ConstantsModule (copy), Base64 (copy), HttpService (copy), GenericTypeModule (copy), ChallengeHeadersModule (copy)
	local DecodeResult = Base64.Decode(p1[ConstantsModule.challengeMetadataHeader])
	
	return (setmetatable({
		challengeId = p1[ConstantsModule.challengeIdHeader],
		challengeMetadata = {
			raw = p1[ConstantsModule.challengeMetadataHeader],
			decoded = DecodeResult,
			typed = HttpService:JSONDecode(DecodeResult)
		},
		challengeType = {
			raw = p1[ConstantsModule.challengeTypeHeader],
			typed = GenericTypeModule.fromRawValue(p1[ConstantsModule.challengeTypeHeader])
		}
	}, ChallengeHeadersModule))
end

return ChallengeHeadersModule