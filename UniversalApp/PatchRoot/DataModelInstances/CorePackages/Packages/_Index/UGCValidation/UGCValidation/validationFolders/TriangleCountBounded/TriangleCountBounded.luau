local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUGCValidateTriangleLimitToleranceModule = require(Parent.flags.getFIntUGCValidateTriangleLimitTolerance)

local function runAccessoryCheck(p1, p2) --[[ Line: 22 ]]
	-- upvalues: ConstantsModule (copy), UGCValidationService (copy), ErrorSourceStringsModule (copy)
	local MAXHATTRIANGLES = ConstantsModule.MAX_HAT_TRIANGLES
	
	for MeshName, value in p2.renderMeshesData do
		local EditableMeshTriCount = UGCValidationService:GetEditableMeshTriCount(value.editable)
		
		if MAXHATTRIANGLES < EditableMeshTriCount then
			p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_TriangleCountExceeded, {
				meshName = MeshName,
				triangleCount = tostring(EditableMeshTriCount),
				maxTriangles = tostring(MAXHATTRIANGLES)
			})
		end
	end
end

local function runBodyPartCheck(p3, p4) --[[ Line: 38 ]]
	-- upvalues: ConstantsModule (copy), UGCValidationService (copy), GetFIntUGCValidateTriangleLimitToleranceModule (copy), ErrorSourceStringsModule (copy)
	local Name = p4.uploadEnum.assetType.Name
	local ASSETRENDERMESHMAXTRIANGLE = ConstantsModule.ASSET_RENDER_MESH_MAX_TRIANGLES[Name]
	
	if not ASSETRENDERMESHMAXTRIANGLE then return end
	local NewEditableMeshTriCount = 0
	
	for _, value in p4.renderMeshesData do
		NewEditableMeshTriCount += UGCValidationService:GetEditableMeshTriCount(value.editable)
	end
	if ASSETRENDERMESHMAXTRIANGLE + ASSETRENDERMESHMAXTRIANGLE * (GetFIntUGCValidateTriangleLimitToleranceModule() / 100) < NewEditableMeshTriCount then
		p3:fail(ErrorSourceStringsModule.Keys.MeshGeometry_TotalTriangleCountExceeded, {
			triangleCount = tostring(NewEditableMeshTriCount),
			assetTypeName = Name,
			maxTriangles = tostring(ASSETRENDERMESHMAXTRIANGLE)
		})
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p5, p6) --[[ Line: 64 ]]
		-- upvalues: ValidationEnumsModule (copy), runBodyPartCheck (copy), runAccessoryCheck (copy)
		if p6.uploadCategory == ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS or p6.uploadCategory == ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD then
			runBodyPartCheck(p5, p6)
			
			return
		else
			runAccessoryCheck(p5, p6)
		end
	end
}