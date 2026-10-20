local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateEmissiveMapAllowedModule = require(Parent.flags.getFFlagUGCValidateEmissiveMapAllowed)
local GetFFlagUGCValidateDecalBlockEmissivesModule = require(Parent.flags.getFFlagUGCValidateDecalBlockEmissives)

local function _(p1): boolean
	return p1.EmissiveMaskContent.SourceType ~= Enum.ContentSourceType.None
end

local function isDecalEmissive(Decal): boolean
	local EmissiveTint = Decal.EmissiveTint
	
	return Decal.EmissiveMaskContent.SourceType ~= Enum.ContentSourceType.None or (math.abs(Decal.EmissiveStrength - 1) > 0.00001 or (math.abs(EmissiveTint.R - 1) > 0.00001 or (math.abs(EmissiveTint.G - 1) > 0.00001 or math.abs(EmissiveTint.B - 1) > 0.00001)))
end

local function reportEmissiveDecals(p1, Descendants)
	-- upvalues: isDecalEmissive (copy), ErrorSourceStringsModule (copy)
	for _, Decal in Descendants do
		if Decal:IsA("Decal") and isDecalEmissive(Decal) then
			p1:fail(ErrorSourceStringsModule.Keys.EmissiveMap_NotAllowedOnDecal, { InstancePath = Decal:GetFullName() })
		end
	end
end

local function reportInExperienceEmissive(p2, Descendants, ConsumerConfig)
	-- upvalues: ValidationEnumsModule (copy), ErrorSourceStringsModule (copy)
	if ConsumerConfig.consumerEnv ~= ValidationEnumsModule.ConsumerEnv.IEC and ConsumerConfig.backendConfigs.universeId == nil then return end
	for _, SurfaceAppearance in Descendants do
		if SurfaceAppearance:IsA("SurfaceAppearance") and SurfaceAppearance.EmissiveMaskContent.SourceType ~= Enum.ContentSourceType.None then
			p2:fail(ErrorSourceStringsModule.Keys.EmissiveMap_NotAllowedInExperience)
			break
		end
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.MAKEUP
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.rootInstance
	},
	fflag = function()
		-- upvalues: GetFFlagUGCValidateEmissiveMapAllowedModule (copy), GetFFlagUGCValidateDecalBlockEmissivesModule (copy)
		return GetFFlagUGCValidateEmissiveMapAllowedModule() or GetFFlagUGCValidateDecalBlockEmissivesModule()
	end,
	expectedFailures = {},
	run = function(p3, p4)
		-- upvalues: GetFFlagUGCValidateDecalBlockEmissivesModule (copy), reportEmissiveDecals (copy), GetFFlagUGCValidateEmissiveMapAllowedModule (copy), reportInExperienceEmissive (copy)
		local RootInstance = p4.rootInstance
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		if GetFFlagUGCValidateDecalBlockEmissivesModule() then
			reportEmissiveDecals(p3, Descendants)
		end
		if GetFFlagUGCValidateEmissiveMapAllowedModule() then
			reportInExperienceEmissive(p3, Descendants, p4.consumerConfig)
		end
	end
}