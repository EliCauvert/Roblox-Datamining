local captureService = game:GetService("CaptureService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.MomentsCreationFlow)
local momentsCreationModule = require(parent_1.MomentsCreation)
local momentsCommonModule = require(parent_1.MomentsCommon)
local _ = require(parent_1.MomentsTypes)
local normalizeMomentMetadataModule = require(parent.Utils.normalizeMomentMetadata)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local getFFlagMomentsUseUploadPostAsync = momentsCommonModule.Flags.GetFFlagMomentsUseUploadPostAsync
local getFFlagMomentsUseMomentsServiceForUpload = momentsCommonModule.Flags.GetFFlagMomentsUseMomentsServiceForUpload
local makePostMetadata = momentsCreationModule.makePostMetadata

return function(p1, p2, p3, p4)
	-- upvalues: normalizeMomentMetadataModule (ref), getFFlagMomentsUseUploadPostAsync (ref), makePostMetadata (ref), getFFlagMomentsUseMomentsServiceForUpload (ref), captureService (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p5)
		-- upvalues: normalizeMomentMetadataModule (copy), p2 (ref), getFFlagMomentsUseUploadPostAsync (copy), makePostMetadata (copy), getFFlagMomentsUseMomentsServiceForUpload (copy), p1 (ref), p4 (ref), captureService (copy), p3 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		local var1 = normalizeMomentMetadataModule(p2)
		
		if getFFlagMomentsUseUploadPostAsync() then
			local var2 = makePostMetadata(p2, if getFFlagMomentsUseMomentsServiceForUpload() then p1 else nil)
			pcall(function()
				-- upvalues: getFFlagMomentsUseMomentsServiceForUpload (copy), p4 (copy), var2 (ref), captureService (copy), p1 (copy)
				if getFFlagMomentsUseMomentsServiceForUpload() then
					(p4 or game:GetService("MomentsService")):CreatePostAsync(var2)
					
					return
				end
				captureService:UploadPostAsync(p1, var2)
			end)
		else
			pcall(function()
				-- upvalues: captureService (copy), p1 (copy), var1 (ref), p3 (copy)
				captureService:UploadCaptureAndPostMoment(p1, var1, p3)
			end)
		end
		p5:dispatch(toastTriggeredModule(capturesToastTypeModule.MomentProcessing))
	end
end