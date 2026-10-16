local Players = game:GetService("Players")
local ConstantsModule = require(script.Parent.Parent.Constants)

local function _() --[[ Line: 9 | Named "getLocalPlayerCharacter" ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer then LocalPlayer.Character else nil
end

return function(Object) --[[ Line: 18 ]]
	-- upvalues: Players (copy), ConstantsModule (copy)
	local List = {}
	local t = {}
	
	if not Object then
		local LocalPlayer = Players.LocalPlayer
		Object = if LocalPlayer then LocalPlayer.Character else nil
	end
	if not Object then
		return List
	end
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if not Humanoid then
		return List
	end
	local HumanoidDescription = Humanoid:FindFirstChildOfClass("HumanoidDescription")
	
	if not HumanoidDescription then
		return List
	end
	for i, value in ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil then
			for _, value1 in string.split(HumanoidDescription[value] or "") do
				local Number: number? = tonumber(value1)
				
				if Number and Number ~= 0 and not t[Number] then
					t[Number] = true
					table.insert(List, Number)
				end
			end
		end
	end
	for _, accessory in HumanoidDescription:GetAccessories(true) do
		if accessory.AssetId and accessory.AssetId ~= 0 and not t[accessory.AssetId] then
			t[accessory.AssetId] = true
			table.insert(List, accessory.AssetId)
		end
	end
	return List
end