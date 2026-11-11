local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local MarketplaceFeeInfoModule = require(Modules.AvatarExperience.Common.Models.MarketplaceFeeInfo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetMarketplaceFee).name] = function(p1, p2)
		-- upvalues: MarketplaceFeeInfoModule (copy), CryoModule (copy)
		return CryoModule.Dictionary.join(p1, (MarketplaceFeeInfoModule.fromGetResaleTaxRate(p2.marketplaceFeeInfo)))
	end
})