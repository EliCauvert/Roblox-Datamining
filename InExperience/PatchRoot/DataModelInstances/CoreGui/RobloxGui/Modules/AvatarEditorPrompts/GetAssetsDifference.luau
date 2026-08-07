local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local _ = require(corePackagesService.Packages.Promise)
local getCurrentHumanoidDescriptionModule = require(script.Parent.GetCurrentHumanoidDescription)
local getAssetIdsFromDescriptionModule = require(script.Parent.GetAssetIdsFromDescription)
local getAssetNamesForIdsModule = require(script.Parent.GetAssetNamesForIds)

return function(p0) --[[ line: 10 ]]
	-- upvalues: cryoModule (ref), getCurrentHumanoidDescriptionModule (ref), getAssetIdsFromDescriptionModule (ref), getAssetNamesForIdsModule (ref)
	local function getAddedAndRemovedIds(p1, p2) --[[ line: 11 ]]
		-- upvalues: cryoModule (copy)
		local var6 = cryoModule.List.toSet(p1)
		local var7 = cryoModule.List.toSet(p2)
		
		return cryoModule.List.filter(p2, function(p3) --[[ line: 15 ]]
			-- upvalues: var6 (ref)
			return var6[p3] == nil
		end), cryoModule.List.filter(p1, function(p4) --[[ line: 19 ]]
			-- upvalues: var7 (ref)
			return var7[p4] == nil
		end)
	end
	
	return getCurrentHumanoidDescriptionModule():andThen(function(p5) --[[ line: 26 ]]
		-- upvalues: getAssetIdsFromDescriptionModule (copy), p0 (ref), getAddedAndRemovedIds (ref), cryoModule (copy), getAssetNamesForIdsModule (copy)
		local var8, var9 = getAddedAndRemovedIds(getAssetIdsFromDescriptionModule(p5), getAssetIdsFromDescriptionModule(p0))
		
		return getAssetNamesForIdsModule(cryoModule.List.join(var8, var9)):andThen(function(p6) --[[ line: 33 ]]
			-- upvalues: var8 (ref), var9 (ref)
			local t = {}
			
			for i, v in ipairs(var8) do
				table.insert(t, p6[v])
			end
			local t_1 = {}
			
			for i_1, v_1 in ipairs(var9) do
				table.insert(t_1, p6[v_1])
			end
			return {
				addedNames = t,
				removedNames = t_1,
				addedAssetIds = var8,
				removedAssetIds = var9
			}
		end)
	end)
end