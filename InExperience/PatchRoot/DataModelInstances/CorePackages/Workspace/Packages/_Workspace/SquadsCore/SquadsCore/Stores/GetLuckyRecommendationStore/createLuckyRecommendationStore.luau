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
	local var1, var2 = signalsModule.createSignal({ phase = squadLuckyRecommendationPhaseModule.Idle })
	local var3 = nil
	local var4 = nil
	
	local var5 = function(p1, p2)
		-- upvalues: var3 (write), squadLuckyRecommendationRevealTypeModule (copy), var4 (write), var2 (ref), squadLuckyRecommendationPhaseModule (copy), getLuckyRecommendation (copy)
		if var3 then
			var3()
			var3 = nil
		end
		local t = {
			result = nil,
			pickRequestId = p1,
			squadId = p2,
			revealType = squadLuckyRecommendationRevealTypeModule.Default
		}
		var4 = t
		var2({ phase = squadLuckyRecommendationPhaseModule.Rolling })
		var3 = getLuckyRecommendation(p1, function(p3)
			-- upvalues: var3 (copy), t (ref)
			var3 = nil
			t.result = { isSuccess = true, recommendation = p3 }
		end, function(p3)
			-- upvalues: var3 (copy), t (ref)
			var3 = nil
			t.result = { isSuccess = false, error = p3 }
		end)
	end
	
	return {
		getState = var1,
		getAnalyticsContext = function()
			-- upvalues: var4 (write)
			return {
				pickRequestId = if var4 then var4.pickRequestId else nil,
				revealType = if var4 then var4.revealType else nil
			}
		end,
		startRoll = function(p1, p2)
			-- upvalues: var4 (write), var1 (ref), squadLuckyRecommendationPhaseModule (copy), squadLuckyRecommendationRevealTypeModule (copy), httpService (copy), var5 (ref)
			if p2 and var4 ~= nil and var4.squadId == p1 then
				if var1(false).phase == squadLuckyRecommendationPhaseModule.Revealed then
					var4.revealType = squadLuckyRecommendationRevealTypeModule.Restored
					
					return
				elseif var4.result == nil or not var4.result.isSuccess then
					var5(httpService:GenerateGUID(false), p1)
					
					return
				else
					var4.revealType = squadLuckyRecommendationRevealTypeModule.Preloaded
				end
			end
		end,
		endRoll = function()
			-- upvalues: var1 (ref), squadLuckyRecommendationPhaseModule (copy), var3 (write), var4 (write), var2 (ref), squadLuckyRecommendationErrorModule (copy)
			if var1(false).phase ~= squadLuckyRecommendationPhaseModule.Rolling then return end
			if var3 then
				var3()
				var3 = nil
			end
			local var6 = if var4 ~= nil then nil else var4.result
			
			if var6 == nil then
				var2({
					phase = squadLuckyRecommendationPhaseModule.Errored,
					error = squadLuckyRecommendationErrorModule.Timeout
				})
				
				return
			elseif var6.isSuccess then
				var2({
					phase = squadLuckyRecommendationPhaseModule.Revealed,
					recommendation = var6.recommendation
				})
				
				return
			end
			var2({
				phase = squadLuckyRecommendationPhaseModule.Errored,
				error = var6.error
			})
		end,
		cancelFetch = function()
			-- upvalues: var3 (write)
			if var3 then
				var3()
				var3 = nil
			end
		end
	}
end