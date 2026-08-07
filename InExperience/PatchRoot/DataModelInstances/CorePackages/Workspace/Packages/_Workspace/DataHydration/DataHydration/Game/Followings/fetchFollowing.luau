local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local followingsUrlBuilderModule = require(script.Parent.FollowingsUrlBuilder)

return function(p0) --[[ line: 12 | named "fetchFollowing" ]]
	-- upvalues: getLocalPlayerUserId (ref), promiseModule (ref), followingsUrlBuilderModule (ref), httpRequestModule (ref)
	local var4 = getLocalPlayerUserId()
	
	return if var4 and var4 > 0 then httpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ line: 24 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(followingsUrlBuilderModule.buildFollowingStatusUrl(tostring(var4), p0), "GET") else promiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot fetch following status: missing or invalid local player ID"
	})
end