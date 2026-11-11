local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local Toast = FoundationModule.Toast
local View = FoundationModule.View
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseScreenSizeFunction = MomentsCommonModule.Hooks.useScreenSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local ConstantsModule = require(Moments.Constants)

local function ToastItem(p1)
	-- upvalues: ReactModule (copy), Toast (copy)
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
	
	return ReactModule.createElement(Toast, {
		title = Entry.data.title,
		text = if Entry.data.text == "" then nil else Entry.data.text,
		LayoutOrder = Entry.id,
		width = p1.toastWidth
	})
end

return function()
	-- upvalues: GetToastStoreModule (copy), SignalsReactModule (copy), UseDeviceInsetsFunction (copy), UseScreenSizeFunction (copy), UseTokensFunction (copy), ReactModule (copy), ToastItem (copy), View (copy), ConstantsModule (copy)
	local ToastStoreModule = GetToastStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ToastStoreModule.getToasts)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseTokensResult = UseTokensFunction()
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: ToastStoreModule (copy)
		ToastStoreModule.dismissToast(p1)
	end, { ToastStoreModule.dismissToast })
	
	if #UseSignalStateResult == 0 then
		return nil
	end
	local _UDim = UDim.new(0, (math.min(400, UseScreenSizeResult.X - 40)))
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