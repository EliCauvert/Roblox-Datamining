local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)
local GetFFlagUGCValidateHeadAboveTorsoModule = require(Parent.flags.getFFlagUGCValidateHeadAboveTorso)
local SharedDataMember = ValidationEnumsModule.SharedDataMember
local ExtentsWithinParentModule = {
	categories = { ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS }
}

if GetFFlagUGCValidateHeadAboveTorsoModule() then
	table.insert(ExtentsWithinParentModule.categories, ValidationEnumsModule.UploadCategory.FULL_BODY)
end
ExtentsWithinParentModule.requiredData = {
	ValidationEnumsModule.SharedDataMember.rootInstance,
	ValidationEnumsModule.SharedDataMember.uploadEnum
}
ExtentsWithinParentModule.conditionalData = { SharedDataMember.renderMeshesData }

if GetFFlagUGCValidateHeadAboveTorsoModule() then
	table.insert(ExtentsWithinParentModule.conditionalData, SharedDataMember.fullBodyPartsMetrics)
end
ExtentsWithinParentModule.expectedFailures = {}
local config = {
	[Enum.AssetType.Torso] = true,
	[Enum.AssetType.LeftArm] = true,
	[Enum.AssetType.RightArm] = true,
	[Enum.AssetType.RightLeg] = true,
	[Enum.AssetType.LeftLeg] = true
}
local config1 = { UpperTorso = true }
local config2 = {
	[Enum.AssetType.LeftLeg] = true,
	[Enum.AssetType.RightLeg] = true
}

local function validateBasedOnBBoxes(Child, Child1, p1, AttachmentName, p2): boolean
	-- upvalues: ErrorSourceStringsModule (copy)
	local BoundsData = p1[Child.Name].boundsData
	local BoundsData1 = p1[Child1.Name].boundsData
	local Flag = true
	
	if BoundsData1.maxOverall and BoundsData.maxOverall and BoundsData.maxOverall.Y < BoundsData1.maxOverall.Y then
		p2:fail(ErrorSourceStringsModule.Keys.Extents_PartAboveParent, {
			lowerPart = Child1.Name,
			upperPart = Child.Name,
			attachmentName = AttachmentName
		}, Child1)
		Flag = false
	end
	if BoundsData.minOverall and BoundsData1.minOverall and BoundsData.minOverall.Y < BoundsData1.minOverall.Y then
		p2:fail(ErrorSourceStringsModule.Keys.Extents_ParentBelowPart, {
			upperPart = Child.Name,
			lowerPart = Child1.Name,
			attachmentName = AttachmentName
		}, Child)
		Flag = false
	end
	return Flag
end

