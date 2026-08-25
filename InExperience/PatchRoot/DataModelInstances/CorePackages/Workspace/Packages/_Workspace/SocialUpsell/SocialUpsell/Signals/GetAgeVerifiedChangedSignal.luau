local notificationService = game:GetService("NotificationService")
local parent = script:FindFirstAncestor("SocialUpsell").Parent
local appCommonLibModule = require(parent.AppCommonLib)
local fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace = require(parent.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace
local var2 = require(parent.RealtimeDelivery).RobloxEventReceiver.new(notificationService)
local signal = appCommonLibModule.Signal
local var3 = nil

return function()
	-- upvalues: var3 (write), signal (ref), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (ref), var2 (ref)
	if not var3 then
		var3 = signal.new()
		
		if fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace and #fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace > 0 then
			var2:observeEvent(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(p0)
				-- upvalues: var3 (copy)
				if var3 then
					var3:fire(p0)
				end
			end)
		end
	end
	return var3
end