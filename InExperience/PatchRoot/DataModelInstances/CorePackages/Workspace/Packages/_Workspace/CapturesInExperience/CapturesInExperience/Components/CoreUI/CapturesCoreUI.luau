local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactUtilsModule = require(Parent1.ReactUtils)
local CaptureService = game:GetService("CaptureService")
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local SignalsModule = require(Parent1.Signals)
local FFlagKeepSideSheetOpenBesideMenu = require(Parent1.SharedFlags).FFlagKeepSideSheetOpenBesideMenu
local GetSideSheetVisibilityModule = require(Parent1.InExperienceSideSheetStore.getSideSheetVisibility)
local CaptureControlsViewModule = require(Parent.Components.CoreUI.CaptureControlsView)
local ConstantsModule = require(Parent.Constants)
local MakeVideoCaptureFailedHandlerModule = require(Parent.Utils.makeVideoCaptureFailedHandler)
local MakeVideoCaptureStartFailedHandlerModule = require(Parent.Utils.makeVideoCaptureStartFailedHandler)
local ToastContainerModule = require(Parent.Components.Common.ToastContainer)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEventConnectionFunction = ReactUtilsModule.useEventConnection
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector

return function()
	-- upvalues: UseDispatchFunction (copy), FFlagKeepSideSheetOpenBesideMenu (copy), ReactModule (copy), GetSideSheetVisibilityModule (copy), SignalsModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseCallbackFunction (copy), MakeVideoCaptureStartFailedHandlerModule (copy), UseEventConnectionFunction (copy), CaptureService (copy), MakeVideoCaptureFailedHandlerModule (copy), CaptureControlsViewModule (copy), ToastContainerModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local IsHidden = false
	
	if FFlagKeepSideSheetOpenBesideMenu then
		local UseStateResult2 = nil
		IsHidden, UseStateResult2 = ReactModule.useState(function()
			-- upvalues: GetSideSheetVisibilityModule (upval)
			return GetSideSheetVisibilityModule(false)
		end)
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), UseStateResult2 (ref), GetSideSheetVisibilityModule (upval)
			return SignalsModule.createEffect(function(p1)
				-- upvalues: UseStateResult2 (upval), GetSideSheetVisibilityModule (upval)
				UseStateResult2(GetSideSheetVisibilityModule(p1))
			end)
		end, {})
	end
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
		CaptureControlsView = if UseSelectorResult1 then ReactModule.createElement(CaptureControlsViewModule, if FFlagKeepSideSheetOpenBesideMenu then { isHidden = IsHidden } else nil) else nil,
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