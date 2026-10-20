local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ConstantsModule = require(Parent.Constants)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)
local BoundsDataUtilsModule = require(Parent.util.BoundsDataUtils)
local MeshSpaceUtilsModule = require(Parent.util.MeshSpaceUtils)
local PrettyPrintVector3Module = require(Parent.util.prettyPrintVector3)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)
local GetFStringUGCValidationAttachmentErrorLinkModule = require(Parent.flags.getFStringUGCValidationAttachmentErrorLink)
local GetFFlagUGCValidateAttachmentBoundsErrorMessageModule = require(Parent.flags.getFFlagUGCValidateAttachmentBoundsErrorMessage)

local function validateInMeshSpace(Name, p1, Bounds, p2, p3, HasFoundAt)
	-- upvalues: GetAttachmentCFrameInPartSpaceModule (copy), BoundsDataUtilsModule (copy), ErrorSourceStringsModule (copy), MeshSpaceUtilsModule (copy), GetFFlagUGCValidateAttachmentBoundsErrorMessageModule (copy), PrettyPrintVector3Module (copy), GetFStringUGCValidationAttachmentErrorLinkModule (copy)
	local ScaledCframe = p2.cframe * GetAttachmentCFrameInPartSpaceModule(Name)
	local BoundsCenters = BoundsDataUtilsModule.calculateBoundsCenters(p2.boundsData)
	local BoundsDimensions: number = BoundsDataUtilsModule.calculateBoundsDimensions(p2.boundsData)
	
	if not BoundsCenters or not BoundsDimensions then
		p3:fail(ErrorSourceStringsModule.Keys.AttachmentBoundsCalculationFailed, { AttachmentName = Name.Name, PartName = p1.Name })
		
		return
	end
	local PositionRatio = (ScaledCframe.Position - BoundsCenters) / (BoundsDimensions / 2)
	local Min = Bounds.min
	local Max = Bounds.max
	
	for _, value in { "X", "Y", "Z" } do
		if PositionRatio[value] < Min[value] or Max[value] < PositionRatio[value] then
			local ClampAttachmentToBoundsResult = MeshSpaceUtilsModule.clampAttachmentToBounds(Name, p2, Bounds, 0.001)
			local AcceptableBoundsLocalSpace, AcceptableBoundsLocalSpace2 = MeshSpaceUtilsModule.calculateAcceptableBoundsLocalSpace(Bounds, p2, BoundsDimensions, BoundsCenters)
			local Position = AcceptableBoundsLocalSpace.Position
			local Rx, Ry, Rz = AcceptableBoundsLocalSpace.Rotation:ToOrientation()
			local _Vector3 = Vector3.new(math.deg(Rx), math.deg(Ry), (math.deg(Rz)))
			
			if GetFFlagUGCValidateAttachmentBoundsErrorMessageModule() then
				p3:fail(if HasFoundAt then ErrorSourceStringsModule.Keys.RigAttachmentOutOfBounds else ErrorSourceStringsModule.Keys.AccessoryAttachmentOutOfBounds, {
					AttachmentName = Name.Name,
					PartName = p1.Name,
					CurrentPosition = PrettyPrintVector3Module(Name.CFrame.Position, 3),
					ClosestValidPosition = PrettyPrintVector3Module(ClampAttachmentToBoundsResult.Position, 3),
					HelpLink = GetFStringUGCValidationAttachmentErrorLinkModule()
				})
				break
			else
				p3:fail(ErrorSourceStringsModule.Keys.AttachmentOutOfBounds, {
					AttachmentName = Name.Name,
					PartName = p1.Name,
					CurrentPosition = PrettyPrintVector3Module(Name.CFrame.Position, 3),
					ClosestValidPosition = PrettyPrintVector3Module(ClampAttachmentToBoundsResult.Position, 3),
					BoundsPosition = PrettyPrintVector3Module(Position, 3),
					BoundsOrientation = PrettyPrintVector3Module(_Vector3, 3),
					BoundsSize = PrettyPrintVector3Module(AcceptableBoundsLocalSpace2, 3),
					HelpLink = GetFStringUGCValidationAttachmentErrorLinkModule()
				})
				break
			end
		end
	end
end

local function checkAll(Object, Head, p4, p5)
	-- upvalues: R15plusUtilsModule (copy), validateInMeshSpace (copy)
	local Name = Object:FindFirstChild(Head.rigAttachmentToParent.name, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if not Name then return end
	validateInMeshSpace(Name, Object, Head.rigAttachmentToParent.bounds, p4, p5, true)
	
	for ChildName, otherAttachment in pairs(Head.otherAttachments) do
		local Child = Object:FindFirstChild(ChildName, R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		
		if Child then
			validateInMeshSpace(Child, Object, otherAttachment.bounds, p4, p5, string.find(ChildName, "RigAttachment$") ~= nil)
		end
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadEnum,
		ValidationEnumsModule.SharedDataMember.consumerConfig
	},
	conditionalData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p6, p7)
		-- upvalues: ConstantsModule (copy), ValidationEnumsModule (copy), BoundsCalculatorModule (copy), ErrorSourceStringsModule (copy), checkAll (copy)
		local RootInstance = p7.rootInstance
		local AssetType = p7.uploadEnum.assetType
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetType]
		
		if not ASSETTYPE then return end
		local EditableMeshes = {}
		
		if p7.renderMeshesData then
			local Descendants = RootInstance:GetDescendants()
			table.insert(Descendants, RootInstance)
			
			for _, descendant in Descendants do
				local RenderMeshes = p7.renderMeshesData[descendant.Name]
				
				if RenderMeshes and RenderMeshes.editable then
					EditableMeshes[descendant] = {
						MeshId = { created = false, instance = RenderMeshes.editable }
					}
				end
			end
		end
		local IndividualAssetPartsData, _, IndividualAssetPartsData3 = BoundsCalculatorModule.calculateIndividualAssetPartsData(RootInstance, {
			assetTypeEnum = AssetType,
			isServer = p7.consumerConfig.validationEnv == ValidationEnumsModule.ValidationEnv.Backend,
			editableMeshes = EditableMeshes
		})
		
		if not IndividualAssetPartsData then
			p6:fail(ErrorSourceStringsModule.Keys.AttachmentBoundsAssetCalculationFailed, { InstancePath = RootInstance:GetFullName() })
			
			return
		end
		if Enum.AssetType.DynamicHead == AssetType then
			local IndividualAssetParts = IndividualAssetPartsData3[RootInstance.Name]
			
			if IndividualAssetParts then
				checkAll(RootInstance, ASSETTYPE.subParts.Head, IndividualAssetParts, p6)
				
				return
			end
		else
			for ChildName, subPart in pairs(ASSETTYPE.subParts) do
				local Child = RootInstance:FindFirstChild(ChildName)
				
				if Child then
					local IndividualAssetParts = IndividualAssetPartsData3[ChildName]
					
					if IndividualAssetParts then
						checkAll(Child, subPart, IndividualAssetParts, p6)
					end
				end
			end
		end
	end
}