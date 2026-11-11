local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local TransferContextModule = require(CurrencyTransfers.Contexts.TransferContext)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Localization = require(Parent.AppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider

return function(p1)
	-- upvalues: Localization (copy), LocalizationService (copy), ReactModule (copy), LocalizationProvider (copy), FoundationProvider (copy), FoundationModule (copy), TransferContextModule (copy)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	
	return function(p2)
		-- upvalues: ReactModule (upval), LocalizationProvider (upval), NewLocalization (copy), FoundationProvider (upval), FoundationModule (upval), TransferContextModule (upval), p1 (copy)
		return ReactModule.createElement(LocalizationProvider, { localization = NewLocalization }, {
			ReactModule.createElement(FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
				ReactModule.createElement(TransferContextModule.Provider, { value = p1.transferStore }, p2.children)
			})
		})
	end
end