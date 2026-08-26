local parent = script:FindFirstAncestor("Achievements").Parent
local promiseModule = require(parent.Promise)
local dashModule = require(parent.Dash)
local makeOmniRecommendationsRequest = require(parent.GraphQlShared).MakeOmniRecommendationsRequest

return function(p1, _)
	-- upvalues: makeOmniRecommendationsRequest (ref), promiseModule (ref), dashModule (ref)
	return makeOmniRecommendationsRequest(p1, "Home", "0", nil, nil, nil, { tostring(100000003) }):andThen(function(p2)
		-- upvalues: promiseModule (copy), dashModule (copy)
		if p2.responseBody == nil then
			return promiseModule.reject("Response has no body.")
		end
		local sorts = p2.responseBody.sorts
		
		if not sorts then
			return promiseModule.reject("Response has no sorts.")
		end
		local t = {}
		
		for i, v in pairs(sorts) do
			if v.topicId == 100000003 then
				local recommendationList = v.recommendationList
				
				if not recommendationList then
					return promiseModule.reject("No recommendation list found in sorts.")
				end
				t = recommendationList
				break
			end
		end
		local tCount = #t
		
		if not dashModule.find(t, function(p3)
			return p3.contentId == game.GameId
		end) then
			tCount += 1
		end
		return promiseModule.resolve(tCount)
	end)
end