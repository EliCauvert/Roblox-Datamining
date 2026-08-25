local httpService = game:GetService("HttpService")

return function(p0)
	-- upvalues: httpService (ref)
	if p0.StatusCode == 403 then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p0 (ref)
			return httpService:JSONDecode(p0.Body)
		end)
		
		return if ok and status and status.reason_code == "participant_chat_disabled" then "participant_chat_disabled" else "unknown"
	end
end