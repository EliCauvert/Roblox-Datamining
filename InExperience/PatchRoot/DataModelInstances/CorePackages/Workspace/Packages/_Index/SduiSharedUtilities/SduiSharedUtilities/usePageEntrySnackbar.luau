local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiPageEntrySnackbarStoreModule = require(SduiSharedUtilities.getSduiPageEntrySnackbarStore)

return function(p1) --[[ Line: 15 | Named "usePageEntrySnackbar" ]]
	-- upvalues: GetSduiPageEntrySnackbarStoreModule (copy), SignalsReactModule (copy), ReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((GetSduiPageEntrySnackbarStoreModule().getSignal(p1)))
	local UseResult = ReactModule.useCallback(function() --[[ Line: 20 ]]
		-- upvalues: p1 (copy), GetSduiPageEntrySnackbarStoreModule (upval)
		if p1 then
			GetSduiPageEntrySnackbarStoreModule().hide(p1)
		end
	end, { p1 })
	ReactModule.useEffect(function() --[[ Line: 27 ]]
		-- upvalues: UseSignalStateResult (copy), p1 (copy), GetSduiPageEntrySnackbarStoreModule (upval)
		if UseSignalStateResult == nil then return end
		local DelayedThread = task.delay(UseSignalStateResult.durationSeconds or 4, function() --[[ Line: 33 ]]
			-- upvalues: p1 (upval), GetSduiPageEntrySnackbarStoreModule (upval)
			if p1 then
				GetSduiPageEntrySnackbarStoreModule().hide(p1)
			end
		end)
		
		return function() --[[ Line: 39 ]]
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { UseSignalStateResult })
	
	return {
		snackbarConfig = UseSignalStateResult,
		dismissSnackbar = UseResult,
		onDismiss = UseResult
	}
end