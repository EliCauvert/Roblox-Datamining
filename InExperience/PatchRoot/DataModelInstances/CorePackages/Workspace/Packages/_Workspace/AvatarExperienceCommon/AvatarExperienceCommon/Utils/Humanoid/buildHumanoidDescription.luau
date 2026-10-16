local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local MutedErrorFunction = require(AvatarExperienceCommon.Parent.Loggers).mutedError
local ConstantsModule = require(AvatarExperienceCommon.Constants)
local CreateHumanoidDescriptionAccessoryInfoModule = require(AvatarExperienceCommon.Utils.Humanoid.createHumanoidDescriptionAccessoryInfo)
local SetMakeupDescriptionsModule = require(AvatarExperienceCommon.Utils.Humanoid.setMakeupDescriptions)
local IsMakeupAssetTypeModule = require(AvatarExperienceCommon.Utils.isMakeupAssetType)

local function applyCurrentAssets(HumanoidDescription, CurrentAssets) --[[ Line: 21 ]]
	-- upvalues: ConstantsModule (copy), CreateHumanoidDescriptionAccessoryInfoModule (copy), IsMakeupAssetTypeModule (copy), MutedErrorFunction (copy), SetMakeupDescriptionsModule (copy)
	if CurrentAssets then
		local List = {}
		
		for i, currentAsset in CurrentAssets do
			local List1 = {}
			local ASSETTYPETOACCESSORYTYPEEntry = ConstantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[i]
			
			for i1, value in currentAsset do
				if ASSETTYPETOACCESSORYTYPEEntry then
					table.insert(List, CreateHumanoidDescriptionAccessoryInfoModule(i, i1, value))
				else
					table.insert(List1, i1)
				end
			end
			if ASSETTYPETOACCESSORYTYPEEntry == nil and #List1 > 0 then
				local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry = ConstantsModule.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[i]
				local Joined = table.concat(List1, ",")
				
				if ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry then
					HumanoidDescription[ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry] = Joined
				elseif i ~= ConstantsModule.ASSET_TYPE_NAME_TO_ID_STRING.Gear and not IsMakeupAssetTypeModule(i) then
					MutedErrorFunction(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(i))))
				end
			end
		end
		HumanoidDescription:SetAccessories(List, true)
		SetMakeupDescriptionsModule(HumanoidDescription, CurrentAssets)
	end
end

local function _(p1, List) --[[ Line: 61 | Named "applyAvatarScales" ]]
	-- upvalues: ConstantsModule (copy)
	if List then
		for i, value in List do
			p1[ConstantsModule.HUMANOID_DESCRIPTION_SCALE_TO_NAME[i]] = value
		end
	end
end

local _ = function(p2, List) --[[ Line: 71 | Named "applyBodyColor3s" ]]
	-- upvalues: ConstantsModule (copy)
	if List then
		for i, value in List do
			p2[ConstantsModule.BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION[i]] = value
		end
	end
end

local function applyEmotes(HumanoidDescription, EmotesSlotInfo) --[[ Line: 82 ]]
	if EmotesSlotInfo then
		local Emotes = {}
		local List = {}
		
		for _, value in EmotesSlotInfo do
			Emotes[tostring(value.assetId)] = { (tonumber(value.assetId)) }
			table.insert(List, { Slot = value.position, Name = tostring(value.assetId) })
		end
		HumanoidDescription:SetEmotes(Emotes)
		HumanoidDescription:SetEquippedEmotes(List)
	end
end

return function(p3) --[[ Line: 103 | Named "buildHumanoidDescription" ]]
	-- upvalues: applyCurrentAssets (copy), ConstantsModule (copy), applyEmotes (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	applyCurrentAssets(HumanoidDescription, p3.currentAssets)
	local AvatarScales = p3.avatarScales
	
	if AvatarScales then
		for i, avatarScale in AvatarScales do
			HumanoidDescription[ConstantsModule.HUMANOID_DESCRIPTION_SCALE_TO_NAME[i]] = avatarScale
		end
	end
	local BodyColor3s = p3.bodyColor3s
	
	if BodyColor3s then
		for i1, bodyColor3 in BodyColor3s do
			HumanoidDescription[ConstantsModule.BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION[i1]] = bodyColor3
		end
	end
	applyEmotes(HumanoidDescription, p3.emotesSlotInfo)
	
	return HumanoidDescription
end