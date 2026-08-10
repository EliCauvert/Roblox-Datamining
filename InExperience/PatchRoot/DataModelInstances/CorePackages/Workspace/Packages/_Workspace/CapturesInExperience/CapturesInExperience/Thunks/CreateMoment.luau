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
local makePostMetadata = momentsCreationModule.makePostMetadata

return function(p0, p1, p2) --[[ line: 21 ]]
	-- upvalues: normalizeMomentMetadataModule (ref), getFFlagMomentsUseUploadPostAsync (ref), makePostMetadata (ref), captureService (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p3) --[[ line: 26 ]]
		-- upvalues: normalizeMomentMetadataModule (copy), p1 (ref), getFFlagMomentsUseUploadPostAsync (copy), makePostMetadata (copy), captureService (copy), p0 (ref), p2 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		local var6 = normalizeMomentMetadataModule(p1)
		
		if getFFlagMomentsUseUploadPostAsync() then
			local var7 = makePostMetadata(p1)
			pcall(function() --[[ line: 31 ]]
				-- upvalues: captureService (copy), p0 (copy), var7 (ref)
				captureService:UploadPostAsync(p0, var7)
			end)
		else
			pcall(function() --[[ line: 35 ]]
				-- upvalues: captureService (copy), p0 (copy), var6 (ref), p2 (copy)
				captureService:UploadCaptureAndPostMoment(p0, var6, p2)
			end)
		end
		p3:dispatch(toastTriggeredModule(capturesToastTypeModule.MomentProcessing))
	end
end