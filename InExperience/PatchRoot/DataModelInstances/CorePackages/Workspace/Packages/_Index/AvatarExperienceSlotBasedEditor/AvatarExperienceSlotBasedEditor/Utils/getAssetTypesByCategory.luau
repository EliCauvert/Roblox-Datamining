local CryoModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.Cryo)
local CategoriesModule = require(script.Parent.Parent.Enums.Categories)
local _ = require(script.Parent.Parent.Types)
local BodyAssetTypes = require(script.Parent.Parent.Constants).BodyAssetTypes

return function(Body, List) --[[ Line: 11 | Named "getAssetTypesByCategory" ]]
	-- upvalues: CategoriesModule (copy), CryoModule (copy), BodyAssetTypes (copy)
	local t = {}
	local MapResult = if Body == CategoriesModule.Body then CryoModule.List.map(BodyAssetTypes, function(p1): string --[[ Line: 18 ]]
		return (tostring(p1.Value))
	end) else {}
	for _, value in List do
		MapResult = CryoModule.List.join(MapResult or {}, CryoModule.List.map(CryoModule.List.filter(value.assetTypes, function(Key): boolean --[[ Line: 32 ]]
			-- upvalues: t (copy)
			if t[Key] then
				return false
			else
				t[Key] = true
				
				return true
			end
		end), function(p1): string --[[ Line: 39 ]]
			return (tostring(p1.Value))
		end))
	end
	if CryoModule.List.find(MapResult, (tostring(Enum.AssetType.RightShoeAccessory.Value))) then
		table.insert(MapResult, (tostring(Enum.AssetType.LeftShoeAccessory.Value)))
	end
	return MapResult
end