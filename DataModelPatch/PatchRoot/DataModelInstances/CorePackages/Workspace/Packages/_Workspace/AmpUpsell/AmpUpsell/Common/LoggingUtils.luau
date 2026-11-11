local Default = require(script:FindFirstAncestor("AmpUpsell").Parent.LoggingProtocol).default
local EnableAmpUpsellLogging = game:DefineFastFlag("EnableAmpUpsellLogging", false)

return {
	logEventOnceIfEnabled = function(p1)
		-- upvalues: EnableAmpUpsellLogging (copy), Default (copy)
		if EnableAmpUpsellLogging then
			Default:logEventOnce(p1)
		end
	end
}