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

local function validateAttachmentPosition(p0, p1, p2) --[[ line: 39 ]]
	-- upvalues: getFStringUGCValidateLegHipAttachmentRangeModule (ref), errorSourceStringsModule (ref)
	if p2 == Enum.AssetType.RightLeg then
		local var15 = p1.RightUpperLeg.Size.X * getFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if var15 < p1.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X then
			p0:fail(errorSourceStringsModule.Keys.LegsSeparated_HipAttachmentOutOfRange, {
				attachmentPath = "RightUpperLeg.RightHipRigAttachment.CFrame.Position.X",
				comparison = "greater than",
				currentValue = string.format("%.2f", p1.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X),
				cutoff = string.format("%.2f", var15)
			})
			
			return
		end
	elseif p2 == Enum.AssetType.LeftLeg then
		local var16 = -p1.LeftUpperLeg.Size.X * getFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if p1.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X < var16 then
			p0:fail(errorSourceStringsModule.Keys.LegsSeparated_HipAttachmentOutOfRange, {
				attachmentPath = "LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X",
				comparison = "less than",
				currentValue = string.format("%.2f", p1.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X),
				cutoff = string.format("%.2f", var16)
			})
		end
	end
end

local function calculateBounds(p3, p4) --[[ line: 70 ]]
	-- upvalues: boundsDataUtilsModule (ref)
	local t = {}
	
	for i, v in p4 do
		t = boundsDataUtilsModule.combineBounds(t, p3[v].boundsData)
	end
	return t
end

local function buildEditableMeshesFromSharedData(p5) --[[ line: 78 ]]
	local t = {}
	
	for i, v in p5.renderMeshesData do
		local var19 = p5.rootInstance:FindFirstChild(i, true)
		
		if var19 and v.editable then
			t[var19] = { MeshId = { created = false, instance = v.editable } }
		end
	end
	return t
end

local function createAllBodyPartsFromRootInstance(p6) --[[ line: 90 ]]
	local t = {}
	
	for i, v in p6:GetChildren() do
		if v:IsA("MeshPart") then
			t[v.Name] = v
		end
	end
	return t
end

local function validateFullBodySeparation(p7, p8) --[[ line: 100 ]]
	-- upvalues: getFFlagUGCValidateLegFullBodySeparationModule (ref), createAllBodyPartsFromRootInstance (ref), buildEditableMeshesFromSharedData (ref), validationEnumsModule (ref), boundsCalculatorModule (ref), errorSourceStringsModule (ref), calculateBounds (ref), constantsModule (ref), boundsDataUtilsModule (ref), getFStringUGCValidateAllowedLegOverlapMultiplierModule (ref)
	if not getFFlagUGCValidateLegFullBodySeparationModule() then return end
	local var21, var22, var23 = boundsCalculatorModule.calculateIndividualFullBodyPartsData(createAllBodyPartsFromRootInstance(p8.rootInstance), {
		isServer = p8.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
		editableMeshes = buildEditableMeshesFromSharedData(p8)
	}, nil, false)
	
	if not var21 then
		p7:fail(errorSourceStringsModule.Keys.LegsSeparated_BoundsCalculationFailed, {
			details = if var22 then table.concat(var22, "; ") else "Unknown error"
		})
		
		return
	end
	local var24 = calculateBounds(var23, {
		constantsModule.NAMED_R15_BODY_PARTS.LeftUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.LeftFoot
	})
	local var25 = boundsDataUtilsModule.calculateBoundsCenters(var24)
	local var26 = boundsDataUtilsModule.calculateBoundsDimensions(var24)
	local var27 = calculateBounds(var23, {
		constantsModule.NAMED_R15_BODY_PARTS.RightUpperLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightLowerLeg,
		constantsModule.NAMED_R15_BODY_PARTS.RightFoot
	})
	local var28 = boundsDataUtilsModule.calculateBoundsCenters(var27)
	local var29 = boundsDataUtilsModule.calculateBoundsDimensions(var27)
	
	if not var25 or not var26 or (not var28 or not var29) then return end
	local var30 = (var26.X + var29.X) * 0.5 - (var28.X - var25.X)
	
	if var30 <= 0 then return end
	local var31 = var26.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	local var32 = var29.X * getFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	
	if var31 < var30 or var32 < var30 then
		p7:fail(errorSourceStringsModule.Keys.LegsSeparated_LegsOverlap, {
			overlap = string.format("%.2f", var30),
			leftMax = string.format("%.2f", var31),
			rightMax = string.format("%.2f", var32)
		})
	end
end

local function _(value) --[[ line: 161 | named "getAssetTypeFromUploadEnum" ]]
	return if value.uploadEnum and value.uploadEnum.assetType then value.uploadEnum.assetType else nil
end

function t.run(p9, p10) --[[ line: 168 ]]
	-- upvalues: validationEnumsModule (ref), validateFullBodySeparation (ref), validateAttachmentPosition (ref)
	if p10.uploadCategory == validationEnumsModule.UploadCategory.FULL_BODY then
		validateFullBodySeparation(p9, p10)
		
		return
	end
	local var33 = if p10.uploadEnum and p10.uploadEnum.assetType then p10.uploadEnum.assetType else nil
	
	if not var33 then return end
	if var33 == Enum.AssetType.RightLeg or var33 == Enum.AssetType.LeftLeg then
		validateAttachmentPosition(p9, p10.rootInstance, var33)
		
		return
	end
end

return t