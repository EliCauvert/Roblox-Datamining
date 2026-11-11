local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local ReducerUtils = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Utils.ReducerUtils
local GetFFlagAXEnableRecommendationTypeAllInCustomizeModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetRecommendedItemsV2).name] = function(p1, p2)
		-- upvalues: GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (copy), ArgCheckModule (copy), ReducerUtils (copy), CryoModule (copy)
		if GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() then
			ArgCheckModule.isType(p2.recommendationsType, "string", "recommendationsType must be a string.")
			ArgCheckModule.isType(p2.itemTypeId, "string", "itemTypeId must be a string.")
			ArgCheckModule.isType(p2.items, "table", "items data must be a table.")
			local RecommendedItemsKey = ReducerUtils.generateRecommendedItemsKey(p2.itemTypeId, p2.recommendationsType)
			local List = {}
			
			for _, item in p2.items do
				local Id = item.id
				local ItemType = item.itemType
				
				if Id and ItemType then
					table.insert(List, { itemId = tostring(Id), itemType = ItemType })
				end
			end
			return CryoModule.Dictionary.join(p1, { [RecommendedItemsKey] = List })
		else
			ArgCheckModule.isType(p2.itemTypeId, "string", "itemTypeId must be a string.")
			ArgCheckModule.isType(p2.items, "table", "items data must be a table.")
			local ItemTypeId = p2.itemTypeId
			local t = {}
			
			for _, item1 in p2.items do
				local Id = item1.id
				
				if Id then
					t[#t + 1] = tostring(Id)
				end
			end
			return CryoModule.Dictionary.join(p1, { [ItemTypeId] = t })
		end
	end
})