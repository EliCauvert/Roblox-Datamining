local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUGCValidateTriangleLimitToleranceModule = require(parent.flags.getFIntUGCValidateTriangleLimitTolerance)
local t = {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry),
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {}
}

local function runAccessoryCheck(p1, p2)
	-- upvalues: constantsModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref)
	local MAX_HAT_TRIANGLES = constantsModule.MAX_HAT_TRIANGLES
	
	for i, v in p2.renderMeshesData do
		local editableEditableMeshTriCount = UGCValidationService:GetEditableMeshTriCount(v.editable)
		
		if MAX_HAT_TRIANGLES < editableEditableMeshTriCount then
			p1:fail(errorSourceStringsModule.Keys.MeshGeometry_TriangleCountExceeded, {
				meshName = i,
				triangleCount = tostring(editableEditableMeshTriCount),
				maxTriangles = tostring(MAX_HAT_TRIANGLES)
			})
		end
	end
end

local function runBodyPartCheck(p3, p4)
	-- upvalues: constantsModule (ref), UGCValidationService (ref), getFIntUGCValidateTriangleLimitToleranceModule (ref), errorSourceStringsModule (ref)
	local name = p4.uploadEnum.assetType.Name
	local var1 = constantsModule.ASSET_RENDER_MESH_MAX_TRIANGLES[name]
	
	if not var1 then return end
	local var2 = 0
	
	for i, v in p4.renderMeshesData do
		var2 += UGCValidationService:GetEditableMeshTriCount(v.editable)
	end
	if var1 + var1 * (getFIntUGCValidateTriangleLimitToleranceModule() / 100) < var2 then
		p3:fail(errorSourceStringsModule.Keys.MeshGeometry_TotalTriangleCountExceeded, {
			triangleCount = tostring(var2),
			assetTypeName = name,
			maxTriangles = tostring(var1)
		})
	end
end

function t.run(p5, p6)
	-- upvalues: validationEnumsModule (ref), runBodyPartCheck (ref), runAccessoryCheck (ref)
	if p6.uploadCategory == validationEnumsModule.UploadCategory.TORSO_AND_LIMBS or p6.uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD then
		runBodyPartCheck(p5, p6)
		
		return
	end
	runAccessoryCheck(p5, p6)
end

return t