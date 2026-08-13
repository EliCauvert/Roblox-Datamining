local messageBusService = game:GetService("MessageBusService")
local adConsentAttributionAdapterModule = require(script.Parent.AdConsentAttributionAdapter)
local t = {
	onUserSettingsChanged = function(value, p0) --[[ line: 20 ]]
		-- upvalues: adConsentAttributionAdapterModule (ref)
		local var3 = if p0 then p0.allowSellShareData else nil
		
		if var3 == nil then
			return
		end
		adConsentAttributionAdapterModule.resolveAndPublish(value, "ConsentChanged", function() --[[ line: 26 ]]
			-- upvalues: var3 (ref)
			return var3
		end)
	end
}

function t.start(p1, p2) --[[ line: 33 ]]
	-- upvalues: messageBusService (ref), t (ref)
	return (p2 or messageBusService):Subscribe("UserSettings.changed", function(p3) --[[ line: 35 ]]
		-- upvalues: t (copy), p1 (ref)
		t.onUserSettingsChanged(p1, p3)
	end, false, false)
end

return t