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

return capturesPolicyModule.connect(function(p8)
	return { enableShareCaptureCTA = p8.enableShareCaptureCTA() }
end)(function(p0)
	-- upvalues: useDispatch (ref), reactModule (ref), promptTriggeredModule (ref), promptTypeModule (ref), useEventConnection (ref), captureServiceModule (ref), fFlagCapturesEnableDownloadPromptForU13Module (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref)
	local var10 = useDispatch()
	useEventConnection(captureServiceModule.OpenSaveCapturesPrompt, reactModule.useCallback(function(p1, p2)
		-- upvalues: var10 (ref), promptTriggeredModule (copy), promptTypeModule (copy)
		var10(promptTriggeredModule(p1, promptTypeModule.SaveCaptures, { contents = p2 }))
	end, {}))
	useEventConnection(captureServiceModule.OpenShareCapturePrompt, reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: fFlagCapturesEnableDownloadPromptForU13Module (copy), p0 (ref), var10 (ref), promptTriggeredModule (copy), promptTypeModule (copy), captureServiceModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		local t = {
			content = p4,
			isU13LocalSavePrompt = fFlagCapturesEnableDownloadPromptForU13Module and not p0.enableShareCaptureCTA,
			launchData = p5
		}
		local captureSavedInternalConnection = nil
		
		if fFlagCapturesEnableDownloadPromptForU13Module or p0.enableShareCaptureCTA then
			var10(promptTriggeredModule(p3, promptTypeModule.ShareCapture, t))
		else
			captureSavedInternalConnection = captureServiceModule.CaptureSavedInternal:Connect(function(p6)
				-- upvalues: p4 (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureTypeModule (copy), captureSavedInternalConnection (write), captureServiceModule (copy), var10 (copy), toastTriggeredModule (copy), capturesToastTypeModule (copy)
				if p4.Object ~= nil then
					if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
						if p6.CaptureTime ~= p4.Object.CaptureTime then return end
					elseif p6.type == captureTypeModule.Video and p6.videoCapture.CaptureTime ~= p4.Object.CaptureTime then return end
				end
				local var14 = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then p6 elseif p6.type == captureTypeModule.Video then p6.videoCapture else p6.filePath
				
				if captureSavedInternalConnection then
					captureSavedInternalConnection:Disconnect()
				end
				captureServiceModule:SaveCapturesToExternalStorageAsync({ var14 })
				var10(toastTriggeredModule(capturesToastTypeModule.CaptureSavedToDevice, { captureInfo = var14 }))
			end)
			captureServiceModule:GetCaptureFilePathAsync(p4)
		end
	end, { p0.enableShareCaptureCTA }))
	local var11 = reactModule.useCallback(function(p7, _)
		-- upvalues: var10 (ref), promptTriggeredModule (copy), promptTypeModule (copy)
		var10(promptTriggeredModule(p7, promptTypeModule.CapturePermissions, {}))
	end, {})
	
	if game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then
		useEventConnection(captureServiceModule.OpenCapturePermissionsPrompt, var11)
	end
	return reactModule.createElement(reactModule.Fragment, {}, {})
end)