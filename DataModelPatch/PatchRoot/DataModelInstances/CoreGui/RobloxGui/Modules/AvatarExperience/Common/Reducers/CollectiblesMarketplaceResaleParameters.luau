local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CollectibleMarketplaceResaleParametersInfoModule = require(Modules.AvatarExperience.Common.Models.CollectibleMarketplaceResaleParametersInfo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleMarketplaceResaleParameters).name] = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), CollectibleMarketplaceResaleParametersInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p2.collectibleItemId, "string", "collectibleItemId must be a string.")
		ArgCheckModule.isType(p2.resaleParametersInfo, "table", "resaleParametersInfo must be a table.")
		local CollectibleItemId = p2.collectibleItemId
		local FromGetCollectibleMarketplaceResaleParametersResult = CollectibleMarketplaceResaleParametersInfoModule.fromGetCollectibleMarketplaceResaleParameters(p2.resaleParametersInfo, p2.itemSubTypeNameString)
		local v1 = p1[CollectibleItemId]
		
		return if v1 then CryoModule.Dictionary.join(p1, {
			[CollectibleItemId] = CryoModule.Dictionary.join(v1, FromGetCollectibleMarketplaceResaleParametersResult)
		}) else CryoModule.Dictionary.join(p1, {
			[CollectibleItemId] = FromGetCollectibleMarketplaceResaleParametersResult
		})
	end
})