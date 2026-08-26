local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactUtilsModule = require(parent_1.ReactUtils)
local captureService = game:GetService("CaptureService")
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local captureControlsViewModule = require(parent.Components.CoreUI.CaptureControlsView)
local constantsModule = require(parent.Constants)
local makeVideoCaptureFailedHandlerModule = require(parent.Utils.makeVideoCaptureFailedHandler)
local makeVideoCaptureStartFailedHandlerModule = require(parent.Utils.makeVideoCaptureStartFailedHandler)
local toastContainerModule = require(parent.Components.Common.ToastContainer)
local useCallback = reactModule.useCallback
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEventConnection = reactUtilsModule.useEventConnection
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local fFlagEnableUpdatedCaptureControlsModule = require(parent.Flags.FFlagEnableUpdatedCaptureControls)

return function(_)
	-- upvalues: useDispatch (ref), useSelector (ref), constantsModule (ref), useCallback (ref), makeVideoCaptureStartFailedHandlerModule (ref), useEventConnection (ref), captureService (ref), makeVideoCaptureFailedHandlerModule (ref), reactModule (ref), fFlagEnableUpdatedCaptureControlsModule (ref), captureControlsViewModule (ref), toastContainerModule (ref)
	local var1 = useDispatch()
	local var2 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Carousel.IsOpen
	end)
	local var3 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsCapturesCoreGuiEnabled
	end)
	useEventConnection(captureService.UserVideoCaptureStartFailed, useCallback(makeVideoCaptureStartFailedHandlerModule(var1), {}))
	useEventConnection(captureService.UserVideoCaptureFailed, useCallback(makeVideoCaptureFailedHandlerModule(var1), {}))
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		CaptureControlsView = if fFlagEnableUpdatedCaptureControlsModule and var3 then reactModule.createElement(captureControlsViewModule) else nil,
		ToastsFrame = if not var2 then reactModule.createElement("Frame", {
			Active = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = constantsModule.ZIndex.Toasts
		}, {
			ToastContainer = reactModule.createElement(toastContainerModule)
		}) else nil
	})
end