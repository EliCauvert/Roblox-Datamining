local parent = script:FindFirstAncestor("GraphQLServer").Parent
local makeOmniRecommendationsRequest = require(parent.GraphQlShared).MakeOmniRecommendationsRequest
local _ = require(parent.LuauPolyfill)
local _ = require(parent.Fetch)

local function _(p1)
	return function(p2, _, p3)
		-- upvalues: p1 (ref)
		return p1(p2, {
			method = "POST",
			body = p3.postBody,
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		})
	end
end

return function(p1)
	-- upvalues: makeOmniRecommendationsRequest (ref)
	local var1 = function(p2, _, p3)
		-- upvalues: p1 (ref)
		return p1(p2, {
			method = "POST",
			body = p3.postBody,
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		})
	end
	
	return function(p2, p3, p4, p5)
		-- upvalues: makeOmniRecommendationsRequest (copy), var1 (ref)
		return makeOmniRecommendationsRequest(var1, p2, p3, p4, p5)
	end
end