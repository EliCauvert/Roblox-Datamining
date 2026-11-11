local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetFFlagUGCValidationEyebrowEyelashSupportModule = require(Parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)

return function(Object, p1)
	-- upvalues: PcallDeferredModule (copy), GetEditableMeshFromContextModule (copy), UGCValidationService (copy), AnalyticsModule (copy), ConstantsInterfaceModule (copy), GetFFlagUGCValidationEyebrowEyelashSupportModule (copy), ConstantsModule (copy)
	local AssetTypeEnum = p1.assetTypeEnum
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: GetEditableMeshFromContextModule (upval), Object (copy), p1 (copy), UGCValidationService (upval)
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object, "MeshId", p1)
		
		if not MeshId then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:GetEditableMeshSkinningTransferJointsInfo(MeshId2)
	end, p1)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateSkinningTransfer_FailedToExecute, nil, p1)
		
		return false, {
			string.format("Failed to execute skinning transfer check for '%s'. Make sure the mesh exists and try again.", Object:GetFullName())
		}
	end
	local HasNextEntry = next(PcallDeferredModuleResult2) ~= nil
	
	if HasNextEntry then
		local List = {}
		
		for i in PcallDeferredModuleResult2 do
			table.insert(List, i)
		end
		local Joined = table.concat(List, ", ")
		
		if ConstantsInterfaceModule.isBodyPart(AssetTypeEnum) then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateSkinningTransfer_BodyPartsWithSpecialJoints, nil, p1)
			
			return false, {
				string.format("Invalid joints [%s] found in body mesh '%s'. Please remove the joints and try again.", Joined, Object:GetFullName())
			}
		end
		local WrapLayer = Object:FindFirstChildOfClass("WrapLayer")
		assert(WrapLayer, "MeshPart isn't a body part, so it must be an accessory with a WrapLayer")
		
		if WrapLayer.AutoSkin ~= Enum.WrapLayerAutoSkin.EnabledOverride then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateSkinningTransfer_SkinningTransferOverride, nil, p1)
			
			return false, {
				string.format("Skinning Transfer joints [%s] found in '%s'. WrapLayer.AutoSkin must be set to EnabledOverride when joints are present.", Joined, Object:GetFullName())
			}
		end
	end
	if GetFFlagUGCValidationEyebrowEyelashSupportModule() and not HasNextEntry and ConstantsModule.SkinningTransferRequiredTypes[AssetTypeEnum] then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateSkinningTransfer_RequiredAssetTypes, nil, p1)
		
		return false, {
			string.format("No Skinning Transfer joints found in '%s'. Accessories of type %s are required to use Skinning Transfer with RBX_Leader and RBX_Follower joints.", Object:GetFullName(), AssetTypeEnum.Name)
		}
	end
	for i1, value in PcallDeferredModuleResult2 do
		if not value then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateSkinningTransfer_Weights, nil, p1)
			
			return false, {
				string.format("Vert(s) in mesh '%s' are only partially weighted to joint %s. Vert(s) must be fully weighted to this joint.", Object:GetFullName(), i1)
			}
		end
	end
	return true
end