local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Packages.Promise)
local GetCurrentHumanoidDescriptionModule = require(script.Parent.GetCurrentHumanoidDescription)
local GetAssetIdsFromDescriptionModule = require(script.Parent.GetAssetIdsFromDescription)
local GetAssetNamesForIdsModule = require(script.Parent.GetAssetNamesForIds)

return function(p1)
	-- upvalues: CryoModule (copy), GetCurrentHumanoidDescriptionModule (copy), GetAssetIdsFromDescriptionModule (copy), GetAssetNamesForIdsModule (copy)
	local function getAddedAndRemovedIds(p2, p3)
		-- upvalues: CryoModule (upval)
		local Set = CryoModule.List.toSet(p2)
		local Set1 = CryoModule.List.toSet(p3)
		
		return CryoModule.List.filter(p3, function(p4): boolean
			-- upvalues: Set (copy)
			return Set[p4] == nil
		end), (CryoModule.List.filter(p2, function(p4): boolean
			-- upvalues: Set1 (copy)
			return Set1[p4] == nil
		end))
	end
	
	return GetCurrentHumanoidDescriptionModule():andThen(function(Result)
		-- upvalues: GetAssetIdsFromDescriptionModule (upval), p1 (copy), getAddedAndRemovedIds (copy), CryoModule (upval), GetAssetNamesForIdsModule (upval)
		local AddedAndRemovedIds, AddedAndRemovedIds2 = getAddedAndRemovedIds(GetAssetIdsFromDescriptionModule(Result), (GetAssetIdsFromDescriptionModule(p1)))
		
		return GetAssetNamesForIdsModule((CryoModule.List.join(AddedAndRemovedIds, AddedAndRemovedIds2))):andThen(function(Result)
			-- upvalues: AddedAndRemovedIds (copy), AddedAndRemovedIds2 (copy)
			local AddedNames = {}
			
			for _, addedAndRemovedId in ipairs(AddedAndRemovedIds) do
				table.insert(AddedNames, Result[addedAndRemovedId])
			end
			local RemovedNames = {}
			
			for _, value in ipairs(AddedAndRemovedIds2) do
				table.insert(RemovedNames, Result[value])
			end
			return {
				addedNames = AddedNames,
				removedNames = RemovedNames,
				addedAssetIds = AddedAndRemovedIds,
				removedAssetIds = AddedAndRemovedIds2
			}
		end)
	end)
end