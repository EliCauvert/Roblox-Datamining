local parent = script:FindFirstAncestor("GraphQLServer").Parent
local makeOmniRecommendationsRequest = require(parent.GraphQlShared).MakeOmniRecommendationsRequest
local _ = require(parent.LuauPolyfill)
local _ = require(parent.Fetch)

local function _(p0)
	return function(p1, _, p2)
		-- upvalues: p0 (ref)
		return p0(p1, {
			method = "POST",
			body = p2.postBody,
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		})
	end
end

return function(p3)
	-- upvalues: makeOmniRecommendationsRequest (ref)
	local var0 = function(p4, _, p5)
		-- upvalues: p3 (ref)
		return p3(p4, {
			method = "POST",
			body = p5.postBody,
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		})
	end
	
	return function(p6, p7, p8, p9)
		-- upvalues: makeOmniRecommendationsRequest (copy), var0 (ref)
		return makeOmniRecommendationsRequest(var0, p6, p7, p8, p9)
	end
end