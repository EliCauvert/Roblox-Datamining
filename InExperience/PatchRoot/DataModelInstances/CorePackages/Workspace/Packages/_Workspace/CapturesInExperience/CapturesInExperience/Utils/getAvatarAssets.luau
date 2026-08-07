local playersService = game:GetService("Players")
local constantsModule = require(script.Parent.Parent.Constants)

local function _() --[[ line: 9 | named "getLocalPlayerCharacter" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer then localPlayer.Character else nil
end

return function(p0) --[[ line: 18 ]]
	-- upvalues: playersService (ref), constantsModule (ref)
	local t = {}
	local t_1 = {}
	
	if not p0 then
		local localPlayer = playersService.LocalPlayer
		p0 = if not localPlayer then nil else localPlayer.Character
	end
	if not p0 then
		return t
	end
	local humanoid = p0:FindFirstChildOfClass("Humanoid")
	
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
				local var6 = tonumber(v_1)
				
				if var6 and var6 ~= 0 and not t_1[var6] then
					t_1[var6] = true
					table.insert(t, var6)
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