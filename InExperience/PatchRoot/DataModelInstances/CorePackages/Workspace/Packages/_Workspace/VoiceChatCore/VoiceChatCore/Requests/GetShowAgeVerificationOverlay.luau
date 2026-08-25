local constantsModule = require(script:FindFirstAncestor("VoiceChatCore").Constants)

local function createQueryParams(p0)
	local var2 = ""
	local var3 = 0
	
	for i, v in p0 do
		var2 ..= if var3 > 0 then "&" else "" .. i .. "=" .. v
		var3 += 1
	end
	return if var3 == 0 then "" else "?" .. var2
end

return function(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref), createQueryParams (ref)
	assert(type(p3) == "string", "GetShowAgeVerificationOverlay request expects placeId to be a string")
	assert(type(p2) == "string", "GetShowAgeVerificationOverlay request expects universeId to be a string")
	assert(if type(p4) ~= "boolean" then type(p4) == "nil" else true, "GetShowAgeVerificationOverlay request expects hasMicPermissions to be a boolean or nil")
	local t = {}
	
	if p4 ~= nil then
		t.userHasDisabledMicDevicePermissions = tostring(not p4)
	end
	if p3 ~= "" and p3 ~= nil then
		t.placeId = p3
	end
	return p1(string.format("%s/v1/settings/verify/show-age-verification-overlay/%s%s", constantsModule.VOICE_URL, p2, createQueryParams(t)), "GET")
end