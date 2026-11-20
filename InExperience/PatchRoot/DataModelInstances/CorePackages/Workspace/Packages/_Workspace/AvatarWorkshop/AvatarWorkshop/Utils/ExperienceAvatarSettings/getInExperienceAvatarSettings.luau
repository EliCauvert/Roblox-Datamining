local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local AvatarSettingsEngineFeaturesModule = require(AvatarWorkshop.Utils.ExperienceAvatarSettings.AvatarSettingsEngineFeatures)
local _ = require(AvatarWorkshop.Utils.ExperienceAvatarSettings.ExperienceAvatarSettingsTypes)
local config = {
	AvatarBodyRules = true,
	AvatarAnimationRules = true,
	AvatarCollisionRules = true,
	AvatarAccessoryRules = true,
	AvatarClothingRules = true,
	AvatarAbilityRules = true
}

local function readBodyOverrides(p1)
	return {
		[Enum.AvatarAssetType.Head] = p1.HeadOverride,
		[Enum.AvatarAssetType.Torso] = p1.TorsoOverride,
		[Enum.AvatarAssetType.LeftArm] = p1.LeftArmOverride,
		[Enum.AvatarAssetType.RightArm] = p1.RightArmOverride,
		[Enum.AvatarAssetType.LeftLeg] = p1.LeftLegOverride,
		[Enum.AvatarAssetType.RightLeg] = p1.RightLegOverride
	}
end

local function readAccessoryOverrides(p1)
	return {
		[Enum.AvatarAssetType.Hat] = p1.HeadAccessoryOverride,
		[Enum.AvatarAssetType.HairAccessory] = p1.HairAccessoryOverride,
		[Enum.AvatarAssetType.FaceAccessory] = p1.FaceAccessoryOverride,
		[Enum.AvatarAssetType.NeckAccessory] = p1.NeckAccessoryOverride,
		[Enum.AvatarAssetType.ShoulderAccessory] = p1.ShoulderAccessoryOverride,
		[Enum.AvatarAssetType.FrontAccessory] = p1.FrontAccessoryOverride,
		[Enum.AvatarAssetType.BackAccessory] = p1.BackAccessoryOverride,
		[Enum.AvatarAssetType.WaistAccessory] = p1.WaistAccessoryOverride
	}
end

local function readClothingOverrides(p1)
	return {
		[Enum.AvatarAssetType.TShirtAccessory] = p1.TShirtAccessoryOverride,
		[Enum.AvatarAssetType.ShirtAccessory] = p1.ShirtAccessoryOverride,
		[Enum.AvatarAssetType.JacketAccessory] = p1.JacketAccessoryOverride,
		[Enum.AvatarAssetType.SweaterAccessory] = p1.SweaterAccessoryOverride,
		[Enum.AvatarAssetType.PantsAccessory] = p1.PantsAccessoryOverride,
		[Enum.AvatarAssetType.ShortsAccessory] = p1.ShortsAccessoryOverride,
		[Enum.AvatarAssetType.DressSkirtAccessory] = p1.DressSkirtAccessoryOverride
	}
end

local function readRenamedClothingOverrides(p1)
	return {
		[Enum.AvatarAssetType.LeftShoeAccessory] = p1.LeftShoeAccessoryOverride,
		[Enum.AvatarAssetType.RightShoeAccessory] = p1.RightShoeAccessoryOverride,
		[Enum.AvatarAssetType.Shirt] = p1.ClassicShirtOverride,
		[Enum.AvatarAssetType.TShirt] = p1.ClassicTShirtOverride,
		[Enum.AvatarAssetType.Pants] = p1.ClassicPantsOverride
	}
end

