local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local followingsUrlBuilderModule = require(script.Parent.FollowingsUrlBuilder)

return function(p0, p1) --[[ line: 13 | named "requestUpdateFollowing" ]]
	-- upvalues: getLocalPlayerUserId (ref), promiseModule (ref), followingsUrlBuilderModule (ref), httpRequestModule (ref), httpService (ref)
	local var5 = getLocalPlayerUserId()
	
	return if var5 and var5 > 0 then httpRequestModule.config({
		requestFunction = function(p2, p3, p4) --[[ line: 25 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(followingsUrlBuilderModule.buildFollowingUpdateUrl(tostring(var5), p0), if p1 then "POST" else "DELETE", {
		postBody = if p1 then httpService:JSONEncode({}) else nil
	}) else promiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot update following status: missing or invalid local player ID"
	})
end