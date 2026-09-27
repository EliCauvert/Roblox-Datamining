local parent = script.Parent.Parent
local captureServiceModule = require(parent.Services.CaptureService)
local externalShareSourceTypeModule = require(parent.Enums.ExternalShareSourceType)
local promptDismissedModule = require(parent.Actions.PromptDismissed)
local shareCaptureModule = require(parent.Thunks.ShareCapture)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p1, p2, p3)
	-- upvalues: promptDismissedModule (ref), captureServiceModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref), shareCaptureModule (ref), externalShareSourceTypeModule (ref)
	return function(p4)
		-- upvalues: promptDismissedModule (copy), p1 (ref), p3 (ref), p2 (ref), captureServiceModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy), shareCaptureModule (copy), externalShareSourceTypeModule (copy)
		p4:dispatch(promptDismissedModule(p1))
		
		if p3 then
			if p2.isU13LocalSavePrompt then
				task.spawn(function()
					-- upvalues: p2 (copy), captureServiceModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), p4 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
					local content = p2.content
					local captureSavedInternalConnection = nil
					captureSavedInternalConnection = captureServiceModule.CaptureSavedInternal:Connect(function(p5)
						-- upvalues: content (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), captureSavedInternalConnection (write), captureServiceModule (copy), p4 (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy)
						if content.Object ~= nil then
							if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
								if p5.CaptureTime ~= content.Object.CaptureTime then return end
							elseif p5.type == captureTypeModule.Video and p5.videoCapture.CaptureTime ~= content.Object.CaptureTime then return end
						end
						local var1 = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then p5 elseif p5.type == captureTypeModule.Video then p5.videoCapture else p5.filePath
						
						if captureSavedInternalConnection then
							captureSavedInternalConnection:Disconnect()
						end
						captureServiceModule:SaveCapturesToExternalStorageAsync({ var1 })
						p4:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureSavedToDevice, { captureInfo = var1 }))
					end)
					captureServiceModule:GetCaptureFilePathAsync(p2.content)
				end)
			else
				task.spawn(function()
					-- upvalues: captureServiceModule (copy), p2 (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), p4 (ref), shareCaptureModule (copy), externalShareSourceTypeModule (copy)
					local contentCaptureFilePathAsync = captureServiceModule:GetCaptureFilePathAsync(p2.content)
					local _ = nil
					local content = p2.content
					local var1 = content.Object ~= nil and content.Object:IsA("VideoCapture")
					p4:dispatch(shareCaptureModule(if fFlagEnableCapturesGalleryRetrievalCoreScriptModule and content.Object ~= nil then content.Object else {
						contentId = content.Uri or "rbxtemp://0",
						filePath = if var1 then "" else contentCaptureFilePathAsync,
						type = if var1 then captureTypeModule.Video else captureTypeModule.Screenshot,
						videoCapture = if var1 then content.Object else nil
					}, externalShareSourceTypeModule.Prompt, p2.launchData))
				end)
			end
		end
		captureServiceModule:OnSharePromptFinished(p1, p3)
	end
end