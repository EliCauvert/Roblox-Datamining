-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:43 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validateLayeredClothingAccessoryModule = require(parent.validation.validateLayeredClothingAccessory)
local validateLayeredClothingAccessoryMeshPartAssetFormatMatchModule = require(parent.validation.validateLayeredClothingAccessoryMeshPartAssetFormatMatch)

return function(value, p0) --[[ line: 9 | named "validateLayeredClothingAccessoryMeshPartAssetFormat" ]]
	-- upvalues: validateLayeredClothingAccessoryModule (ref), validateLayeredClothingAccessoryMeshPartAssetFormatMatchModule (ref)
	assert(p0.instances ~= nil, "instances required in validationContext for validateLayeredClothingAccessoryMeshPartAssetFormat")
	local instances = p0.instances
	local _ = nil
	local _ = nil
	local var2, var3 = validateLayeredClothingAccessoryModule(p0)
	
	if not var2 then
		return false, var3
	end
	local var4, var5 = validateLayeredClothingAccessoryMeshPartAssetFormatMatchModule(instances[1], value, p0)
	
	if var4 then
		return true
	end
	return false, var5
end