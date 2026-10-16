local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CaptureServiceModule = require(Parent.Services.CaptureService)
local ReactModule = require(Parent1.React)
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local PromptTriggeredModule = require(Parent.Actions.PromptTriggered)
local PromptTypeModule = require(Parent.Enums.PromptType)
local _ = require(Parent.Types)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local FFlagCapturesEnableDownloadPromptForU13Module = require(Parent.Flags.FFlagCapturesEnableDownloadPromptForU13)

return (require(Parent.App.CapturesPolicy).connect(function(p1) --[[ Line: 105 ]]
	return { enableShareCaptureCTA = p1.enableShareCaptureCTA() }
end)(function(p1) --[[ Line: 30 ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), PromptTriggeredModule (copy), PromptTypeModule (copy), UseEventConnectionFunction (copy), CaptureServiceModule (copy), FFlagCapturesEnableDownloadPromptForU13Module (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	UseEventConnectionFunction(CaptureServiceModule.OpenSaveCapturesPrompt, (ReactModule.useCallback(function(p2, Contents) --[[ Line: 33 ]]
		-- upvalues: UseDispatchResult (copy), PromptTriggeredModule (upval), PromptTypeModule (upval)
		UseDispatchResult(PromptTriggeredModule(p2, PromptTypeModule.SaveCaptures, { contents = Contents }))
	end, {})))
	UseEventConnectionFunction(CaptureServiceModule.OpenShareCapturePrompt, (ReactModule.useCallback(function(p2, Content, LaunchData) --[[ Line: 43 ]]
		-- upvalues: FFlagCapturesEnableDownloadPromptForU13Module (upval), p1 (copy), UseDispatchResult (copy), PromptTriggeredModule (upval), PromptTypeModule (upval), CaptureServiceModule (upval), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureTypeModule (upval), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
		local config = {
			content = Content,
			isU13LocalSavePrompt = FFlagCapturesEnableDownloadPromptForU13Module and not p1.enableShareCaptureCTA,
			launchData = LaunchData
		}
		local Connection = nil
		
		if FFlagCapturesEnableDownloadPromptForU13Module or p1.enableShareCaptureCTA then
			UseDispatchResult(PromptTriggeredModule(p2, PromptTypeModule.ShareCapture, config))
		else
			Connection = CaptureServiceModule.CaptureSavedInternal:Connect(function(CaptureInfo) --[[ Line: 55 ]]
				-- upvalues: Content (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureTypeModule (upval), Connection (ref), CaptureServiceModule (upval), UseDispatchResult (upval), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
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
				UseDispatchResult(ToastTriggeredModule(CapturesToastTypeModule.CaptureSavedToDevice, { captureInfo = CaptureInfo1 }))
			end)
			CaptureServiceModule:GetCaptureFilePathAsync(Content)
		end
	end, { p1.enableShareCaptureCTA })))
	local UseResult = ReactModule.useCallback(function(p2, _) --[[ Line: 93 ]]
		-- upvalues: UseDispatchResult (copy), PromptTriggeredModule (upval), PromptTypeModule (upval)
		UseDispatchResult(PromptTriggeredModule(p2, PromptTypeModule.CapturePermissions, {}))
	end, {})
	
	if game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then
		UseEventConnectionFunction(CaptureServiceModule.OpenCapturePermissionsPrompt, UseResult)
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {})
end))