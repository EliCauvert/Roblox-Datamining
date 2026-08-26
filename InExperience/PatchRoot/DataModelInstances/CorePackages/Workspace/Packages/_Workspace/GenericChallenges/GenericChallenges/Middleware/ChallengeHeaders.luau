local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local constantsModule = require(genericChallenges.Utils.constants)
local genericTypeModule = require(genericChallenges.Types.GenericType)
local base64 = require(genericChallenges.Parent.AuthCommon).Utils.Base64
local httpService = game:GetService("HttpService")
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: constantsModule (ref), base64 (ref), httpService (ref), genericTypeModule (ref), t (ref)
	local t_1 = { challengeId = p1[constantsModule.challengeIdHeader] }
	local var1 = base64.Decode(p1[constantsModule.challengeMetadataHeader])
	t_1.challengeMetadata = {
		raw = p1[constantsModule.challengeMetadataHeader],
		decoded = var1,
		typed = httpService:JSONDecode(var1)
	}
	t_1.challengeType = {
		raw = p1[constantsModule.challengeTypeHeader],
		typed = genericTypeModule.fromRawValue(p1[constantsModule.challengeTypeHeader])
	}
	
	return setmetatable(t_1, t)
end

return t