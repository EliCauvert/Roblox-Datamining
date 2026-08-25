local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local urlBuilderModule = require(squadsCore.Parent.UrlBuilder)
local loggerModule = require(squadsCore.Logger)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local squadLuckyRecommendationErrorModule = require(squadsCore.Enums.SquadLuckyRecommendationError)
local _ = require(squadsCore.Types)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

return function(p0, p1, p2)
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref), loggerModule (ref), serializeTableModule (ref), squadLuckyRecommendationErrorModule (ref)
	local var6 = httpService:RequestInternal({
		Method = "GET",
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = urlBuilder.new({
			path = "group-up/v1/get-lucky-recommendation",
			base = urlBase.APIS,
			query = { pickRequestId = p0 }
		})()
	})
	local var7 = false
	var6:Start(function(_, p3)
		-- upvalues: var7 (write), httpService (copy), loggerModule (copy), serializeTableModule (copy), p2 (ref), squadLuckyRecommendationErrorModule (copy), p1 (ref)
		if var7 then return end
		if p3 == nil or p3.StatusCode ~= 200 then
			local var9 = if p3 ~= nil then nil else p3.StatusCode
			
			if p2 then
				p2(if var9 == 404 then squadLuckyRecommendationErrorModule.NoRecommendations else squadLuckyRecommendationErrorModule.Failed)
			end
			loggerModule:error("Error getting lucky recommendation: {}", if p3 ~= nil then "request aborted" else p3.StatusMessage)
		else
			local recommendations = httpService:JSONDecode(p3.Body).recommendations
			local var8 = if recommendations then recommendations[1] else nil
			loggerModule:debug("Response: {}", serializeTableModule(p3.Body))
			
			if var8 == nil then
				if p2 then
					p2(squadLuckyRecommendationErrorModule.NoRecommendations)
					
					return
				end
			elseif p1 then
				p1({
					universeId = var8.universeId,
					rootPlaceId = var8.rootPlaceId,
					universeName = var8.universeName
				})
				
				return
			end
		end
	end)
	
	return function()
		-- upvalues: var7 (write), var6 (ref)
		var7 = true
		var6:Cancel()
	end
end