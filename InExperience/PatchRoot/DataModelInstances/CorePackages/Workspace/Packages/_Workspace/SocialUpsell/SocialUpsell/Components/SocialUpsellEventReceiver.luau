local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local getAgeVerifiedChangedSignalModule = require(socialUpsell.Signals.GetAgeVerifiedChangedSignal)
local fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace = require(parent.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace

function SocialUpsellEventReceiver(p0) --[[ line: 16 ]]
	-- upvalues: realtimeDeliveryModule (ref), fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (ref), getAgeVerifiedChangedSignalModule (ref), reactModule (ref), parent (ref)
	realtimeDeliveryModule.useRealtimeConnectionStateChanged(fStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(p1, p2) --[[ line: 19 ]]
		-- upvalues: getAgeVerifiedChangedSignalModule (copy)
		if p1 == Enum.ConnectionState.Connected and p2 then
			getAgeVerifiedChangedSignalModule():fire()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref), parent (copy)
		if p0.shouldRequestAppAgeSignals then
			require(parent.AppStoreAgeSignalsManager).AppAgeSignalsManager.requestAppAgeSignals():catch(function() --[[ line: 31 ]] end)
		end
	end, { p0.shouldRequestAppAgeSignals })
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: p0 (ref), getAgeVerifiedChangedSignalModule (copy)
		local var4 = if p0.onAgeVerifiedChange then getAgeVerifiedChangedSignalModule():connect(p0.onAgeVerifiedChange) else nil
		
		return function() --[[ line: 40 ]]
			-- upvalues: var4 (write)
			if var4 then
				var4:disconnect()
			end
		end
	end, { p0.onAgeVerifiedChange })
	
	return nil
end

return SocialUpsellEventReceiver