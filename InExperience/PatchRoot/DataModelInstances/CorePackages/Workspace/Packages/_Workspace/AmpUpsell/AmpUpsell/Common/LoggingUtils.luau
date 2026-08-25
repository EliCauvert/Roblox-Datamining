local default = require(script:FindFirstAncestor("AmpUpsell").Parent.LoggingProtocol).default
local enableAmpUpsellLogging = game:DefineFastFlag("EnableAmpUpsellLogging", false)

return {
	logEventOnceIfEnabled = function(p0)
		-- upvalues: enableAmpUpsellLogging (ref), default (ref)
		if enableAmpUpsellLogging then
			default:logEventOnce(p0)
		end
	end
}