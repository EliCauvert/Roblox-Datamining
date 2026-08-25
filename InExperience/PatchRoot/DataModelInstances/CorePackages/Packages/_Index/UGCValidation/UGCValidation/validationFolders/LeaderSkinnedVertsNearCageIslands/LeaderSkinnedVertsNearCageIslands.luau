local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local eyelashCageUVReferenceValuesModule = require(parent.EyelashCageUVReferenceValues)
local t = {
	fflag = require(parent.flags.getEngineFeatureEngineUGCValidateLeaderVertsNearCageIslands),
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {
		validationEnumsModule.SharedDataMember.renderMeshesData,
		validationEnumsModule.SharedDataMember.innerCagesData
	}
}
local var5 = require(parent.flags.getFIntUGCValidationLeaderVertsNearCageIslandsDistance)() / 10000

function t.run(p0, p1)
	-- upvalues: UGCValidationService (ref), eyelashCageUVReferenceValuesModule (ref), var5 (ref), errorSourceStringsModule (ref)
	if p1.uploadEnum.assetType ~= Enum.AssetType.EyelashAccessory then return end
	local handle = p1.renderMeshesData.Handle
	local handle_1 = p1.innerCagesData.Handle
	
	if handle == nil or handle_1 == nil then
		error("Schema should have ensured data exists for handle")
	end
	if not UGCValidationService:ValidateLeaderSkinnedVertsNearCageIslands(handle.editable, handle_1.editable, eyelashCageUVReferenceValuesModule, handle_1.origin, var5) then
		p0:fail(errorSourceStringsModule.Keys.LeaderVertsNearCageIslands)
	end
end

return t