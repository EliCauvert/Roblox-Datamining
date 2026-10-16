local HttpService = game:GetService("HttpService")
local SquadsCore = script:FindFirstAncestor("SquadsCore")
local UrlBuilderModule = require(SquadsCore.Parent.UrlBuilder)
local LoggerModule = require(SquadsCore.Logger)
local SerializeTableModule = require(SquadsCore.Utils.serializeTable)
local SquadLuckyRecommendationErrorModule = require(SquadsCore.Enums.SquadLuckyRecommendationError)
local _ = require(SquadsCore.Types)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase

return function(PickRequestId, Callback1, Callback) --[[ Line: 20 ]]
	-- upvalues: UrlBuilder (copy), UrlBase (copy), HttpService (copy), LoggerModule (copy), SerializeTableModule (copy), SquadLuckyRecommendationErrorModule (copy)
	local RequestInternalResult = HttpService:RequestInternal({
		Method = "GET",
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = UrlBuilder.new({
			path = "group-up/v1/get-lucky-recommendation",
			base = UrlBase.APIS,
			query = { pickRequestId = PickRequestId }
		})()
	})
	local Flag = false
	RequestInternalResult:Start(function(_, p1) --[[ Line: 44 ]]
		-- upvalues: Flag (ref), HttpService (upval), LoggerModule (upval), SerializeTableModule (upval), Callback (copy), SquadLuckyRecommendationErrorModule (upval), Callback1 (copy)
		if Flag then return end
		if p1 == nil or p1.StatusCode ~= 200 then
			local StatusCode = if p1 == nil then nil else p1.StatusCode
			
			if Callback then
				Callback(if StatusCode == 404 then SquadLuckyRecommendationErrorModule.NoRecommendations else SquadLuckyRecommendationErrorModule.Failed)
			end
			LoggerModule:error("Error getting lucky recommendation: {}", if p1 == nil then "request aborted" else p1.StatusMessage)
		else
			local Recommendations = HttpService:JSONDecode(p1.Body).recommendations
			local Recommendation = if Recommendations then Recommendations[1] else nil
			LoggerModule:debug("Response: {}", SerializeTableModule(p1.Body))
			
			if Recommendation == nil then
				if Callback then
					Callback(SquadLuckyRecommendationErrorModule.NoRecommendations)
					
					return
				end
			elseif Callback1 then
				Callback1({
					universeId = Recommendation.universeId,
					rootPlaceId = Recommendation.rootPlaceId,
					universeName = Recommendation.universeName
				})
				
				return
			end
		end
	end)
	
	return function() --[[ Line: 84 ]]
		-- upvalues: Flag (ref), RequestInternalResult (copy)
		Flag = true
		RequestInternalResult:Cancel()
	end
end