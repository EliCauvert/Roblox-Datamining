local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = currencyTransfers.Parent
local contentProviderService = game:GetService("ContentProvider")
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)

local function getEconomyUserCurrencyUrl()
	-- upvalues: contentProviderService (ref)
	return string.gsub(string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:"), "https://www.", "https://economy.") .. "v1/user/currency"
end

return function(p1, p2)
	-- upvalues: httpRequestModule (ref), getEconomyUserCurrencyUrl (ref)
	return (if p2 ~= nil then httpRequestModule.new(p1) else httpRequestModule.fromNetworkImpl(p2)):get(getEconomyUserCurrencyUrl()):andThen(function(p3)
		return (if p3.robux ~= nil then p3.Robux else p3.robux) or 0
	end)
end