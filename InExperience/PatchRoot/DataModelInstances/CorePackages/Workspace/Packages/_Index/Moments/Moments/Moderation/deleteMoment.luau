local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local getFFlagMomentsFixDeleteModule = require(moments.Flags.GetFFlagMomentsFixDelete)
local text = httpModule.Url.APIS_URL .. "content-captures-api/v2/moments/"
local text_1 = httpModule.Url.APIS_URL .. "/posts-api/v1/content-posts/delete/"

return function(p0, p1) --[[ line: 26 | named "deleteMoment" ]]
	-- upvalues: getFFlagMomentsFixDeleteModule (ref), httpClientModule (ref), text_1 (ref), text (ref)
	return if getFFlagMomentsFixDeleteModule() then httpClientModule.asPromise(httpClientModule.fetch({
		method = "DELETE",
		analyticsKey = "moments.delete-moment",
		url = text .. p0,
		network = p1,
		decode = function(_) --[[ line: 46 ]]
			return { ok = true }
		end
	})) else httpClientModule.asPromise(httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.delete-moment",
		url = text_1 .. p0,
		body = {},
		network = p1,
		decode = function(_) --[[ line: 35 ]]
			return { ok = true }
		end
	}))
end