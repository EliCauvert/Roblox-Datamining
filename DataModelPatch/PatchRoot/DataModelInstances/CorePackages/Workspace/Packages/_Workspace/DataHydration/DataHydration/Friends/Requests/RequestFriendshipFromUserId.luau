local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Url = require(DataHydration.Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.Friends.Networking.myHttpRequest)

return function(p1, FriendshipOriginSourceType)
	-- upvalues: Url (copy), HttpService (copy), MyHttpRequestModule (copy)
	return MyHttpRequestModule(string.format("%s/users/%s/request-friendship", Url.FRIEND_URL, (tostring(p1))), "POST", {
		postBody = HttpService:JSONEncode({ friendshipOriginSourceType = FriendshipOriginSourceType })
	}):andThen(function()
		return nil
	end):catch(function(Err)
		-- upvalues: HttpService (upval)
		local StatusCode = if type(Err) == "table" then Err.StatusCode else nil
		local Code = nil
		local Body = if type(Err) == "table" then Err.Body else nil
		
		if type(Body) == "string" then
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, Body)
			
			if Success and type(Result) == "table" then
				local Errors = Result.errors
				
				if type(Errors) == "table" and Errors[1] then
					Code = Errors[1].code
				end
			end
		end
		error({ statusCode = StatusCode, firstErrorCode = Code })
	end)
end