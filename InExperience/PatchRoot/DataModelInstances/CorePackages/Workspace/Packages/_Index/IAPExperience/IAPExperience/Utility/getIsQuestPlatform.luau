local httpService = game:GetService("HttpService")

return function() --[[ line: 4 ]]
	-- upvalues: httpService (ref)
	return string.find(httpService:GetUserAgent(), "OculusQuest3Store") ~= nil
end