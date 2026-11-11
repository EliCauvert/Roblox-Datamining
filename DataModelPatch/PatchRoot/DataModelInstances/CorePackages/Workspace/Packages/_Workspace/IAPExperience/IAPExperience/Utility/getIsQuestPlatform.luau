local HttpService = game:GetService("HttpService")

return function(): boolean
	-- upvalues: HttpService (copy)
	return string.find(HttpService:GetUserAgent(), "OculusQuest3Store") ~= nil
end