local default = require(script:FindFirstAncestor("AmpUpsell").Parent.LoggingProtocol).default
local enableAmpUpsellLogging = game:DefineFastFlag("EnableAmpUpsellLogging", false)

return {
	logEventOnceIfEnabled = function(p1)
		-- upvalues: enableAmpUpsellLogging (ref), default (ref)
		if enableAmpUpsellLogging then
			default:logEventOnce(p1)
		end
	end
}