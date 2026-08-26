local constantsModule = require(script:FindFirstAncestor("VoiceChatCore").Constants)

return function(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref)
	assert(type(p2) == "string", "GetShowPhoneVerificationUpsell request expects universeId to be a string")
	local formattedText = string.format("%s/v1/phone-verification/configuration?layerName=%s&experienceId=%s", constantsModule.UPSELL_CARD_URL, p3, p2)
	
	if p4 and p4 > 0 then
		formattedText ..= "&sessionStartTime=" .. p3
	end
	return p1(formattedText, "GET")
end