local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TutilsModule = require(CorePackages.Packages.tutils)
local EmoteUtility = require(CorePackages.Packages.Thumbnailing).EmoteUtility
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local IsMakeupAssetTypeFunction = AvatarExperienceCommonModule.Utils.isMakeupAssetType
local SetMakeupDescriptionsFunction = AvatarExperienceCommonModule.Utils.setMakeupDescriptions
local GetFFlagAXLookViewportCameraAlignmentModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLookViewportCameraAlignment)
local AXFixMySharedAvatarMutedError = game:DefineFastFlag("AXFixMySharedAvatarMutedError", false)
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local FFlagAXCommunityAvatarsMakeupEquipping = AvatarExperienceFlagsModule.FFlagAXCommunityAvatarsMakeupEquipping
local list = {
	{ id = 14461759190, assetTypeId = 29 },
	{ id = 14461763778, assetTypeId = 30 },
	{ id = 14461769598, assetTypeId = 28 },
	{ id = 14461775685, assetTypeId = 31 },
	{ id = 14461780409, assetTypeId = 27 },
	{ id = 14461797943, assetTypeId = 17 }
}
local LookViewportUtils = {
	createHumanoidDescriptionFromLook = function(p1)
		-- upvalues: list (copy), ConstantsModule (copy), FFlagAXCommunityAvatarsMakeupEquipping (copy), IsMakeupAssetTypeFunction (copy), FFlagParseHeadShapeFromAPIResponse (copy), SetMakeupDescriptionsFunction (copy)
		local HumanoidDescription = Instance.new("HumanoidDescription")
		
		if p1.lookType == "Outfit" then
			HumanoidDescription.HeadColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.LeftArmColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.RightArmColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.TorsoColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.LeftLegColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.RightLegColor = BrickColor.new("Medium stone grey").Color
			
			for _, value1 in list do
				HumanoidDescription[ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[tostring(value1.assetTypeId)]] = value1.id
			end
		end
		local List = {}
		local T = if FFlagAXCommunityAvatarsMakeupEquipping then {} else nil
		
		if p1.lookAssetInfos then
			for _, lookAssetInfo in p1.lookAssetInfos do
				local Text = tostring(lookAssetInfo.assetType)
				local AssetTypeIdToAccessoryTypeEnumEntry = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[Text]
				
				if AssetTypeIdToAccessoryTypeEnumEntry then
					table.insert(List, {
						AssetId = tonumber(lookAssetInfo.id) or 0,
						Order = if lookAssetInfo.meta then lookAssetInfo.meta.order else nil,
						AccessoryType = AssetTypeIdToAccessoryTypeEnumEntry
					})
					continue
				end
				if FFlagAXCommunityAvatarsMakeupEquipping and IsMakeupAssetTypeFunction(Text) then
					if not T[Text] then
						T[Text] = {}
					end
					T[Text][tostring(lookAssetInfo.id)] = {
						order = if lookAssetInfo.meta then lookAssetInfo.meta.order else nil
					}
				elseif FFlagAXCommunityAvatarsMakeupEquipping then
					local AssetTypeIdStringToHumanoidDescriptionPropEntry1 = ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[Text]
					
					if AssetTypeIdStringToHumanoidDescriptionPropEntry1 then
						HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry1] = lookAssetInfo.id
					end
				else
					HumanoidDescription[ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[Text]] = lookAssetInfo.id
				end
			end
		end
		if p1.lookBundleInfos then
			for _, lookBundleInfo in p1.lookBundleInfos do
				for _, value2 in lookBundleInfo.assetsInBundle do
					if value2.isIncluded then
						local Text = tostring(value2.assetType)
						local AssetTypeIdToAccessoryTypeEnumEntry = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[Text]
						
						if AssetTypeIdToAccessoryTypeEnumEntry then
							table.insert(List, {
								AssetId = tonumber(value2.id) or 0,
								Order = if value2.meta then value2.meta.order else nil,
								AccessoryType = AssetTypeIdToAccessoryTypeEnumEntry
							})
						elseif FFlagAXCommunityAvatarsMakeupEquipping and IsMakeupAssetTypeFunction(Text) then
							if not T[Text] then
								T[Text] = {}
							end
							T[Text][tostring(value2.id)] = { order = if value2.meta then value2.meta.order else nil }
						else
							local AssetTypeIdStringToHumanoidDescriptionPropEntry = ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[Text]
							
							if FFlagParseHeadShapeFromAPIResponse and ConstantsModule.BodyPartNameToEnum[AssetTypeIdStringToHumanoidDescriptionPropEntry] then
								local BodyPartDescription = Instance.new("BodyPartDescription")
								BodyPartDescription.AssetId = value2.id
								BodyPartDescription.Parent = HumanoidDescription
								BodyPartDescription.BodyPart = ConstantsModule.BodyPartNameToEnum[AssetTypeIdStringToHumanoidDescriptionPropEntry]
								
								if value2.meta and value2.meta.headShape then
									BodyPartDescription.HeadShape = if value2.meta.headShape == "Default" then "" else value2.meta.headShape
								end
							elseif not FFlagAXCommunityAvatarsMakeupEquipping then
								HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry] = value2.id
							elseif AssetTypeIdStringToHumanoidDescriptionPropEntry then
								HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry] = value2.id
							end
						end
					end
				end
			end
		end
		if FFlagAXCommunityAvatarsMakeupEquipping then
			SetMakeupDescriptionsFunction(HumanoidDescription, T)
		end
		HumanoidDescription:SetAccessories(List, true)
		
		if p1.avatarProperties and p1.avatarProperties.bodyColor3s then
			for i1, bodyColor3 in p1.avatarProperties.bodyColor3s do
				HumanoidDescription[ConstantsModule.BodyPartForSkinColoringIdToHumanoidDescription[i1]] = Color3.fromHex(bodyColor3)
			end
		else
			HumanoidDescription.HeadColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.LeftArmColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.RightArmColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.TorsoColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.LeftLegColor = BrickColor.new("Medium stone grey").Color
			HumanoidDescription.RightLegColor = BrickColor.new("Medium stone grey").Color
		end
		if p1.avatarProperties and p1.avatarProperties.scale then
			for i, value in p1.avatarProperties.scale do
				HumanoidDescription[ConstantsModule.HumanoidDescriptionScaleToName[i]] = value
			end
		end
		return HumanoidDescription
	end
}

