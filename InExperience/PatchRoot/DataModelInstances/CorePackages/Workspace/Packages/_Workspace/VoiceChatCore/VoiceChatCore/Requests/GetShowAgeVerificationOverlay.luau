local constantsModule = require(script:FindFirstAncestor("VoiceChatCore").Constants)

local function createQueryParams(p1)
	local var1 = ""
	local var2 = 0
	
	for i, v in p1 do
		var1 ..= if var2 > 0 then "&" else "" .. i .. "=" .. v
		var2 += 1
	end
	return if var2 == 0 then "" else "?" .. var2
end

return function(p2, p3, p4, p5)
	-- upvalues: constantsModule (ref), createQueryParams (ref)
	assert(type(p4) == "string", "GetShowAgeVerificationOverlay request expects placeId to be a string")
	assert(type(p3) == "string", "GetShowAgeVerificationOverlay request expects universeId to be a string")
	assert(if type(p5) ~= "boolean" then type(p5) == "nil" else true, "GetShowAgeVerificationOverlay request expects hasMicPermissions to be a boolean or nil")
	local t = {}
	
	if p5 ~= nil then
		t.userHasDisabledMicDevicePermissions = tostring(not p5)
	end
	if p4 ~= "" and p4 ~= nil then
		t.placeId = p4
	end
	return p2(string.format("%s/v1/settings/verify/show-age-verification-overlay/%s%s", constantsModule.VOICE_URL, p3, createQueryParams(t)), "GET")
end