local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local url = require(dataHydration.Parent.Http).Url
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)

return function(p1, p2)
	-- upvalues: url (ref), httpService (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/users/%s/request-friendship", url.FRIEND_URL, tostring(p1)), "POST", {
		postBody = httpService:JSONEncode({ friendshipOriginSourceType = p2 })
	}):andThen(function()
		return nil
	end):catch(function(p3)
		-- upvalues: httpService (copy)
		local var1 = if type(p3) == "table" then p3.StatusCode else nil
		local code = nil
		local var2 = if type(p3) == "table" then p3.Body else nil
		
		if type(var2) == "string" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var2)
			
			if ok and type(status) == "table" then
				local errors = status.errors
				
				if type(errors) == "table" and errors[1] then
					code = errors[1].code
				end
			end
		end
		error({ statusCode = var1, firstErrorCode = code })
	end)
end