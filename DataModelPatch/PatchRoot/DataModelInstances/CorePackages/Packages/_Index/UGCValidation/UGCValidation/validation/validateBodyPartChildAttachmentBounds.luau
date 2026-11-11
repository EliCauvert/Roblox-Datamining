local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local PrettyPrintVector3Module = require(Parent.util.prettyPrintVector3)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)
local BoundsDataUtilsModule = require(Parent.util.BoundsDataUtils)
local MeshSpaceUtilsModule = require(Parent.util.MeshSpaceUtils)
local GetFStringUGCValidationAttachmentErrorLinkModule = require(Parent.flags.getFStringUGCValidationAttachmentErrorLink)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)

local function validateInMeshSpace(Name, p1, Bounds, p2, p3)
	-- upvalues: GetAttachmentCFrameInPartSpaceModule (copy), BoundsDataUtilsModule (copy), AnalyticsModule (copy), MeshSpaceUtilsModule (copy), PrettyPrintVector3Module (copy), GetFStringUGCValidationAttachmentErrorLinkModule (copy)
	local ScaledCframe = p3.cframe * GetAttachmentCFrameInPartSpaceModule(Name)
	local BoundsCenters = BoundsDataUtilsModule.calculateBoundsCenters(p3.boundsData)
	local BoundsDimensions: number = BoundsDataUtilsModule.calculateBoundsDimensions(p3.boundsData)
	
	if not BoundsCenters or not BoundsDimensions then
		return false, { "Missing mesh data for " .. p1.Name }
	end
	local PositionRatio = (ScaledCframe.Position - BoundsCenters) / (BoundsDimensions / 2)
	local Min = Bounds.min
	local Max = Bounds.max
	
	for _, value in { "X", "Y", "Z" } do
		if PositionRatio[value] < Min[value] or Max[value] < PositionRatio[value] then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition, nil, p2)
			local ClampAttachmentToBoundsResult = MeshSpaceUtilsModule.clampAttachmentToBounds(Name, p3, Bounds, 0.001)
			assert(BoundsCenters and BoundsDimensions, "meshCenterOpt and meshDimensionsOpt must be defined")
			local AcceptableBoundsLocalSpace, AcceptableBoundsLocalSpace2 = MeshSpaceUtilsModule.calculateAcceptableBoundsLocalSpace(Bounds, p3, BoundsDimensions, BoundsCenters)
			local Position = AcceptableBoundsLocalSpace.Position
			local Rx, Ry, Rz = AcceptableBoundsLocalSpace.Rotation:ToOrientation()
			
			return false, {
				string.format("Attachment (%s) in %s is placed at position [%s] that is outside the valid range. The closest valid position is [%s]. (the attachment must be within the oriented bounding box - Position: [%s], Orientation: [%s], Size: [%s]%s)", Name.Name, p1.Name, PrettyPrintVector3Module(Name.CFrame.Position, 3), PrettyPrintVector3Module(ClampAttachmentToBoundsResult.Position, 3), PrettyPrintVector3Module(Position, 3), PrettyPrintVector3Module(Vector3.new(math.deg(Rx), math.deg(Ry), (math.deg(Rz))), 3), PrettyPrintVector3Module(AcceptableBoundsLocalSpace2, 3), if GetFStringUGCValidationAttachmentErrorLinkModule() == "" then "" else ". See " .. GetFStringUGCValidationAttachmentErrorLinkModule() .. " for further explanation")
			}
		end
	end
	return true
end

local function checkAll(Object, _, Head, p4, p5)
	-- upvalues: FailureReasonsAccumulatorModule (copy), R15plusUtilsModule (copy), validateInMeshSpace (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local Name = Object:FindFirstChild(Head.rigAttachmentToParent.name, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(Name)
	NewFailureReasonsAccumulator:updateReasons(validateInMeshSpace(Name, Object, Head.rigAttachmentToParent.bounds, p4, p5))
	
	for ChildName, otherAttachment in pairs(Head.otherAttachments) do
		local Child = Object:FindFirstChild(ChildName, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(Child)
		NewFailureReasonsAccumulator:updateReasons(validateInMeshSpace(Child, Object, otherAttachment.bounds, p4, p5))
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

return function(Object, p6)
	-- upvalues: ConstantsModule (copy), FailureReasonsAccumulatorModule (copy), BoundsCalculatorModule (copy), checkAll (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local AssetTypeEnum = p6.assetTypeEnum
	local IsServer = p6.isServer
	assert(AssetTypeEnum)
	local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum]
	assert(ASSETTYPE)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local IndividualAssetPartsData, IndividualAssetPartsData2, IndividualAssetPartsData3 = BoundsCalculatorModule.calculateIndividualAssetPartsData(Object, p6)
	
	if not IndividualAssetPartsData then
		return IndividualAssetPartsData, IndividualAssetPartsData2
	end
	if Enum.AssetType.DynamicHead == AssetTypeEnum then
		NewFailureReasonsAccumulator:updateReasons(checkAll(Object, IsServer, ASSETTYPE.subParts.Head, p6, IndividualAssetPartsData3[Object.Name]))
	else
		for ChildName, subPart in pairs(ASSETTYPE.subParts) do
			local Child = Object:FindFirstChild(ChildName)
			assert(Child)
			NewFailureReasonsAccumulator:updateReasons(checkAll(Child, IsServer, subPart, p6, IndividualAssetPartsData3[ChildName]))
		end
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p6)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end