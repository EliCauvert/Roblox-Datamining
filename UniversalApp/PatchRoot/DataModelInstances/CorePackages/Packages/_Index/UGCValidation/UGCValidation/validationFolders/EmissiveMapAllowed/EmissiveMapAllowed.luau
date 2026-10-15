local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateEmissiveMapAllowedModule = require(parent.flags.getFFlagUGCValidateEmissiveMapAllowed)
local getFFlagUGCValidateDecalBlockEmissivesModule = require(parent.flags.getFFlagUGCValidateDecalBlockEmissives)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.MAKEUP
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.rootInstance
	},
	fflag = function()
		-- upvalues: getFFlagUGCValidateEmissiveMapAllowedModule (ref), getFFlagUGCValidateDecalBlockEmissivesModule (ref)
		return getFFlagUGCValidateEmissiveMapAllowedModule() or getFFlagUGCValidateDecalBlockEmissivesModule()
	end,
	expectedFailures = {}
}

local function _(p1)
	return p1.EmissiveMaskContent.SourceType ~= Enum.ContentSourceType.None
end

local function isDecalEmissive(p1)
	local emissiveTint = p1.EmissiveTint
	
	return if p1.EmissiveMaskContent.SourceType == Enum.ContentSourceType.None then if math.abs(p1.EmissiveStrength - 1) <= 0.00001 then if math.abs(emissiveTint.R - 1) <= 0.00001 then if math.abs(emissiveTint.G - 1) <= 0.00001 then math.abs(emissiveTint.B - 1) > 0.00001 else true else true else true else p1.EmissiveMaskContent.SourceType ~= Enum.ContentSourceType.None
end

local function reportEmissiveDecals(p1, p2)
	-- upvalues: isDecalEmissive (ref), errorSourceStringsModule (ref)
	for i, v in p2 do
		if v:IsA("Decal") and isDecalEmissive(v) then
			p1:fail(errorSourceStringsModule.Keys.EmissiveMap_NotAllowedOnDecal, { InstancePath = v:GetFullName() })
		end
	end
end

local function reportInExperienceEmissive(p3, p4, p5)
	-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref)
	if not (if p5.consumerEnv ~= validationEnumsModule.ConsumerEnv.IEC then p5.backendConfigs.universeId ~= nil else true) then return end
	for i, v in p4 do
		if v:IsA("SurfaceAppearance") and v.EmissiveMaskContent.SourceType ~= Enum.ContentSourceType.None then
			p3:fail(errorSourceStringsModule.Keys.EmissiveMap_NotAllowedInExperience)
			
			return
		end
	end
end

function t.run(p6, p7)
	-- upvalues: getFFlagUGCValidateDecalBlockEmissivesModule (ref), reportEmissiveDecals (ref), getFFlagUGCValidateEmissiveMapAllowedModule (ref), reportInExperienceEmissive (ref)
	local rootInstance = p7.rootInstance
	local descendants = rootInstance:GetDescendants()
	table.insert(descendants, rootInstance)
	
	if getFFlagUGCValidateDecalBlockEmissivesModule() then
		reportEmissiveDecals(p6, descendants)
	end
	if getFFlagUGCValidateEmissiveMapAllowedModule() then
		reportInExperienceEmissive(p6, descendants, p7.consumerConfig)
	end
end

return t