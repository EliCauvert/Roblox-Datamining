local cryoModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.Cryo)
local categoriesModule = require(script.Parent.Parent.Enums.Categories)
local _ = require(script.Parent.Parent.Types)
local bodyAssetTypes = require(script.Parent.Parent.Constants).BodyAssetTypes

return function(value, p1)
	-- upvalues: categoriesModule (ref), cryoModule (ref), bodyAssetTypes (ref)
	local t = {}
	local var1 = if value == categoriesModule.Body then cryoModule.List.map(bodyAssetTypes, function(p2)
		return tostring(p2.Value)
	end) else {}
	
	for i, v in p1 do
		var1 = cryoModule.List.join(var1 or {}, cryoModule.List.map(cryoModule.List.filter(v.assetTypes, function(p2)
			-- upvalues: t (ref)
			if t[p2] then
				return false
			end
			t[p2] = true
			
			return true
		end), function(p2)
			return tostring(p2.Value)
		end))
	end
	if cryoModule.List.find(var1, tostring(Enum.AssetType.RightShoeAccessory.Value)) then
		table.insert(var1, tostring(Enum.AssetType.LeftShoeAccessory.Value))
	end
	return var1
end