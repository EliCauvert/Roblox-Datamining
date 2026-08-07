local httpService = game:GetService("HttpService")

return function(p0) --[[ line: 3 | named "encodeUserIds" ]]
	-- upvalues: httpService (ref)
	if p0 == nil then
		return "[]"
	end
	local ok, status = pcall(function() --[[ line: 8 ]]
		-- upvalues: httpService (copy), p0 (ref)
		return httpService:JSONEncode(p0)
	end)
	
	return if ok then status else "[]"
end