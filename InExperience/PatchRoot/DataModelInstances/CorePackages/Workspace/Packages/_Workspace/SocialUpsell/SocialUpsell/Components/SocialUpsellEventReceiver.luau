local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local GetAgeVerifiedChangedSignalModule = require(SocialUpsell.Signals.GetAgeVerifiedChangedSignal)
local FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace = require(Parent.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace

function SocialUpsellEventReceiver(p1) --[[ Line: 16 ]]
	-- upvalues: RealtimeDeliveryModule (copy), FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), GetAgeVerifiedChangedSignalModule (copy), ReactModule (copy), Parent (copy)
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged(FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(ConnectionState, p2) --[[ Line: 19 ]]
		-- upvalues: GetAgeVerifiedChangedSignalModule (upval)
		if ConnectionState == Enum.ConnectionState.Connected and p2 then
			GetAgeVerifiedChangedSignalModule():fire()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 28 ]]
		-- upvalues: p1 (copy), Parent (upval)
		if p1.shouldRequestAppAgeSignals then
			require(Parent.AppStoreAgeSignalsManager).AppAgeSignalsManager.requestAppAgeSignals():catch(function() --[[ Line: 31 ]] end)
		end
	end, { p1.shouldRequestAppAgeSignals })
	ReactModule.useEffect(function() --[[ Line: 35 ]]
		-- upvalues: p1 (copy), GetAgeVerifiedChangedSignalModule (upval)
		local Connection = if p1.onAgeVerifiedChange then GetAgeVerifiedChangedSignalModule():connect(p1.onAgeVerifiedChange) else nil
		
		return function() --[[ Line: 40 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:disconnect()
			end
		end
	end, { p1.onAgeVerifiedChange })
	
	return nil
end

return SocialUpsellEventReceiver