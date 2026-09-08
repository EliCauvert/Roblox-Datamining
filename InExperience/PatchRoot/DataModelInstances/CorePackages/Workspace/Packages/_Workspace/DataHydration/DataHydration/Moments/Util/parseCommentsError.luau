local httpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)

return function(p1)
	-- upvalues: httpService (ref)
	if type(p1) ~= "string" or p1 == "" then
		return nil
	end
	local matchIndex = string.find(p1, "{", 1, true)
	local ok, status = pcall(httpService.JSONDecode, httpService, if matchIndex ~= nil then p1 else string.sub(p1, matchIndex))
	
	return if not (not ok or type(status) ~= "table") then if type(status.errorCode) == "string" and type(status.message) == "string" then { errorCode = status.errorCode, message = status.message } else nil else nil
end