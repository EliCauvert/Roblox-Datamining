local parent = script:FindFirstAncestor("Moments").Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local fFlagMomentsPassFeedItemIdToBackendApis = require(parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis
local text = httpModule.Url.APIS_URL .. "content-captures-api/v2/moments/"

return function(p1, p2, p3)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref), httpClientModule (ref), text (ref)
	local var1 = p1
	
	if fFlagMomentsPassFeedItemIdToBackendApis then
		if p3 == nil or p3 == "" then
			return promiseModule.reject("feedItemId is required to delete a Moment")
		end
		var1 = "by-feed-item/" .. p2
	end
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "DELETE",
		analyticsKey = "moments.delete-moment",
		url = text .. var4,
		network = p2,
		decode = function(_)
			return { ok = true }
		end
	}))
end