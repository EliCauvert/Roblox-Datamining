local HttpService = game:GetService("HttpService")
local SquadsCore = script:FindFirstAncestor("SquadsCore")
local SignalsModule = require(SquadsCore.Parent.Signals)
local GetLuckyRecommendationFunction = require(SquadsCore.NetworkRequests).getLuckyRecommendation
local SquadLuckyRecommendationErrorModule = require(SquadsCore.Enums.SquadLuckyRecommendationError)
local SquadLuckyRecommendationPhaseModule = require(SquadsCore.Enums.SquadLuckyRecommendationPhase)
local SquadLuckyRecommendationRevealTypeModule = require(SquadsCore.Enums.SquadLuckyRecommendationRevealType)
local _ = require(SquadsCore.Types)

return function() --[[ Line: 46 ]]
	-- upvalues: SignalsModule (copy), SquadLuckyRecommendationPhaseModule (copy), SquadLuckyRecommendationRevealTypeModule (copy), GetLuckyRecommendationFunction (copy), HttpService (copy), SquadLuckyRecommendationErrorModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({ phase = SquadLuckyRecommendationPhaseModule.Idle })
	local Callback: (() -> ())? = nil
	local AnalyticsContext = nil
	
	local function v10(PickRequestId, SquadId) --[[ Line: 60 ]]
		-- upvalues: Callback (ref), SquadLuckyRecommendationRevealTypeModule (upval), AnalyticsContext (ref), Signal2 (copy), SquadLuckyRecommendationPhaseModule (upval), GetLuckyRecommendationFunction (upval)
		if Callback then
			Callback()
			Callback = nil
		end
		local config = {
			result = nil,
			pickRequestId = PickRequestId,
			squadId = SquadId,
			revealType = SquadLuckyRecommendationRevealTypeModule.Default
		}
		AnalyticsContext = config
		Signal2({ phase = SquadLuckyRecommendationPhaseModule.Rolling })
		Callback = GetLuckyRecommendationFunction(PickRequestId, function(Recommendation) --[[ Line: 71 ]]
			-- upvalues: Callback (upval), config (copy)
			Callback = nil
			config.result = { isSuccess = true, recommendation = Recommendation }
		end, function(p1) --[[ Line: 74 ]]
			-- upvalues: Callback (upval), config (copy)
			Callback = nil
			config.result = { isSuccess = false, error = p1 }
		end)
	end
	
	return {
		getState = Signal,
		getAnalyticsContext = function() --[[ Line: 119 ]]
			-- upvalues: AnalyticsContext (ref)
			return {
				pickRequestId = if AnalyticsContext then AnalyticsContext.pickRequestId else nil,
				revealType = if AnalyticsContext then AnalyticsContext.revealType else nil
			}
		end,
		startRoll = function(SquadId, p1) --[[ Line: 80 ]]
			-- upvalues: AnalyticsContext (ref), Signal (copy), SquadLuckyRecommendationPhaseModule (upval), SquadLuckyRecommendationRevealTypeModule (upval), HttpService (upval), v10 (copy)
			if p1 and AnalyticsContext ~= nil and AnalyticsContext.squadId == SquadId then
				if Signal(false).phase == SquadLuckyRecommendationPhaseModule.Revealed then
					AnalyticsContext.revealType = SquadLuckyRecommendationRevealTypeModule.Restored
					
					return
				end
				if AnalyticsContext.result ~= nil and AnalyticsContext.result.isSuccess then
					AnalyticsContext.revealType = SquadLuckyRecommendationRevealTypeModule.Preloaded
					
					return
				end
			end
			v10(HttpService:GenerateGUID(false), SquadId)
		end,
		endRoll = function() --[[ Line: 95 ]]
			-- upvalues: Signal (copy), SquadLuckyRecommendationPhaseModule (upval), Callback (ref), AnalyticsContext (ref), Signal2 (copy), SquadLuckyRecommendationErrorModule (upval)
			if Signal(false).phase ~= SquadLuckyRecommendationPhaseModule.Rolling then return end
			if Callback then
				Callback()
				Callback = nil
			end
			local Result = if AnalyticsContext == nil then nil else AnalyticsContext.result
			
			if Result == nil then
				Signal2({
					phase = SquadLuckyRecommendationPhaseModule.Errored,
					error = SquadLuckyRecommendationErrorModule.Timeout
				})
				
				return
			end
			if Result.isSuccess then
				Signal2({
					phase = SquadLuckyRecommendationPhaseModule.Revealed,
					recommendation = Result.recommendation
				})
				
				return
			else
				Signal2({
					phase = SquadLuckyRecommendationPhaseModule.Errored,
					error = Result.error
				})
			end
		end,
		cancelFetch = function() --[[ Line: 53 ]]
			-- upvalues: Callback (ref)
			if Callback then
				Callback()
				Callback = nil
			end
		end
	}
end