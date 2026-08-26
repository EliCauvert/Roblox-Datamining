local parent = script.Parent.Parent
local getPaymentFromPlatformModule = require(parent.Utils.getPaymentFromPlatform)
local _ = require(parent.Utils.getPaymentFromPlatformLegacy)
local getHasAmazonUserAgentModule = require(parent.Utils.getHasAmazonUserAgent)
local getHasQuestUserAgentModule = require(parent.Utils.getHasQuestUserAgent)
local getFFlagEnableLuobuInGameUpsellModule = require(parent.Flags.GetFFlagEnableLuobuInGameUpsell)

return function(p1)
	-- upvalues: getHasAmazonUserAgentModule (ref), getFFlagEnableLuobuInGameUpsellModule (ref), getHasQuestUserAgentModule (ref), getPaymentFromPlatformModule (ref)
	return getPaymentFromPlatformModule(p1, getFFlagEnableLuobuInGameUpsellModule(), getHasAmazonUserAgentModule(), getHasQuestUserAgentModule())
end