local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getAccessoryScaleModule = require(parent.util.getAccessoryScale)
local getAttachmentModule = require(parent.util.getAttachment)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)
local isMeshPartAccessoryModule = require(parent.util.isMeshPartAccessory)
local getFFlagUGCValidateMeshMaxScaleModule = require(parent.flags.getFFlagUGCValidateMeshMaxScale)
local getFIntUGCValidateMeshCenteringHundredsThresholdModule = require(parent.flags.getFIntUGCValidateMeshCenteringHundredsThreshold)
local getFFlagUGCValidateMigrateMeshGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry)
local legacyAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("LegacyAccessoryCheckAvatarPartScaleType", false)
local meshpartAccessoryCheckAvatarPartScaleType = game:DefineFastFlag("MeshpartAccessoryCheckAvatarPartScaleType", false)
local UGCValidationScaleMinimumThousandths = game:DefineFastInt("UGCValidationScaleMinimumThousandths", 10)
local fIntUGCValidationScaleMaximumThousandths = game:DefineFastInt("FIntUGCValidationScaleMaximumThousandths", 10000)
local t = {
	fflag = getFFlagUGCValidateMigrateMeshGeometryModule,
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {}
}

local function pointInBounds(p0, p1, p2)
	local var17 = p1:PointToObjectSpace(p0)
	
	return -p2.X / 2 <= var17.X and (var17.X <= p2.X / 2 and (-p2.Y / 2 <= var17.Y and (var17.Y <= p2.Y / 2 and (-p2.Z / 2 <= var17.Z and var17.Z <= p2.Z / 2))))
end

local function _(p3)
	return math.floor(p3 * 100) / 100
end

function t.run(p4, p5)
	-- upvalues: validationEnumsModule (ref), constantsModule (ref), getAttachmentModule (ref), isMeshPartAccessoryModule (ref), meshpartAccessoryCheckAvatarPartScaleType (ref), legacyAccessoryCheckAvatarPartScaleType (ref), getAccessoryScaleModule (ref), errorSourceStringsModule (ref), UGCValidationScaleMinimumThousandths (ref), getFFlagUGCValidateMeshMaxScaleModule (ref), fIntUGCValidationScaleMaximumThousandths (ref), UGCValidationService (ref), pointInBounds (ref), getMeshMinMaxModule (ref), getFIntUGCValidateMeshCenteringHundredsThresholdModule (ref)
	local rootInstance = p5.rootInstance
	local assetType = p5.uploadEnum.assetType
	local var18 = p5.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend
	local var19 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if not var19 then return end
	local handle = rootInstance:FindFirstChild("Handle")
	
	if not handle then return end
	local handle_1 = p5.renderMeshesData.Handle
	
	if not handle_1 then return end
	local var21 = getAttachmentModule(handle, var19.attachmentNames)
	
	if not var21 then return end
	local name = var19.bounds[var21.Name]
	
	if not name then return end
	local scale = handle_1.scale
	local size = name.size
	local offset = name.offset or Vector3.new(0, 0, 0)
	
	if p5.uploadCategory == validationEnumsModule.UploadCategory.RIGID_ACCESSORY and (if isMeshPartAccessoryModule(rootInstance) then meshpartAccessoryCheckAvatarPartScaleType else legacyAccessoryCheckAvatarPartScaleType) and handle:FindFirstChild("AvatarPartScaleType") then
		local var23 = getAccessoryScaleModule(handle, var21)
		size /= var23
		offset = if name.offset then name.offset / var23 else Vector3.new(0, 0, 0)
	end
	local var24 = handle.CFrame * var21.CFrame * CFrame.new(offset)
	
	if handle.Position.X > 10000 or handle.Position.X < -10000 or (handle.Position.Y > 10000 or handle.Position.Y < -10000) or (handle.Position.Z > 10000 or handle.Position.Z < -10000) then
		p4:fail(errorSourceStringsModule.Keys.MeshGeometry_PositionOutOfBounds, {})
		
		return
	elseif var24.Position.X > 10000 or var24.Position.X < -10000 or (var24.Position.Y > 10000 or var24.Position.Y < -10000) or (var24.Position.Z > 10000 or var24.Position.Z < -10000) then
		p4:fail(errorSourceStringsModule.Keys.MeshGeometry_PositionOutOfBounds, {})
		
		return
	elseif scale.X < UGCValidationScaleMinimumThousandths / 1000 or scale.Y < UGCValidationScaleMinimumThousandths / 1000 or scale.Z < UGCValidationScaleMinimumThousandths / 1000 then
		p4:fail(errorSourceStringsModule.Keys.MeshGeometry_ScaleTooSmall, {})
		
		return
	elseif getFFlagUGCValidateMeshMaxScaleModule() and (fIntUGCValidationScaleMaximumThousandths / 1000 < scale.X or fIntUGCValidationScaleMaximumThousandths / 1000 < scale.Y or fIntUGCValidationScaleMaximumThousandths / 1000 < scale.Z) then
		p4:fail(errorSourceStringsModule.Keys.MeshGeometry_ScaleTooLarge, { meshName = handle.Name })
		
		return
	end
	for i, v in pairs(UGCValidationService:GetEditableMeshVerts(handle_1.editable)) do
		if not pointInBounds(handle.CFrame:PointToWorldSpace(v * scale), var24, size) then
			p4:fail(errorSourceStringsModule.Keys.MeshGeometry_ExceedsBounds, {
				meshName = rootInstance.Name,
				assetTypeName = assetType.Name,
				maxSizeX = string.format("%.2f", math.floor(size.X * 100) / 100),
				maxSizeY = string.format("%.2f", math.floor(size.Y * 100) / 100),
				maxSizeZ = string.format("%.2f", math.floor(size.Z * 100) / 100)
			})
			
			return
		end
	end
	local var25 = (var21.CFrame.Rotation * handle.Size):Abs()
	
	if var25.X > size.X or var25.Y > size.Y or var25.Z > size.Z then
		p4:fail(errorSourceStringsModule.Keys.MeshGeometry_ExceedsBounds, {
			meshName = handle:GetFullName(),
			assetTypeName = assetType.Name,
			maxSizeX = string.format("%.2f", math.floor(size.X * 100) / 100),
			maxSizeY = string.format("%.2f", math.floor(size.Y * 100) / 100),
			maxSizeZ = string.format("%.2f", math.floor(size.Z * 100) / 100)
		})
		
		return
	elseif p5.consumerConfig.consumerEnv ~= validationEnumsModule.ConsumerEnv.IEC then
		local var26, _, var27, var28 = getMeshMinMaxModule({
			fieldName = "MeshId",
			fullName = handle:GetFullName(),
			editableMesh = handle_1.editable,
			scale = scale,
			context = rootInstance.Name
		}, { shouldYield = false, isServer = var18 })
		
		if not var26 then
			p4:fetchError(string.format("Failed to compute mesh min/max for %s", handle:GetFullName()))
		end
		if var27 and var28 and getFIntUGCValidateMeshCenteringHundredsThresholdModule() / 100 < ((var27 + var28) / 2).Magnitude then
			p4:fail(errorSourceStringsModule.Keys.MeshGeometry_NotCentered, { fieldName = "MeshId", meshName = handle:GetFullName() })
		end
	end
end

return t