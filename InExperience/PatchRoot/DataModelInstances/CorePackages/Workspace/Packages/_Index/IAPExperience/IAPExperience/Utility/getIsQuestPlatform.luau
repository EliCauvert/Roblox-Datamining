local HttpService = game:GetService("HttpService")

return function(): boolean --[[ Line: 4 ]]
	-- upvalues: HttpService (copy)
	return string.find(HttpService:GetUserAgent(), "OculusQuest3Store") ~= nil
end