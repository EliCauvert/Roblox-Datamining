local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local Url = require(Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.Friends.Networking.myHttpRequest)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor

return function(p1, FriendshipOriginSourceType, p2)
	-- upvalues: FFlagEnableFriendsStoreChallengeInterceptor (copy), MyHttpRequestModule (copy), Url (copy), HttpService (copy)
	return (if FFlagEnableFriendsStoreChallengeInterceptor and p2 then p2 else MyHttpRequestModule)(string.format("%s/users/%s/request-friendship", Url.FRIEND_URL, (tostring(p1))), "POST", {
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