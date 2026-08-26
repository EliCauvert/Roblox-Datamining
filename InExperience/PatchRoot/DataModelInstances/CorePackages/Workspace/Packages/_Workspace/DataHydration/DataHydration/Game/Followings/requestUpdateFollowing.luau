local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local followingsUrlBuilderModule = require(script.Parent.FollowingsUrlBuilder)

return function(p1, p2)
	-- upvalues: getLocalPlayerUserId (ref), promiseModule (ref), followingsUrlBuilderModule (ref), httpRequestModule (ref), httpService (ref)
	local var1 = getLocalPlayerUserId()
	
	return if var1 and var1 > 0 then httpRequestModule.config({
		requestFunction = function(p3, p4, p5)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p3, p4, p5)
		end
	})(followingsUrlBuilderModule.buildFollowingUpdateUrl(tostring(var1), p1), if p2 then "POST" else "DELETE", {
		postBody = if p2 then httpService:JSONEncode({}) else nil
	}) else promiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot update following status: missing or invalid local player ID"
	})
end