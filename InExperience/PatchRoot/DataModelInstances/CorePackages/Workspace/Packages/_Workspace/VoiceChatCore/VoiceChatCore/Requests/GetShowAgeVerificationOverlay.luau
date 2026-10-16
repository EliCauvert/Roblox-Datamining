local ConstantsModule = require(script:FindFirstAncestor("VoiceChatCore").Constants)

local function createQueryParams(List): string --[[ Line: 9 ]]
	local Text = ""
	local Count = 0
	
	for i, value in List do
		Text ..= if Count > 0 then "&" else "" .. i .. "=" .. value
		Count += 1
	end
	return if Count == 0 then "" else "?" .. Text
end

return function(Callback, p1, PlaceId, p2) --[[ Line: 19 ]]
	-- upvalues: ConstantsModule (copy), createQueryParams (copy)
	assert(type(PlaceId) == "string", "GetShowAgeVerificationOverlay request expects placeId to be a string")
	assert(type(p1) == "string", "GetShowAgeVerificationOverlay request expects universeId to be a string")
	assert(type(p2) == "boolean" or type(p2) == "nil", "GetShowAgeVerificationOverlay request expects hasMicPermissions to be a boolean or nil")
	local t = {}
	
	if p2 ~= nil then
		t.userHasDisabledMicDevicePermissions = tostring(not p2)
	end
	if PlaceId ~= "" and PlaceId ~= nil then
		t.placeId = PlaceId
	end
	return Callback(string.format("%s/v1/settings/verify/show-age-verification-overlay/%s%s", ConstantsModule.VOICE_URL, p1, (createQueryParams(t))), "GET")
end