local HttpService = game:GetService("HttpService")

return function(p1, ...): string --[[ Line: 17 | Named "formatProdErrorMessage" ]]
	-- upvalues: HttpService (copy)
	local Text = "https://reactjs.org/docs/error-decoder.html?invariant=" .. tostring(p1)
	
	for i = 1, select("#", ...) do
		Text ..= "&args[]=" .. HttpService:UrlEncode(select(i, ...))
	end
	return string.format("Minified React error #%d; visit %s for the full message or use the non-minified dev environment for full errors and additional helpful warnings.", p1, Text)
end