local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)

return function(p0, p1) --[[ line: 22 ]]
	-- upvalues: url (ref), httpService (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/users/%s/request-friendship", url.FRIEND_URL, tostring(p0)), "POST", {
		postBody = httpService:JSONEncode({ friendshipOriginSourceType = p1 })
	}):andThen(function() --[[ line: 28 ]]
		return nil
	end):catch(function(p2) --[[ line: 31 ]]
		-- upvalues: httpService (copy)
		local var3 = if type(p2) == "table" then p2.StatusCode else nil
		local code = nil
		local var4 = if type(p2) == "table" then p2.Body else nil
		
		if type(var4) == "string" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var4)
			
			if ok and type(status) == "table" then
				local errors = status.errors
				
				if type(errors) == "table" and errors[1] then
					code = errors[1].code
				end
			end
		end
		error({ statusCode = var3, firstErrorCode = code })
	end)
end