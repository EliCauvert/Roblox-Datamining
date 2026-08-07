local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local assetInfoModule = require(parent.Models.AssetInfo)
local setEquippedAssetsModule = require(parent.Actions.SetEquippedAssets)
local constantsModule = require(parent.Constants)
local getAvatarPreviewModule = require(parent.Thunks.GetAvatarPreview)
local fFlagAXInspectAndBuyMakeupSupport = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXInspectAndBuyMakeupSupport
local t = {}

local function getAssetIds(value) --[[ line: 19 ]]
	-- upvalues: constantsModule (ref), assetInfoModule (ref), fFlagAXInspectAndBuyMakeupSupport (ref)
	local t = {}
	local var8 = false
	
	for i, v in constantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		if constantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil then
			local var9 = value[v] or ""
			local var10 = if i ~= tostring(Enum.AssetType.Head.Value) then i == tostring(Enum.AssetType.DynamicHead.Value) else true
			
			if not var8 or not var10 then
				if var10 then
					var8 = true
				end
				for i_3, v_1 in string.split(var9) do
					if tonumber(v_1) and v_1 ~= "0" then
						table.insert(t, assetInfoModule.fromHumanoidDescription(v_1))
					end
				end
			end
		end
	end
	for i_1, v_1 in value:GetAccessories(true) do
		t[#t + 1] = assetInfoModule.fromHumanoidDescriptionAccessory(v_1)
	end
	for i_2, v_2 in value:GetEmotes() do
		for i_3, v_3 in v_2 do
			t[#t + 1] = assetInfoModule.fromHumanoidDescription(v_3)
		end
	end
	if fFlagAXInspectAndBuyMakeupSupport then
		for i_3, v_3 in value:GetChildren() do
			if v_3:IsA("MakeupDescription") and v_3.AssetId > 0 then
				t[#t + 1] = assetInfoModule.fromHumanoidDescription(v_3.AssetId)
			end
		end
	end
	return t
end

return function(value, p0) --[[ line: 83 | named "GetAssetsFromHumanoidDescriptionV2" ]]
	-- upvalues: thunkModule (ref), t (ref), getAssetIds (ref), getAvatarPreviewModule (ref), setEquippedAssetsModule (ref)
	return thunkModule.new(script.Name, t, function(p1, _) --[[ line: 84 ]]
		-- upvalues: getAssetIds (copy), value (ref), p0 (ref), getAvatarPreviewModule (copy), setEquippedAssetsModule (copy)
		local var11 = getAssetIds(value)
		
		if p0 then
			p1:dispatch(setEquippedAssetsModule(var11))
			
			return
		end
		p1:dispatch(getAvatarPreviewModule(var11))
	end)
end