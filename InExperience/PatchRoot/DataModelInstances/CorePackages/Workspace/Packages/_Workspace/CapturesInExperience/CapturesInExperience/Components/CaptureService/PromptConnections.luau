local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local captureServiceModule = require(parent.Services.CaptureService)
local reactModule = require(parent_1.React)
local useDispatch = require(parent_1.RoactUtils).Hooks.RoactRodux.useDispatch
local useEventConnection = require(parent_1.ReactUtils).useEventConnection
local capturesPolicyModule = require(parent.App.CapturesPolicy)
local promptTriggeredModule = require(parent.Actions.PromptTriggered)
local promptTypeModule = require(parent.Enums.PromptType)
local _ = require(parent.Types)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local captureTypeModule = require(parent.Enums.CaptureType)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local fFlagCapturesEnableDownloadPromptForU13Module = require(parent.Flags.FFlagCapturesEnableDownloadPromptForU13)

return capturesPolicyModule.connect(function(p1)
	return { enableShareCaptureCTA = p1.enableShareCaptureCTA() }
end)(function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), promptTriggeredModule (ref), promptTypeModule (ref), useEventConnection (ref), captureServiceModule (ref), fFlagCapturesEnableDownloadPromptForU13Module (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref)
	local var1 = useDispatch()
	useEventConnection(captureServiceModule.OpenSaveCapturesPrompt, reactModule.useCallback(function(p2, p3)
		-- upvalues: var1 (ref), promptTriggeredModule (copy), promptTypeModule (copy)
		var1(promptTriggeredModule(p2, promptTypeModule.SaveCaptures, { contents = p3 }))
	end, {}))
	useEventConnection(captureServiceModule.OpenShareCapturePrompt, reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: fFlagCapturesEnableDownloadPromptForU13Module (copy), p1 (ref), var1 (ref), promptTriggeredModule (copy), promptTypeModule (copy), captureServiceModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		local t = {
			content = p3,
			isU13LocalSavePrompt = fFlagCapturesEnableDownloadPromptForU13Module and not p1.enableShareCaptureCTA,
			launchData = p4
		}
		local captureSavedInternalConnection = nil
		
		if fFlagCapturesEnableDownloadPromptForU13Module or p1.enableShareCaptureCTA then
			var1(promptTriggeredModule(p2, promptTypeModule.ShareCapture, t))
		else
			captureSavedInternalConnection = captureServiceModule.CaptureSavedInternal:Connect(function(p5)
				-- upvalues: p3 (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), captureSavedInternalConnection (write), captureServiceModule (copy), var1 (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy)
				if p3.Object ~= nil then
					if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
						if p5.CaptureTime ~= p3.Object.CaptureTime then return end
					elseif p5.type == captureTypeModule.Video and p5.videoCapture.CaptureTime ~= p3.Object.CaptureTime then return end
				end
				local var2 = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then p5 elseif p5.type == captureTypeModule.Video then p5.videoCapture else p5.filePath
				
				if captureSavedInternalConnection then
					captureSavedInternalConnection:Disconnect()
				end
				captureServiceModule:SaveCapturesToExternalStorageAsync({ var2 })
				var1(toastTriggeredModule(capturesToastTypeModule.CaptureSavedToDevice, { captureInfo = var2 }))
			end)
			captureServiceModule:GetCaptureFilePathAsync(p3)
		end
	end, { p1.enableShareCaptureCTA }))
	local var2 = reactModule.useCallback(function(p2, _)
		-- upvalues: var1 (ref), promptTriggeredModule (copy), promptTypeModule (copy)
		var1(promptTriggeredModule(p2, promptTypeModule.CapturePermissions, {}))
	end, {})
	
	if game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then
		useEventConnection(captureServiceModule.OpenCapturePermissionsPrompt, var2)
	end
	return reactModule.createElement(reactModule.Fragment, {}, {})
end)