local list = {
	{
		className = "AvatarBodyRules",
		modeProperty = "AppearanceMode",
		slots = {
			{
				property = "CustomHead",
				assetType = Enum.AvatarAssetType.Head
			},
			{
				property = "CustomTorso",
				assetType = Enum.AvatarAssetType.Torso
			},
			{
				property = "CustomLeftArm",
				assetType = Enum.AvatarAssetType.LeftArm
			},
			{
				property = "CustomRightArm",
				assetType = Enum.AvatarAssetType.RightArm
			},
			{
				property = "CustomLeftLeg",
				assetType = Enum.AvatarAssetType.LeftLeg
			},
			{
				property = "CustomRightLeg",
				assetType = Enum.AvatarAssetType.RightLeg
			}
		}
	},
	{
		className = "AvatarAccessoryRules",
		modeProperty = "CustomAccessoryMode",
		slots = {
			{
				property = "CustomHeadAccessory",
				assetType = Enum.AvatarAssetType.Hat
			},
			{
				property = "CustomHairAccessory",
				assetType = Enum.AvatarAssetType.HairAccessory
			},
			{
				property = "CustomFaceAccessory",
				assetType = Enum.AvatarAssetType.FaceAccessory
			},
			{
				property = "CustomNeckAccessory",
				assetType = Enum.AvatarAssetType.NeckAccessory
			},
			{
				property = "CustomShoulderAccessory",
				assetType = Enum.AvatarAssetType.ShoulderAccessory
			},
			{
				property = "CustomFrontAccessory",
				assetType = Enum.AvatarAssetType.FrontAccessory
			},
			{
				property = "CustomBackAccessory",
				assetType = Enum.AvatarAssetType.BackAccessory
			},
			{
				property = "CustomWaistAccessory",
				assetType = Enum.AvatarAssetType.WaistAccessory
			}
		}
	},
	{
		className = "AvatarClothingRules",
		modeProperty = "CustomClothingMode",
		slots = {
			{
				property = "CustomTShirtAccessory",
				assetType = Enum.AvatarAssetType.TShirtAccessory
			},
			{
				property = "CustomShirtAccessory",
				assetType = Enum.AvatarAssetType.ShirtAccessory
			},
			{
				property = "CustomPantsAccessory",
				assetType = Enum.AvatarAssetType.PantsAccessory
			},
			{
				property = "CustomShortsAccessory",
				assetType = Enum.AvatarAssetType.ShortsAccessory
			},
			{
				property = "CustomDressSkirtAccessory",
				assetType = Enum.AvatarAssetType.DressSkirtAccessory
			},
			{
				property = "CustomJacketAccessory",
				assetType = Enum.AvatarAssetType.JacketAccessory
			},
			{
				property = "CustomSweaterAccessory",
				assetType = Enum.AvatarAssetType.SweaterAccessory
			},
			{
				property = "CustomLeftShoesAccessory",
				assetType = Enum.AvatarAssetType.LeftShoeAccessory
			},
			{
				property = "CustomRightShoesAccessory",
				assetType = Enum.AvatarAssetType.RightShoeAccessory
			},
			{
				property = "CustomClassicShirtsAccessory",
				assetType = Enum.AvatarAssetType.Shirt
			},
			{
				property = "CustomClassicTShirtsAccessory",
				assetType = Enum.AvatarAssetType.TShirt
			},
			{
				property = "CustomClassicPantsAccessory",
				assetType = Enum.AvatarAssetType.Pants
			}
		}
	}
}

local function _(AvatarRules)
	return if AvatarRules and AvatarRules:IsA("AvatarRules") then AvatarRules else nil
end

local function isWellFormed(Object): boolean
	-- upvalues: config (copy)
	local t = {}
	
	for _, child in Object:GetChildren() do
		local ClassName = child.ClassName
		
		if not config[ClassName] or t[ClassName] or #child:GetChildren() > 0 then
			return false
		end
		t[ClassName] = true
	end
	return true
end

local _ = function(p1)
	local Success, Result = pcall(p1)
	
	return if Success then Result else nil
end

local _ = function(p1)
	return if p1.BuildMode == Enum.AvatarSettingsBuildMode.CustomBuild then {
		height = p1.CustomBuildHeight,
		width = p1.CustomBuildWidth,
		head = p1.CustomBuildHead,
		bodyType = p1.CustomBuildBodyType,
		proportion = p1.CustomBuildProportions
	} else nil
end

