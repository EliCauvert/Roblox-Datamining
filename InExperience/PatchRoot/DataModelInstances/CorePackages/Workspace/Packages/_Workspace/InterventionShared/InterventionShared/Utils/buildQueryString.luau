local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: httpService (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		table.insert(t, string.format("%s=%s", httpService:UrlEncode(tostring(i)), httpService:UrlEncode(tostring(v))))
	end
	return if #t == 0 then "" else "?" .. table.concat(t, "&")
end