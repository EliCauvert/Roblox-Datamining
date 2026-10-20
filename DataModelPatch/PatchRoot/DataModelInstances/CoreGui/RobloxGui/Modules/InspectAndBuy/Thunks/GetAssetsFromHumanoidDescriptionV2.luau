local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local SetEquippedAssetsModule = require(Parent.Actions.SetEquippedAssets)
local ConstantsModule = require(Parent.Constants)
local GetAvatarPreviewModule = require(Parent.Thunks.GetAvatarPreview)
local FFlagAXInspectAndBuyMakeupSupport = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXInspectAndBuyMakeupSupport
local t = {}

local function getAssetIds(Humanoid: Humanoid)
	-- upvalues: ConstantsModule (copy), AssetInfoModule (copy), FFlagAXInspectAndBuyMakeupSupport (copy)
	local FromHumanoidDescriptionResults = {}
	local Flag = false
	
	for i, value in ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil then
			local Text = Humanoid[value] or ""
			local IsIMatch: boolean = i == tostring(Enum.AssetType.Head.Value) or i == tostring(Enum.AssetType.DynamicHead.Value)
			
			if not Flag or not IsIMatch then
				if IsIMatch then
					Flag = true
				end
				for _, value1 in string.split(Text) do
					if tonumber(value1) and value1 ~= "0" then
						table.insert(FromHumanoidDescriptionResults, AssetInfoModule.fromHumanoidDescription(value1))
					end
				end
			end
		end
	end
	for _, accessory in Humanoid:GetAccessories(true) do
		FromHumanoidDescriptionResults[#FromHumanoidDescriptionResults + 1] = AssetInfoModule.fromHumanoidDescriptionAccessory(accessory)
	end
	for _, emote in Humanoid:GetEmotes() do
		for _, value2 in emote do
			FromHumanoidDescriptionResults[#FromHumanoidDescriptionResults + 1] = AssetInfoModule.fromHumanoidDescription(value2)
		end
	end
	if FFlagAXInspectAndBuyMakeupSupport then
		for _, MakeupDescription in Humanoid:GetChildren() do
			if MakeupDescription:IsA("MakeupDescription") and MakeupDescription.AssetId > 0 then
				FromHumanoidDescriptionResults[#FromHumanoidDescriptionResults + 1] = AssetInfoModule.fromHumanoidDescription(MakeupDescription.AssetId)
			end
		end
	end
	return FromHumanoidDescriptionResults
end

return function(Humanoid, p1)
	-- upvalues: ThunkModule (copy), t (copy), getAssetIds (copy), GetAvatarPreviewModule (copy), SetEquippedAssetsModule (copy)
	return ThunkModule.new(script.Name, t, function(p2, _)
		-- upvalues: getAssetIds (upval), Humanoid (copy), p1 (copy), GetAvatarPreviewModule (upval), SetEquippedAssetsModule (upval)
		local AssetIds = getAssetIds(Humanoid)
		
		if p1 then
			p2:dispatch(SetEquippedAssetsModule(AssetIds))
			
			return
		else
			p2:dispatch(GetAvatarPreviewModule(AssetIds))
		end
	end)
end