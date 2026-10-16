local Parent = script:FindFirstAncestor("Achievements").Parent
local PromiseModule = require(Parent.Promise)
local DashModule = require(Parent.Dash)
local MakeOmniRecommendationsRequestFunction = require(Parent.GraphQlShared).MakeOmniRecommendationsRequest

return function(p1, _) --[[ Line: 44 ]]
	-- upvalues: MakeOmniRecommendationsRequestFunction (copy), PromiseModule (copy), DashModule (copy)
	return MakeOmniRecommendationsRequestFunction(p1, "Home", "0", nil, nil, nil, { (tostring(100000003)) }):andThen(function(Result) --[[ Line: 47 ]]
		-- upvalues: PromiseModule (upval), DashModule (upval)
		if Result.responseBody == nil then
			return PromiseModule.reject("Response has no body.")
		end
		local Sorts = Result.responseBody.sorts
		
		if not Sorts then
			return PromiseModule.reject("Response has no sorts.")
		end
		local t = {}
		
		for _, sort in pairs(Sorts) do
			if sort.topicId == 100000003 then
				local RecommendationList = sort.recommendationList
				
				if not RecommendationList then
					return PromiseModule.reject("No recommendation list found in sorts.")
				end
				t = RecommendationList
				break
			end
		end
		local CountT = #t
		
		if not DashModule.find(t, function(p2): boolean --[[ Line: 73 ]]
			return p2.contentId == game.GameId
		end) then
			CountT += 1
		end
		return PromiseModule.resolve(CountT)
	end)
end