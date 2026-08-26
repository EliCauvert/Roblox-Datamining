local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local boundsDataUtilsModule = require(parent.util.BoundsDataUtils)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local getFFlagUGCValidateMigratePoseBlockingModule = require(parent.flags.getFFlagUGCValidateMigratePoseBlocking)
local getFFlagUGCValidateLegFullBodySeparationModule = require(parent.flags.getFFlagUGCValidateLegFullBodySeparation)
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
	},
	fflag = getFFlagUGCValidateMigratePoseBlockingModule,
	expectedFailures = {}
}

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

local function validateFullBodySeparation(p5, p6)
	-- upvalues: getFFlagUGCValidateLegFullBodySeparationModule (ref), createAllBodyPartsFromRootInstance (ref), buildEditableMeshesFromSharedData (ref), validationEnumsModule (ref), boundsCalculatorModule (ref), errorSourceStringsModule (ref), calculateBounds (ref), constantsModule (ref), boundsDataUtilsModule (ref), getFStringUGCValidateAllowedLegOverlapMultiplierModule (ref)
	if not getFFlagUGCValidateLegFullBodySeparationModule() then return end
	local var2, var3, var4 = boundsCalculatorModule.calculateIndividualFullBodyPartsData(createAllBodyPartsFromRootInstance(p6.rootInstance), {
		isServer = p6.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
		editableMeshes = buildEditableMeshesFromSharedData(p6)
	}, nil, false)
	
	if not var2 then
		p5:fail(errorSourceStringsModule.Keys.LegsSeparated_BoundsCalculationFailed, {
			details = if var3 then table.concat(var3, "; ") else "Unknown error"
		})
		
		return
	end
	local var5 = calculateBounds(var4, {
		constantsModule.NAMED_R15_BODY_PARTS.LeftUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftFoot
	})
	local var6 = boundsDataUtilsModule.calculateBoundsCenters(var5)
	local var7 = boundsDataUtilsModule.calculateBoundsDimensions(var5)
	local var8 = calculateBounds(var4, {
		constantsModule.NAMED_R15_BODY_PARTS.RightUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightFoot
	})
	local var9 = boundsDataUtilsModule.calculateBoundsCenters(var8)
	local var10 = boundsDataUtilsModule.calculateBoundsDimensions(var8)
	
	if not var6 or not var7 or (not var9 or not var10) then return end
	local var11 = (var7.X + var10.X) * 0.5 - (var9.X - var6.X)
	
	if var11 <= 0 then return end
	local var12 = var7.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	local var13 = var10.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	
	if var12 < var11 or var13 < var11 then
		p5:fail(errorSourceStringsModule.Keys.LegsSeparated_LegsOverlap, {
			overlap = string.format("%.2f", var11),
			leftMax = string.format("%.2f", var12),
			rightMax = string.format("%.2f", var13)
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