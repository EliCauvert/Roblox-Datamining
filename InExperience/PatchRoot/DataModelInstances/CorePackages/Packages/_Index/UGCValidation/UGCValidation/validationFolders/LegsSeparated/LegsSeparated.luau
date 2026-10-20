local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local BoundsDataUtilsModule = require(Parent.util.BoundsDataUtils)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)
local GetFFlagUGCValidateHeadAboveTorsoModule = require(Parent.flags.getFFlagUGCValidateHeadAboveTorso)
local GetFStringUGCValidateLegHipAttachmentRangeModule = require(Parent.flags.GetFStringUGCValidateLegHipAttachmentRange)
local GetFStringUGCValidateAllowedLegOverlapMultiplierModule = require(Parent.flags.GetFStringUGCValidateAllowedLegOverlapMultiplier)
local LegsSeparatedModule = {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.FULL_BODY
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.renderMeshesData
	}
}

if GetFFlagUGCValidateHeadAboveTorsoModule() then
	LegsSeparatedModule.conditionalData = {
		ValidationEnumsModule.SharedDataMember.fullBodyPartsMetrics
	}
end
LegsSeparatedModule.expectedFailures = {}

local function validateAttachmentPosition(p1, RootInstance, AssetType)
	-- upvalues: GetFStringUGCValidateLegHipAttachmentRangeModule (copy), ErrorSourceStringsModule (copy)
	if AssetType == Enum.AssetType.RightLeg then
		local ScaledX = RootInstance.RightUpperLeg.Size.X * GetFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if ScaledX < RootInstance.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X then
			p1:fail(ErrorSourceStringsModule.Keys.LegsSeparated_HipAttachmentOutOfRange, {
				attachmentPath = "RightUpperLeg.RightHipRigAttachment.CFrame.Position.X",
				comparison = "greater than",
				currentValue = string.format("%.2f", RootInstance.RightUpperLeg.RightHipRigAttachment.CFrame.Position.X),
				cutoff = string.format("%.2f", ScaledX)
			})
			
			return
		end
	elseif AssetType == Enum.AssetType.LeftLeg then
		local ScaledAsNumberResult = -RootInstance.LeftUpperLeg.Size.X * GetFStringUGCValidateLegHipAttachmentRangeModule.asNumber()
		
		if RootInstance.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X < ScaledAsNumberResult then
			p1:fail(ErrorSourceStringsModule.Keys.LegsSeparated_HipAttachmentOutOfRange, {
				attachmentPath = "LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X",
				comparison = "less than",
				currentValue = string.format("%.2f", RootInstance.LeftUpperLeg.LeftHipRigAttachment.CFrame.Position.X),
				cutoff = string.format("%.2f", ScaledAsNumberResult)
			})
		end
	end
end

local function calculateBounds(p1, List)
	-- upvalues: BoundsDataUtilsModule (copy)
	local CombineBoundsResult = {}
	
	for _, value in List do
		CombineBoundsResult = BoundsDataUtilsModule.combineBounds(CombineBoundsResult, p1[value].boundsData)
	end
	return CombineBoundsResult
end

local function buildEditableMeshesFromSharedData(p2)
	local t = {}
	
	for ChildName, value in p2.renderMeshesData do
		local Child = p2.rootInstance:FindFirstChild(ChildName, true)
		
		if Child and value.editable then
			t[Child] = { MeshId = { created = false, instance = value.editable } }
		end
	end
	return t
end

local function createAllBodyPartsFromRootInstance(RootInstance)
	local Parts = {}
	
	for _, Part in RootInstance:GetChildren() do
		if Part:IsA("MeshPart") then
			Parts[Part.Name] = Part
		end
	end
	return Parts
end

