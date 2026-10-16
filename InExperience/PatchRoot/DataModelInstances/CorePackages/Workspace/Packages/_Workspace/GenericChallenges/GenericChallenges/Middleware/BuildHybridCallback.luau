local JavascriptHybridModule = require(script:FindFirstAncestor("GenericChallenges").Types.JavascriptHybrid)
local HttpService = game:GetService("HttpService")

return function(p1) --[[ Line: 29 ]]
	-- upvalues: HttpService (copy), JavascriptHybridModule (copy)
	return function(Input) --[[ Line: 30 ]]
		-- upvalues: HttpService (upval), JavascriptHybridModule (upval), p1 (copy)
		local Data = HttpService:JSONDecode(Input)
		
		if Data.moduleID ~= JavascriptHybridModule.Module.Navigation or Data.functionName ~= JavascriptHybridModule.Function.navigateToFeature or not Data.params or not Data.params.params then return end
		local Params = Data.params.params
		
		if Params.feature == JavascriptHybridModule.Feature.ChallengeParsed and Params.data.parsed == false then
			p1.OnChallengeLoadFailed(Params)
			
			return
		end
		if Params.feature == JavascriptHybridModule.Feature.ChallengeInitialized and Params.data.initialized == false then
			p1.OnChallengeLoadFailed(Params)
			
			return
		end
		if p1.Hooks ~= nil then
			for _, hook in p1.Hooks do
				if hook(Params) then return end
			end
		end
		if Params.feature == JavascriptHybridModule.Feature.ChallengeCompleted then
			if Params.data ~= nil then
				p1.OnChallengeCompleted(Params)
				
				return
			end
			if p1.OnChallengeAbandoned == nil then
				p1.OnChallengeLoadFailed(Params)
				
				return
			else
				p1.OnChallengeAbandoned()
				
				return
			end
		elseif Params.feature == JavascriptHybridModule.Feature.ChallengeInvalidated then
			p1.OnChallengeInvalidated(Params)
			
			return
		else
			if Data.params.params.feature == JavascriptHybridModule.Feature.ChallengeDisplayed and p1.OnChallengeDisplayed ~= nil then
				p1.OnChallengeDisplayed(Params)
			end
		end
	end
end