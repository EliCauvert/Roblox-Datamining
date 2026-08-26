local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getSduiPageEntrySnackbarStoreModule = require(sduiSharedUtilities.getSduiPageEntrySnackbarStore)

return function(p1)
	-- upvalues: getSduiPageEntrySnackbarStoreModule (ref), signalsReactModule (ref), reactModule (ref)
	local var1 = signalsReactModule.useSignalState(getSduiPageEntrySnackbarStoreModule().getSignal(p1))
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), getSduiPageEntrySnackbarStoreModule (copy)
		if p1 then
			getSduiPageEntrySnackbarStoreModule().hide(p1)
		end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref), getSduiPageEntrySnackbarStoreModule (copy)
		if var1 == nil then
			return
		end
		local delayedThread = task.delay(var1.durationSeconds or 4, function()
			-- upvalues: p1 (copy), getSduiPageEntrySnackbarStoreModule (copy)
			if p1 then
				getSduiPageEntrySnackbarStoreModule().hide(p1)
			end
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var1 })
	
	return {
		snackbarConfig = var1,
		dismissSnackbar = var2,
		onDismiss = var2
	}
end