local function checkLegOverlap(p3, FullBodyPartsMetrics)
	-- upvalues: calculateBounds (copy), ConstantsModule (copy), BoundsDataUtilsModule (copy), GetFStringUGCValidateAllowedLegOverlapMultiplierModule (copy), ErrorSourceStringsModule (copy)
	local Bounds = calculateBounds(FullBodyPartsMetrics, {
		ConstantsModule.NAMED_R15_BODY_PARTS.LeftUpperLeg,
		ConstantsModule.NAMED_R15_BODY_PARTS.LeftLowerLeg,
		ConstantsModule.NAMED_R15_BODY_PARTS.LeftFoot
	})
	local BoundsCenters = BoundsDataUtilsModule.calculateBoundsCenters(Bounds)
	local BoundsDimensions = BoundsDataUtilsModule.calculateBoundsDimensions(Bounds)
	local Bounds1 = calculateBounds(FullBodyPartsMetrics, {
		ConstantsModule.NAMED_R15_BODY_PARTS.RightUpperLeg,
		ConstantsModule.NAMED_R15_BODY_PARTS.RightLowerLeg,
		ConstantsModule.NAMED_R15_BODY_PARTS.RightFoot
	})
	local BoundsCenters1 = BoundsDataUtilsModule.calculateBoundsCenters(Bounds1)
	local BoundsDimensions1 = BoundsDataUtilsModule.calculateBoundsDimensions(Bounds1)
	
	if not BoundsCenters or not BoundsDimensions or not BoundsCenters1 or not BoundsDimensions1 then return end
	local XDelta = (BoundsDimensions.X + BoundsDimensions1.X) * 0.5 - (BoundsCenters1.X - BoundsCenters.X)
	
	if XDelta <= 0 then return end
	local ScaledX = BoundsDimensions.X * GetFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	local ScaledX1 = BoundsDimensions1.X * GetFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber()
	
	if ScaledX < XDelta or ScaledX1 < XDelta then
		p3:fail(ErrorSourceStringsModule.Keys.LegsSeparated_LegsOverlap, {
			overlap = string.format("%.2f", XDelta),
			leftMax = string.format("%.2f", ScaledX),
			rightMax = string.format("%.2f", ScaledX1)
		})
	end
end

local function validateFullBodySeparation(p3, p4)
	-- upvalues: GetFFlagUGCValidateHeadAboveTorsoModule (copy), checkLegOverlap (copy), createAllBodyPartsFromRootInstance (copy), buildEditableMeshesFromSharedData (copy), ValidationEnumsModule (copy), BoundsCalculatorModule (copy), ErrorSourceStringsModule (copy)
	if GetFFlagUGCValidateHeadAboveTorsoModule() then
		local FullBodyPartsMetrics = p4.fullBodyPartsMetrics
		
		if FullBodyPartsMetrics and next(FullBodyPartsMetrics) then
			checkLegOverlap(p3, FullBodyPartsMetrics)
			
			return
		end
		return
	else
		local IndividualFullBodyPartsData, IndividualFullBodyPartsData2, IndividualFullBodyPartsData3 = BoundsCalculatorModule.calculateIndividualFullBodyPartsData(createAllBodyPartsFromRootInstance(p4.rootInstance), {
			isServer = p4.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend,
			editableMeshes = buildEditableMeshesFromSharedData(p4)
		}, nil, false)
		
		if IndividualFullBodyPartsData then
			checkLegOverlap(p3, IndividualFullBodyPartsData3)
			
			return
		else
			p3:fail(ErrorSourceStringsModule.Keys.LegsSeparated_BoundsCalculationFailed, {
				details = if IndividualFullBodyPartsData2 then table.concat(IndividualFullBodyPartsData2, "; ") else "Unknown error"
			})
		end
	end
end

local function _(p3)
	return if p3.uploadEnum and p3.uploadEnum.assetType then p3.uploadEnum.assetType else nil
end

function LegsSeparatedModule.run(p3, p4)
	-- upvalues: ValidationEnumsModule (copy), validateFullBodySeparation (copy), validateAttachmentPosition (copy)
	if p4.uploadCategory == ValidationEnumsModule.UploadCategory.FULL_BODY then
		validateFullBodySeparation(p3, p4)
		
		return
	end
	local AssetType = if p4.uploadEnum and p4.uploadEnum.assetType then p4.uploadEnum.assetType else nil
	
	if not AssetType then return end
	if AssetType == Enum.AssetType.RightLeg or AssetType == Enum.AssetType.LeftLeg then
		validateAttachmentPosition(p3, p4.rootInstance, AssetType)
		
		return
	end
end

return LegsSeparatedModule