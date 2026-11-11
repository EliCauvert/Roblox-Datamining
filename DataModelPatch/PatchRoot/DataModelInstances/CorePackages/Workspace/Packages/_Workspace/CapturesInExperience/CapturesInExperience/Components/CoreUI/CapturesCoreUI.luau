local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CaptureService = game:GetService("CaptureService")
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local CaptureControlsViewModule = require(Parent.Components.CoreUI.CaptureControlsView)
local ConstantsModule = require(Parent.Constants)
local MakeVideoCaptureFailedHandlerModule = require(Parent.Utils.makeVideoCaptureFailedHandler)
local MakeVideoCaptureStartFailedHandlerModule = require(Parent.Utils.makeVideoCaptureStartFailedHandler)
local ToastContainerModule = require(Parent.Components.Common.ToastContainer)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local FFlagEnableUpdatedCaptureControlsModule = require(Parent.Flags.FFlagEnableUpdatedCaptureControls)

return function(_)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseCallbackFunction (copy), MakeVideoCaptureStartFailedHandlerModule (copy), UseEventConnectionFunction (copy), CaptureService (copy), MakeVideoCaptureFailedHandlerModule (copy), ReactModule (copy), FFlagEnableUpdatedCaptureControlsModule (copy), CaptureControlsViewModule (copy), ToastContainerModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Carousel.IsOpen
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].IsCapturesCoreGuiEnabled
	end)
	UseEventConnectionFunction(CaptureService.UserVideoCaptureStartFailed, (UseCallbackFunction(MakeVideoCaptureStartFailedHandlerModule(UseDispatchResult), {})))
	UseEventConnectionFunction(CaptureService.UserVideoCaptureFailed, (UseCallbackFunction(MakeVideoCaptureFailedHandlerModule(UseDispatchResult), {})))
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		CaptureControlsView = if FFlagEnableUpdatedCaptureControlsModule and UseSelectorResult1 then ReactModule.createElement(CaptureControlsViewModule) else nil,
		ToastsFrame = if UseSelectorResult then nil else ReactModule.createElement("Frame", {
			Active = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = ConstantsModule.ZIndex.Toasts
		}, {
			ToastContainer = ReactModule.createElement(ToastContainerModule)
		})
	})
end