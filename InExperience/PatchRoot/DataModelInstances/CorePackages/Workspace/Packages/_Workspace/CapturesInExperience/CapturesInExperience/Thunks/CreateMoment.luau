local CaptureService = game:GetService("CaptureService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)

if require(Parent.Flags.FFlagCapturesInExpUseMomentsCreation) then
	local _ = require(Parent1.MomentsTypes)
	local PublishMomentWithTagsFunction = require(Parent1.MomentsCreation).publishMomentWithTags
	
	return function(p1, p2, p3, p4, p5, p6) --[[ Line: 17 ]]
		-- upvalues: PublishMomentWithTagsFunction (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
		return function(p7) --[[ Line: 25 ]]
			-- upvalues: PublishMomentWithTagsFunction (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
			if PublishMomentWithTagsFunction(p1, p2, p3, p4, p5, p6) then
				p7:dispatch(ToastTriggeredModule(CapturesToastTypeModule.MomentProcessing))
			end
		end
	end
else
	local _ = require(Parent1.MomentsCreationFlow)
	local MomentsCommonModule = require(Parent1.MomentsCommon)
	local _ = require(Parent1.MomentsTypes)
	local NormalizeMomentMetadataModule = require(Parent.Utils.normalizeMomentMetadata)
	local GetFFlagMomentsUseUploadPostAsyncFunction = MomentsCommonModule.Flags.GetFFlagMomentsUseUploadPostAsync
	local GetFFlagMomentsUseMomentsServiceForUploadFunction = MomentsCommonModule.Flags.GetFFlagMomentsUseMomentsServiceForUpload
	local MakePostMetadataFunction = require(Parent1.MomentsCreation).makePostMetadata
	
	return function(Capture, p1, FeedRegistrationInfo, p2) --[[ Line: 55 ]]
		-- upvalues: NormalizeMomentMetadataModule (copy), GetFFlagMomentsUseUploadPostAsyncFunction (copy), MakePostMetadataFunction (copy), GetFFlagMomentsUseMomentsServiceForUploadFunction (copy), CaptureService (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
		return function(p3) --[[ Line: 61 ]]
			-- upvalues: NormalizeMomentMetadataModule (upval), p1 (copy), GetFFlagMomentsUseUploadPostAsyncFunction (upval), MakePostMetadataFunction (upval), GetFFlagMomentsUseMomentsServiceForUploadFunction (upval), Capture (copy), p2 (copy), CaptureService (upval), FeedRegistrationInfo (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
			local NormalizeMomentMetadataModuleResult = NormalizeMomentMetadataModule(p1)
			
			if GetFFlagMomentsUseUploadPostAsyncFunction() then
				local PostMetadata = MakePostMetadataFunction(p1, if GetFFlagMomentsUseMomentsServiceForUploadFunction() then Capture else nil)
				pcall(function() --[[ Line: 67 ]]
					-- upvalues: GetFFlagMomentsUseMomentsServiceForUploadFunction (upval), p2 (upval), PostMetadata (copy), CaptureService (upval), Capture (upval)
					if GetFFlagMomentsUseMomentsServiceForUploadFunction() then
						(p2 or game:GetService("MomentsService")):CreatePostAsync(PostMetadata)
						
						return
					else
						CaptureService:UploadPostAsync(Capture, PostMetadata)
					end
				end)
			else
				pcall(function() --[[ Line: 76 ]]
					-- upvalues: CaptureService (upval), Capture (upval), NormalizeMomentMetadataModuleResult (copy), FeedRegistrationInfo (upval)
					CaptureService:UploadCaptureAndPostMoment(Capture, NormalizeMomentMetadataModuleResult, FeedRegistrationInfo)
				end)
			end
			p3:dispatch(ToastTriggeredModule(CapturesToastTypeModule.MomentProcessing))
		end
	end
end