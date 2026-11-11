local Parent = script.Parent.Parent
local GetPaymentFromPlatformModule = require(Parent.Utils.getPaymentFromPlatform)
local _ = require(Parent.Utils.getPaymentFromPlatformLegacy)
local GetHasAmazonUserAgentModule = require(Parent.Utils.getHasAmazonUserAgent)
local GetHasQuestUserAgentModule = require(Parent.Utils.getHasQuestUserAgent)
local GetFFlagEnableLuobuInGameUpsellModule = require(Parent.Flags.GetFFlagEnableLuobuInGameUpsell)

return function(p1)
	-- upvalues: GetHasAmazonUserAgentModule (copy), GetFFlagEnableLuobuInGameUpsellModule (copy), GetHasQuestUserAgentModule (copy), GetPaymentFromPlatformModule (copy)
	return GetPaymentFromPlatformModule(p1, GetFFlagEnableLuobuInGameUpsellModule(), GetHasAmazonUserAgentModule(), (GetHasQuestUserAgentModule()))
end