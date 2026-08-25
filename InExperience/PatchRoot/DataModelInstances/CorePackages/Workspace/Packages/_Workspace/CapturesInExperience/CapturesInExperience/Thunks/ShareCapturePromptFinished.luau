local parent = script.Parent.Parent
local captureServiceModule = require(parent.Services.CaptureService)
local externalShareSourceTypeModule = require(parent.Enums.ExternalShareSourceType)
local promptDismissedModule = require(parent.Actions.PromptDismissed)
local shareCaptureModule = require(parent.Thunks.ShareCapture)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local capturesPromptShareImageFixEnabled = game:DefineFastFlag("CapturesPromptShareImageFixEnabled", false)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p0, p1, p2)
	-- upvalues: promptDismissedModule (ref), captureServiceModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref), capturesPromptShareImageFixEnabled (ref), shareCaptureModule (ref), externalShareSourceTypeModule (ref)
	return function(p3)
		-- upvalues: promptDismissedModule (copy), p0 (ref), p2 (ref), p1 (ref), captureServiceModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy), capturesPromptShareImageFixEnabled (copy), shareCaptureModule (copy), externalShareSourceTypeModule (copy)
		p3:dispatch(promptDismissedModule(p0))
		
		if p2 then
			if p1.isU13LocalSavePrompt then
				task.spawn(function()
					-- upvalues: p1 (copy), captureServiceModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), p3 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
					local content = p1.content
					local captureSavedInternalConnection = nil
					captureSavedInternalConnection = captureServiceModule.CaptureSavedInternal:Connect(function(p4)
						-- upvalues: content (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), captureSavedInternalConnection (write), captureServiceModule (copy), p3 (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy)
						if content.Object ~= nil then
							if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
								if p4.CaptureTime ~= content.Object.CaptureTime then return end
							elseif p4.type == captureTypeModule.Video and p4.videoCapture.CaptureTime ~= content.Object.CaptureTime then return end
						end
						local var10 = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then p4 elseif p4.type == captureTypeModule.Video then p4.videoCapture else p4.filePath
						
						if captureSavedInternalConnection then
							captureSavedInternalConnection:Disconnect()
						end
						captureServiceModule:SaveCapturesToExternalStorageAsync({ var10 })
						p3:dispatch(toastTriggeredModule(capturesToastTypeModule.CaptureSavedToDevice, { captureInfo = var10 }))
					end)
					captureServiceModule:GetCaptureFilePathAsync(p1.content)
				end)
			else
				task.spawn(function()
					-- upvalues: captureServiceModule (copy), p1 (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), capturesPromptShareImageFixEnabled (copy), captureTypeModule (copy), p3 (ref), shareCaptureModule (copy), externalShareSourceTypeModule (copy)
					local var14
					local contentCaptureFilePathAsync = captureServiceModule:GetCaptureFilePathAsync(p1.content)
					local _ = nil
					local content = p1.content
					local var12 = content.Object ~= nil and content.Object:IsA("VideoCapture")
					
					if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
						local var13
						if capturesPromptShareImageFixEnabled then
							var13 = content.Object ~= nil
							var13 = nil
						else
							var13 = true
						end
						var14 = if var13 then content.Object else {
							contentId = content.Uri or "rbxtemp://0",
							filePath = if var12 then "" else contentCaptureFilePathAsync,
							type = if var12 then captureTypeModule.Video else captureTypeModule.Screenshot,
							videoCapture = if var12 then content.Object else nil
						}
					end
					p3:dispatch(shareCaptureModule(var14, externalShareSourceTypeModule.Prompt, p1.launchData))
				end)
			end
		end
		captureServiceModule:OnSharePromptFinished(p0, p2)
	end
end