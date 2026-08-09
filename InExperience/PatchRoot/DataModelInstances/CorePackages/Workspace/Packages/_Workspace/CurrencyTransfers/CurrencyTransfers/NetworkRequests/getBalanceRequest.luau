local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = currencyTransfers.Parent
local contentProviderService = game:GetService("ContentProvider")
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)

local function getEconomyUserCurrencyUrl() --[[ line: 10 ]]
	-- upvalues: contentProviderService (ref)
	return string.gsub(string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:"), "https://www.", "https://economy.") .. "v1/user/currency"
end

return function(p0) --[[ line: 18 | named "getBalanceRequest" ]]
	-- upvalues: httpRequestModule (ref), getEconomyUserCurrencyUrl (ref)
	return httpRequestModule.new(p0):get(getEconomyUserCurrencyUrl()):andThen(function(p1) --[[ line: 21 ]]
		return (if p1.robux ~= nil then p1.Robux else p1.robux) or 0
	end)
end