local HttpService = game:GetService("HttpService")

return function()
	-- upvalues: HttpService (copy)
	return HttpService:GenerateGUID(true)
end