local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local transferContextModule = require(currencyTransfers.Contexts.TransferContext)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local localization = require(parent.AppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider

return function(p0) --[[ line: 16 ]]
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationProvider (ref), foundationModule (ref), transferContextModule (ref)
	local var5 = localization.new(localizationService.RobloxLocaleId)
	
	return function(p1) --[[ line: 18 ]]
		-- upvalues: reactModule (copy), localizationProvider (copy), var5 (ref), foundationProvider (copy), foundationModule (copy), transferContextModule (copy), p0 (ref)
		return reactModule.createElement(localizationProvider, { localization = var5 }, {
			reactModule.createElement(foundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
				reactModule.createElement(transferContextModule.Provider, { value = p0.transferStore }, p1.children)
			})
		})
	end
end