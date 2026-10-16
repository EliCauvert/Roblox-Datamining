local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local FollowingsUrlBuilderModule = require(script.Parent.FollowingsUrlBuilder)

return function(p1) --[[ Line: 12 | Named "fetchFollowing" ]]
	-- upvalues: GetLocalPlayerUserIdFunction (copy), PromiseModule (copy), FollowingsUrlBuilderModule (copy), HttpRequestModule (copy)
	local LocalPlayerUserId: number = GetLocalPlayerUserIdFunction()
	
	return if LocalPlayerUserId and LocalPlayerUserId > 0 then HttpRequestModule.config({
		requestFunction = function(p2, p3, p4) --[[ Line: 24 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(FollowingsUrlBuilderModule.buildFollowingStatusUrl(tostring(LocalPlayerUserId), p1), "GET") else PromiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot fetch following status: missing or invalid local player ID"
	})
end