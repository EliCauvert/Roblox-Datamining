local CaptureService = game:GetService("CaptureService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local _ = require(Parent1.MomentsCreationFlow)
local _ = require(Parent1.MomentsTypes)
local NormalizeMomentMetadataModule = require(Parent.Utils.normalizeMomentMetadata)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)

return function(Capture, p1, FeedRegistrationInfo)
	-- upvalues: NormalizeMomentMetadataModule (copy), CaptureService (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
	return function(p2)
		-- upvalues: NormalizeMomentMetadataModule (upval), p1 (copy), CaptureService (upval), Capture (copy), FeedRegistrationInfo (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
		local NormalizeMomentMetadataModuleResult = NormalizeMomentMetadataModule(p1)
		pcall(function()
			-- upvalues: CaptureService (upval), Capture (upval), NormalizeMomentMetadataModuleResult (copy), FeedRegistrationInfo (upval)
			CaptureService:UploadCaptureAndPostMoment(Capture, NormalizeMomentMetadataModuleResult, FeedRegistrationInfo)
		end)
		p2:dispatch(ToastTriggeredModule(CapturesToastTypeModule.MomentProcessing))
	end
end