return function(p1) --[[ Line: 1 | Named "getResponseBody" ]]
	return if p1 == nil then nil else p1.responseBody or p1
end