local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationAddThumbnailFrustumCheckingv2 = game:DefineFastFlag("UGCValidationAddThumbnailFrustumCheckingv2", false)
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)

return function(p1, p2, p3, p4, p5)
	-- upvalues: analyticsModule (ref), UGCValidationAddThumbnailFrustumCheckingv2 (ref), UGCValidationService (ref)
	local thumbnailConfiguration = p1:FindFirstChild("ThumbnailConfiguration")
	
	if thumbnailConfiguration then
		local thumbnailCameraTarget = thumbnailConfiguration:FindFirstChild("ThumbnailCameraTarget")
		
		if thumbnailCameraTarget.Value ~= p2 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateThumbnailConfiguration_InvalidTarget, nil, p5)
			
			return false, {
				string.format("Invalid target asset for thumbnail generation. Expected it to be '%s'.", p2:GetFullName())
			}
		elseif game:GetEngineFeature("EngineUGCValidateThumbnailerMeshInFrustum") and UGCValidationAddThumbnailFrustumCheckingv2 then
			local cFrame = thumbnailCameraTarget.Value.CFrame
			
			if UGCValidationService:CheckEditableMeshInCameraFrustum(p3.editableMesh, p4, cFrame, cFrame * thumbnailConfiguration:FindFirstChild("ThumbnailCameraValue").Value) == false then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateThumbnailConfiguration_OutsideView, nil, p5)
				
				return false, {
					string.format("Asset '%s' is positioned outside the thumbnail camera view. You need to reposition the asset at the center of the camera view and try again.", p3.fullName)
				}
			end
		end
	end
	return true
end