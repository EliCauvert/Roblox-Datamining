local cryoModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.Cryo)
local categoriesModule = require(script.Parent.Parent.Enums.Categories)
local _ = require(script.Parent.Parent.Types)
local bodyAssetTypes = require(script.Parent.Parent.Constants).BodyAssetTypes

return function(value, p0) --[[ line: 11 | named "getAssetTypesByCategory" ]]
	-- upvalues: categoriesModule (ref), cryoModule (ref), bodyAssetTypes (ref)
	local t = {}
	local var3 = if value == categoriesModule.Body then cryoModule.List.map(bodyAssetTypes, function(p1) --[[ line: 18 ]]
		return tostring(p1.Value)
	end) else {}
	
	for i, v in p0 do
		var3 = cryoModule.List.join(var3 or {}, cryoModule.List.map(cryoModule.List.filter(v.assetTypes, function(p2) --[[ line: 32 ]]
			-- upvalues: t (ref)
			if t[p2] then
				return false
			end
			t[p2] = true
			
			return true
		end), function(p3) --[[ line: 39 ]]
			return tostring(p3.Value)
		end))
	end
	if cryoModule.List.find(var3, tostring(Enum.AssetType.RightShoeAccessory.Value)) then
		table.insert(var3, tostring(Enum.AssetType.LeftShoeAccessory.Value))
	end
	return var3
end