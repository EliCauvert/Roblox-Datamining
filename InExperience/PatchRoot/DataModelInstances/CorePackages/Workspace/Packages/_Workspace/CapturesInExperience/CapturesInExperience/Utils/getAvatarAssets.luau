local playersService = game:GetService("Players")
local constantsModule = require(script.Parent.Parent.Constants)

local function _()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer then localPlayer.Character else nil
end

return function(p1)
	-- upvalues: playersService (ref), constantsModule (ref)
	local t = {}
	local t_1 = {}
	
	if not p1 then
		local localPlayer = playersService.LocalPlayer
		p1 = if not localPlayer then nil else localPlayer.Character
	end
	if not p1 then
		return t
	end
	local humanoid = p1:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then
		return t
	end
	local humanoidDescription = humanoid:FindFirstChildOfClass("HumanoidDescription")
	
	if not humanoidDescription then
		return t
	end
	for i, v in constantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		if constantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil then
			for i_1, v_1 in string.split(humanoidDescription[v] or "") do
				local var1 = tonumber(v_1)
				
				if var1 and var1 ~= 0 and not t_1[var1] then
					t_1[var1] = true
					table.insert(t, var1)
				end
			end
		end
	end
	for i_1, v_1 in humanoidDescription:GetAccessories(true) do
		if v_1.AssetId and v_1.AssetId ~= 0 and not t_1[v_1.AssetId] then
			t_1[v_1.AssetId] = true
			table.insert(t, v_1.AssetId)
		end
	end
	return t
end