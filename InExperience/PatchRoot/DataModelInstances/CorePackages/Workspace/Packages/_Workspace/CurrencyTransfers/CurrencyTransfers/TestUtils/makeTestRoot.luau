local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local transferContextModule = require(currencyTransfers.Contexts.TransferContext)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local localization = require(parent.AppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider

return function(p1)
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationProvider (ref), foundationModule (ref), transferContextModule (ref)
	local var1 = localization.new(localizationService.RobloxLocaleId)
	
	return function(p2)
		-- upvalues: reactModule (copy), localizationProvider (copy), var1 (ref), foundationProvider (copy), foundationModule (copy), transferContextModule (copy), p1 (ref)
		return reactModule.createElement(localizationProvider, { localization = var1 }, {
			reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
				reactModule.createElement(transferContextModule.Provider, { value = p1.transferStore }, p2.children)
			})
		})
	end
end