local function validateBasedOnAttachmentYPos(Child, Child1, ChildName, p1)
	-- upvalues: R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy), ErrorSourceStringsModule (copy)
	local ChildName1 = Child1:FindFirstChild(ChildName, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local ChildName2 = Child:FindFirstChild(ChildName, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if not ChildName1 or not ChildName2 then return end
	local Size: number = Child1.Size
	local Size1: number = Child.Size
	local Position = GetAttachmentCFrameInPartSpaceModule(ChildName1).Position
	local Position1 = GetAttachmentCFrameInPartSpaceModule(ChildName2).Position
	local Y = (Size / 2 + Position).Y
	local Y1 = (Size1 / 2 + Position1).Y
	
	if (Size1 / 2 - Position1).Y < (Size / 2 - Position).Y then
		p1:fail(ErrorSourceStringsModule.Keys.Extents_PartAboveParent, {
			lowerPart = Child1.Name,
			upperPart = Child.Name,
			attachmentName = ChildName
		}, Child1)
	end
	if Y < Y1 then
		p1:fail(ErrorSourceStringsModule.Keys.Extents_ParentBelowPart, {
			upperPart = Child.Name,
			lowerPart = Child1.Name,
			attachmentName = ChildName
		}, Child)
	end
end

local function validateHeadAboveTorso(p1, p2)
	-- upvalues: ConstantsModule (copy), ErrorSourceStringsModule (copy)
	local FullBodyPartsMetrics = p2.fullBodyPartsMetrics
	
	if not FullBodyPartsMetrics or not next(FullBodyPartsMetrics) then return end
	local FullBodyPartsMetric = FullBodyPartsMetrics[ConstantsModule.NAMED_R15_BODY_PARTS.Head]
	local FullBodyPartsMetric1 = FullBodyPartsMetrics[ConstantsModule.NAMED_R15_BODY_PARTS.UpperTorso]
	
	if not FullBodyPartsMetric or not FullBodyPartsMetric1 then return end
	local BoundsData = FullBodyPartsMetric.boundsData
	local BoundsData1 = FullBodyPartsMetric1.boundsData
	
	if not BoundsData.maxOverall or not BoundsData.minOverall or not BoundsData1.maxOverall or not BoundsData1.minOverall then return end
	local Head = p2.rootInstance:FindFirstChild(ConstantsModule.NAMED_R15_BODY_PARTS.Head)
	
	if BoundsData.minOverall.Y < BoundsData1.minOverall.Y then
		p1:fail(ErrorSourceStringsModule.Keys.Extents_ParentBelowPart, {
			upperPart = "Head",
			lowerPart = "UpperTorso",
			attachmentName = "NeckRigAttachment"
		}, Head)
	end
	local IsZBelow = (BoundsData.maxOverall.Z + BoundsData.minOverall.Z) / 2 < BoundsData1.minOverall.Z
	
	if BoundsData1.maxOverall.Y >= (BoundsData.maxOverall.Y + BoundsData.minOverall.Y) / 2 and not IsZBelow then
		p1:fail(ErrorSourceStringsModule.Keys.Extents_HeadBelowTorso, {}, Head)
	end
end

function ExtentsWithinParentModule.run(p1, p2)
	-- upvalues: ValidationEnumsModule (copy), GetFFlagUGCValidateHeadAboveTorsoModule (copy), validateHeadAboveTorso (copy), config (copy), ConstantsModule (copy), BoundsCalculatorModule (copy), config1 (copy), validateBasedOnBBoxes (copy), config2 (copy), validateBasedOnAttachmentYPos (copy)
	if p2.uploadCategory ~= ValidationEnumsModule.UploadCategory.FULL_BODY then
		local RootInstance = p2.rootInstance
		local AssetType = p2.uploadEnum.assetType
		
		if not config[AssetType] then return end
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetType]
		
		if not ASSETTYPE then return end
		local RenderMeshesData = p2.renderMeshesData
		
		if not RenderMeshesData then return end
		local IndividualAssetPartsDataFromData, _, IndividualAssetPartsDataFromData3 = BoundsCalculatorModule.calculateIndividualAssetPartsDataFromData(RootInstance, AssetType, RenderMeshesData)
		
		if not IndividualAssetPartsDataFromData then
			p1:fetchError("Failed to calculate asset bounds data for extents check on " .. AssetType.Name)
			
			return
		end
		for ChildName, subPart in pairs(ASSETTYPE.subParts) do
			local BODYPARTTOPARENTEntry = ConstantsModule.BODYPART_TO_PARENT[ChildName]
			
			if BODYPARTTOPARENTEntry ~= nil then
				local ChildName1 = RootInstance:FindFirstChild(ChildName)
				local BODYPARTTOPARENTEntry1 = RootInstance:FindFirstChild(BODYPARTTOPARENTEntry)
				
				if ChildName1 and BODYPARTTOPARENTEntry1 then
					local Child = BODYPARTTOPARENTEntry1
					local Child1 = ChildName1
					
					if config1[ChildName] then
						Child = ChildName1
						Child1 = BODYPARTTOPARENTEntry1
					end
					local Name = subPart.rigAttachmentToParent.name
					
					if (not IndividualAssetPartsDataFromData3[Child.Name] or not IndividualAssetPartsDataFromData3[Child1.Name] or validateBasedOnBBoxes(Child, Child1, IndividualAssetPartsDataFromData3, Name, p1)) and config2[AssetType] then
						validateBasedOnAttachmentYPos(Child, Child1, Name, p1)
					end
				end
			end
		end
		return
	elseif GetFFlagUGCValidateHeadAboveTorsoModule() then
		validateHeadAboveTorso(p1, p2)
	end
end

return ExtentsWithinParentModule