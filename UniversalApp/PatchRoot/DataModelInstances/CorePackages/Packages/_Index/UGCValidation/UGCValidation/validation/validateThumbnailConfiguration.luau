local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationAddThumbnailFrustumCheckingv2 = game:DefineFastFlag("UGCValidationAddThumbnailFrustumCheckingv2", false)
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)

return function(p0, p1, p2, p3, p4) --[[ line: 14 | named "validateThumbnailConfiguration" ]]
	-- upvalues: analyticsModule (ref), UGCValidationAddThumbnailFrustumCheckingv2 (ref), UGCValidationService (ref)
	local thumbnailConfiguration = p0:FindFirstChild("ThumbnailConfiguration")
	
	if thumbnailConfiguration then
		local thumbnailCameraTarget = thumbnailConfiguration:FindFirstChild("ThumbnailCameraTarget")
		
		if thumbnailCameraTarget.Value ~= p1 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateThumbnailConfiguration_InvalidTarget, nil, p4)
			
			return false, {
				string.format("Invalid target asset for thumbnail generation. Expected it to be '%s'.", p1:GetFullName())
			}
		elseif game:GetEngineFeature("EngineUGCValidateThumbnailerMeshInFrustum") and UGCValidationAddThumbnailFrustumCheckingv2 then
			local cFrame = thumbnailCameraTarget.Value.CFrame
			
			if UGCValidationService:CheckEditableMeshInCameraFrustum(p2.editableMesh, p3, cFrame, cFrame * thumbnailConfiguration:FindFirstChild("ThumbnailCameraValue").Value) == false then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateThumbnailConfiguration_OutsideView, nil, p4)
				
				return false, {
					string.format("Asset '%s' is positioned outside the thumbnail camera view. You need to reposition the asset at the center of the camera view and try again.", p2.fullName)
				}
			end
		end
	end
	return true
end