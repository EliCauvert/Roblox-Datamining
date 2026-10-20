local HttpResponseModule = {}
HttpResponseModule.__index = HttpResponseModule

function HttpResponseModule.__tostring(List): string
	local List1 = {}
	
	for i, value in pairs(List) do
		table.insert(List1, string.format("%s = %s", tostring(i), (tostring(value))))
	end
	table.sort(List1)
	
	return "<HttpResponse: " .. table.concat(List1, ", ") .. ">"
end

function HttpResponseModule.success(ResponseCode, ResponseBody)
	-- upvalues: HttpResponseModule (copy)
	return (setmetatable({ responseCode = ResponseCode, responseBody = ResponseBody }, HttpResponseModule))
end

function HttpResponseModule.error(HttpError)
	-- upvalues: HttpResponseModule (copy)
	return (setmetatable({ HttpError = HttpError }, HttpResponseModule))
end

return HttpResponseModule