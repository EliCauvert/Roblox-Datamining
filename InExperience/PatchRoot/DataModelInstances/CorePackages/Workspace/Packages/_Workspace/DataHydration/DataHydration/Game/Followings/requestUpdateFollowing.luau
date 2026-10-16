local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local FollowingsUrlBuilderModule = require(script.Parent.FollowingsUrlBuilder)

return function(p1, p2) --[[ Line: 13 | Named "requestUpdateFollowing" ]]
	-- upvalues: GetLocalPlayerUserIdFunction (copy), PromiseModule (copy), FollowingsUrlBuilderModule (copy), HttpRequestModule (copy), HttpService (copy)
	local LocalPlayerUserId: number = GetLocalPlayerUserIdFunction()
	
	return if LocalPlayerUserId and LocalPlayerUserId > 0 then HttpRequestModule.config({
		requestFunction = function(p3, p4, p5) --[[ Line: 25 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.RequestInternal(p3, p4, p5)
		end
	})(FollowingsUrlBuilderModule.buildFollowingUpdateUrl(tostring(LocalPlayerUserId), p1), if p2 then "POST" else "DELETE", {
		postBody = if p2 then HttpService:JSONEncode({}) else nil
	}) else PromiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot update following status: missing or invalid local player ID"
	})
end