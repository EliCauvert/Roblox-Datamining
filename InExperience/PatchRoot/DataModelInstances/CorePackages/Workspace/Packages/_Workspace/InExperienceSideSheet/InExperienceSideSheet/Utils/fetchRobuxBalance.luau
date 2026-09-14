local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local contentProviderService = game:GetService("ContentProvider")
local httpService = game:GetService("HttpService")
local toEconomyCurrencyUrlModule = require(inExperienceSideSheet.Utils.toEconomyCurrencyUrl)
local extractRobuxBalanceModule = require(inExperienceSideSheet.Utils.extractRobuxBalance)

return function(p1)
	-- upvalues: httpService (ref), toEconomyCurrencyUrlModule (ref), contentProviderService (ref), extractRobuxBalanceModule (ref)
	httpService:RequestInternal({
		Method = "GET",
		Url = toEconomyCurrencyUrlModule(contentProviderService.BaseUrl)
	}):Start(function(p2, p3)
		-- upvalues: httpService (copy), extractRobuxBalanceModule (copy), p1 (ref)
		if not p2 then return end
		local ok, status = pcall(httpService.JSONDecode, httpService, p3.Body)
		
		if not ok then return end
		local var1 = extractRobuxBalanceModule(status)
		
		if var1 ~= nil then
			p1(var1)
		end
	end)
end