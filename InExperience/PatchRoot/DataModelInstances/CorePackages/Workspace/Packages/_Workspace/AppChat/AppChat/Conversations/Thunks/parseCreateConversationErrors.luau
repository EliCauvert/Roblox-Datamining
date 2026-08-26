local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: httpService (ref)
	if p1.StatusCode == 403 then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p1 (ref)
			return httpService:JSONDecode(p1.Body)
		end)
		
		return if ok and status and status.reason_code == "participant_chat_disabled" then "participant_chat_disabled" else "unknown"
	end
end