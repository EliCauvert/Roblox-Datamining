local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)

return function(p0, p1) --[[ line: 17 | named "validateSkinningTransfer" ]]
	-- upvalues: pcallDeferredModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), analyticsModule (ref), constantsInterfaceModule (ref), getFFlagUGCValidationEyebrowEyelashSupportModule (ref), constantsModule (ref)
	local assetTypeEnum = p1.assetTypeEnum
	local var7, var8 = pcallDeferredModule(function() --[[ line: 23 ]]
		-- upvalues: getEditableMeshFromContextModule (copy), p0 (ref), p1 (ref), UGCValidationService (copy)
		local var13, var14 = getEditableMeshFromContextModule(p0, "MeshId", p1)
		
		if not var13 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:GetEditableMeshSkinningTransferJointsInfo(var14)
	end, p1)
	
	if not var7 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_FailedToExecute, nil, p1)
		
		return false, {
			string.format("Failed to execute skinning transfer check for '%s'. Make sure the mesh exists and try again.", p0:GetFullName())
		}
	end
	local var9 = next(var8) ~= nil
	
	if var9 then
		local t = {}
		
		for i in var8 do
			table.insert(t, i)
		end
		local joined = table.concat(t, ", ")
		
		if constantsInterfaceModule.isBodyPart(assetTypeEnum) then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_BodyPartsWithSpecialJoints, nil, p1)
			
			return false, {
				string.format("Invalid joints [%s] found in body mesh '%s'. Please remove the joints and try again.", joined, p0:GetFullName())
			}
		end
		local wrapLayer = p0:FindFirstChildOfClass("WrapLayer")
		assert(wrapLayer, "MeshPart isn't a body part, so it must be an accessory with a WrapLayer")
		
		if wrapLayer.AutoSkin ~= Enum.WrapLayerAutoSkin.EnabledOverride then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_SkinningTransferOverride, nil, p1)
			
			return false, {
				string.format("Skinning Transfer joints [%s] found in '%s'. WrapLayer.AutoSkin must be set to EnabledOverride when joints are present.", joined, p0:GetFullName())
			}
		elseif getFFlagUGCValidationEyebrowEyelashSupportModule() and not var9 and constantsModule.SkinningTransferRequiredTypes[assetTypeEnum] then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_RequiredAssetTypes, nil, p1)
			
			return false, {
				string.format("No Skinning Transfer joints found in '%s'. Accessories of type %s are required to use Skinning Transfer with RBX_Leader and RBX_Follower joints.", p0:GetFullName(), assetTypeEnum.Name)
			}
		end
		for i, v in var8 do
			if not v then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateSkinningTransfer_Weights, nil, p1)
				
				return false, {
					string.format("Vert(s) in mesh '%s' are only partially weighted to joint %s. Vert(s) must be fully weighted to this joint.", p0:GetFullName(), i)
				}
			end
		end
		return true
	end
end