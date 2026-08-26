local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local getAgeVerifiedChangedSignalModule = require(socialUpsell.Signals.GetAgeVerifiedChangedSignal)
local fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace = require(parent.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace

function SocialUpsellEventReceiver(p1)
	-- upvalues: realtimeDeliveryModule (ref), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (ref), getAgeVerifiedChangedSignalModule (ref), reactModule (ref), parent (ref)
	realtimeDeliveryModule.useRealtimeConnectionStateChanged(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(p2, p3)
		-- upvalues: getAgeVerifiedChangedSignalModule (copy)
		if p2 == Enum.ConnectionState.Connected and p3 then
			getAgeVerifiedChangedSignalModule():fire()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), parent (copy)
		if p1.shouldRequestAppAgeSignals then
			require(parent.AppStoreAgeSignalsManager).AppAgeSignalsManager.requestAppAgeSignals():catch(function() end)
		end
	end, { p1.shouldRequestAppAgeSignals })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), getAgeVerifiedChangedSignalModule (copy)
		local var1 = if p1.onAgeVerifiedChange then getAgeVerifiedChangedSignalModule():connect(p1.onAgeVerifiedChange) else nil
		
		return function()
			-- upvalues: var1 (write)
			if var1 then
				var1:disconnect()
			end
		end
	end, { p1.onAgeVerifiedChange })
	
	return nil
end

return SocialUpsellEventReceiver