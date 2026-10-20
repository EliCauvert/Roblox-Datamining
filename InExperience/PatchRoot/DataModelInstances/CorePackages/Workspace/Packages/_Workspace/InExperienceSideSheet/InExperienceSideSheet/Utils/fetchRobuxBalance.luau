local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local ToEconomyCurrencyUrlModule = require(InExperienceSideSheet.Utils.toEconomyCurrencyUrl)
local ExtractRobuxBalanceModule = require(InExperienceSideSheet.Utils.extractRobuxBalance)

return function(Callback)
	-- upvalues: HttpService (copy), ToEconomyCurrencyUrlModule (copy), ContentProvider (copy), ExtractRobuxBalanceModule (copy)
	HttpService:RequestInternal({
		Method = "GET",
		Url = ToEconomyCurrencyUrlModule(ContentProvider.BaseUrl)
	}):Start(function(p1, p2)
		-- upvalues: HttpService (upval), ExtractRobuxBalanceModule (upval), Callback (copy)
		if not p1 then return end
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p2.Body)
		
		if not Success then return end
		local ExtractRobuxBalanceModuleResult = ExtractRobuxBalanceModule(Result)
		
		if ExtractRobuxBalanceModuleResult ~= nil then
			Callback(ExtractRobuxBalanceModuleResult)
		end
	end)
end