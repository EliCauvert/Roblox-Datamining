local Parent = script:FindFirstAncestor("Moments").Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local FFlagMomentsPassFeedItemIdToBackendApis = require(Parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis
local Text = require(Parent.Http).Url.APIS_URL .. "content-captures-api/v2/moments/"

return function(p1, Network, Text1) --[[ Line: 22 | Named "deleteMoment" ]]
	-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (copy), PromiseModule (copy), HttpClientModule (copy), Text (copy)
	local v1: string = p1
	
	if FFlagMomentsPassFeedItemIdToBackendApis then
		if Text1 == nil or Text1 == "" then
			return PromiseModule.reject("feedItemId is required to delete a Moment")
		end
		v1 = "by-feed-item/" .. Text1
	end
	return HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "DELETE",
		analyticsKey = "moments.delete-moment",
		url = Text .. v1,
		network = Network,
		decode = function(_) --[[ Line: 36 ]]
			return { ok = true }
		end
	}))
end