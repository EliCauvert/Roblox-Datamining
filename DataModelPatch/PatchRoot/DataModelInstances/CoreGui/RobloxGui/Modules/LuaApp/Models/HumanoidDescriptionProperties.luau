local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TModule = require(CorePackages.Packages.t)
local TutilsModule = require(CorePackages.Packages.tutils)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AssetTypeIdStringToHumanoidDescriptionProp = ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp
local HumanoidDescriptionScaleToName = ConstantsModule.HumanoidDescriptionScaleToName
local BodyPartForSkinColoringIdToHumanoidDescription = ConstantsModule.BodyPartForSkinColoringIdToHumanoidDescription
local InterfaceResult = TModule.interface({
	id = TModule.number,
	assets = TModule.table,
	bodyColor3s = TModule.table,
	scale = TModule.table
})
local HumanoidDescriptionPropertiesModule = {
	new = function()
		return {}
	end
}

function HumanoidDescriptionPropertiesModule.fromOutfitDetailsWebApi(p1)
	-- upvalues: HumanoidDescriptionPropertiesModule (copy), InterfaceResult (copy), MutedErrorModule (copy), TutilsModule (copy), AssetTypeIdStringToHumanoidDescriptionProp (copy), TModule (copy), BodyPartForSkinColoringIdToHumanoidDescription (copy), HumanoidDescriptionScaleToName (copy)
	local NewHumanoidDescriptionProperties = HumanoidDescriptionPropertiesModule.new()
	
	if not InterfaceResult(p1) then
		MutedErrorModule(string.format("the responseBody of Avatar endpoint, /v3/outfits/{outfitId}/details, did not have expected sets of data: %s", TutilsModule.toString(p1)))
	end
	local Id = p1.id
	local Assets = p1.assets or {}
	local Scale = p1.scale or {}
	for _, asset in pairs(Assets) do
		local Text = tostring(asset.id)
		local AssetTypeIdStringToHumanoidDescriptionPropEntry = AssetTypeIdStringToHumanoidDescriptionProp[tostring(asset.assetType and asset.assetType.id)]
		
		if TModule.string(AssetTypeIdStringToHumanoidDescriptionPropEntry) then
			NewHumanoidDescriptionProperties[AssetTypeIdStringToHumanoidDescriptionPropEntry] = Text
		else
			MutedErrorModule(string.format("Avatar's /%s/outfits/%s/details returned an assetTypeId that was not recognized: %s", "v3", Id, TutilsModule.toString(asset)))
		end
	end
	local BodyColor3s = p1.bodyColor3s or {}
	for i, bodyColor3 in pairs(BodyColor3s) do
		local BodyPartForSkinColoringIdToHumanoidDescriptionEntry = BodyPartForSkinColoringIdToHumanoidDescription[tostring(i)]
		
		if not TModule.string(BodyPartForSkinColoringIdToHumanoidDescriptionEntry) then
			MutedErrorModule(string.format("Avatar's /v3/outfits/%s/details returned a BodyPartForSkinColoringId that was not recognized: bodyPartForSkinColoringId = %s, bodyColor3AsHex = %s", Id, i, bodyColor3))
			continue
		end
		local Success, Result = pcall(function(): Color3
			-- upvalues: bodyColor3 (copy)
			return Color3.fromHex(bodyColor3)
		end)
		
		if Success then
			NewHumanoidDescriptionProperties[BodyPartForSkinColoringIdToHumanoidDescriptionEntry] = Result
		else
			MutedErrorModule(string.format("Avatar's /v3/outfits/%s/details returned a bodyColor3 with bad hash value: bodyPartForSkinColoringId = %s, bodyColor3AsHex = %s", Id, i, bodyColor3))
		end
	end
	for i1, value in pairs(Scale) do
		local HumanoidDescriptionScaleToNameEntry = HumanoidDescriptionScaleToName[tostring(i1)]
		
		if TModule.string(HumanoidDescriptionScaleToNameEntry) then
			NewHumanoidDescriptionProperties[HumanoidDescriptionScaleToNameEntry] = value
		else
			MutedErrorModule(string.format("Avatar's /%s/outfits/%s/details returned a scaleType that was not recognized: scaleType: %s, scale: %s", "v3", Id, i1, value))
		end
	end
	return NewHumanoidDescriptionProperties
end

function HumanoidDescriptionPropertiesModule.createHumanoidDescription(List)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	
	for i, value in pairs(List) do
		HumanoidDescription[i] = value
	end
	return HumanoidDescription
end

return HumanoidDescriptionPropertiesModule