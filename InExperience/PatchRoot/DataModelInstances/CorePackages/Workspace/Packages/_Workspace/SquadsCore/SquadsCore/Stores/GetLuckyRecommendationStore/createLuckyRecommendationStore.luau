local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local signalsModule = require(squadsCore.Parent.Signals)
local getLuckyRecommendation = require(squadsCore.NetworkRequests).getLuckyRecommendation
local squadLuckyRecommendationErrorModule = require(squadsCore.Enums.SquadLuckyRecommendationError)
local squadLuckyRecommendationPhaseModule = require(squadsCore.Enums.SquadLuckyRecommendationPhase)
local squadLuckyRecommendationRevealTypeModule = require(squadsCore.Enums.SquadLuckyRecommendationRevealType)
local _ = require(squadsCore.Types)

return function()
	-- upvalues: signalsModule (ref), squadLuckyRecommendationPhaseModule (ref), squadLuckyRecommendationRevealTypeModule (ref), getLuckyRecommendation (ref), httpService (ref), squadLuckyRecommendationErrorModule (ref)
	local var6, var7 = signalsModule.createSignal({ phase = squadLuckyRecommendationPhaseModule.Idle })
	local var8 = nil
	local var9 = nil
	
	local var10 = function(p0, p1)
		-- upvalues: var8 (write), squadLuckyRecommendationRevealTypeModule (copy), var9 (write), var7 (ref), squadLuckyRecommendationPhaseModule (copy), getLuckyRecommendation (copy)
		if var8 then
			var8()
			var8 = nil
		end
		local t = {
			result = nil,
			pickRequestId = p0,
			squadId = p1,
			revealType = squadLuckyRecommendationRevealTypeModule.Default
		}
		var9 = t
		var7({ phase = squadLuckyRecommendationPhaseModule.Rolling })
		var8 = getLuckyRecommendation(p0, function(p2)
			-- upvalues: var8 (copy), t (ref)
			var8 = nil
			t.result = { isSuccess = true, recommendation = p2 }
		end, function(p3)
			-- upvalues: var8 (copy), t (ref)
			var8 = nil
			t.result = { isSuccess = false, error = p3 }
		end)
	end
	
	return {
		getState = var6,
		getAnalyticsContext = function()
			-- upvalues: var9 (write)
			return {
				pickRequestId = if var9 then var9.pickRequestId else nil,
				revealType = if var9 then var9.revealType else nil
			}
		end,
		startRoll = function(p4, p5)
			-- upvalues: var9 (write), var6 (ref), squadLuckyRecommendationPhaseModule (copy), squadLuckyRecommendationRevealTypeModule (copy), httpService (copy), var10 (ref)
			if p5 and var9 ~= nil and var9.squadId == p4 then
				if var6(false).phase == squadLuckyRecommendationPhaseModule.Revealed then
					var9.revealType = squadLuckyRecommendationRevealTypeModule.Restored
					
					return
				elseif var9.result == nil or not var9.result.isSuccess then
					var10(httpService:GenerateGUID(false), p4)
					
					return
				else
					var9.revealType = squadLuckyRecommendationRevealTypeModule.Preloaded
				end
			end
		end,
		endRoll = function()
			-- upvalues: var6 (ref), squadLuckyRecommendationPhaseModule (copy), var8 (write), var9 (write), var7 (ref), squadLuckyRecommendationErrorModule (copy)
			if var6(false).phase ~= squadLuckyRecommendationPhaseModule.Rolling then return end
			if var8 then
				var8()
				var8 = nil
			end
			local var12 = if var9 ~= nil then nil else var9.result
			
			if var12 == nil then
				var7({
					phase = squadLuckyRecommendationPhaseModule.Errored,
					error = squadLuckyRecommendationErrorModule.Timeout
				})
				
				return
			elseif var12.isSuccess then
				var7({
					phase = squadLuckyRecommendationPhaseModule.Revealed,
					recommendation = var12.recommendation
				})
				
				return
			end
			var7({
				phase = squadLuckyRecommendationPhaseModule.Errored,
				error = var12.error
			})
		end,
		cancelFetch = function()
			-- upvalues: var8 (write)
			if var8 then
				var8()
				var8 = nil
			end
		end
	}
end