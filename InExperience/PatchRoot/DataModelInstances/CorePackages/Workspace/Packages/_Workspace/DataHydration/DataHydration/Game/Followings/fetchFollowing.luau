local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local followingsUrlBuilderModule = require(script.Parent.FollowingsUrlBuilder)

return function(p1)
	-- upvalues: getLocalPlayerUserId (ref), promiseModule (ref), followingsUrlBuilderModule (ref), httpRequestModule (ref)
	local var1 = getLocalPlayerUserId()
	
	return if var1 and var1 > 0 then httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(followingsUrlBuilderModule.buildFollowingStatusUrl(tostring(var1), p1), "GET") else promiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot fetch following status: missing or invalid local player ID"
	})
end