local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local constantsModule = require(genericChallenges.Utils.constants)
local genericTypeModule = require(genericChallenges.Types.GenericType)
local base64 = require(genericChallenges.Parent.AuthCommon).Utils.Base64
local httpService = game:GetService("HttpService")
local t = {}
t.__index = t

function t.new(p0) --[[ line: 41 ]]
	-- upvalues: constantsModule (ref), base64 (ref), httpService (ref), genericTypeModule (ref), t (ref)
	local t_1 = { challengeId = p0[constantsModule.challengeIdHeader] }
	local var6 = base64.Decode(p0[constantsModule.challengeMetadataHeader])
	t_1.challengeMetadata = {
		raw = p0[constantsModule.challengeMetadataHeader],
		decoded = var6,
		typed = httpService:JSONDecode(var6)
	}
	t_1.challengeType = {
		raw = p0[constantsModule.challengeTypeHeader],
		typed = genericTypeModule.fromRawValue(p0[constantsModule.challengeTypeHeader])
	}
	
	return setmetatable(t_1, t)
end

return t