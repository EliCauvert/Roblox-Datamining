local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseMappedSignalFunction = require(CorePackages.Workspace.Packages.Chrome).Hooks.useMappedSignal
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local GetOffersStoreFunction = require(CorePackages.Workspace.Packages.InExperienceOffers).getOffersStore

return function()
	-- upvalues: ServiceModule (copy), ConstantsModule (copy), UseMappedSignalFunction (copy), ReactModule (copy), GetOffersStoreFunction (copy)
	local IntegrationsResultEntry = ServiceModule:integrations()[ConstantsModule.IN_EXPERIENCE_SHOP_ID]
	local IsUseMappedSignalResultMatch = UseMappedSignalFunction(if IntegrationsResultEntry then IntegrationsResultEntry.availability else nil) == ServiceModule.AvailabilitySignal.Available
	ReactModule.useEffect(function()
		-- upvalues: GetOffersStoreFunction (upval), IsUseMappedSignalResultMatch (copy)
		GetOffersStoreFunction(false).setIsShopAvailable(IsUseMappedSignalResultMatch)
	end, { IsUseMappedSignalResultMatch })
end