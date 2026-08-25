local httpService = game:GetService("HttpService")

return function(p0, ...)
	-- upvalues: httpService (ref)
	local text = "https://reactjs.org/docs/error-decoder.html?invariant=" .. tostring(p0)
	
	for i = 1, select("#", ...) do
		text ..= "&args[]=" .. httpService:UrlEncode(select(i, ...))
	end
	return string.format("Minified React error #%d; visit %s for the full message or use the non-minified dev environment for full errors and additional helpful warnings.", p0, text)
end