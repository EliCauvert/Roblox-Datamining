local NotificationModalsManagerModule = require(script:FindFirstAncestor("FriendsChat").Parent.NotificationModalsManager)

return function(ToastTitle, p1)
	-- upvalues: NotificationModalsManagerModule (copy)
	if p1 then
		NotificationModalsManagerModule.SetUIBloxToast({
			toastTitle = ToastTitle,
			sequenceNumber = DateTime.now().UnixTimestampMillis
		})
		
		return
	end
end