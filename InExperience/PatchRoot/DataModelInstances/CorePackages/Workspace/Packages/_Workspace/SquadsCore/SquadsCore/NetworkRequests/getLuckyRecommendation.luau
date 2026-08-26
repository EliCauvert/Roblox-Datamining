local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local urlBuilderModule = require(squadsCore.Parent.UrlBuilder)
local loggerModule = require(squadsCore.Logger)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local squadLuckyRecommendationErrorModule = require(squadsCore.Enums.SquadLuckyRecommendationError)
local _ = require(squadsCore.Types)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

return function(p1, p2, p3)
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref), loggerModule (ref), serializeTableModule (ref), squadLuckyRecommendationErrorModule (ref)
	local var1 = httpService:RequestInternal({
		Method = "GET",
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = urlBuilder.new({
			path = "group-up/v1/get-lucky-recommendation",
			base = urlBase.APIS,
			query = { pickRequestId = p1 }
		})()
	})
	local var2 = false
	var1:Start(function(_, p4)
		-- upvalues: var2 (write), httpService (copy), loggerModule (copy), serializeTableModule (copy), p3 (ref), squadLuckyRecommendationErrorModule (copy), p2 (ref)
		if var2 then return end
		if p4 == nil or p4.StatusCode ~= 200 then
			local var3 = if p4 ~= nil then nil else p4.StatusCode
			
			if p3 then
				p3(if var3 == 404 then squadLuckyRecommendationErrorModule.NoRecommendations else squadLuckyRecommendationErrorModule.Failed)
			end
			loggerModule:error("Error getting lucky recommendation: {}", if p4 ~= nil then "request aborted" else p4.StatusMessage)
		else
			local recommendations = httpService:JSONDecode(p4.Body).recommendations
			local var4 = if recommendations then recommendations[1] else nil
			loggerModule:debug("Response: {}", serializeTableModule(p4.Body))
			
			if var4 == nil then
				if p3 then
					p3(squadLuckyRecommendationErrorModule.NoRecommendations)
					
					return
				end
			elseif p2 then
				p2({
					universeId = var4.universeId,
					rootPlaceId = var4.rootPlaceId,
					universeName = var4.universeName
				})
				
				return
			end
		end
	end)
	
	return function()
		-- upvalues: var2 (write), var1 (ref)
		var2 = true
		var1:Cancel()
	end
end