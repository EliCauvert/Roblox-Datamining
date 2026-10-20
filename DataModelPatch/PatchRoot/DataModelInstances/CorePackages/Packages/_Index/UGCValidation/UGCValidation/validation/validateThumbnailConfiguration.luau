local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationAddThumbnailFrustumCheckingv2 = game:DefineFastFlag("UGCValidationAddThumbnailFrustumCheckingv2", false)
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)

return function(Object, Object1, p1, MeshScale, p2)
	-- upvalues: AnalyticsModule (copy), UGCValidationAddThumbnailFrustumCheckingv2 (copy), UGCValidationService (copy)
	local ThumbnailConfiguration = Object:FindFirstChild("ThumbnailConfiguration")
	
	if ThumbnailConfiguration then
		local ThumbnailCameraTarget = ThumbnailConfiguration:FindFirstChild("ThumbnailCameraTarget")
		
		if ThumbnailCameraTarget.Value ~= Object1 then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateThumbnailConfiguration_InvalidTarget, nil, p2)
			
			return false, {
				string.format("Invalid target asset for thumbnail generation. Expected it to be '%s'.", Object1:GetFullName())
			}
		end
		if game:GetEngineFeature("EngineUGCValidateThumbnailerMeshInFrustum") and UGCValidationAddThumbnailFrustumCheckingv2 then
			local ValueCFrame = ThumbnailCameraTarget.Value.CFrame
			
			if UGCValidationService:CheckEditableMeshInCameraFrustum(p1.editableMesh, MeshScale, ValueCFrame, ValueCFrame * ThumbnailConfiguration:FindFirstChild("ThumbnailCameraValue").Value) == false then
				AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateThumbnailConfiguration_OutsideView, nil, p2)
				
				return false, {
					string.format("Asset '%s' is positioned outside the thumbnail camera view. You need to reposition the asset at the center of the camera view and try again.", p1.fullName)
				}
			end
		end
	end
	return true
end