function LookViewportUtils.createAvatarModel(p2)
	-- upvalues: LookViewportUtils (copy), Players (copy), GetFFlagAXLookViewportCameraAlignmentModule (copy), EmoteUtility (copy)
	local HumanoidDescriptionFromLook = LookViewportUtils.createHumanoidDescriptionFromLook(p2)
	local HumanoidModelFromDescriptionAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromDescriptionAsync(HumanoidDescriptionFromLook, Enum.HumanoidRigType.R15) else Players:CreateHumanoidModelFromDescription(HumanoidDescriptionFromLook, Enum.HumanoidRigType.R15)
	HumanoidModelFromDescriptionAsync:WaitForChild("HumanoidRootPart").Anchored = true
	HumanoidModelFromDescriptionAsync:PivotTo(CFrame.new(0, 1000, 0))
	HumanoidModelFromDescriptionAsync.Parent = workspace
	
	if not GetFFlagAXLookViewportCameraAlignmentModule() then
		local EmoteAssetId = p2.displayProperties and p2.displayProperties.emoteAssetId
		
		if EmoteAssetId then
			EmoteUtility.ApplyKeyframesForPose(HumanoidModelFromDescriptionAsync, (EmoteUtility.LoadKeyframesForPose(HumanoidModelFromDescriptionAsync, tonumber(EmoteAssetId), 10647852134, true, false)))
		end
	end
	return HumanoidModelFromDescriptionAsync
end

function LookViewportUtils.applyPose(p2, p3)
	-- upvalues: EmoteUtility (copy)
	EmoteUtility.ApplyKeyframesForPose(p3, (EmoteUtility.LoadKeyframesForPose(p3, tonumber(p2), 10647852134, true, false)))
	task.wait()
end

function LookViewportUtils.loadAnimationTrackForAvatar(Text, Object)
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	local Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
	
	if Animator and #Animator:GetPlayingAnimationTracks() <= 0 then
		local Animation = Instance.new("Animation")
		Animation.AnimationId = "rbxassetid://" .. Text
		local AnimationTrack = Animator:LoadAnimation(Animation)
		AnimationTrack.Looped = false
		
		return AnimationTrack
	else
		return nil
	end
end

function LookViewportUtils.areLooksDifferent(p2, p3): boolean
	-- upvalues: TutilsModule (copy)
	if p2 == p3 then
		return false
	elseif p2 and p3 then
		local Inverted = not TutilsModule.deepEqual(p2.lookBundleInfos, p3.lookBundleInfos)
		local v1 = (p2.displayProperties and p2.displayProperties.emoteAssetId) ~= (p3.displayProperties and p3.displayProperties.emoteAssetId)
		local Inverted1 = not TutilsModule.deepEqual(p2.avatarProperties, p3.avatarProperties)
		
		return not TutilsModule.deepEqual(p2.lookAssetInfos, p3.lookAssetInfos) or (Inverted or (v1 or Inverted1))
	else
		return true
	end
end

function LookViewportUtils.hydratedLookToLookDetails(p2)
	-- upvalues: CryoModule (copy), AXFixMySharedAvatarMutedError (copy), MutedErrorModule (copy)
	local config = {
		totalPrice = 0,
		totalPremiumPrice = 0,
		lookAssetInfos = {},
		lookBundleInfos = {}
	}
	local JoinResult = if p2.assetsIncludingBundleParts then CryoModule.List.join(p2.assets, p2.assetsIncludingBundleParts) else p2.assets
	
	if JoinResult then
		for _, value in JoinResult do
			if not AXFixMySharedAvatarMutedError or value.assetType then
				local Success, Result = pcall(function()
					-- upvalues: value (copy)
					return Enum.AssetType[value.assetType].Value
				end)
				
				if Success then
					config.lookAssetInfos[tostring(value.id)] = {
						quantityOwned = 0,
						id = tostring(value.id),
						itemType = value.type,
						assetType = Result,
						meta = if value.order then { order = value.order } else nil
					}
				else
					MutedErrorModule(`Incorrect asseType received from hydrated look: "{value.assetType}" does not map to an Enum.AssetType ({Result})`)
				end
			end
		end
	end
	local AvatarProperties = p2.avatarProperties
	
	if AvatarProperties then
		config.avatarProperties = {
			bodyColor3s = AvatarProperties.bodyColors,
			playerAvatarType = AvatarProperties.playerAvatarType,
			scale = AvatarProperties.scales
		}
	end
	return config
end

return LookViewportUtils