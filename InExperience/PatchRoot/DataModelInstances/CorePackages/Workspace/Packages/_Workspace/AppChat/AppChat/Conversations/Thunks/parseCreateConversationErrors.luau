local HttpService = game:GetService("HttpService")

return function(p1): string --[[ Line: 3 | Named "parseCreateConversationErrors" ]]
	-- upvalues: HttpService (copy)
	if p1.StatusCode == 403 then
		local Success, Result = pcall(function() --[[ Line: 5 ]]
			-- upvalues: HttpService (upval), p1 (copy)
			return HttpService:JSONDecode(p1.Body)
		end)
		
		if Success and Result and Result.reason_code == "participant_chat_disabled" then
			return "participant_chat_disabled"
		end
	end
	return "unknown"
end