local Parent = script:FindFirstAncestor("SocialUpsell").Parent
local FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace = require(Parent.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace
local NewResult = require(Parent.RealtimeDelivery).RobloxEventReceiver.new((game:GetService("NotificationService")))
local Signal = require(Parent.AppCommonLib).Signal
local NewResult1 = nil

return function() --[[ Line: 21 ]]
	-- upvalues: NewResult1 (ref), Signal (copy), FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), NewResult (copy)
	if not NewResult1 then
		NewResult1 = Signal.new()
		
		if FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace and #FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace > 0 then
			NewResult:observeEvent(FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(p1) --[[ Line: 28 ]]
				-- upvalues: NewResult1 (upval)
				if NewResult1 then
					NewResult1:fire(p1)
				end
			end)
		end
	end
	return NewResult1
end