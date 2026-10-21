local Parent = script:FindFirstAncestor("Moments").Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local Text = require(Parent.Http).Url.APIS_URL .. "content-captures-api/v2/moments/"

return function(Text1, Network)
	-- upvalues: PromiseModule (copy), HttpClientModule (copy), Text (copy)
	return if Text1 == nil or Text1 == "" then PromiseModule.reject("feedItemId is required to delete a Moment") else HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "DELETE",
		analyticsKey = "moments.delete-moment",
		url = Text .. ("by-feed-item/" .. Text1),
		network = Network,
		decode = function(_)
			return { ok = true }
		end
	}))
end