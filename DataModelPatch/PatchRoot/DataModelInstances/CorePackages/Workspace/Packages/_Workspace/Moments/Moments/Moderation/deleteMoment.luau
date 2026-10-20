local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local GetFFlagMomentsFixDeleteModule = require(Moments.Flags.GetFFlagMomentsFixDelete)
local Text = HttpModule.Url.APIS_URL .. "content-captures-api/v2/moments/"
local Text1 = HttpModule.Url.APIS_URL .. "/posts-api/v1/content-posts/delete/"

return function(Text2, Network)
	-- upvalues: GetFFlagMomentsFixDeleteModule (copy), HttpClientModule (copy), Text1 (copy), Text (copy)
	return if GetFFlagMomentsFixDeleteModule() then HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "DELETE",
		analyticsKey = "moments.delete-moment",
		url = Text .. Text2,
		network = Network,
		decode = function(_)
			return { ok = true }
		end
	})) else HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.delete-moment",
		url = Text1 .. Text2,
		body = {},
		network = Network,
		decode = function(_)
			return { ok = true }
		end
	}))
end