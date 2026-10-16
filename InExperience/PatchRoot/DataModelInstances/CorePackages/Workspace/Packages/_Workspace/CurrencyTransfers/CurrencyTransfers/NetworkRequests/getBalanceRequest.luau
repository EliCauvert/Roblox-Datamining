local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = CurrencyTransfers.Parent
local ContentProvider = game:GetService("ContentProvider")
local HttpRequestModule = require(CurrencyTransfers.NetworkRequests.HttpRequest)

local function getEconomyUserCurrencyUrl(): string --[[ Line: 10 ]]
	-- upvalues: ContentProvider (copy)
	return string.gsub(string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "/m.", "/www."), "http:", "https:"), "https://www.", "https://economy.") .. "v1/user/currency"
end

return function(p1, p2) --[[ Line: 18 | Named "getBalanceRequest" ]]
	-- upvalues: HttpRequestModule (copy), getEconomyUserCurrencyUrl (copy)
	return (if p2 == nil then HttpRequestModule.new(p1) else HttpRequestModule.fromNetworkImpl(p2)):get((getEconomyUserCurrencyUrl())):andThen(function(Result) --[[ Line: 23 ]]
		return (if Result.robux == nil then Result.Robux else Result.robux) or 0
	end)
end