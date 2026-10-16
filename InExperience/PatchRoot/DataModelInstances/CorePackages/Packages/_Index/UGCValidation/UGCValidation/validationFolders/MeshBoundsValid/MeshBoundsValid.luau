local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetAccessoryScaleModule = require(Parent.util.getAccessoryScale)
local GetAttachmentModule = require(Parent.util.getAttachment)
local GetMeshMinMaxModule = require(Parent.util.getMeshMinMax)
local IsMeshPartAccessoryModule = require(Parent.util.isMeshPartAccessory)
local GetFFlagUGCValidateMeshMaxScaleModule = require(Parent.flags.getFFlagUGCValidateMeshMaxScale)
local GetFIntUGCValidateMeshCenteringHundredsThresholdModule = require(Parent.flags.getFIntUGCValidateMeshCenteringHundredsThreshold)
local LegacyAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("LegacyAccessoryCheckAvatarPartScaleType", false)
local MeshpartAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("MeshpartAccessoryCheckAvatarPartScaleType", false)
local UGCValidationScaleMinimumThousandths = game:DefineFastInt("UGCValidationScaleMinimumThousandths", 10)
local FIntUGCValidationScaleMaximumThousandths = game:DefineFastInt("FIntUGCValidationScaleMaximumThousandths", 10000)

local function pointInBounds(p1, CF, Vector): boolean --[[ Line: 37 ]]
	local Vector1 = CF:PointToObjectSpace(p1)
	
	return -Vector.X / 2 <= Vector1.X and (Vector1.X <= Vector.X / 2 and (-Vector.Y / 2 <= Vector1.Y and (Vector1.Y <= Vector.Y / 2 and -Vector.Z / 2 <= Vector1.Z))) and Vector1.Z <= Vector.Z / 2
end

