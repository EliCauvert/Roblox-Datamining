local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CryoModule = require(CorePackages.Packages.Cryo)
local CollectibleInfoModule = require(Modules.AvatarExperience.Common.Models.CollectibleInfo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleItemInfo).name] = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), CollectibleInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p2.collectibleItemId, "string", "collectibleItemId must be a string.")
		ArgCheckModule.isType(p2.collectibleItemData, "table", "collectibleItemData must be a table.")
		local CollectibleItemId = p2.collectibleItemId
		local FromGetCollectibleItemDataResult = CollectibleInfoModule.fromGetCollectibleItemData(p2.collectibleItemData)
		local v1 = p1[CollectibleItemId]
		
		return if v1 then CryoModule.Dictionary.join(p1, {
			[CollectibleItemId] = CryoModule.Dictionary.join(v1, FromGetCollectibleItemDataResult)
		}) else CryoModule.Dictionary.join(p1, { [CollectibleItemId] = FromGetCollectibleItemDataResult })
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleResellersInstances).name] = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), CollectibleInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p2.collectibleItemId, "string", "collectibleItemId must be a string.")
		ArgCheckModule.isType(p2.collectibleItemInstances, "table", "collectibleItemData must be a table.")
		local CollectibleItemId = p2.collectibleItemId
		local FromGetResellersResult = CollectibleInfoModule.fromGetResellers(p2.collectibleItemInstances)
		local v1 = p1[CollectibleItemId]
		
		return if v1 then CryoModule.Dictionary.join(p1, {
			[CollectibleItemId] = CryoModule.Dictionary.join(v1, FromGetResellersResult)
		}) else CryoModule.Dictionary.join(p1, { [CollectibleItemId] = FromGetResellersResult })
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleResaleData).name] = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), CollectibleInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p2.collectibleItemId, "string", "collectibleItemId must be a string.")
		ArgCheckModule.isType(p2.resaleData, "table", "resaleData must be a table.")
		local CollectibleItemId = p2.collectibleItemId
		local FromGetResaleDataResult = CollectibleInfoModule.fromGetResaleData(p2.resaleData)
		local v1 = p1[CollectibleItemId]
		
		return if v1 then CryoModule.Dictionary.join(p1, {
			[CollectibleItemId] = CryoModule.Dictionary.join(v1, FromGetResaleDataResult)
		}) else CryoModule.Dictionary.join(p1, { [CollectibleItemId] = FromGetResaleDataResult })
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).State.Actions.FetchCollectibleItemDataBatchedSuccess.name] = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping then function(p1, p2)
		-- upvalues: CollectibleInfoModule (copy), CryoModule (copy)
		local P6 = p1 or {}
		local JoinResults = {}
		
		for _, value in p2.collectibleItemData do
			local CollectibleItemId = value.collectibleItemId
			JoinResults[CollectibleItemId] = CryoModule.Dictionary.join(P6[CollectibleItemId] or {}, (CollectibleInfoModule.fromGetCollectibleItemData(value)))
		end
		return CryoModule.Dictionary.join(P6, JoinResults)
	end else nil
})