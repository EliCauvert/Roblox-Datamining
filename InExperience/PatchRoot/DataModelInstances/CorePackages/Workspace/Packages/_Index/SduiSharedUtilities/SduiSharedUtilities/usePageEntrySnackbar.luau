local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getSduiPageEntrySnackbarStoreModule = require(sduiSharedUtilities.getSduiPageEntrySnackbarStore)

return function(p0)
	-- upvalues: getSduiPageEntrySnackbarStoreModule (ref), signalsReactModule (ref), reactModule (ref)
	local var4 = signalsReactModule.useSignalState(getSduiPageEntrySnackbarStoreModule().getSignal(p0))
	local var5 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), getSduiPageEntrySnackbarStoreModule (copy)
		if p0 then
			getSduiPageEntrySnackbarStoreModule().hide(p0)
		end
	end, { p0 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p0 (ref), getSduiPageEntrySnackbarStoreModule (copy)
		if var4 == nil then
			return
		end
		local delayedThread = task.delay(var4.durationSeconds or 4, function()
			-- upvalues: p0 (copy), getSduiPageEntrySnackbarStoreModule (copy)
			if p0 then
				getSduiPageEntrySnackbarStoreModule().hide(p0)
			end
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var4 })
	
	return {
		snackbarConfig = var4,
		dismissSnackbar = var5,
		onDismiss = var5
	}
end