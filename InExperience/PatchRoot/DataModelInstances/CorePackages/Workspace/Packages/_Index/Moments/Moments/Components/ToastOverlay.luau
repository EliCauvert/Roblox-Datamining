local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationProvider = FoundationModule.FoundationProvider
local Snackbar = FoundationModule.Snackbar
local Toast = FoundationModule.Toast
local View = FoundationModule.View
local ColorMode = FoundationModule.Enums.ColorMode
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseScreenSizeFunction = MomentsCommonModule.Hooks.useScreenSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local _ = require(Moments.Stores.GetToastStore.createToastStore)
local ConstantsModule = require(Moments.Constants)
local UseScreenBottomInsetModule = require(Moments.Hooks.useScreenBottomInset)
local FFlagMomentsPostFeedback = require(Parent.SharedFlags).FFlagMomentsPostFeedback

local function ToastItem(p1)
	-- upvalues: ReactModule (copy), Snackbar (copy), Toast (copy)
	local Entry = p1.entry
	local OnDismissFunction = p1.onDismiss
	ReactModule.useEffect(function()
		-- upvalues: OnDismissFunction (copy), Entry (copy)
		local DelayedThread = task.delay(3, function()
			-- upvalues: OnDismissFunction (upval), Entry (upval)
			OnDismissFunction(Entry.id)
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { Entry.id, OnDismissFunction })
	
	return if Entry.data.variant == "snackbar" then ReactModule.createElement(Snackbar, { title = Entry.data.title, LayoutOrder = Entry.id }) else ReactModule.createElement(Toast, {
		title = Entry.data.title,
		text = if Entry.data.text == "" then nil else Entry.data.text,
		LayoutOrder = Entry.id,
		width = p1.toastWidth
	})
end

local function BottomToastStack(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseScreenBottomInsetModule (copy), ReactModule (copy), View (copy), ConstantsModule (copy), FoundationProvider (copy), ColorMode (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "position-bottom-center anchor-bottom-center size-full-0 auto-y",
		ZIndex = ConstantsModule.ZIndex.Toasts,
		padding = {
			bottom = UDim.new(0, UseScreenBottomInsetModule() + UseTokensResult.Padding.Large),
			left = UDim.new(0, UseDeviceInsetsResult.left + UseTokensResult.Padding.Large),
			right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
		}
	}, {
		DarkScope = ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
			Stack = ReactModule.createElement(View, { tag = "col align-x-center gap-small size-full-0 auto-y" }, p1.children)
		})
	})
end

local function PlacedToastStacks(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), ToastItem (copy), View (copy), ConstantsModule (copy), BottomToastStack (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local Elements = {}
	local Children = {}
	local Flag = false
	
	for _, toast in p1.toasts do
		local Element = ReactModule.createElement(ToastItem, {
			entry = toast,
			onDismiss = p1.onDismiss,
			toastWidth = p1.toastWidth
		})
		
		if toast.data.placement == "bottom" then
			Flag = true
			Children["Toast_" .. tostring(toast.id)] = Element
		else
			Elements["Toast_" .. tostring(toast.id)] = Element
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Top = ReactModule.createElement(View, {
			tag = "col gap-small position-top-center anchor-top-center auto-xy",
			ZIndex = ConstantsModule.ZIndex.Toasts,
			padding = {
				top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.Large),
				left = UDim.new(0, UseDeviceInsetsResult.left + UseTokensResult.Padding.Large),
				right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
			}
		}, Elements),
		Bottom = if Flag then ReactModule.createElement(BottomToastStack, { children = Children }) else nil
	})
end

return function()
	-- upvalues: GetToastStoreModule (copy), SignalsReactModule (copy), UseDeviceInsetsFunction (copy), UseScreenSizeFunction (copy), UseTokensFunction (copy), ReactModule (copy), FFlagMomentsPostFeedback (copy), PlacedToastStacks (copy), ToastItem (copy), View (copy), ConstantsModule (copy)
	local ToastStoreModule = GetToastStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ToastStoreModule.getToasts)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseTokensResult = UseTokensFunction()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: ToastStoreModule (copy)
		ToastStoreModule.dismissToast(p2)
	end, { ToastStoreModule.dismissToast })
	
	if #UseSignalStateResult == 0 then
		return nil
	end
	local _UDim = UDim.new(0, (math.min(400, UseScreenSizeResult.X - 40)))
	
	if FFlagMomentsPostFeedback then
		return ReactModule.createElement(PlacedToastStacks, {
			toasts = UseSignalStateResult,
			onDismiss = UseResult,
			toastWidth = _UDim
		})
	end
	local Elements = {}
	
	for _, Entry in UseSignalStateResult do
		Elements["Toast_" .. tostring(Entry.id)] = ReactModule.createElement(ToastItem, { entry = Entry, onDismiss = UseResult, toastWidth = _UDim })
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small position-top-center anchor-top-center auto-xy",
		ZIndex = ConstantsModule.ZIndex.Toasts,
		padding = {
			top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.Large),
			left = UDim.new(0, UseDeviceInsetsResult.left + UseTokensResult.Padding.Large),
			right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
		}
	}, Elements)
end