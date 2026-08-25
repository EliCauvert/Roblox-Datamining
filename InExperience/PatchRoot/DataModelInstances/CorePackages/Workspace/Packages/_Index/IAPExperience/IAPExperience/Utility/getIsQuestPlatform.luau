local httpService = game:GetService("HttpService")

return function()
	-- upvalues: httpService (ref)
	return string.find(httpService:GetUserAgent(), "OculusQuest3Store") ~= nil
end