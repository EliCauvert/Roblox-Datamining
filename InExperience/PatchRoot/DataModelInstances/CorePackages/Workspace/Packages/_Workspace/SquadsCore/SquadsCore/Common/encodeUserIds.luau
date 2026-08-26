local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: httpService (ref)
	if p1 == nil then
		return "[]"
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONEncode(p1)
	end)
	
	return if ok then status else "[]"
end