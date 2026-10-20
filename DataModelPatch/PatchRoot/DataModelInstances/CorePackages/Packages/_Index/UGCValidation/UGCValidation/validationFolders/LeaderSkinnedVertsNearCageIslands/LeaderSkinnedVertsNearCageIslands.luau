local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local EyelashCageUVReferenceValuesModule = require(Parent.EyelashCageUVReferenceValues)
local DistanceThreshold = require(Parent.flags.getFIntUGCValidationLeaderVertsNearCageIslandsDistance)() / 10000

return {
	fflag = require(Parent.flags.getEngineFeatureEngineUGCValidateLeaderVertsNearCageIslands),
	categories = { ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.renderMeshesData,
		ValidationEnumsModule.SharedDataMember.innerCagesData
	},
	run = function(p1, p2)
		-- upvalues: UGCValidationService (copy), EyelashCageUVReferenceValuesModule (copy), DistanceThreshold (copy), ErrorSourceStringsModule (copy)
		if p2.uploadEnum.assetType ~= Enum.AssetType.EyelashAccessory then return end
		local Handle = p2.renderMeshesData.Handle
		local Handle1 = p2.innerCagesData.Handle
		
		if Handle == nil or Handle1 == nil then
			error("Schema should have ensured data exists for handle")
		end
		if not UGCValidationService:ValidateLeaderSkinnedVertsNearCageIslands(Handle.editable, Handle1.editable, EyelashCageUVReferenceValuesModule, Handle1.origin, DistanceThreshold) then
			p1:fail(ErrorSourceStringsModule.Keys.LeaderVertsNearCageIslands)
		end
	end
}