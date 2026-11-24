local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetFriendsCallingStoreModule = require(FriendsCalling.Stores.GetFriendsCallingStore)
local CallEndedSnackbarModule = require(script.Parent.CallEndedSnackbar)
local GetCallEndedMessageModule = require(script.Parent.getCallEndedMessage)
local UseSignalStateFunction = SignalsReactModule.useSignalState

return function(p1)
	-- upvalues: GetFriendsCallingStoreModule (copy), UseSignalStateFunction (copy), GetCallEndedMessageModule (copy), ReactModule (copy), CallEndedSnackbarModule (copy)
	local FriendsCallingStoreModule = GetFriendsCallingStoreModule(false)
	UseSignalStateFunction(FriendsCallingStoreModule.getCallEndedReason)
	local CallEndedReason = FriendsCallingStoreModule.getCallEndedReason(false)
	local CallEndedMessageModule = if CallEndedReason == nil then nil else GetCallEndedMessageModule(CallEndedReason)
	ReactModule.useEffect(function()
		-- upvalues: CallEndedMessageModule (copy), FriendsCallingStoreModule (copy)
		if CallEndedMessageModule == nil then return end
		local DelayedThread = task.delay(4, FriendsCallingStoreModule.clearCallEndedReason)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { CallEndedMessageModule, FriendsCallingStoreModule })
	
	return if CallEndedMessageModule == nil or CallEndedReason == nil then nil else ReactModule.createElement("ScreenGui", {
		DisplayOrder = p1.displayOrder,
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		[ReactModule.Tag] = "data-testid=friends-calling-call-ended-screen"
	}, {
		Snackbar = ReactModule.createElement(CallEndedSnackbarModule, { endReason = CallEndedReason })
	})
end