local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local mutedError = require(parent.Loggers).mutedError
local constantsModule = require(avatarExperienceCommon.Constants)
local createHumanoidDescriptionAccessoryInfoModule = require(avatarExperienceCommon.Utils.Humanoid.createHumanoidDescriptionAccessoryInfo)
local setMakeupDescriptionsModule = require(avatarExperienceCommon.Utils.Humanoid.setMakeupDescriptions)
local isMakeupAssetTypeModule = require(avatarExperienceCommon.Utils.isMakeupAssetType)
local fFlagAXMakeupEquipping = require(parent.AvatarExperienceFlags).FFlagAXMakeupEquipping

local function applyCurrentAssets(value, p0)
	-- upvalues: constantsModule (ref), createHumanoidDescriptionAccessoryInfoModule (ref), fFlagAXMakeupEquipping (ref), isMakeupAssetTypeModule (ref), mutedError (ref), setMakeupDescriptionsModule (ref)
	if p0 then
		local t = {}
		
		for i, v in p0 do
			local t_1 = {}
			local var9 = constantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[i]
			
			for i_1, v_1 in v do
				if var9 then
					table.insert(t, createHumanoidDescriptionAccessoryInfoModule(i, i_1, v_1))
				else
					table.insert(t_1, i_1)
				end
			end
			if var9 == nil and #t_1 > 0 then
				local var10 = constantsModule.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[i]
				local joined = table.concat(t_1, ",")
				
				if var10 then
					value[var10] = joined
				elseif i ~= constantsModule.ASSET_TYPE_NAME_TO_ID_STRING.Gear and (not fFlagAXMakeupEquipping or not isMakeupAssetTypeModule(i)) then
					mutedError(string.format("assetTypeId: %s not recognized as member of humanoidDescription", tostring(i)))
				end
			end
		end
		value:SetAccessories(t, true)
		
		if fFlagAXMakeupEquipping then
			setMakeupDescriptionsModule(value, p0)
		end
	end
end

local function _(p1, p2)
	-- upvalues: constantsModule (ref)
	if p2 then
		for i, v in p2 do
			p1[constantsModule.HUMANOID_DESCRIPTION_SCALE_TO_NAME[i]] = v
		end
	end
end

local _ = function(p3, p4)
	-- upvalues: constantsModule (ref)
	if p4 then
		for i, v in p4 do
			p3[constantsModule.BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION[i]] = v
		end
	end
end

local function applyEmotes(p5, p6)
	if p6 then
		local t = {}
		local t_1 = {}
		
		for i, v in p6 do
			t[tostring(v.assetId)] = { tonumber(v.assetId) }
			table.insert(t_1, { Slot = v.position, Name = tostring(v.assetId) })
		end
		p5:SetEmotes(t)
		p5:SetEquippedEmotes(t_1)
	end
end

return function(p7)
	-- upvalues: applyCurrentAssets (ref), constantsModule (ref), applyEmotes (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	applyCurrentAssets(humanoidDescription, p7.currentAssets)
	local avatarScales = p7.avatarScales
	
	if avatarScales then
		for i, v in avatarScales do
			humanoidDescription[constantsModule.HUMANOID_DESCRIPTION_SCALE_TO_NAME[i]] = v
		end
	end
	local bodyColor3s = p7.bodyColor3s
	
	if bodyColor3s then
		for i, v in bodyColor3s do
			humanoidDescription[constantsModule.BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION[i]] = v
		end
	end
	applyEmotes(humanoidDescription, p7.emotesSlotInfo)
	
	return humanoidDescription
end