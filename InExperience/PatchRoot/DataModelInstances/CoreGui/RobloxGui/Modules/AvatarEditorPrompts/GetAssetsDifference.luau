local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local _ = require(corePackagesService.Packages.Promise)
local getCurrentHumanoidDescriptionModule = require(script.Parent.GetCurrentHumanoidDescription)
local getAssetIdsFromDescriptionModule = require(script.Parent.GetAssetIdsFromDescription)
local getAssetNamesForIdsModule = require(script.Parent.GetAssetNamesForIds)

return function(p1)
	-- upvalues: cryoModule (ref), getCurrentHumanoidDescriptionModule (ref), getAssetIdsFromDescriptionModule (ref), getAssetNamesForIdsModule (ref)
	local function getAddedAndRemovedIds(p2, p3)
		-- upvalues: cryoModule (copy)
		local var1 = cryoModule.List.toSet(p2)
		local var2 = cryoModule.List.toSet(p3)
		
		return cryoModule.List.filter(p3, function(p4)
			-- upvalues: var1 (ref)
			return var1[p4] == nil
		end), cryoModule.List.filter(p2, function(p4)
			-- upvalues: var2 (ref)
			return var2[p4] == nil
		end)
	end
	
	return getCurrentHumanoidDescriptionModule():andThen(function(p2)
		-- upvalues: getAssetIdsFromDescriptionModule (copy), p1 (ref), getAddedAndRemovedIds (ref), cryoModule (copy), getAssetNamesForIdsModule (copy)
		local var1, var2 = getAddedAndRemovedIds(getAssetIdsFromDescriptionModule(p2), getAssetIdsFromDescriptionModule(p1))
		
		return getAssetNamesForIdsModule(cryoModule.List.join(var1, var2)):andThen(function(p3)
			-- upvalues: var1 (ref), var2 (ref)
			local t = {}
			
			for i, v in ipairs(var1) do
				table.insert(t, p3[v])
			end
			local t_1 = {}
			
			for i_1, v_1 in ipairs(var2) do
				table.insert(t_1, p3[v_1])
			end
			return {
				addedNames = t,
				removedNames = t_1,
				addedAssetIds = var1,
				removedAssetIds = var2
			}
		end)
	end)
end