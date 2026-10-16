local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local MakeOmniRecommendationsRequestFunction = require(Parent.GraphQlShared).MakeOmniRecommendationsRequest
local _ = require(Parent.LuauPolyfill)
local _ = require(Parent.Fetch)

local function _(p1) --[[ Line: 11 | Named "makeNetworkImpl" ]]
	return function(p2, _, p3) --[[ Line: 12 ]]
		-- upvalues: p1 (copy)
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

return function(Callback) --[[ Line: 24 ]]
	-- upvalues: MakeOmniRecommendationsRequestFunction (copy)
	local function v4(p1, _, p2) --[[ Line: 12 ]]
		-- upvalues: Callback (copy)
		return Callback(p1, {
			method = "POST",
			body = p2.postBody,
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		})
	end
	
	return function(p1, p2, p3, p4) --[[ Line: 26 ]]
		-- upvalues: MakeOmniRecommendationsRequestFunction (upval), v4 (copy)
		return MakeOmniRecommendationsRequestFunction(v4, p1, p2, p3, p4)
	end
end