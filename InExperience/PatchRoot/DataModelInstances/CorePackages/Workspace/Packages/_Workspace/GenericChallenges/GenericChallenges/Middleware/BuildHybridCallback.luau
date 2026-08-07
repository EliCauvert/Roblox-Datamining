local javascriptHybridModule = require(script:FindFirstAncestor("GenericChallenges").Types.JavascriptHybrid)
local httpService = game:GetService("HttpService")

return function(p0) --[[ line: 29 ]]
	-- upvalues: httpService (ref), javascriptHybridModule (ref)
	return function(p1) --[[ line: 30 ]]
		-- upvalues: httpService (copy), javascriptHybridModule (copy), p0 (ref)
		local var2 = httpService:JSONDecode(p1)
		
		if var2.moduleID ~= javascriptHybridModule.Module.Navigation or var2.functionName ~= javascriptHybridModule.Function.navigateToFeature or (not var2.params or not var2.params.params) then return end
		local params = var2.params.params
		
		if params.feature == javascriptHybridModule.Feature.ChallengeParsed and params.data.parsed == false then
			p0.OnChallengeLoadFailed(params)
			
			return
		elseif params.feature == javascriptHybridModule.Feature.ChallengeInitialized and params.data.initialized == false then
			p0.OnChallengeLoadFailed(params)
			
			return
		elseif p0.Hooks ~= nil then
			for i, v in p0.Hooks do
				if v(params) then return end
			end
		end
		if params.feature == javascriptHybridModule.Feature.ChallengeCompleted then
			if params.data ~= nil then
				p0.OnChallengeCompleted(params)
				
				return
			elseif p0.OnChallengeAbandoned == nil then
				p0.OnChallengeLoadFailed(params)
				
				return
			end
			p0.OnChallengeAbandoned()
			
			return
		elseif params.feature == javascriptHybridModule.Feature.ChallengeInvalidated then
			p0.OnChallengeInvalidated(params)
			
			return
		elseif var2.params.params.feature == javascriptHybridModule.Feature.ChallengeDisplayed and p0.OnChallengeDisplayed ~= nil then
			p0.OnChallengeDisplayed(params)
		end
	end
end