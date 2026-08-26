local javascriptHybridModule = require(script:FindFirstAncestor("GenericChallenges").Types.JavascriptHybrid)
local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: httpService (ref), javascriptHybridModule (ref)
	return function(p2)
		-- upvalues: httpService (copy), javascriptHybridModule (copy), p1 (ref)
		local var1 = httpService:JSONDecode(p2)
		
		if var1.moduleID ~= javascriptHybridModule.Module.Navigation or var1.functionName ~= javascriptHybridModule.Function.navigateToFeature or (not var1.params or not var1.params.params) then return end
		local params = var1.params.params
		
		if params.feature == javascriptHybridModule.Feature.ChallengeParsed and params.data.parsed == false then
			p1.OnChallengeLoadFailed(params)
			
			return
		elseif params.feature == javascriptHybridModule.Feature.ChallengeInitialized and params.data.initialized == false then
			p1.OnChallengeLoadFailed(params)
			
			return
		elseif p1.Hooks ~= nil then
			for i, v in p1.Hooks do
				if v(params) then return end
			end
		end
		if params.feature == javascriptHybridModule.Feature.ChallengeCompleted then
			if params.data ~= nil then
				p1.OnChallengeCompleted(params)
				
				return
			elseif p1.OnChallengeAbandoned == nil then
				p1.OnChallengeLoadFailed(params)
				
				return
			end
			p1.OnChallengeAbandoned()
			
			return
		elseif params.feature == javascriptHybridModule.Feature.ChallengeInvalidated then
			p1.OnChallengeInvalidated(params)
			
			return
		elseif var1.params.params.feature == javascriptHybridModule.Feature.ChallengeDisplayed and p1.OnChallengeDisplayed ~= nil then
			p1.OnChallengeDisplayed(params)
		end
	end
end