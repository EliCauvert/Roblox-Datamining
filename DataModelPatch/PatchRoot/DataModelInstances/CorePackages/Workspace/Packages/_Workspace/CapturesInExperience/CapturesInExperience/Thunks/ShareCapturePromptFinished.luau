local Parent = script.Parent.Parent
local CaptureServiceModule = require(Parent.Services.CaptureService)
local ExternalShareSourceTypeModule = require(Parent.Enums.ExternalShareSourceType)
local PromptDismissedModule = require(Parent.Actions.PromptDismissed)
local ShareCaptureModule = require(Parent.Thunks.ShareCapture)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local _ = require(Parent.Types)
local CapturesPromptShareImageFixEnabled = game:DefineFastFlag("CapturesPromptShareImageFixEnabled", false)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(PromptId, p1, Accepted)
	-- upvalues: PromptDismissedModule (copy), CaptureServiceModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy), CapturesPromptShareImageFixEnabled (copy), ShareCaptureModule (copy), ExternalShareSourceTypeModule (copy)
	return function(p2)
		-- upvalues: PromptDismissedModule (upval), PromptId (copy), Accepted (copy), p1 (copy), CaptureServiceModule (upval), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureTypeModule (upval), ToastTriggeredModule (upval), CapturesToastTypeModule (upval), CapturesPromptShareImageFixEnabled (upval), ShareCaptureModule (upval), ExternalShareSourceTypeModule (upval)
		p2:dispatch(PromptDismissedModule(PromptId))
		
		if Accepted then
			if p1.isU13LocalSavePrompt then
				task.spawn(function()
					-- upvalues: p1 (upval), CaptureServiceModule (upval), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureTypeModule (upval), p2 (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
					local Content = p1.content
					local Connection = nil
					Connection = CaptureServiceModule.CaptureSavedInternal:Connect(function(CaptureInfo)
						-- upvalues: Content (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureTypeModule (upval), Connection (ref), CaptureServiceModule (upval), p2 (upval), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
						if Content.Object ~= nil then
							if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
								if CaptureInfo.CaptureTime ~= Content.Object.CaptureTime then return end
							elseif CaptureInfo.type == CaptureTypeModule.Video and CaptureInfo.videoCapture.CaptureTime ~= Content.Object.CaptureTime then return end
						end
						local CaptureInfo1 = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then CaptureInfo elseif CaptureInfo.type == CaptureTypeModule.Video then CaptureInfo.videoCapture else CaptureInfo.filePath
						
						if Connection then
							Connection:Disconnect()
						end
						CaptureServiceModule:SaveCapturesToExternalStorageAsync({ CaptureInfo1 })
						p2:dispatch(ToastTriggeredModule(CapturesToastTypeModule.CaptureSavedToDevice, { captureInfo = CaptureInfo1 }))
					end)
					CaptureServiceModule:GetCaptureFilePathAsync(p1.content)
				end)
			else
				task.spawn(function()
					-- upvalues: CaptureServiceModule (upval), p1 (upval), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CapturesPromptShareImageFixEnabled (upval), CaptureTypeModule (upval), p2 (copy), ShareCaptureModule (upval), ExternalShareSourceTypeModule (upval)
					local CaptureFilePathAsync = CaptureServiceModule:GetCaptureFilePathAsync(p1.content)
					local Content = p1.content
					local IsVideoCapture = Content.Object ~= nil and Content.Object:IsA("VideoCapture")
					p2:dispatch(ShareCaptureModule(if FFlagEnableCapturesGalleryRetrievalCoreScriptModule and (not CapturesPromptShareImageFixEnabled or Content.Object ~= nil) then Content.Object else {
						contentId = Content.Uri or "rbxtemp://0",
						filePath = if IsVideoCapture then "" else CaptureFilePathAsync,
						type = if IsVideoCapture then CaptureTypeModule.Video else CaptureTypeModule.Screenshot,
						videoCapture = if IsVideoCapture then Content.Object else nil
					}, ExternalShareSourceTypeModule.Prompt, p1.launchData))
				end)
			end
		end
		CaptureServiceModule:OnSharePromptFinished(PromptId, Accepted)
	end
end