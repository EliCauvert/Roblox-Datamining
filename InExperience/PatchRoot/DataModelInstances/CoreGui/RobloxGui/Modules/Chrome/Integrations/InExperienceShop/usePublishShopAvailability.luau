local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local inExperienceOffersModule = require(corePackagesService.Workspace.Packages.InExperienceOffers)
local useMappedSignal = require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal
local serviceModule = require(chrome.Service)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local getOffersStore = inExperienceOffersModule.getOffersStore

return function()
	-- upvalues: serviceModule (ref), constantsModule (ref), useMappedSignal (ref), reactModule (ref), getOffersStore (ref)
	local iNEXPERIENCESHOPID = serviceModule:integrations()[constantsModule.IN_EXPERIENCE_SHOP_ID]
	local var1 = useMappedSignal(if iNEXPERIENCESHOPID then iNEXPERIENCESHOPID.availability else nil) == serviceModule.AvailabilitySignal.Available
	reactModule.useEffect(function()
		-- upvalues: getOffersStore (copy), var1 (ref)
		getOffersStore(false).setIsShopAvailable(var1)
	end, { var1 })
end