local function _(p1: number): number --[[ Line: 47 | Named "truncate" ]]
	return math.floor(p1 * 100) / 100
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 51 ]]
		-- upvalues: ValidationEnumsModule (copy), ConstantsModule (copy), GetAttachmentModule (copy), IsMeshPartAccessoryModule (copy), MeshpartAccessoryCheckAvatarPartScaleType (copy), LegacyAccessoryCheckAvatarPartScaleType (copy), GetAccessoryScaleModule (copy), ErrorSourceStringsModule (copy), UGCValidationScaleMinimumThousandths (copy), GetFFlagUGCValidateMeshMaxScaleModule (copy), FIntUGCValidationScaleMaximumThousandths (copy), UGCValidationService (copy), pointInBounds (copy), GetMeshMinMaxModule (copy), GetFIntUGCValidateMeshCenteringHundredsThresholdModule (copy)
		local RootInstance = p2.rootInstance
		local AssetType = p2.uploadEnum.assetType
		local IsValidationEnvMatch = p2.consumerConfig.validationEnv == ValidationEnumsModule.ValidationEnv.Backend
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetType]
		
		if not ASSETTYPE then return end
		local Handle = RootInstance:FindFirstChild("Handle")
		
		if not Handle then return end
		local Handle1 = p2.renderMeshesData.Handle
		
		if not Handle1 then return end
		local AttachmentModule = GetAttachmentModule(Handle, ASSETTYPE.attachmentNames)
		
		if not AttachmentModule then return end
		local Bound = ASSETTYPE.bounds[AttachmentModule.Name]
		
		if not Bound then return end
		local Scale = Handle1.scale
		local Size = Bound.size
		local Offset = Bound.offset or vector.create(0, 0, 0)
		
		if p2.uploadCategory == ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY and ((if IsMeshPartAccessoryModule(RootInstance) then MeshpartAccessoryCheckAvatarPartScaleType else LegacyAccessoryCheckAvatarPartScaleType) and Handle:FindFirstChild("AvatarPartScaleType")) then
			local AccessoryScaleModule = GetAccessoryScaleModule(Handle, AttachmentModule)
			Size /= AccessoryScaleModule
			Offset = if Bound.offset then Bound.offset / AccessoryScaleModule else vector.create(0, 0, 0)
		end
		local CF = Handle.CFrame * AttachmentModule.CFrame * CFrame.new(Offset)
		
		if Handle.Position.X > 10000 or Handle.Position.X < -10000 or Handle.Position.Y > 10000 or Handle.Position.Y < -10000 or Handle.Position.Z > 10000 or Handle.Position.Z < -10000 then
			p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_PositionOutOfBounds, {})
			
			return
		end
		if CF.Position.X > 10000 or CF.Position.X < -10000 or CF.Position.Y > 10000 or CF.Position.Y < -10000 or CF.Position.Z > 10000 or CF.Position.Z < -10000 then
			p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_PositionOutOfBounds, {})
			
			return
		end
		if Scale.X < UGCValidationScaleMinimumThousandths / 1000 or Scale.Y < UGCValidationScaleMinimumThousandths / 1000 or Scale.Z < UGCValidationScaleMinimumThousandths / 1000 then
			p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_ScaleTooSmall, {})
			
			return
		end
		if GetFFlagUGCValidateMeshMaxScaleModule() and (FIntUGCValidationScaleMaximumThousandths / 1000 < Scale.X or FIntUGCValidationScaleMaximumThousandths / 1000 < Scale.Y or FIntUGCValidationScaleMaximumThousandths / 1000 < Scale.Z) then
			p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_ScaleTooLarge, { meshName = Handle.Name })
			
			return
		end
		for _, editableMeshVert in pairs((UGCValidationService:GetEditableMeshVerts(Handle1.editable))) do
			if not pointInBounds(Handle.CFrame:PointToWorldSpace(editableMeshVert * Scale), CF, Size) then
				p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_ExceedsBounds, {
					meshName = RootInstance.Name,
					assetTypeName = AssetType.Name,
					maxSizeX = string.format("%.2f", math.floor(Size.X * 100) / 100),
					maxSizeY = string.format("%.2f", math.floor(Size.Y * 100) / 100),
					maxSizeZ = string.format("%.2f", math.floor(Size.Z * 100) / 100)
				})
				
				return
			end
		end
		local AbsResult = (AttachmentModule.CFrame.Rotation * Handle.Size):Abs()
		
		if AbsResult.X > Size.X or AbsResult.Y > Size.Y or AbsResult.Z > Size.Z then
			p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_ExceedsBounds, {
				meshName = Handle:GetFullName(),
				assetTypeName = AssetType.Name,
				maxSizeX = string.format("%.2f", math.floor(Size.X * 100) / 100),
				maxSizeY = string.format("%.2f", math.floor(Size.Y * 100) / 100),
				maxSizeZ = string.format("%.2f", math.floor(Size.Z * 100) / 100)
			})
			
			return
		end
		if p2.consumerConfig.consumerEnv ~= ValidationEnumsModule.ConsumerEnv.IEC then
			local MeshMinMaxModule, _, MeshMinMaxModule3, MeshMinMaxModule4 = GetMeshMinMaxModule({
				fieldName = "MeshId",
				fullName = Handle:GetFullName(),
				editableMesh = Handle1.editable,
				scale = Scale,
				context = RootInstance.Name
			}, { shouldYield = false, isServer = IsValidationEnvMatch })
			
			if not MeshMinMaxModule then
				p1:fetchError(string.format("Failed to compute mesh min/max for %s", Handle:GetFullName()))
			end
			if MeshMinMaxModule3 and MeshMinMaxModule4 and GetFIntUGCValidateMeshCenteringHundredsThresholdModule() / 100 < ((MeshMinMaxModule3 + MeshMinMaxModule4) / 2).Magnitude then
				p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_NotCentered, { fieldName = "MeshId", meshName = Handle:GetFullName() })
			end
		end
	end
}