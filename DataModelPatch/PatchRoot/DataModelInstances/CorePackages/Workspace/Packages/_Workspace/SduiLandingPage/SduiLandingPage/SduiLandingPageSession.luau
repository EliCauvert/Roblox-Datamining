local HttpService = game:GetService("HttpService")

return {
	_sessionId = "",
	Get = function(p1)
		-- upvalues: HttpService (copy)
		if p1._sessionId == "" then
			p1._sessionId = HttpService:GenerateGUID(false)
		end
		return p1._sessionId
	end,
	Refresh = function(p1)
		-- upvalues: HttpService (copy)
		p1._sessionId = HttpService:GenerateGUID(false)
		
		return p1._sessionId
	end
}