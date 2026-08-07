local captureService = game:GetService("CaptureService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.MomentsCreationFlow)
local _ = require(parent_1.MomentsTypes)
local normalizeMomentMetadataModule = require(parent.Utils.normalizeMomentMetadata)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)

return function(p0, p1, p2) --[[ line: 15 ]]
	-- upvalues: normalizeMomentMetadataModule (ref), captureService (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p3) --[[ line: 20 ]]
		-- upvalues: normalizeMomentMetadataModule (copy), p1 (ref), captureService (copy), p0 (ref), p2 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		local var4 = normalizeMomentMetadataModule(p1)
		pcall(function() --[[ line: 23 ]]
			-- upvalues: captureService (copy), p0 (copy), var4 (ref), p2 (copy)
			captureService:UploadCaptureAndPostMoment(p0, var4, p2)
		end)
		p3:dispatch(toastTriggeredModule(capturesToastTypeModule.MomentProcessing))
	end
end