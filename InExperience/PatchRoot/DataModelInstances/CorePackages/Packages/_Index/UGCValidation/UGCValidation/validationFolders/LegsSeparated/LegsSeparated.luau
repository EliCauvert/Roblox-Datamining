local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local boundsDataUtilsModule = require(parent.util.BoundsDataUtils)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local getFFlagUGCValidateMigratePoseBlockingModule = require(parent.flags.getFFlagUGCValidateMigratePoseBlocking)
local getFFlagUGCValidateLegFullBodySeparationModule = require(parent.flags.getFFlagUGCValidateLegFullBodySeparation)
local getFFlagUGCValidateHeadAboveTorsoModule = require(parent.flags.getFFlagUGCValidateHeadAboveTorso)
local getFStringUGCValidateLegHipAttachmentRangeModule = require(parent.flags.GetFStringUGCValidateLegHipAttachmentRange)
local getFStringUGCValidateAllowedLegOverlapMultiplierModule = require(parent.flags.GetFStringUGCValidateAllowedLegOverlapMultiplier)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.FULL_BODY
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.renderMeshesData
	}
}

if getFFlagUGCValidateHeadAboveTorsoModule() then
	t.conditionalData = {
		validationEnumsModule.SharedDataMember.fullBodyPartsMetrics
	}
end
t.fflag = getFFlagUGCValidateMigratePoseBlockingModule
t.expectedFailures = {}

local function validateAttachmentPosition(p1, p2, p3)
	-- upvalues: getFStringUGCValidateLegHipAttachmentRangeModule (ref), errorSourceStringsModule (ref)
	if p3 == Enum.AssetType.RightLeg then
		local var1 = p2.RightUpperLeg.Size.X * getFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if var1 < p2.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X then
			p1:fail(errorSourceStringsModule.Keys.LegsSeparated_HipAttachmentOutOfRange, {
				attachmentPath = "RightUpperLeg.RightHipRigAttachment.CFrame.Position.X",
				comparison = "greater than",
				currentValue = string.format("%.2f", p2.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X),
				cutoff = string.format("%.2f", var1)
			})
			
			return
		end
	elseif p3 == Enum.AssetType.LeftLeg then
		local var2 = -p2.LeftUpperLeg.Size.X * getFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if p2.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X < var2 then
			p1:fail(errorSourceStringsModule.Keys.LegsSeparated_HipAttachmentOutOfRange, {
				attachmentPath = "LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X",
				comparison = "less than",
				currentValue = string.format("%.2f", p2.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X),
				cutoff = string.format("%.2f", var2)
			})
		end
	end
end

local function calculateBounds(p1, p2)
	-- upvalues: boundsDataUtilsModule (ref)
	local t = {}
	
	for i, v in p2 do
		t = boundsDataUtilsModule.combineBounds(t, p1[v].boundsData)
	end
	return t
end

local function buildEditableMeshesFromSharedData(p3)
	local t = {}
	
	for i, v in p3.renderMeshesData do
		local var1 = p3.rootInstance:FindFirstChild(i, true)
		
		if var1 and v.editable then
			t[var1] = { MeshId = { created = false, instance = v.editable } }
		end
	end
	return t
end

local function createAllBodyPartsFromRootInstance(p4)
	local t = {}
	
	for i, v in p4:GetChildren() do
		if v:IsA("MeshPart") then
			t[v.Name] = v
		end
	end
	return t
end

local function checkLegOverlap(p5, p6)
	-- upvalues: calculateBounds (ref), constantsModule (ref), boundsDataUtilsModule (ref), getFStringUGCValidateAllowedLegOverlapMultiplierModule (ref), errorSourceStringsModule (ref)
	local var2 = calculateBounds(p6, {
		constantsModule.NAMED_R15_BODY_PARTS.LeftUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftFoot
	})
	local var3 = boundsDataUtilsModule.calculateBoundsCenters(var2)
	local var4 = boundsDataUtilsModule.calculateBoundsDimensions(var2)
	local var5 = calculateBounds(p6, {
		constantsModule.NAMED_R15_BODY_PARTS.RightUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightFoot
	})
	local var6 = boundsDataUtilsModule.calculateBoundsCenters(var5)
	local var7 = boundsDataUtilsModule.calculateBoundsDimensions(var5)
	
	if not var3 or not var4 or (not var6 or not var7) then return end
	local var8 = (var4.X + var7.X) * 0.5 - (var6.X - var3.X)
	
	if var8 <= 0 then return end
	local var9 = var4.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	local var10 = var7.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	
	if var9 < var8 or var10 < var8 then
		p5:fail(errorSourceStringsModule.Keys.LegsSeparated_LegsOverlap, {
			overlap = string.format("%.2f", var8),
			leftMax = string.format("%.2f", var9),
			rightMax = string.format("%.2f", var10)
		})
	end
end

local function validateFullBodySeparation(p5, p6)
	-- upvalues: getFFlagUGCValidateLegFullBodySeparationModule (ref), getFFlagUGCValidateHeadAboveTorsoModule (ref), checkLegOverlap (ref), createAllBodyPartsFromRootInstance (ref), buildEditableMeshesFromSharedData (ref), validationEnumsModule (ref), boundsCalculatorModule (ref), errorSourceStringsModule (ref)
	if not getFFlagUGCValidateLegFullBodySeparationModule() then return end
	if getFFlagUGCValidateHeadAboveTorsoModule() then
		local fullBodyPartsMetrics = p6.fullBodyPartsMetrics
		
		if fullBodyPartsMetrics and next(fullBodyPartsMetrics) then
			checkLegOverlap(p5, fullBodyPartsMetrics)
			
			return
		end
		return
	else
		local var2, var3, var4 = boundsCalculatorModule.calculateIndividualFullBodyPartsData(createAllBodyPartsFromRootInstance(p6.rootInstance), {
			isServer = p6.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
			editableMeshes = buildEditableMeshesFromSharedData(p6)
		}, nil, false)
		
		if var2 then
			checkLegOverlap(p5, var4)
			
			return
		end
		p5:fail(errorSourceStringsModule.Keys.LegsSeparated_BoundsCalculationFailed, {
			details = if var3 then table.concat(var3, "; ") else "Unknown error"
		})
	end
end

local function _(value)
	return if value.uploadEnum and value.uploadEnum.assetType then value.uploadEnum.assetType else nil
end

function t.run(p5, p6)
	-- upvalues: validationEnumsModule (ref), validateFullBodySeparation (ref), validateAttachmentPosition (ref)
	if p6.uploadCategory == validationEnumsModule.UploadCategory.FULL_BODY then
		validateFullBodySeparation(p5, p6)
		
		return
	end
	local var2 = if p6.uploadEnum and p6.uploadEnum.assetType then p6.uploadEnum.assetType else nil
	
	if not var2 then return end
	if var2 == Enum.AssetType.RightLeg or var2 == Enum.AssetType.LeftLeg then
		validateAttachmentPosition(p5, p6.rootInstance, var2)
		
		return
	end
end

return t