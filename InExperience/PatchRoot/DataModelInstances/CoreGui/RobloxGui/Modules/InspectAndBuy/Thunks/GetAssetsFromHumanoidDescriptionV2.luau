local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local assetInfoModule = require(parent.Models.AssetInfo)
local setEquippedAssetsModule = require(parent.Actions.SetEquippedAssets)
local constantsModule = require(parent.Constants)
local getAvatarPreviewModule = require(parent.Thunks.GetAvatarPreview)
local fFlagAXInspectAndBuyMakeupSupport = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXInspectAndBuyMakeupSupport
local t = {}

local function getAssetIds(value)
	-- upvalues: constantsModule (ref), assetInfoModule (ref), fFlagAXInspectAndBuyMakeupSupport (ref)
	local t = {}
	local var1 = false
	
	for i, v in constantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		if constantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil then
			local var2 = value[v] or ""
			local var3 = if i ~= tostring(Enum.AssetType.Head.Value) then i == tostring(Enum.AssetType.DynamicHead.Value) else true
			
			if not var1 or not var3 then
				if var3 then
					var1 = true
				end
				for i_3, v_1 in string.split(var2) do
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

return function(value, p1)
	-- upvalues: thunkModule (ref), t (ref), getAssetIds (ref), getAvatarPreviewModule (ref), setEquippedAssetsModule (ref)
	return thunkModule.new(script.Name, t, function(p2, _)
		-- upvalues: getAssetIds (copy), value (ref), p1 (ref), getAvatarPreviewModule (copy), setEquippedAssetsModule (copy)
		local var4 = getAssetIds(value)
		
		if p1 then
			p2:dispatch(setEquippedAssetsModule(var4))
			
			return
		end
		p2:dispatch(getAvatarPreviewModule(var4))
	end)
end