local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = CurrencyTransfers.Parent
local ContentProvider = game:GetService("ContentProvider")
local HttpRequestModule = require(CurrencyTransfers.NetworkRequests.HttpRequest)

local function getEconomyUserCurrencyUrl(): string
	-- upvalues: ContentProvider (copy)
	return string.gsub(string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "/m.", "/www."), "http:", "https:"), "https://www.", "https://economy.") .. "v1/user/currency"
end

return function(p1)
	-- upvalues: HttpRequestModule (copy), getEconomyUserCurrencyUrl (copy)
	return HttpRequestModule.new(p1):get((getEconomyUserCurrencyUrl())):andThen(function(Result)
		return (if Result.robux == nil then Result.Robux else Result.robux) or 0
	end)
end