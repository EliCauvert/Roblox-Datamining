local httpService = game:GetService("HttpService")

return {
	stringify = function(p0, ...)
		-- upvalues: httpService (ref)
		if select("#", ...) > 0 then
			warn("JSON.stringify doesn't currently support more than 1 argument. All additional arguments will be ignored.")
		end
		return httpService:JSONEncode(p0)
	end,
	parse = function(p1, ...)
		-- upvalues: httpService (ref)
		if select("#", ...) > 0 then
			warn("JSON.parse doesn't currently support more than 1 argument. All additional arguments will be ignored.")
		end
		return httpService:JSONDecode(p1)
	end
}