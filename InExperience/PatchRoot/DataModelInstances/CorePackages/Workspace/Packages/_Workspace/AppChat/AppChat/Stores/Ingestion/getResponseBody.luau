return function(p0) --[[ line: 1 | named "getResponseBody" ]]
	return if p0 == nil then nil else p0.responseBody or p0
end