local httpService = game:GetService("HttpService")

return function(p0, p1) --[[ line: 10 | named "serializeParticipantIdsForTelemetry" ]]
	-- upvalues: httpService (ref)
	local t = {}
	
	for i, v in p0 or {} do
		local var2 = tonumber(if typeof(v) == "table" then v.id else v)
		
		if var2 ~= nil and var2 ~= p1 then
			table.insert(t, var2)
		end
	end
	local ok, status = pcall(function() --[[ line: 21 ]]
		-- upvalues: httpService (copy), t (ref)
		return httpService:JSONEncode(t)
	end)
	
	return if ok then status else "[]"
end