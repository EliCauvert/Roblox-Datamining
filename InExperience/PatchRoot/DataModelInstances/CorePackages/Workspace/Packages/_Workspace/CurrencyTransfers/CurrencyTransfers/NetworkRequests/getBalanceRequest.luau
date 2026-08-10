local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = currencyTransfers.Parent
local contentProviderService = game:GetService("ContentProvider")
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)

local function getEconomyUserCurrencyUrl() --[[ line: 10 ]]
	-- upvalues: contentProviderService (ref)
	return string.gsub(string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:"), "https://www.", "https://economy.") .. "v1/user/currency"
end

return function(p0, p1) --[[ line: 18 | named "getBalanceRequest" ]]
	-- upvalues: httpRequestModule (ref), getEconomyUserCurrencyUrl (ref)
	return (if p1 ~= nil then httpRequestModule.new(p0) else httpRequestModule.fromNetworkImpl(p1)):get(getEconomyUserCurrencyUrl()):andThen(function(p2) --[[ line: 23 ]]
		return (if p2.robux ~= nil then p2.Robux else p2.robux) or 0
	end)
end