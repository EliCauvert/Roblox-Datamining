local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)
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

local function reportFailure_lowerAboveUpper(p1, p2, ChildName, p3)
	-- upvalues: AnalyticsModule (copy)
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyAttPosRelativeToParent_PartAboveParent, nil, p3)
	
	return false, {
		string.format("%s cannot extend above %s. You can adjust how the parts are put together by moving %s", p2.Name, p1.Name, ChildName)
	}
end

local function reportFailure_upperBelowLower(p1, p2, ChildName, p3)
	-- upvalues: AnalyticsModule (copy)
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyAttPosRelativeToParent_ParentBelowPart, nil, p3)
	
	return false, {
		string.format("%s cannot extend below %s. You can adjust how the parts are put together by moving %s", p1.Name, p2.Name, ChildName)
	}
end

local ValidateBodyPartExtentsRelativeToParentModule = {
	validateSinglePartBasedOnBBoxes = function(Child, Child1, p1, Name, p2)
		-- upvalues: FailureReasonsAccumulatorModule (copy), reportFailure_lowerAboveUpper (copy), reportFailure_upperBelowLower (copy)
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		local BoundsData = p1[Child.Name].boundsData
		local BoundsData1 = p1[Child1.Name].boundsData
		
		if BoundsData1.maxOverall and BoundsData.maxOverall and BoundsData.maxOverall.Y < BoundsData1.maxOverall.Y then
			NewFailureReasonsAccumulator:updateReasons(reportFailure_lowerAboveUpper(Child, Child1, Name, p2))
		end
		if BoundsData.minOverall and BoundsData1.minOverall and BoundsData.minOverall.Y < BoundsData1.minOverall.Y then
			NewFailureReasonsAccumulator:updateReasons(reportFailure_upperBelowLower(Child, Child1, Name, p2))
		end
		return NewFailureReasonsAccumulator:getFinalResults()
	end,
	validateSinglePartBasedOnAttachmentYPos = function(Child, Child1, ChildName, p1)
		-- upvalues: FailureReasonsAccumulatorModule (copy), R15plusUtilsModule (copy), GetExpectedPartSizeModule (copy), GetAttachmentCFrameInPartSpaceModule (copy), reportFailure_lowerAboveUpper (copy), reportFailure_upperBelowLower (copy)
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		local ChildName1 = Child1:FindFirstChild(ChildName, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		local ChildName2 = Child:FindFirstChild(ChildName, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(ChildName1)
		assert(ChildName2)
		local ExpectedPartSizeModule: number = GetExpectedPartSizeModule(Child1, p1)
		local ExpectedPartSizeModule1: number = GetExpectedPartSizeModule(Child, p1)
		local Position = GetAttachmentCFrameInPartSpaceModule(ChildName1).Position
		local Position1 = GetAttachmentCFrameInPartSpaceModule(ChildName2).Position
		local Y = (ExpectedPartSizeModule / 2 + Position).Y
		local Y1 = (ExpectedPartSizeModule1 / 2 + Position1).Y
		
		if (ExpectedPartSizeModule1 / 2 - Position1).Y < (ExpectedPartSizeModule / 2 - Position).Y then
			NewFailureReasonsAccumulator:updateReasons(reportFailure_lowerAboveUpper(Child, Child1, ChildName, p1))
		end
		if Y < Y1 then
			NewFailureReasonsAccumulator:updateReasons(reportFailure_upperBelowLower(Child, Child1, ChildName, p1))
		end
		return NewFailureReasonsAccumulator:getFinalResults()
	end
}

function ValidateBodyPartExtentsRelativeToParentModule.runValidation(Object, p1)
	-- upvalues: ConstantsModule (copy), config (copy), BoundsCalculatorModule (copy), FailureReasonsAccumulatorModule (copy), config1 (copy), ValidateBodyPartExtentsRelativeToParentModule (copy), config2 (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local AssetTypeEnum = p1.assetTypeEnum
	assert(AssetTypeEnum)
	local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum]
	assert(ASSETTYPE)
	
	if not config[AssetTypeEnum] then
		return true
	end
	local IndividualAssetPartsData, IndividualAssetPartsData2, IndividualAssetPartsData3 = BoundsCalculatorModule.calculateIndividualAssetPartsData(Object, p1)
	
	if not IndividualAssetPartsData then
		return false, IndividualAssetPartsData2
	end
	assert(IndividualAssetPartsData3)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for ChildName, subPart in pairs(ASSETTYPE.subParts) do
		local BODYPARTTOPARENTEntry = ConstantsModule.BODYPART_TO_PARENT[ChildName]
		
		if BODYPARTTOPARENTEntry ~= nil then
			local ChildName1 = Object:FindFirstChild(ChildName)
			local BODYPARTTOPARENTEntry1 = Object:FindFirstChild(BODYPARTTOPARENTEntry)
			assert(ChildName1)
			assert(BODYPARTTOPARENTEntry1)
			local Child = BODYPARTTOPARENTEntry1
			local Child1 = ChildName1
			
			if config1[ChildName] then
				Child = ChildName1
				Child1 = BODYPARTTOPARENTEntry1
			end
			local Name = subPart.rigAttachmentToParent.name
			local ValidateSinglePartBasedOnBBoxesResult, ValidateSinglePartBasedOnBBoxesResult2 = ValidateBodyPartExtentsRelativeToParentModule.validateSinglePartBasedOnBBoxes(Child, Child1, IndividualAssetPartsData3, Name, p1)
			NewFailureReasonsAccumulator:updateReasons(ValidateSinglePartBasedOnBBoxesResult, ValidateSinglePartBasedOnBBoxesResult2)
			
			if ValidateSinglePartBasedOnBBoxesResult and config2[AssetTypeEnum] then
				NewFailureReasonsAccumulator:updateReasons(ValidateBodyPartExtentsRelativeToParentModule.validateSinglePartBasedOnAttachmentYPos(Child, Child1, Name, p1))
			end
		end
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end

return ValidateBodyPartExtentsRelativeToParentModule