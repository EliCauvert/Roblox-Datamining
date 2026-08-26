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

local function ToastItem(p1)
	-- upvalues: reactModule (ref), toast (ref)
	local entry = p1.entry
	local onDismiss = p1.onDismiss
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
		width = p1.toastWidth
	})
end

return function()
	-- upvalues: getToastStoreModule (ref), signalsReactModule (ref), useDeviceInsets (ref), useScreenSize (ref), useTokens (ref), reactModule (ref), ToastItem (ref), view (ref), constantsModule (ref)
	local var1 = getToastStoreModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getToasts)
	local var3 = useDeviceInsets()
	local var4 = useScreenSize()
	local var5 = useTokens()
	local var6 = reactModule.useCallback(function(p1)
		-- upvalues: var1 (ref)
		var1.dismissToast(p1)
	end, { var1.dismissToast })
	
	if #var2 == 0 then
		return nil
	end
	local uDim = UDim.new(0, math.min(400, var4.X - 40))
	local t = {}
	
	for i, v in var2 do
		t["Toast_" .. tostring(v.id)] = reactModule.createElement(ToastItem, { entry = v, onDismiss = var6, toastWidth = uDim })
	end
	return reactModule.createElement(view, {
		tag = "col gap-small position-top-center anchor-top-center auto-xy",
		ZIndex = constantsModule.ZIndex.Toasts,
		padding = {
			top = UDim.new(0, var3.top + var5.Padding.Large),
			left = UDim.new(0, var3.left + var5.Padding.Large),
			right = UDim.new(0, var3.right + var5.Padding.Large)
		}
	}, t)
end