local ConstantsModule = require(script:FindFirstAncestor("VoiceChatCore").Constants)

return function(Callback, p1, p2, Text: number) --[[ Line: 4 ]]
	-- upvalues: ConstantsModule (copy)
	assert(type(p1) == "string", "GetShowPhoneVerificationUpsell request expects universeId to be a string")
	local Formatted = string.format("%s/v1/phone-verification/configuration?layerName=%s&experienceId=%s", ConstantsModule.UPSELL_CARD_URL, p2, p1)
	
	if Text and Text > 0 then
		Formatted ..= "&sessionStartTime=" .. Text
	end
	return Callback(Formatted, "GET")
end