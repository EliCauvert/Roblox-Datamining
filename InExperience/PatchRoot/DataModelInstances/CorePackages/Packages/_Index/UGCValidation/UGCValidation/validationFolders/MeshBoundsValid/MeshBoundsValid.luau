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

local function pointInBounds(p1, p2, p3)
	local var1 = p2:PointToObjectSpace(p1)
	
	return -p3.X / 2 <= var1.X and (var1.X <= p3.X / 2 and (-p3.Y / 2 <= var1.Y and (var1.Y <= p3.Y / 2 and (-p3.Z / 2 <= var1.Z and var1.Z <= p3.Z / 2))))
end

local function _(p1)
	return math.floor(p1 * 100) / 100
end

function t.run(p1, p2)
	-- upvalues: validationEnumsModule (ref), constantsModule (ref), getAttachmentModule (ref), isMeshPartAccessoryModule (ref), meshpartAccessoryCheckAvatarPartScaleType (ref), legacyAccessoryCheckAvatarPartScaleType (ref), getAccessoryScaleModule (ref), errorSourceStringsModule (ref), UGCValidationScaleMinimumThousandths (ref), getFFlagUGCValidateMeshMaxScaleModule (ref), fIntUGCValidationScaleMaximumThousandths (ref), UGCValidationService (ref), pointInBounds (ref), getMeshMinMaxModule (ref), getFIntUGCValidateMeshCenteringHundredsThresholdModule (ref)
	local rootInstance = p2.rootInstance
	local assetType = p2.uploadEnum.assetType
	local var1 = p2.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend
	local var2 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if not var2 then return end
	local handle = rootInstance:FindFirstChild("Handle")
	
	if not handle then return end
	local handle_1 = p2.renderMeshesData.Handle
	
	if not handle_1 then return end
	local var3 = getAttachmentModule(handle, var2.attachmentNames)
	
	if not var3 then return end
	local name = var2.bounds[var3.Name]
	
	if not name then return end
	local scale = handle_1.scale
	local size = name.size
	local offset = name.offset or Vector3.new(0, 0, 0)
	
	if p2.uploadCategory == validationEnumsModule.UploadCategory.RIGID_ACCESSORY and (if isMeshPartAccessoryModule(rootInstance) then meshpartAccessoryCheckAvatarPartScaleType else legacyAccessoryCheckAvatarPartScaleType) and handle:FindFirstChild("AvatarPartScaleType") then
		local var4 = getAccessoryScaleModule(handle, var3)
		size /= var4
		offset = if name.offset then name.offset / var4 else Vector3.new(0, 0, 0)
	end
	local var5 = handle.CFrame * var3.CFrame * CFrame.new(offset)
	
	if handle.Position.X > 10000 or handle.Position.X < -10000 or (handle.Position.Y > 10000 or handle.Position.Y < -10000) or (handle.Position.Z > 10000 or handle.Position.Z < -10000) then
		p1:fail(errorSourceStringsModule.Keys.MeshGeometry_PositionOutOfBounds, {})
		
		return
	elseif var5.Position.X > 10000 or var5.Position.X < -10000 or (var5.Position.Y > 10000 or var5.Position.Y < -10000) or (var5.Position.Z > 10000 or var5.Position.Z < -10000) then
		p1:fail(errorSourceStringsModule.Keys.MeshGeometry_PositionOutOfBounds, {})
		
		return
	elseif scale.X < UGCValidationScaleMinimumThousandths / 1000 or scale.Y < UGCValidationScaleMinimumThousandths / 1000 or scale.Z < UGCValidationScaleMinimumThousandths / 1000 then
		p1:fail(errorSourceStringsModule.Keys.MeshGeometry_ScaleTooSmall, {})
		
		return
	elseif getFFlagUGCValidateMeshMaxScaleModule() and (fIntUGCValidationScaleMaximumThousandths / 1000 < scale.X or fIntUGCValidationScaleMaximumThousandths / 1000 < scale.Y or fIntUGCValidationScaleMaximumThousandths / 1000 < scale.Z) then
		p1:fail(errorSourceStringsModule.Keys.MeshGeometry_ScaleTooLarge, { meshName = handle.Name })
		
		return
	end
	for i, v in pairs(UGCValidationService:GetEditableMeshVerts(handle_1.editable)) do
		if not pointInBounds(handle.CFrame:PointToWorldSpace(v * scale), var5, size) then
			p1:fail(errorSourceStringsModule.Keys.MeshGeometry_ExceedsBounds, {
				meshName = rootInstance.Name,
				assetTypeName = assetType.Name,
				maxSizeX = string.format("%.2f", math.floor(size.X * 100) / 100),
				maxSizeY = string.format("%.2f", math.floor(size.Y * 100) / 100),
				maxSizeZ = string.format("%.2f", math.floor(size.Z * 100) / 100)
			})
			
			return
		end
	end
	local var6 = (var3.CFrame.Rotation * handle.Size):Abs()
	
	if var6.X > size.X or var6.Y > size.Y or var6.Z > size.Z then
		p1:fail(errorSourceStringsModule.Keys.MeshGeometry_ExceedsBounds, {
			meshName = handle:GetFullName(),
			assetTypeName = assetType.Name,
			maxSizeX = string.format("%.2f", math.floor(size.X * 100) / 100),
			maxSizeY = string.format("%.2f", math.floor(size.Y * 100) / 100),
			maxSizeZ = string.format("%.2f", math.floor(size.Z * 100) / 100)
		})
		
		return
	elseif p2.consumerConfig.consumerEnv ~= validationEnumsModule.ConsumerEnv.IEC then
		local var7, _, var8, var9 = getMeshMinMaxModule({
			fieldName = "MeshId",
			fullName = handle:GetFullName(),
			editableMesh = handle_1.editable,
			scale = scale,
			context = rootInstance.Name
		}, { shouldYield = false, isServer = var1 })
		
		if not var7 then
			p1:fetchError(string.format("Failed to compute mesh min/max for %s", handle:GetFullName()))
		end
		if var8 and var9 and getFIntUGCValidateMeshCenteringHundredsThresholdModule() / 100 < ((var8 + var9) / 2).Magnitude then
			p1:fail(errorSourceStringsModule.Keys.MeshGeometry_NotCentered, { fieldName = "MeshId", meshName = handle:GetFullName() })
		end
	end
end

return t