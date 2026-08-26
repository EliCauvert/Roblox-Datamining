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
local var1 = require(parent.flags.getFIntUGCValidationLeaderVertsNearCageIslandsDistance)() / 10000

function t.run(p1, p2)
	-- upvalues: UGCValidationService (ref), eyelashCageUVReferenceValuesModule (ref), var1 (ref), errorSourceStringsModule (ref)
	if p2.uploadEnum.assetType ~= Enum.AssetType.EyelashAccessory then return end
	local handle = p2.renderMeshesData.Handle
	local handle_1 = p2.innerCagesData.Handle
	
	if handle == nil or handle_1 == nil then
		error("Schema should have ensured data exists for handle")
	end
	if not UGCValidationService:ValidateLeaderSkinnedVertsNearCageIslands(handle.editable, handle_1.editable, eyelashCageUVReferenceValuesModule, handle_1.origin, var1) then
		p1:fail(errorSourceStringsModule.Keys.LeaderVertsNearCageIslands)
	end
end

return t