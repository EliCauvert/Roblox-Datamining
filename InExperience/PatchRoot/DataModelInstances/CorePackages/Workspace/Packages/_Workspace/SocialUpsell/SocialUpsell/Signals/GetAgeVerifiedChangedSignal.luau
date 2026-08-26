local notificationService = game:GetService("NotificationService")
local parent = script:FindFirstAncestor("SocialUpsell").Parent
local appCommonLibModule = require(parent.AppCommonLib)
local fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace = require(parent.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace
local var1 = require(parent.RealtimeDelivery).RobloxEventReceiver.new(notificationService)
local signal = appCommonLibModule.Signal
local var2 = nil

return function()
	-- upvalues: var2 (write), signal (ref), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (ref), var1 (ref)
	if not var2 then
		var2 = signal.new()
		
		if fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace and #fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace > 0 then
			var1:observeEvent(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(p1)
				-- upvalues: var2 (copy)
				if var2 then
					var2:fire(p1)
				end
			end)
		end
	end
	return var2
end