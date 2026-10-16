local HttpService = game:GetService("HttpService")

return function(List): string --[[ Line: 10 | Named "buildQueryString" ]]
	-- upvalues: HttpService (copy)
	local List1 = {}
	
	for i, value in pairs(List) do
		table.insert(List1, string.format("%s=%s", HttpService:UrlEncode((tostring(i))), HttpService:UrlEncode((tostring(value)))))
	end
	return if #List1 == 0 then "" else "?" .. table.concat(List1, "&")
end