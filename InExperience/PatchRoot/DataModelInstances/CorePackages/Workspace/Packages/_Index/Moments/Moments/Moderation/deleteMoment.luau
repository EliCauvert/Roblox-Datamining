local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local getFFlagMomentsFixDeleteModule = require(moments.Flags.GetFFlagMomentsFixDelete)
local fFlagMomentsPassFeedItemIdToBackendApis = require(parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis
local text = httpModule.Url.APIS_URL .. "content-captures-api/v2/moments/"
local text_1 = httpModule.Url.APIS_URL .. "/posts-api/v1/content-posts/delete/"

return function(p1, p2, p3)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref), getFFlagMomentsFixDeleteModule (ref), httpClientModule (ref), text_1 (ref), text (ref)
	local var1 = p1
	
	if fFlagMomentsPassFeedItemIdToBackendApis then
		if p3 == nil or p3 == "" then
			return promiseModule.reject("feedItemId is required to delete a Moment")
		end
	else
		return if getFFlagMomentsFixDeleteModule() then httpClientModule.asPromise(httpClientModule.fetch({
			method = "DELETE",
			analyticsKey = "moments.delete-moment",
			url = text .. var7,
			network = p2,
			decode = function(_)
				return { ok = true }
			end
		})) else httpClientModule.asPromise(httpClientModule.fetch({
			method = "POST",
			analyticsKey = "moments.delete-moment",
			url = text_1 .. p0,
			body = {},
			network = p2,
			decode = function(_)
				return { ok = true }
			end
		}))
	end
	var1 = "by-feed-item/" .. p2
end