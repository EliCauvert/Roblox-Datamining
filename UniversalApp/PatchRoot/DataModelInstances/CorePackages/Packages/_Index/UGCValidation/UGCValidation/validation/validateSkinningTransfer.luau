local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)

return function(p1, p2)
	-- upvalues: pcallDeferredModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), analyticsModule (ref), constantsInterfaceModule (ref), getFFlagUGCValidationEyebrowEyelashSupportModule (ref), constantsModule (ref)
	local assetTypeEnum = p2.assetTypeEnum
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: getEditableMeshFromContextModule (copy), p1 (ref), p2 (ref), UGCValidationService (copy)
		local var3, var4 = getEditableMeshFromContextModule(p1, "MeshId", p2)
		
		if not var3 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:GetEditableMeshSkinningTransferJointsInfo(var4)
	end, p2)
	
	if not var1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_FailedToExecute, nil, p2)
		
		return false, {
			string.format("Failed to execute skinning transfer check for '%s'. Make sure the mesh exists and try again.", p1:GetFullName())
		}
	end
	local var3 = next(var2) ~= nil
	
	if var3 then
		local t = {}
		
		for i in var2 do
			table.insert(t, i)
		end
		local joined = table.concat(t, ", ")
		
		if constantsInterfaceModule.isBodyPart(assetTypeEnum) then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_BodyPartsWithSpecialJoints, nil, p2)
			
			return false, {
				string.format("Invalid joints [%s] found in body mesh '%s'. Please remove the joints and try again.", joined, p1:GetFullName())
			}
		end
		local wrapLayer = p1:FindFirstChildOfClass("WrapLayer")
		assert(wrapLayer, "MeshPart isn't a body part, so it must be an accessory with a WrapLayer")
		
		if wrapLayer.AutoSkin ~= Enum.WrapLayerAutoSkin.EnabledOverride then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_SkinningTransferOverride, nil, p2)
			
			return false, {
				string.format("Skinning Transfer joints [%s] found in '%s'. WrapLayer.AutoSkin must be set to EnabledOverride when joints are present.", joined, p1:GetFullName())
			}
		elseif getFFlagUGCValidationEyebrowEyelashSupportModule() and not var3 and constantsModule.SkinningTransferRequiredTypes[assetTypeEnum] then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_RequiredAssetTypes, nil, p2)
			
			return false, {
				string.format("No Skinning Transfer joints found in '%s'. Accessories of type %s are required to use Skinning Transfer with RBX_Leader and RBX_Follower joints.", p1:GetFullName(), assetTypeEnum.Name)
			}
		end
		for i, v in var2 do
			if not v then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_Weights, nil, p2)
				
				return false, {
					string.format("Vert(s) in mesh '%s' are only partially weighted to joint %s. Vert(s) must be fully weighted to this joint.", p1:GetFullName(), i)
				}
			end
		end
		return true
	end
end