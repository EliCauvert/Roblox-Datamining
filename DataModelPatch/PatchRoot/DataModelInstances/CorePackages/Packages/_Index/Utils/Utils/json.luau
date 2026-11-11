local HttpService = game:GetService("HttpService")

return {
	stringify = function(Input, ...)
		-- upvalues: HttpService (copy)
		if select("#", ...) > 0 then
			warn("JSON.stringify doesn't currently support more than 1 argument. All additional arguments will be ignored.")
		end
		return HttpService:JSONEncode(Input)
	end,
	parse = function(Input, ...)
		-- upvalues: HttpService (copy)
		if select("#", ...) > 0 then
			warn("JSON.parse doesn't currently support more than 1 argument. All additional arguments will be ignored.")
		end
		return HttpService:JSONDecode(Input)
	end
}