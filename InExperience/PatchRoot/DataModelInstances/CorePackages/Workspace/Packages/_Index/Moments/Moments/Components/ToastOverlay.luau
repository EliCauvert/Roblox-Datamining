local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local toast = foundationModule.Toast
local view = foundationModule.View
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useScreenSize = momentsCommonModule.Hooks.useScreenSize
local useTokens = foundationModule.Hooks.useTokens
local getToastStoreModule = require(moments.Stores.GetToastStore)
local constantsModule = require(moments.Constants)

local function ToastItem(p0)
	-- upvalues: reactModule (ref), toast (ref)
	local entry = p0.entry
	local onDismiss = p0.onDismiss
	reactModule.useEffect(function()
		-- upvalues: onDismiss (ref), entry (ref)
		local delayedThread = task.delay(3, function()
			-- upvalues: onDismiss (copy), entry (copy)
			onDismiss(entry.id)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { entry.id, onDismiss })
	
	return reactModule.createElement(toast, {
		title = entry.data.title,
		text = if entry.data.text ~= "" then nil else entry.data.text,
		LayoutOrder = entry.id,
		width = p0.toastWidth
	})
end

return function()
	-- upvalues: getToastStoreModule (ref), signalsReactModule (ref), useDeviceInsets (ref), useScreenSize (ref), useTokens (ref), reactModule (ref), ToastItem (ref), view (ref), constantsModule (ref)
	local var9 = getToastStoreModule(false)
	local var10 = signalsReactModule.useSignalState(var9.getToasts)
	local var11 = useDeviceInsets()
	local var12 = useScreenSize()
	local var13 = useTokens()
	local var14 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (ref)
		var9.dismissToast(p1)
	end, { var9.dismissToast })
	
	if #var10 == 0 then
		return nil
	end
	local uDim = UDim.new(0, math.min(400, var12.X - 40))
	local t = {}
	
	for i, v in var10 do
		t["Toast_" .. tostring(v.id)] = reactModule.createElement(ToastItem, { entry = v, onDismiss = var14, toastWidth = uDim })
	end
	return reactModule.createElement(view, {
		tag = "col gap-small position-top-center anchor-top-center auto-xy",
		ZIndex = constantsModule.ZIndex.Toasts,
		padding = {
			top = UDim.new(0, var11.top + var13.Padding.Large),
			left = UDim.new(0, var11.left + var13.Padding.Large),
			right = UDim.new(0, var11.right + var13.Padding.Large)
		}
	}, t)
end