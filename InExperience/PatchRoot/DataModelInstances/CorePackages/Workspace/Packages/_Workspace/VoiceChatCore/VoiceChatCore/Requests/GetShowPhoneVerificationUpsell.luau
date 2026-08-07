local constantsModule = require(script:FindFirstAncestor("VoiceChatCore").Constants)

return function(p0, p1, p2, p3) --[[ line: 4 ]]
	-- upvalues: constantsModule (ref)
	assert(type(p1) == "string", "GetShowPhoneVerificationUpsell request expects universeId to be a string")
	local formattedText = string.format("%s/v1/phone-verification/configuration?layerName=%s&experienceId=%s", constantsModule.UPSELL_CARD_URL, p2, p1)
	
	if p3 and p3 > 0 then
		formattedText ..= "&sessionStartTime=" .. p3
	end
	return p0(formattedText, "GET")
end