return function(p1, p2)
	-- upvalues: AvatarSettingsEngineFeaturesModule (copy), isWellFormed (copy), readBodyOverrides (copy), readAccessoryOverrides (copy), readClothingOverrides (copy), readRenamedClothingOverrides (copy), list (copy)
	local function _()
		-- upvalues: p1 (copy)
		return p1 or game:GetService("AvatarSettings")
	end
	
	local _ = function()
		-- upvalues: p2 (copy)
		return p2 or game:GetService("StarterPlayer")
	end
	
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy)
		local DefaultAvatarRules = (p1 or game:GetService("AvatarSettings")):FindFirstChild("DefaultAvatarRules")
		
		return if DefaultAvatarRules and DefaultAvatarRules:IsA("AvatarRules") then DefaultAvatarRules else nil
	end)
	local Result1 = if Success then Result else nil
	local Success1, Result2 = pcall(function()
		-- upvalues: AvatarSettingsEngineFeaturesModule (upval), p2 (copy), isWellFormed (upval)
		if AvatarSettingsEngineFeaturesModule.isPlaceAvatarRulesSupported() then
			local PlaceAvatarRules = (p2 or game:GetService("StarterPlayer")).PlaceAvatarRules
			local PlaceAvatarRules1 = if PlaceAvatarRules and PlaceAvatarRules:IsA("AvatarRules") then PlaceAvatarRules else nil
			
			return if PlaceAvatarRules1 and isWellFormed(PlaceAvatarRules1) then PlaceAvatarRules1 else nil
		else
			return nil
		end
	end)
	local Result3 = if Success1 then Result2 else nil
	
	local _ = function(ClassName)
		-- upvalues: Result3 (copy), Result1 (copy)
		local Success, Result = pcall(function()
			-- upvalues: Result3 (upval), ClassName (copy)
			return Result3 and Result3:FindFirstChildWhichIsA(ClassName)
		end)
		local Result2 = if Success then Result else nil
		
		if not Result2 then
			local Success1, Result4 = pcall(function()
				-- upvalues: Result1 (upval), ClassName (copy)
				return Result1 and Result1:FindFirstChildWhichIsA(ClassName)
			end)
			
			if Success1 then
				return Result4
			end
			Result2 = nil
		end
		return Result2
	end
	
	local Success2, Result4 = pcall(function()
		-- upvalues: AvatarSettingsEngineFeaturesModule (upval), p1 (copy)
		return if AvatarSettingsEngineFeaturesModule.isOverridesSchemaSupported() then (p1 or game:GetService("AvatarSettings")).RulesSchemaVersion else nil
	end)
	local Result5 = if Success2 then Result4 else nil
	local IsResultAbove: boolean = Result5 ~= nil and Result5 >= 3
	local ClassName = "AvatarBodyRules"
	local Success3, Result6 = pcall(function()
		-- upvalues: Result3 (copy), ClassName (copy)
		return Result3 and Result3:FindFirstChildWhichIsA(ClassName)
	end)
	local Result7 = if Success3 then Result6 else nil
	
	if not Result7 then
		local ClassName1 = "AvatarBodyRules"
		local Success4, Result8 = pcall(function()
			-- upvalues: Result1 (copy), ClassName1 (copy)
			return Result1 and Result1:FindFirstChildWhichIsA(ClassName1)
		end)
		Result7 = if Success4 then Result8 else nil
	end
	local ClassName2 = "AvatarAnimationRules"
	local Success5, Result9 = pcall(function()
		-- upvalues: Result3 (copy), ClassName2 (copy)
		return Result3 and Result3:FindFirstChildWhichIsA(ClassName2)
	end)
	local Result10 = if Success5 then Result9 else nil
	
	if not Result10 then
		local ClassName3 = "AvatarAnimationRules"
		local Success6, Result11 = pcall(function()
			-- upvalues: Result1 (copy), ClassName3 (copy)
			return Result1 and Result1:FindFirstChildWhichIsA(ClassName3)
		end)
		Result10 = if Success6 then Result11 else nil
	end
	local Success7, Result12 = pcall(function()
		-- upvalues: IsResultAbove (copy), Result7 (copy), Result1 (copy)
		return if IsResultAbove then if Result7 then Result7.AvatarType else nil elseif Result1 then Result1.AvatarType else nil
	end)
	local Result13 = if Success7 then Result12 else nil
	local AssetOverrides = {}
	
	local _ = function(List)
		-- upvalues: AssetOverrides (copy)
		if not List then return end
		for i, value in List do
			if value >= 0 then
				AssetOverrides[i] = value
			end
		end
	end
	
	if IsResultAbove then
		local ClassName4 = "AvatarAccessoryRules"
		local Success8, Result14 = pcall(function()
			-- upvalues: Result3 (copy), ClassName4 (copy)
			return Result3 and Result3:FindFirstChildWhichIsA(ClassName4)
		end)
		local Result15 = if Success8 then Result14 else nil
		
		if not Result15 then
			local ClassName5 = "AvatarAccessoryRules"
			local Success9, Result16 = pcall(function()
				-- upvalues: Result1 (copy), ClassName5 (copy)
				return Result1 and Result1:FindFirstChildWhichIsA(ClassName5)
			end)
			Result15 = if Success9 then Result16 else nil
		end
		local ClassName6 = "AvatarClothingRules"
		local Success10, Result17 = pcall(function()
			-- upvalues: Result3 (copy), ClassName6 (copy)
			return Result3 and Result3:FindFirstChildWhichIsA(ClassName6)
		end)
		local Result18 = if Success10 then Result17 else nil
		
		if not Result18 then
			local ClassName7 = "AvatarClothingRules"
			local Success11, Result19 = pcall(function()
				-- upvalues: Result1 (copy), ClassName7 (copy)
				return Result1 and Result1:FindFirstChildWhichIsA(ClassName7)
			end)
			Result18 = if Success11 then Result19 else nil
		end
		local Success12, Result20 = pcall(function()
			-- upvalues: Result7 (copy), readBodyOverrides (upval)
			return if Result7 then readBodyOverrides(Result7) else nil
		end)
		local Result21 = if Success12 then Result20 else nil
		
		if Result21 then
			for i, value1 in Result21 do
				if value1 >= 0 then
					AssetOverrides[i] = value1
				end
			end
		end
		local Success13, Result22 = pcall(function()
			-- upvalues: Result15 (copy), readAccessoryOverrides (upval)
			return if Result15 then readAccessoryOverrides(Result15) else nil
		end)
		local Result23 = if Success13 then Result22 else nil
		
		if Result23 then
			for i1, value2 in Result23 do
				if value2 >= 0 then
					AssetOverrides[i1] = value2
				end
			end
		end
		local Success15, Result26 = pcall(function()
			-- upvalues: Result18 (copy), readClothingOverrides (upval)
			return if Result18 then readClothingOverrides(Result18) else nil
		end)
		local Result27 = if Success15 then Result26 else nil
		
		if Result27 then
			for i3, value4 in Result27 do
				if value4 >= 0 then
					AssetOverrides[i3] = value4
				end
			end
		end
		local Success17, Result30 = pcall(function()
			-- upvalues: Result18 (copy), AvatarSettingsEngineFeaturesModule (upval), readRenamedClothingOverrides (upval)
			return if Result18 and AvatarSettingsEngineFeaturesModule.isClothingOverrideRenamesSupported() then readRenamedClothingOverrides(Result18) else nil
		end)
		local Result31 = if Success17 then Result30 else nil
		
		if Result31 then
			for i4, value5 in Result31 do
				if value5 >= 0 then
					AssetOverrides[i4] = value5
				end
			end
		end
	else
		for _, value in list do
			local ClassName8 = value.className
			local Success18, Result32 = pcall(function()
				-- upvalues: Result3 (copy), ClassName8 (copy)
				return Result3 and Result3:FindFirstChildWhichIsA(ClassName8)
			end)
			local Result33 = if Success18 then Result32 else nil
			
			if not Result33 then
				local Success19, Result34 = pcall(function()
					-- upvalues: Result1 (copy), ClassName8 (copy)
					return Result1 and Result1:FindFirstChildWhichIsA(ClassName8)
				end)
				Result33 = if Success19 then Result34 else nil
			end
			local Success14, Result24 = pcall(function()
				-- upvalues: Result33 (copy), value (copy)
				return if Result33 then Result33[value.modeProperty] else nil
			end)
			local Result25 = if Success14 then Result24 else nil
			
			if Result33 and (Result25 and Result25.Name ~= "PlayerChoice") then
				for _, slot in value.slots do
					local Success16, Result28 = pcall(function()
						-- upvalues: Result33 (copy), slot (copy)
						return if Result33[slot.property .. "Enabled"] == true then Result33[slot.property .. "Id"] else nil
					end)
					local Result29 = if Success16 then Result28 else nil
					
					if Result29 then
						local config = { [slot.assetType] = Result29 }
						
						if config then
							for i2, value3 in config do
								if value3 >= 0 then
									AssetOverrides[i2] = value3
								end
							end
						end
					end
				end
			end
		end
	end
	local t = {}
	local AvatarType = Result13
	
	if not AvatarType then
		local Success20, Result35 = pcall(function()
			-- upvalues: p2 (copy)
			return (p2 or game:GetService("StarterPlayer")).GameSettingsAvatar
		end)
		AvatarType = if Success20 then Result35 else nil
	end
	t.avatarType = AvatarType
	t.assetOverrides = AssetOverrides
	local Success21, Result36 = pcall(function()
		-- upvalues: Result7 (copy)
		return if Result7 and Result7.BuildMode == Enum.AvatarSettingsBuildMode.CustomBuild then {
			height = Result7.CustomBuildHeight,
			width = Result7.CustomBuildWidth,
			head = Result7.CustomBuildHead,
			bodyType = Result7.CustomBuildBodyType,
			proportion = Result7.CustomBuildProportions
		} else nil
	end)
	t.scaleLimits = if Success21 then Result36 else nil
	local Success22, Result37 = pcall(function()
		-- upvalues: Result10 (copy)
		return if Result10 then Result10.AnimationPacksMode else nil
	end)
	t.animationPacksMode = if Success22 then Result37 else nil
	
	return t
end