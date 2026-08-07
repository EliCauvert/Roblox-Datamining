-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:48 2026 Pacific Standard Time.

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

local function runAccessoryCheck(p0, p1) --[[ line: 25 ]]
	-- upvalues: constantsModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref)
	local MAX_HAT_TRIANGLES = constantsModule.MAX_HAT_TRIANGLES
	
	for i, v in p1.renderMeshesData do
		local editableEditableMeshTriCount = UGCValidationService:GetEditableMeshTriCount(v.editable)
		
		if MAX_HAT_TRIANGLES < editableEditableMeshTriCount then
			p0:fail(errorSourceStringsModule.Keys.MeshGeometry_TriangleCountExceeded, {
				meshName = i,
				triangleCount = tostring(editableEditableMeshTriCount),
				maxTriangles = tostring(MAX_HAT_TRIANGLES)
			})
		end
	end
end

local function runBodyPartCheck(p2, p3) --[[ line: 41 ]]
	-- upvalues: constantsModule (ref), UGCValidationService (ref), getFIntUGCValidateTriangleLimitToleranceModule (ref), errorSourceStringsModule (ref)
	local name = p3.uploadEnum.assetType.Name
	local var9 = constantsModule.ASSET_RENDER_MESH_MAX_TRIANGLES[name]
	
	if not var9 then return end
	local var10 = 0
	
	for i, v in p3.renderMeshesData do
		var10 += UGCValidationService:GetEditableMeshTriCount(v.editable)
	end
	if var9 + var9 * (getFIntUGCValidateTriangleLimitToleranceModule() / 100) < var10 then
		p2:fail(errorSourceStringsModule.Keys.MeshGeometry_TotalTriangleCountExceeded, {
			triangleCount = tostring(var10),
			assetTypeName = name,
			maxTriangles = tostring(var9)
		})
	end
end

function t.run(p4, p5) --[[ line: 67 ]]
	-- upvalues: validationEnumsModule (ref), runBodyPartCheck (ref), runAccessoryCheck (ref)
	if p5.uploadCategory == validationEnumsModule.UploadCategory.TORSO_AND_LIMBS or p5.uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD then
		runBodyPartCheck(p4, p5)
		
		return
	end
	runAccessoryCheck(p4, p5)
end

return t